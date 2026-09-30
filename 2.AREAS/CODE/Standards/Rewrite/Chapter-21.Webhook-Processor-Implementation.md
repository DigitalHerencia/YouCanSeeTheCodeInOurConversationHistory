# Chapter 21: Webhook Processor

**The Book of Implementation™**

## Placement

```text
app/api/<provider>/webhooks/route.ts   # thin route — verify signature, delegate
lib/integrations/<provider>/webhooks.ts  # provider-specific processing
lib/db/transactions/webhook-event.tx.ts  # provider-agnostic claim/complete/fail helpers
```

## Golden pattern — the claim (atomic, idempotency-keyed insert)

```ts
export async function claimWebhookEventTx(
  tx: Prisma.TransactionClient,
  input: { provider: string; eventId: string; type: string; payload: string; organizationId?: string | null },
) {
  const payloadHash = hashWebhookPayload(input.payload); // sha256

  const inserted = await tx.$queryRaw<Array<{ id: string }>>`
    INSERT INTO "WebhookEvent" ("id","organizationId","provider","eventId","type","status","payloadHash","receivedAt")
    VALUES (gen_random_uuid(), ${input.organizationId ?? null}::uuid, ${input.provider}, ${input.eventId}, ${input.type}, 'PROCESSING', ${payloadHash}, now())
    ON CONFLICT ("provider","eventId") DO UPDATE
    SET "status" = 'PROCESSING', "receivedAt" = now(), "processedAt" = NULL, "errorCode" = NULL
    WHERE "WebhookEvent"."payloadHash" = EXCLUDED."payloadHash"
      AND "WebhookEvent"."type" = EXCLUDED."type"
      AND (
        "WebhookEvent"."status" = 'FAILED'
        OR ("WebhookEvent"."status" = 'PROCESSING' AND "WebhookEvent"."receivedAt" < now() - interval '5 minutes')
      )
    RETURNING "id"
  `;

  if (inserted[0]?.id) return inserted[0].id;      // claimed — proceed

  const existing = await tx.webhookEvent.findUnique({
    where: { provider_eventId: { provider: input.provider, eventId: input.eventId } },
    select: { payloadHash: true, type: true },
  });
  if (existing && (existing.payloadHash !== payloadHash || existing.type !== input.type)) {
    throw new WebhookIdentityConflictError(); // same id, different payload — reject
  }
  return null; // already processed / in-flight — treat as a no-op duplicate
}

export function completeWebhookEventTx(tx: Prisma.TransactionClient, webhookEventId: string) {
  return tx.webhookEvent.update({ where: { id: webhookEventId }, data: { status: "PROCESSED", processedAt: new Date(), errorCode: null } });
}

export function failWebhookEventTx(tx: Prisma.TransactionClient, webhookEventId: string, errorCode: string) {
  return tx.webhookEvent.update({ where: { id: webhookEventId }, data: { status: "FAILED", processedAt: new Date(), errorCode } });
}
```

## Anatomy

- **`ON CONFLICT ("provider","eventId") DO UPDATE ... WHERE ...` is one atomic statement** — the check ("is this event new, stuck, or previously failed?") and the write (claim it) happen in a single round-trip, closing the race window that a separate check-then-insert would leave open.
- **The `WHERE` clause on the `DO UPDATE`** is what allows a legitimate retry: an event that previously `FAILED`, or one stuck in `PROCESSING` for more than 5 minutes (a crashed worker), can be re-claimed. An event that's `PROCESSED`, or actively `PROCESSING` within the window, cannot — that's the duplicate-delivery case, silently absorbed.
- **`payloadHash` + `type` comparison on the existing row** is the identity check: the same `(provider, eventId)` pair arriving with a *different* payload is treated as a distinct, suspicious event and rejected outright, not silently overwritten.
- **`return null` on an already-claimed/duplicate event** — the caller checks for `null` and simply returns early; a duplicate delivery is a successful no-op, not an error.
- **Complete/fail are separate, explicit terminal states** — a failure is recorded (and is what makes the event eligible for the retry window above), it isn't left stuck in `PROCESSING` forever.

## Real worked example

Verified against the live Stripe webhook processor in the template:

```ts
export function verifyStripeWebhook(payload: string, signature: string | null) {
  const secret = process.env.STRIPE_WEBHOOK_SECRET?.trim();
  if (!secret) throw new Error("Stripe webhooks are not configured.");
  if (!signature) throw new Error("The Stripe-Signature header is required.");
  return getStripeClient().webhooks.constructEvent(payload, signature, secret);
}

export async function processStripeWebhook(event: Stripe.Event, payload: string) {
  const input = getBillingSubscriptionInputFromEvent(event);
  const organizationId = input?.organizationId ?? null;

  const webhookEventId = await withProviderTransaction((tx) =>
    claimWebhookEventTx(tx, { provider: "stripe", eventId: event.id, type: event.type, payload, organizationId }),
  );
  if (!webhookEventId) return false; // duplicate — nothing to do

  try {
    if (input) {
      await withProviderOrganizationTransaction(input.organizationId, async (tx) => {
        await tx.billingSubscription.upsert({ where: { organizationId: input.organizationId }, create: input, update: input });
        await completeWebhookEventTx(tx, webhookEventId);
      });
    } else {
      await withProviderTransaction((tx) => completeWebhookEventTx(tx, webhookEventId));
    }
    return true;
  } catch (error) {
    await withProviderTransaction((tx) => failWebhookEventTx(tx, webhookEventId, "processing_failed"));
    throw error;
  }
}
```

Note `verifyStripeWebhook` runs before `processStripeWebhook` is ever called from the route handler — signature verification happens outside and before the claim, since an unverified payload shouldn't even be hashed and inserted as a claimed event.

## Forbidden variants (enforced, not just documented)

- **No applying the business-logic effect before signature verification.** Verification is step one, unconditionally.
- **No separate `SELECT` (has this been processed?) followed by a separate `INSERT`/`UPDATE`.** That's the race condition this whole chapter exists to close — use the single atomic upsert.
- **No network/provider call inside the same transaction as `claimWebhookEventTx` or `completeWebhookEventTx`.** Claim, then do external work outside a transaction if needed, then complete/fail in its own transaction.
- **No silently swallowing a processing failure without calling `failWebhookEventTx`.** An un-recorded failure leaves the event stuck in `PROCESSING`, invisible to the retry-window logic.

## Checklist

- [ ] Signature verified before payload is trusted or hashed
- [ ] Claim is a single atomic statement keyed on `(provider, eventId)`, not a check-then-write pair
- [ ] Payload identity (hash + type) checked against any existing row with the same id
- [ ] Duplicate/already-claimed events return early as a no-op, not an error
- [ ] Success and failure are both explicitly recorded via `completeWebhookEventTx` / `failWebhookEventTx`
- [ ] No outbound network call inside the claim or completion transaction
