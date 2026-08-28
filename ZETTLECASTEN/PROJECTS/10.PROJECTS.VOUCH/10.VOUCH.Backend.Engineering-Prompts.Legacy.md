# Vouch Backend Engineering Prompts

## Purpose

These prompts convert the Vouch Server Architecture Taxonomy and Backend Implementation Matrix into sequential Codex execution passes.

Use these prompts one at a time.

Do not paste the whole document into Codex as one mega-prompt.

Each pass has one job, one bounded target, and one expected output.

The backend execution strategy is:

```txt
inventory
-> reframe
-> normalize
-> extract services
-> harden boundaries
-> harden providers
-> harden settlement
-> verify conformance
```

The goal is not to generate more code.

The goal is to make the existing Vouch backend deterministic, source-of-truth aligned, and safe for real payment coordination.

---

# Prompt 1 — Backend Inventory and Domain Classification Audit

## Goal

Inventory all server-side artifacts and classify them against the Vouch backend domain taxonomy and implementation matrix.

## Prompt

You are auditing a production Next.js App Router / TypeScript / Prisma / Stripe / Clerk SaaS backend against the Vouch source of truth.

Perform a backend inventory and domain classification audit.

Source authority order:

```txt
.agents/docs/*.md
.agents/contracts/*.yaml
.agents/instructions/*.md
existing repo code
agent judgment
```

Audit these directories:

```txt
app/api/**
lib/actions/**
lib/fetchers/**
lib/auth/**
lib/authz/**
lib/db/**
lib/integrations/**
lib/vouch/**
lib/domain/**
schemas/**
types/**
tests/**
```

Classify every backend artifact into one of these categories:

```txt
identity
authorization
readiness
vouch lifecycle
pricing
invitation
payment coordination
connect payout
confirmation
settlement
webhook reconciliation
audit
recovery
DTO mapping
configuration
test coverage
obsolete/remove
rename/reframe
needs deeper audit
```

For every relevant file, report:

```txt
path
classification
current purpose
canonical domain association
keep/rename/move/merge/remove recommendation
boundary violations
source-of-truth risks
```

Do not modify code in this pass.

Generate or update:

```txt
.agents/json/backend-inventory-audit.json
```

Return a concise summary after writing the artifact.

---

# Prompt 2 — Obsolete Surface and Naming Reframe Pass

## Goal

Remove or reframe backend concepts that imply forbidden or obsolete Vouch product surfaces.

## Prompt

Using the backend inventory audit, remove or reframe obsolete backend concepts that conflict with the Vouch source of truth.

Target likely drift:

```txt
settings
setup
admin
analytics
notifications
support settlement
disputes
claims
evidence
manual outcome
```

Rules:

```txt
Readiness may remain only as embedded gating.
Settings may remain only as account basics, provider redirect, or readiness logic when strictly necessary.
Setup must not exist as a standalone product surface.
Admin/support/manual settlement surfaces are forbidden.
Disputes, claims, appeals, evidence, ratings, reviews, messaging, and marketplace behavior are forbidden.
```

Special hard rule:

```txt
The Clerk webhook handler must remain explicitly modeled and named as a webhook handler.
Do not rename it into a vague sync endpoint, generic processor, generic route, or non-webhook abstraction.
```

Update code where necessary.

Output complete changed files.

Also update any relevant tests and contracts.

Run or report the required validation commands:

```txt
pnpm prisma:validate
pnpm validate:contracts
pnpm typecheck
pnpm lint
pnpm test
```

---

# Prompt 3 — Domain Service Inventory Normalization

## Goal

Normalize backend service organization around domains, services, and operations.

## Prompt

Refactor backend service organization around the canonical Vouch backend model:

```txt
domain -> service -> operation -> supporting modules
```

Canonical domains:

```txt
identity
authorization
readiness
vouch lifecycle
pricing
invitation
payment coordination
connect payout
confirmation
settlement
webhook reconciliation
audit
recovery
configuration
```

Canonical service modules should be grouped coherently under existing repo conventions.

Preferred conventions:

```txt
lib/vouch/*
lib/domain/*
lib/actions/*
lib/fetchers/*
lib/db/transactions/*
lib/integrations/*
```

Do not create a new architecture style if the repo already has an accepted equivalent.

Rules:

```txt
Actions are user-triggered write entrypoints.
Fetchers are protected read entrypoints.
Transactions are atomic persistence units.
Integrations hide provider SDK details.
Schemas validate input.
DTOs define transport-safe output.
Mappers convert persistence/provider state to DTOs.
Domain services encode business rules and service orchestration.
```

Refactor only where it improves boundary clarity and source-of-truth alignment.

Do not invent new product behavior.

Output complete changed files.

---

# Prompt 4 — Server Action Boundary Hardening

## Goal

Ensure every server action follows the canonical Vouch action pattern.

## Prompt

Audit and harden all server actions.

Target files:

```txt
lib/actions/**
```

Every server action must follow:

```txt
authenticate
-> authorize
-> Zod validate
-> transaction and/or provider operation
-> audit event
-> revalidate
-> typed result or redirect
```

Rules:

```txt
Do not trust client-provided fee math.
Do not trust browser return state.
Do not expose raw provider errors.
Do not call Prisma inline when a transaction helper should own persistence.
Do not call Stripe inline when an integration module should own provider access.
Do not implement manual settlement, force release, support override, disputes, claims, or evidence review.
```

Ensure actions return typed action results or redirects consistently.

Ensure actions do not contain UI logic.

Ensure provider redirects are explicit and safe.

Output complete changed files.

Update tests where required.

---

# Prompt 5 — Protected Fetcher Boundary Hardening

## Goal

Ensure every protected fetcher follows the canonical Vouch fetcher pattern.

## Prompt

Audit and harden all protected fetchers.

Target files:

```txt
lib/fetchers/**
```

Every protected fetcher must follow:

```txt
authenticate
-> authorize
-> minimal select
-> DTO mapping
-> cache policy
-> transport-safe return
```

Rules:

```txt
Fetchers are read-only.
Fetchers do not mutate database state.
Fetchers do not call Stripe mutations.
Fetchers do not call server actions.
Fetchers do not return raw Prisma records.
Fetchers do not return raw Stripe objects.
Fetchers do not return raw Clerk objects.
Fetchers do not skip authorization.
```

Add or normalize DTO mappers where raw persistence shape leaks upward.

Add or normalize selects where query shape is ad hoc.

Output complete changed files.

Update tests where required.

---

# Prompt 6 — DTO, Select, and Mapper Safety Pass

## Goal

Ensure backend read paths expose only transport-safe DTOs.

## Prompt

Audit and harden DTO, select, and mapper boundaries.

Target files:

```txt
lib/db/selects/**
lib/dto/**
lib/mappers/**
types/**
lib/fetchers/**
features/**
components/**
```

Rules:

```txt
No raw Prisma models should be returned to UI.
No raw Stripe objects should be returned to UI.
No raw Clerk objects should be returned to UI.
No raw webhook payloads should be returned to UI.
No raw card, bank, or identity-provider-sensitive data should be returned to UI.
Dates must be transport-safe strings.
Money must use integer cents plus formatted labels where useful.
Role-aware action availability should be derived server-side.
```

Normalize DTO naming around:

```txt
CurrentUserDto
AccountReadinessDto
PaymentReadinessDto
PayoutReadinessDto
VouchCardDto
VouchDetailDto
CreateVouchPageDto
ParticipantTimelineEventDto
```

Output complete changed files.

Update tests where required.

---

# Prompt 7 — Readiness Gate Reframe Pass

## Goal

Reframe setup/settings logic into embedded readiness gates.

## Prompt

Audit all setup/readiness/settings-related backend logic and reframe it according to the Vouch source of truth.

Rules:

```txt
Readiness is valid.
Setup as a standalone product surface is not valid.
Settings as a product surface is not valid for MVP except account basics if already required.
Connect is a Stripe-hosted flow.
Payment method setup is a Stripe-hosted flow.
Readiness gates are embedded in dashboard, create, accept, detail, and provider redirect flows.
```

Required readiness capabilities:

```txt
create readiness
accept readiness
payment method readiness
payout readiness
confirmation readiness
terms acceptance readiness
identity/adult readiness if represented in source-of-truth contracts
```

Rename or reframe files where needed.

Do not remove valid readiness logic just because it has old setup naming.

Migrate useful logic into canonical readiness modules.

Output complete changed files.

Update tests so they validate readiness as embedded gating, not setup pages.

---

# Prompt 8 — Pricing and Fee Snapshot Hardening

## Goal

Ensure all Vouch fee logic is server-owned, integer-safe, and immutable after commitment.

## Prompt

Audit and harden Vouch pricing and fee logic.

Target domains:

```txt
pricing
vouch lifecycle
payment coordination
```

Rules:

```txt
Fee math is server-owned.
Client-provided totals are never trusted.
Money is stored as integer cents.
Committed pricing snapshots are immutable.
Historical committed fees are not recalculated from current policy.
Application fees and processing offsets are calculated server-side.
Stripe fee handling must match the source of truth.
```

Ensure create/commit Vouch flow uses server-calculated pricing snapshots.

Ensure DTOs expose safe pricing summaries.

Output complete changed files.

Update unit tests for fee math and snapshot immutability.

---

# Prompt 9 — Stripe Payment Coordination Hardening

## Goal

Ensure Stripe payment coordination is provider-backed, idempotent, and source-of-truth aligned.

## Prompt

Audit and harden Stripe payment coordination.

Target files:

```txt
lib/integrations/stripe/**
lib/actions/paymentActions.ts
lib/actions/vouchActions.ts
lib/db/transactions/paymentTransactions.ts
lib/fetchers/paymentFetchers.ts
```

Rules:

```txt
Stripe owns payment truth.
Vouch mirrors Stripe payment state.
Use manual-capture destination PaymentIntents for Vouch settlement where required by source of truth.
Retrieve PaymentIntent state before capture, cancel, or refund decisions.
Use idempotency keys for provider mutations.
Do not create internal fake payment pages.
Do not use invoice/product/price flows for individual Vouches unless explicitly required by source of truth.
Do not leak raw Stripe objects into UI.
```

Verify support for:

```txt
payment method setup
Vouch fee checkout if applicable
destination PaymentIntent creation
payment intent retrieval
capture
cancel
refund fallback
status mapping
provider state persistence
```

Output complete changed files.

Update tests for provider retrieval, status mapping, idempotency, and manual capture behavior.

---

# Prompt 10 — Stripe Connect and Payout Readiness Hardening

## Goal

Ensure Connect onboarding and payout readiness remain provider-hosted and embedded in canonical flows.

## Prompt

Audit and harden Stripe Connect / payout readiness behavior.

Rules:

```txt
Connect onboarding is Stripe-hosted.
Connected account dashboard is Stripe-hosted.
Connect is not an internal settings page.
Payout readiness is an embedded gate.
Provider account state must be refreshed from Stripe where appropriate.
Do not expose raw Connect account objects to UI.
Do not create marketplace discovery or provider profile behavior.
```

Required operations:

```txt
startConnectOnboarding
startConnectDashboard
retrieveConnectAccountState
mapPayoutReadiness
persistConnectedAccountState
```

Output complete changed files.

Update tests for Connect redirect, readiness mapping, and provider state persistence.

---

# Prompt 11 — Confirmation System Hardening

## Goal

Harden the bilateral confirmation system around Vouch codes, confirmation windows, duplicate prevention, and offline payload rules.

## Prompt

Audit and harden the Vouch confirmation system.

Rules:

```txt
Both participants must confirm inside the confirmation window.
One-sided confirmation never releases funds.
Confirmation must be participant-role aware.
Duplicate confirmations are blocked.
Vouch code exchange must validate the counterparty code.
Offline confirmation payloads count only if they prove generation inside the confirmation window.
Clock-skew tolerance must be bounded.
GPS is not settlement truth.
Screenshots, evidence, and support judgment are forbidden.
```

Target files:

```txt
lib/domain/vouch-confirmation.ts
lib/vouch/confirmation.ts
lib/actions/vouchActions.ts
lib/db/transactions/confirmationTransactions.ts
schemas/vouch.ts
types/vouch.ts
tests/unit/confirmation/**
```

Do not invent new confirmation surfaces beyond source-of-truth behavior.

Output complete changed files.

Update unit tests for:

```txt
valid bilateral confirmation
one-sided confirmation non-release
duplicate prevention
late confirmation rejection
time bucket validation
offline payload validation
role mismatch rejection
```

---

# Prompt 12 — Settlement Resolution Hardening

## Goal

Ensure settlement is deterministic, provider-backed, and impossible to manually override.

## Prompt

Audit and harden Vouch settlement resolution.

Rules:

```txt
Settlement combines Vouch workflow truth with Stripe provider truth.
Always retrieve provider truth before capture, cancel, or refund.
Capture only when both participants confirmed within the confirmation window and provider state permits capture.
Incomplete confirmation resolves to non-capture, cancel, expiration, or refund according to provider state.
No manual awards.
No support override.
No force release.
No UI-triggered manual capture.
No settlement decisions from browser return URLs.
```

Target files:

```txt
lib/domain/vouch-settlement.ts
lib/vouch/settlement.ts
lib/actions/vouchActions.ts
lib/actions/paymentActions.ts
lib/db/transactions/vouchTransactions.ts
lib/db/transactions/paymentTransactions.ts
lib/integrations/stripe/payment-intents.ts
lib/integrations/stripe/refunds.ts
tests/unit/settlement/**
```

Ensure idempotency keys are used for provider mutations.

Ensure recovery-required states are recorded safely on provider failure.

Output complete changed files.

Update settlement tests.

---

# Prompt 13 — Webhook Handler and Ledger Hardening

## Goal

Ensure Stripe and Clerk webhook handlers are verified, idempotent, explicit, and source-of-truth aligned.

## Prompt

Audit and harden provider webhook handling.

Target routes:

```txt
app/api/stripe/webhooks/route.ts
app/api/clerk/webhooks/route.ts
```

Supporting modules:

```txt
lib/integrations/stripe/webhook-events.ts
lib/auth/webhooks.ts
lib/db/transactions/webhookTransactions.ts
lib/db/transactions/paymentTransactions.ts
lib/db/transactions/userTransactions.ts
lib/db/transactions/auditTransactions.ts
schemas/webhooks.ts
types/webhooks.ts
```

Rules:

```txt
Webhook handlers are the only approved API route category.
Handlers must read raw request bodies where provider verification requires it.
Handlers must verify provider signatures before processing.
Every provider event id must be recorded once.
Duplicates must be acknowledged without rerunning transitions.
Late events must apply only valid forward movement.
Unsupported events should be safely ignored and recorded.
No raw provider payload storage unless explicitly allowed by source-of-truth contracts.
No client components should call webhook routes.
```

Hard rule:

```txt
The Clerk webhook handler must remain explicitly a Clerk webhook handler.
Do not rename, hide, or reframe it away from webhook semantics.
```

Output complete changed files.

Update tests for:

```txt
signature verification
duplicate event id handling
late event reconciliation
unsupported event ignore behavior
Clerk user sync idempotency
Stripe payment state reconciliation
```

---

# Prompt 14 — Audit and Timeline Safety Pass

## Goal

Ensure audit history is deterministic system history, not dispute evidence or subjective narrative.

## Prompt

Audit and harden audit event handling and participant timeline mapping.

Rules:

```txt
Audit is append-only deterministic system history.
Audit is not dispute evidence.
Audit is not support adjudication.
Audit must not store subjective accusations.
Audit must not store screenshots, evidence narratives, or manual outcome records.
Participant-safe timelines must hide internal/provider-sensitive fields.
Provider reconciliation events should be recorded safely.
```

Target files:

```txt
lib/audit/**
lib/db/transactions/auditTransactions.ts
lib/db/selects/audit.selects.ts
lib/dto/audit.mappers.ts
types/audit.ts
schemas/audit.ts
tests/unit/audit/**
```

Output complete changed files.

Update audit/timeline tests.

---

# Prompt 15 — Recovery and Idempotent Retry Hardening

## Goal

Ensure recovery handles only technical inconsistency and never creates discretionary outcome behavior.

## Prompt

Audit and harden recovery behavior.

Rules:

```txt
Recovery handles technical inconsistency only.
Recovery may retrieve provider state.
Recovery may retry idempotent provider operations.
Recovery may repair local provider mirror state.
Recovery may record safe failure/recovery audit events.
Recovery cannot rewrite Vouch terms.
Recovery cannot rewrite confirmation truth.
Recovery cannot manually award funds.
Recovery cannot create off-platform payout instructions.
```

Target files:

```txt
lib/domain/vouch-recovery.ts
lib/vouch/recovery.ts
lib/db/transactions/systemTransactions.ts
lib/db/transactions/paymentTransactions.ts
lib/db/transactions/auditTransactions.ts
lib/integrations/stripe/payment-intents.ts
lib/integrations/stripe/refunds.ts
tests/unit/recovery/**
```

Output complete changed files.

Update recovery tests.

---

# Prompt 16 — API Route Surface Contract Pass

## Goal

Ensure API routes are limited to provider webhooks only.

## Prompt

Audit all API route handlers.

Allowed API route handlers:

```txt
app/api/clerk/webhooks/route.ts
app/api/stripe/webhooks/route.ts
```

Forbidden internal API routes:

```txt
app/api/vouches/create/route.ts
app/api/vouches/confirm/route.ts
app/api/vouches/capture/route.ts
app/api/vouches/refund/route.ts
app/api/payment/setup/route.ts
app/api/payout/setup/route.ts
app/api/accounts/create/route.ts
app/api/admin/settlement/route.ts
app/api/disputes/**
app/api/messages/**
app/api/reviews/**
app/api/marketplace/**
```

Rules:

```txt
Internal app writes use server actions.
Protected reads use fetchers.
External provider events use webhook handlers.
No client component should call internal API mutation routes.
```

Remove, migrate, or fail loudly on forbidden API surfaces.

Update contract tests to enforce the approved route surface.

Output complete changed files.

---

# Prompt 17 — Environment and Configuration Safety Pass

## Goal

Centralize and validate server configuration without leaking secrets.

## Prompt

Audit and harden environment/configuration handling.

Target files:

```txt
lib/env.ts
lib/integrations/stripe/config.ts
lib/auth/config.ts
next.config.*
```

Rules:

```txt
Server secrets must never leak to client bundles.
Required env vars must fail fast when missing.
Public env vars must be explicitly named and safe.
Stripe live/test configuration must not mix unsafely.
Webhook secrets must be server-only.
Provider return URLs must be centralized.
```

Output complete changed files.

Update tests where applicable.

---

# Prompt 18 — Backend Contract Test Expansion

## Goal

Add or harden tests that enforce backend architecture and forbidden surfaces.

## Prompt

Expand backend contract tests to enforce source-of-truth architecture.

Required checks:

```txt
no forbidden API routes
no forbidden product surfaces in backend modules
Clerk webhook handler remains explicitly a webhook handler
Stripe webhook handler remains explicitly a webhook handler
no raw provider payloads exported to UI DTOs
no raw Prisma models returned from fetchers
server actions follow action boundaries
fetchers follow read-only boundaries
settlement has no manual award or force release path
confirmation has no one-sided release path
readiness is embedded gating, not setup page product surface
```

Target files:

```txt
tests/contract/backend-boundaries.test.ts
tests/contract/source-conformance.test.ts
tests/contract/architecture-surface.test.ts
```

Output complete changed files.

Run:

```txt
pnpm test -- tests/contract/backend-boundaries.test.ts tests/contract/source-conformance.test.ts tests/contract/architecture-surface.test.ts
```

---

# Prompt 19 — Backend Validation and Fix Pass

## Goal

Run validation, fix root causes, and produce a clean backend status report.

## Prompt

Run the backend validation sequence and fix root causes.

Commands:

```txt
pnpm prisma:validate
pnpm validate:contracts
pnpm typecheck
pnpm lint
pnpm test
pnpm validate
```

Rules:

```txt
Do not silence errors with broad any types.
Do not delete tests to pass validation.
Do not weaken source-of-truth contracts.
Do not rename the Clerk webhook handler away from webhook semantics.
Fix root causes.
Output complete changed files.
```

Generate or update:

```txt
.agents/json/backend-validation-report.json
```

Include:

```txt
commands run
pass/fail status
files changed
root causes fixed
remaining blockers
```

---

# Prompt 20 — Final Backend Conformance Audit

## Goal

Verify the backend fully conforms to the Vouch source of truth, server architecture taxonomy, and backend implementation matrix.

## Prompt

Perform the final backend conformance audit.

Validate:

```txt
domain taxonomy alignment
service inventory alignment
operation inventory alignment
action boundary correctness
fetcher boundary correctness
transaction ownership
provider integration boundaries
Stripe payment truth handling
Clerk auth truth handling
webhook handler explicitness
webhook idempotency
confirmation correctness
settlement correctness
audit safety
recovery safety
DTO transport safety
forbidden backend surfaces
validation status
```

Specifically verify absence of:

```txt
marketplace search
provider discovery
public profiles
service listings
categories
ratings
reviews
messaging
chat
disputes
claims
appeals
evidence upload
screenshot review
manual fund award
manual settlement rewrite
force release
support override
admin arbitration
```

Hard requirement:

```txt
The Clerk webhook handler remains a webhook handler.
```

Generate final report:

```txt
.agents/json/backend-conformance-report.json
```

Include:

```txt
aligned domains
missing services
missing operations
violations
warnings
recommended removals
provider risks
settlement risks
webhook risks
validation status
MVP backend readiness judgment
```

Do not invent product behavior.

Conform strictly to the Vouch source of truth.

---

# Final Execution Rule

Codex should only change code when the pass explicitly requires code changes.

Inventory and audit passes produce JSON reports.

Refactor and hardening passes output complete changed files.

Validation passes fix root causes, not symptoms.

The backend is not successful because it has files.

The backend is successful when Vouch's rules are enforceable, provider-backed, idempotent, audited, and validated.

The Clerk webhook handler remains a webhook handler.

