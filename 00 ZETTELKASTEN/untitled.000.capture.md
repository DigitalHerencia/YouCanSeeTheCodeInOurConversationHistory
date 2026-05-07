---
title: Untitled
source:
created: 05/06/2026
parent:
description:
tags: []
type:
---
# Vouch Stripe Functional Build Pass

You are in the Vouch repo. This is a build pass, not a naming cleanup pass, not a planning pass, and not a documentation pass.

Build the Stripe-backed payment system so Vouch can execute its deterministic commitment-backed lifecycle:

merchant creates Vouch → customer accepts and pays/authorizes → Stripe manual-capture PaymentIntent is created and confirmed → both parties confirm presence inside the confirmation window → funds capture → failed or incomplete confirmation cancels/voids or refunds according to provider state → webhooks reconcile provider truth.

Do not stop after fixing names.  
Do not only update comments.  
Do not output a plan instead of code.  
Implement the functional path.

---

## Source of truth

Before inspecting implementation, read the source-of-truth docs listed below.  
Then inspect the required implementation files.

Read first:

- `AGENTS.md`
- `.agents/docs/stripe-connect-integration.md`
- `.agents/contracts/domain-model.yaml`
- `.agents/contracts/features.yaml`
- `.agents/docs/prd.md`
- `.agents/docs/tech-requirements.md`
- `.agents/docs/user-flows.md`
- `.agents/contracts/routes.yaml`
- `.agents/contracts/acceptance-gates.yaml`
- `.agents/contracts/authz.yaml`

If old code, comments, docs, or tests conflict with those files, the updated files win.

---

## Product invariant

Vouch is commitment-backed payment coordination.

Both parties confirm presence within the confirmation window → capture funds.

Otherwise → cancel authorization, void uncaptured authorization, or refund captured funds according to actual Stripe state.

Vouch is not a marketplace, broker, scheduler, escrow provider, dispute system, evidence system, messaging system, ratings/reviews system, discovery platform, public profile system, or manual arbitration surface.

Do not add marketplace, escrow, dispute, evidence, arbitration, messaging, ratings, reviews, public profiles, listings, browse, search, categories, recommendations, scheduler, manual fund award, force release, or manual confirmation rewrite behavior.

---

## Payment operation definitions

Use these meanings consistently:

- **authorize** = create/confirm Stripe PaymentIntent and reserve funds
- **capture** = finalize authorized payment settlement
- **cancel / void** = release uncaptured authorization
- **refund** = reverse captured / settled funds

Do not use ambiguous “release” wording for multiple meanings.

---

## Current role mapping

Product roles:

- merchant/provider = creates Vouch, owns connected account, receives funds
- customer/client = accepts Vouch, pays customer total

Current legacy schema mapping:

- `Vouch.payerId` = merchant/provider/creator
- `Vouch.payeeId` = customer/client/acceptor

Therefore Stripe must use:

- merchant connected account from `vouch.payer.connectedAccount`
- customer payment customer/payment method from `vouch.payee.paymentCustomer`

If code currently uses `vouch.payer.paymentCustomer` as the paying customer, fix it.

If code currently uses `vouch.payee.connectedAccount` as the destination merchant account, fix it.

Do not perform a destructive Prisma rename in this pass. Keep legacy field names but make behavior correct.

---

## Stripe money model

PaymentIntent must be:

- `amount = customerTotalCents`
- `capture_method = "manual"`
- `application_fee_amount = applicationFeeAmountCents`
- `transfer_data.destination = merchant/provider connected account`

Frozen pricing snapshot fields:

- `protectedAmountCents`
- `merchantReceivesCents`
- `vouchServiceFeeCents`
- `processingFeeOffsetCents`
- `applicationFeeAmountCents`
- `customerTotalCents`

Do not use `amountCents + platformFeeCents` as the authoritative customer charge amount.

---

## Required files / surfaces to inspect first

After reading source-of-truth docs, inspect:

- `lib/actions/vouchActions.ts`
- `lib/actions/paymentActions.ts`
- `lib/integrations/stripe/payment-intents.ts`
- `lib/integrations/stripe/status-map.ts`
- `lib/integrations/stripe/webhook-events.ts`
- `app/api/stripe/webhooks/route.ts`
- `lib/db/transactions/vouchTransactions.ts`
- `lib/db/transactions/confirmationTransactions.ts`
- `lib/db/selects/payment.selects.ts`
- `lib/db/selects/vouch.selects.ts`
- `lib/fetchers/paymentFetchers.ts`
- `lib/fetchers/setupFetchers.ts`
- `schemas/payment.ts`
- `schemas/vouch.ts`
- `types/payment.ts`
- `types/vouch.ts`
- `prisma/schema.prisma`
- `app/(tenant)/settings/payment/page.tsx`
- `app/(tenant)/settings/payout/page.tsx`
- `features/settings/payment-settings-page.tsx`
- `features/settings/payout-settings-page.tsx`

Touch other files only when required to complete the payment lifecycle.

---

## Functional build requirements

### 1) Payment setup must work

Implement or repair the customer payment-method setup path.

Payment setup must:

- create or reuse Stripe Customer
- create SetupIntent
- provide a working way for the user to complete card/payment-method setup
- store provider customer reference
- update local payment readiness based on provider truth
- not store card data
- not show blind success

Do not satisfy this with placeholder readiness, optimistic UI state, or local-only flags unsupported by Stripe truth.

If current UI only starts setup but cannot actually complete setup, build the missing minimal UI/client surface required for setup completion.

---

### 2) Payout setup must work

Implement or repair merchant/provider connected-account onboarding.

Payout setup must:

- create or reuse Stripe Connect account
- create account onboarding link
- reconcile returned connected-account state
- store connected account reference
- update payout readiness based on provider truth
- use sandbox-compatible account behavior
- not show blind success

Do not satisfy this with placeholder readiness, optimistic UI state, or local-only flags unsupported by Stripe truth.

---

### 3) Return routes must exist and reconcile  
  
Create or repair:  
  
- `app/(tenant)/settings/payment/return/page.tsx`  
- `app/(tenant)/settings/payout/return/page.tsx`  
  
These pages must not say success just because Stripe redirected back.  
  
They must:  
  
- authenticate user  
- reconcile provider-backed readiness  
- render or redirect based on actual provider-backed state  
- show a clear pending/failure/success state based on provider truth  
- not create local-only success  
- not store raw provider payloads

---

### 4) Vouch creation must work

Merchant/provider creates the Vouch.

Creation must:

- authenticate user
- check create readiness
- calculate pricing server-side
- freeze pricing snapshot
- create invite
- write audit event
- not rely on client-calculated fees

---

### 5) Acceptance and payment authorization must work

Customer/client accepts the invite.

Acceptance must:

- authenticate user
- check accept readiness
- block self-acceptance
- bind `payeeId` to accepting customer
- use customer/client Stripe customer/payment method from `vouch.payee.paymentCustomer`
- use merchant/provider connected account from `vouch.payer.connectedAccount`
- create/confirm a manual-capture PaymentIntent
- store PaymentIntent ID
- set local payment state according to actual Stripe result
- write audit events
- fail cleanly if payment method or connected account is missing

This is the most important repair. Do not leave this half-built.

---

### 6) Payment authorization state must be provider-backed

Map Stripe states correctly:

- `requires_capture` → local `authorized`
- `succeeded` → local `captured`
- `canceled` → local `voided`
- `payment_failed` → local failure
- `requires_payment_method` → local requires payment method
- `requires_action` → local awaiting customer action
- `processing` → local processing
- `requires_confirmation` → local pending confirmation

Do not mark authorized just because a browser/client action returned.

---

### 7) Confirmation must work

Each participant can confirm only for themselves.

Confirmation must:

- authenticate user
- authorize participant
- enforce confirmation window
- prevent duplicates
- write presence confirmation
- write audit event
- never capture on one confirmation
- never capture on late confirmation

Confirmation write path must synchronously invoke settlement evaluation or enqueue deterministic server-side settlement evaluation immediately.

---

### 8) Resolution must work

When confirmation state changes or expiration reconciliation runs, resolve payment if possible.

Rules:

- both valid confirmations inside window → capture PaymentIntent
- missing/incomplete confirmation after deadline → cancel / void uncaptured authorization
- if already captured and reversal is required → refund
- update `Vouch`
- update `PaymentRecord`
- write audit events
- revalidate relevant paths

Implement the actual capture / void / refund functions if they are stubs, system-blocked, or disconnected.

Do not leave `captureOrReleaseVouchPayment` and `refundOrVoidVouchPayment` as dead blockers unless another internal function performs the real operation and is wired into confirmation / expiration flows.

Settlement operations must be idempotent.  
  
Implement or repair deterministic server-side settlement so that:  
  
- repeated confirmation submissions do not double-capture  
- repeated expiration reconciliation does not double-cancel or double-refund  
- repeated webhooks do not duplicate local state transitions  
- provider state wins for actual payment status  
- Vouch business state still follows the dual-confirmation invariant  
  
Before capture/cancel/refund, retrieve or verify the current Stripe PaymentIntent/Charge state where needed so the operation matches actual provider state.

---

### 9) Expiration / non-release path must exist

There must be an executable server-side path for expired / incomplete Vouches.

Acceptable surfaces:

- internal route handler
- scheduled job
- cron endpoint
- internal server action

Prefer non-public internal execution.

It must:

- find active Vouches past `confirmationExpiresAt`
- check confirmation aggregate
- capture only if both valid confirmations exist
- otherwise cancel / void / refund as required
- be idempotent
- write audit events

Do not build a public dispute process.

---

### 10) Webhooks must be functional

Stripe webhook handling must:

- verify signature
- dedupe by provider event ID
- store safe metadata only
- avoid full Stripe payload persistence
- process idempotently
- tolerate duplicates
- reconcile late provider truth

Must map at minimum:

- `payment_intent.amount_capturable_updated`
- `payment_intent.succeeded`
- `payment_intent.canceled`
- `payment_intent.payment_failed`
- `charge.refunded`
- `account.updated`

Map equivalent Stripe events if implementation already uses adjacent event coverage.

Webhooks may update provider-backed payment status, setup status, connected-account status, refund status, and reconciliation state.  
  
Webhooks must not override Vouch confirmation truth.  
  
Webhooks must not capture funds unless local Vouch state already satisfies the deterministic both-confirmed-within-window rule.  
  
Handle setup-related events when available, including:  
  
- `setup_intent.succeeded`  
- `setup_intent.setup_failed`  
  
Handle account readiness changes with:  
  
- `account.updated`  
  
For destination-charge refunds, reconcile refund state without storing full raw Stripe payloads.

---

### 11) Tests must protect actual payment behavior

Do not write a huge test suite.

Add / update targeted tests only for:

- merchant destination comes from creator / payer connected account
- customer payment method comes from acceptor / payee payment customer
- PaymentIntent uses `customerTotalCents`
- application fee uses `applicationFeeAmountCents`
- manual capture is used
- both confirmations are required before capture
- incomplete confirmation cancels / voids / refunds according to provider state
- webhook idempotency

Prefer existing folders:

- `tests/unit/payments`
- `tests/unit/vouches`
- `tests/unit/webhooks`

---

## Architecture rules

Respect repo boundaries:

- `app/**` route shells only
- `features/**` orchestration
- `components/**` pure UI
- reads through `lib/fetchers/*`
- writes through `lib/actions/*`, `lib/db/transactions/*`, or `lib/integrations/*`
- auth in `lib/auth/*`
- authz in `lib/authz/*`
- schemas in `schemas/*`
- DTOs/types in `types/*`

No Stripe SDK logic in UI components or route pages.

No Prisma queries in UI components.

---

## Execution discipline

Do not spend tokens running quality gates before editing.

Do not do repeated test runs while coding.

Do not do broad unrelated cleanup.

Do not ask for clarification unless an external secret, account, or runtime dependency prevents progress.

Workflow:

1. Read source-of-truth docs.
2. Inspect relevant files.
3. Build the missing functional Stripe lifecycle.
4. Run validation after edits are complete.
5. Fix validation errors caused by this pass.
6. Stop and report.

---

## Validation discipline

After edits are complete, run only:

pnpm prisma:validate
pnpm typecheck
pnpm test -- tests/unit/payments tests/unit/webhooks tests/unit/vouches

Only if those pass, or if the edit touched broad shared config, run:

pnpm lint
pnpm validate:contracts

Do not run Playwright.

Do not run full E2E.

Do not run full `pnpm validate`.

---

## Output format

Report only:

## Summary
- What functional behavior was built / fixed.

## Files Changed
- `path`

## Validation
- command — pass / fail / not run

## Remaining Blockers
- Only real blockers.

## Assumptions Made
- Only assumptions that materially affect correctness.

---

## Definition of done

This pass is not done unless:

- payment setup path is usable enough for local/dev completion
- payout setup path is usable enough for local/dev onboarding
- return routes reconcile provider-backed state
- merchant/provider connected account is used as Stripe destination
- customer/client payment method is used for Stripe authorization
- PaymentIntent uses manual capture
- PaymentIntent amount uses `customerTotalCents`
- application fee uses `applicationFeeAmountCents`
- authorization state is provider-backed
- both confirmations are required before capture
- incomplete confirmation path voids / cancels / refunds
- expiration / non-release resolution path exists
- webhook processing is idempotent
- targeted payment / vouch / webhook tests pass or have clear fixable errors