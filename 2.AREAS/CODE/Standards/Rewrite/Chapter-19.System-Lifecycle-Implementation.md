# Chapter 19: System Lifecycle

**The Book of Implementation™**

## Placement

```text
prisma/schema.prisma            # state enums + dedicated timestamps (the states)
lib/workflows/<domain>Workflows.ts   # one authoritative workflow per named transition
lib/db/transactions/*.tx.ts     # atomic multi-step transitions (claim / complete / fail)
```

## Golden pattern: the lifecycle grammar

```text
Lifecycle: <Entity>
  Identity / scope:   <id> + organizationId (or explicit global scope)
  Truth source:       <this database | provider (mirrored) | derived>
  States:             initial: <S0> · active: <S1..> · recoverable: <Sr> · terminal: <Sn..>
  Transitions:        <name>: <from> → <to>
                        guard:   <precondition checked against current state>
                        owner:   <exactly one workflow>
                        write:   atomic, conditioned on expected state/version
                        stamp:   dedicated timestamp (e.g. processedAt, completedAt)
  Failure:            <what state a failed attempt leaves behind>
  Recovery:           <which transition brings a recoverable state back, and who may fire it>
  Concurrency:        <version / unique key / lease that rejects the losing writer>
```

## Golden pattern: a guarded transition in code

```ts
export async function <transition>Workflow(entityId: string) {
  const entity = await get<Entity>ById(entityId);
  if (!entity) throw new ResourceNotFoundError("<Entity>");
  if (entity.status !== "<FROM_STATE>") {
    throw new Error("Only a <from state> can be <transition>.");   // the guard
  }
  return update<Entity>({
    ...entity,
    status: "<TO_STATE>",
    expectedUpdatedAt: new Date(entity.updatedAt),   // rejects a stale or racing writer
  });
}
```

## Anatomy

- **The enum defines states; the workflow defines the legal move.** Nothing else in the codebase is allowed to write the status column for that transition.
- **The guard reads current state first**, so a transition attempted from the wrong state fails loudly with a named error and never silently overwrites.
- **`expectedUpdatedAt` (or a version column) turns concurrent attempts into a detectable conflict** instead of last-writer-wins.
- **A separate recoverable state (like `FAILED`) exists so that recovery is itself a guarded transition** with an owner, not an ad hoc reset.

## Real worked examples

Verified against the live `prisma/schema.prisma` in the maximal template.

**Access lifecycle (membership):**

```prisma
enum MembershipStatus {
  INVITED
  ACTIVE
  SUSPENDED
  REVOKED
}
```

The transaction wrapper from Chapter 20 only resolves memberships with `status: "ACTIVE"`, which is the guard that makes `SUSPENDED` and `REVOKED` states effective everywhere a tenant transaction is opened.

**Domain entity lifecycle (CRM deal):**

```prisma
enum CrmDealStage {
  LEAD
  QUALIFIED
  PROPOSAL
  NEGOTIATION
  WON
  LOST
}
```

`closeDealWorkflow` and `reopenOpportunityWorkflow` from Chapter 14 are the named transitions: closing moves a deal to `WON` or `LOST`, and reopening moves it back to `QUALIFIED`.

**Operation lifecycle (webhook event):**

```prisma
enum WebhookStatus {
  RECEIVED
  PROCESSING
  PROCESSED
  FAILED
}

model WebhookEvent {
  provider    String
  eventId     String
  status      WebhookStatus @default(RECEIVED)
  payloadHash String?
  errorCode   String?
  receivedAt  DateTime  @default(now()) @db.Timestamptz(6)
  processedAt DateTime? @db.Timestamptz(6)

  @@unique([provider, eventId])
}
```

`RECEIVED → PROCESSING` is the atomic claim, `PROCESSING → PROCESSED` is `completeWebhookEventTx`, and `PROCESSING → FAILED` is `failWebhookEventTx` (all from Chapter 21). `FAILED` is the recoverable state: the claim statement is allowed to move a `FAILED` event, or one stuck in `PROCESSING` past the 5-minute lease, back to `PROCESSING`. `PROCESSED` is terminal. `@@unique([provider, eventId])` is the concurrency guard, and `processedAt` is the dedicated completion timestamp.

**Operation lifecycle (idempotency record):**

```prisma
model IdempotencyRecord {
  scope       String
  key         String
  state       IdempotencyState @default(STARTED)
  result      Json?
  errorCode   String?
  completedAt DateTime? @db.Timestamptz(6)

  @@unique([scope, key])
}
```

## Forbidden variants (enforced, not just documented)

- **No status column written by more than one workflow for the same transition.** One transition, one owner.
- **No transition without a guard on current state.** An unconditioned `update({ status })` is an undocumented transition.
- **No lifecycle that specifies only the happy path.** Every lifecycle names its failure state and its recovery transition, or states explicitly that it has none.
- **No provider status copied verbatim into a domain enum.** Map it through an explicit, exhaustive translation.
- **No network or provider call inside the transaction that performs the transition.** Separate durable operation state carries the work across the boundary.

## Checklist

- [ ] Every stateful entity has named initial, active, recoverable, and terminal states
- [ ] Every transition has exactly one owning workflow and a guard on current state
- [ ] Transition writes are atomic and conditioned on expected state or version
- [ ] Each completion has a dedicated timestamp, not a reused `updatedAt`
- [ ] Failure and recovery behavior is specified, including what a crashed attempt leaves behind
- [ ] Provider vocabulary is mapped to domain vocabulary, never copied across
