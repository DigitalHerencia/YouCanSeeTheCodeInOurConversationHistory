---
title: 'The Maximal Template™ Domain Library\app\api\stripe\webhooks\route.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\api\stripe\webhooks\route.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.api.stripe.webhooks.route.ts'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\app\api\stripe\webhooks\route.ts'
source_file: 'route.ts'
source_sha256: 'd4f6890b8f205638f2ccdf86dc41ff2ced812142c75f01707fea1faa442e8e8b'
generated: true
---

# `route.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\api\stripe\webhooks\route.ts`
> SHA-256: `d4f6890b8f205638f2ccdf86dc41ff2ced812142c75f01707fea1faa442e8e8b`

```ts
import {
  withProviderOrganizationTransaction,
  withProviderTransaction,
} from "@/lib/db/provider";
import {
  claimWebhookEventTx,
  completeWebhookEventTx,
  failWebhookEventTx,
} from "@/lib/db/transactions/webhook-event.tx";
import { getBillingSubscriptionInputFromEvent } from "@/lib/integrations/stripe/subscriptions";
import { verifyStripeWebhook } from "@/lib/integrations/stripe/webhooks";

export async function POST(request: Request) {
  let webhookEventId: string | null = null;
  try {
    const payload = await request.text();
    const event = verifyStripeWebhook(
      payload,
      request.headers.get("stripe-signature"),
    );
    const input = getBillingSubscriptionInputFromEvent(event);
    const organizationId = input?.organizationId ?? null;
    webhookEventId = await withProviderTransaction((tx) =>
      claimWebhookEventTx(tx, {
        provider: "stripe",
        eventId: event.id,
        type: event.type,
        payload,
        organizationId,
      }),
    );
    if (!webhookEventId)
      return Response.json({ received: true, duplicate: true });

    if (input) {
      await withProviderOrganizationTransaction(input.organizationId, (tx) =>
        tx.billingSubscription.upsert({
          where: { organizationId: input.organizationId },
          create: input,
          update: input,
        }),
      );
    }
    await withProviderTransaction((tx) =>
      completeWebhookEventTx(tx, webhookEventId!),
    );
    return Response.json({ received: true });
  } catch (cause) {
    const message =
      cause instanceof Error ? cause.message : "Stripe webhook failed.";
    if (webhookEventId)
      await withProviderTransaction((tx) =>
        failWebhookEventTx(tx, webhookEventId!, message),
      );
    return Response.json(
      { error: message },
      { status: webhookEventId ? 500 : 400 },
    );
  }
}

```