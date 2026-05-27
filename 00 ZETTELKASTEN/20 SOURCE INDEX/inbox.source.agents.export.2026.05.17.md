---
title: ".agents-export-2026-05-17"
type: reference
scope: vault
project:
domain: inbox
artifact: agents.export.2026.05.17
kind: source-note
namespace: inbox.source.agents.export.2026.05.17
status: review
authority: archive
parent: "[[devnotes.zettelkasten.map]]"
depends_on: []
supersedes: []
tags:
  - inbox
  - imports/source-note
  - status/review
created: 2026-05-27
updated: 2026-05-27
source_file: "00 ZETTELKASTEN/INBOX/.agents-export-2026-05-17.md"
source_hash: "3793B7E5E201DF09FCA53C4E74AD4F0DA58313C0B740301B42EADF2E8049EC81"
---
# .agents-export-2026-05-17

# Codebase Export

## .agents/contracts/domain-model.yaml
```yaml
id: vouch.domain-model
source_date: "2026-05-16"
authority: source-of-truth
lifecycle_states:
  - draft
  - committed
  - sent
  - accepted
  - authorized
  - confirmable
  - completed
  - expired
roles:
  - merchant
  - customer
rules:
  immutable_after_commit: true
  sent_vouches_are_immutable: true
  bilateral_confirmation_required_for_release: true
  provider_states_separate_from_lifecycle: true
forbidden_surfaces:
  - marketplace
  - messaging
  - disputes
  - evidence
  - reviews
  - manual_settlement

```

## .agents/contracts/integrations.yaml
```yaml
id: vouch.integrations
source_date: "2026-05-16"
authority: source-of-truth
providers:
  stripe:
    owns:
      - payment_method_collection
      - payment_authorization
      - hosted_checkout
      - identity_collection
      - connect_onboarding
      - payout_account_management
      - payment_truth
    vouch_stores_only:
      - safe_provider_references
      - statuses
      - timestamps
      - readiness_flags
      - audit_safe_metadata
  clerk:
    owns:
      - authentication_truth
rules:
  browser_return_is_not_payment_truth: true
  no_raw_card_bank_identity_storage: true
  webhook_reconciliation_required: true

```

## .agents/contracts/product.yaml
```yaml
id: vouch.product
source_date: "2026-05-16"
authority: source-of-truth
definition: commitment-backed payment coordination
core_rule: both participants confirm inside the confirmation window before release can proceed
merchant_fee:
  due: committed_creation
  hosted_by: stripe
customer_authorization:
  hosted_by: stripe
  vouch_authority: workflow_truth_only
boundaries:
  not_scheduler: true
  not_messaging: true
  not_discretionary_outcome_system: true
  not_provider_discovery: true

```

## .agents/contracts/routes.yaml
```yaml
id: vouch.routes
source_date: "2026-05-16"
authority: source-of-truth
public:
  - /
  - /pricing
  - /faq
  - /legal/terms
  - /legal/privacy
  - /checkout/success
auth:
  - /sign-in
  - /sign-up
tenant:
  - /dashboard
  - /vouches/new
  - /vouches/new/confirm
  - /vouches/[vouchId]
api:
  - /api/clerk/webhooks
  - /api/stripe/webhooks
external_provider_surfaces:
  - stripe_connect
  - stripe_checkout
  - stripe_payment_method_management
  - clerk_account

```

## .agents/contracts/quality-gates.yaml
```yaml
id: vouch.quality-gates
source_date: "2026-05-16"
authority: source-of-truth
checks:
  contract_validation: pnpm validate:contracts
  typecheck: pnpm typecheck
  unit_tests: pnpm test
  full_validation: pnpm validate
visual_review:
  server_required: approval_required
  screenshot_catalog:
    - landing
    - pricing
    - faq
    - terms
    - privacy
    - sign-in
    - sign-up
    - dashboard
    - create-vouch
    - confirm-create
    - vouch-detail
    - checkout-success

```

## .agents/docs/architecture.md
```md
# Vouch Architecture

## Layer contract

Vouch is a production SaaS codebase with strict boundaries.

Vouch is a narrow commitment-backed payment coordination system for appointments and in-person agreements.

The architecture exists to enforce deterministic workflow state, provider-backed payment truth, bilateral confirmation, auditability, and non-discretionary settlement.

Vouch is not a marketplace, broker, scheduler, messaging app, review system, dispute-resolution system, escrow provider, discovery platform, or admin arbitration surface.

Outcome follows system state.

## Route layer

`app/**` is route shell only.

Allowed:

- route segments
- layouts
- metadata
- loading/error/not-found boundaries
- thin `page.tsx` files
- Suspense wrappers
- redirects
- params/searchParams handoff
- one page-level feature component
- external provider webhook route handlers

Forbidden:

- Prisma
- Stripe SDK
- provider business logic
- Clerk domain logic
- authz enforcement
- DTO shaping
- domain mutation
- settlement logic
- webhook reconciliation
- manual settlement override logic
- complex forms
- large hard-coded copy blocks

Route files define application surface area.

Route files do not define business truth.

## Feature layer

`features/**` owns page-level orchestration.

Feature modules may:

- call fetchers from server features
- pass DTOs into UI
- wire server actions into forms
- coordinate Suspense boundaries
- coordinate role-aware page branches
- coordinate drawers/dialogs/forms
- hold client-only state in `.client.tsx` files

Feature modules must not:

- query Prisma
- call Stripe SDKs directly
- perform provider reconciliation
- own reusable UI primitives
- become generic component libraries
- create hidden workflow rules
- create discretionary settlement behavior

Feature modules coordinate surfaces.

They do not own Vouch truth.

## Component layer

`components/**` is pure reusable UI.

Components may:

- render DTOs
- render forms
- render panels/cards/buttons
- format labels from props
- emit server-action form submissions
- use client state for UI interaction

Components must not:

- call Prisma
- call protected fetchers
- call Stripe SDK
- call Clerk server APIs
- perform authz
- mutate domain state directly
- invent hidden business rules
- decide settlement
- decide confirmation truth
- create dispute, evidence, review, messaging, or marketplace behavior

Components display state.

They do not create truth.

## UI primitives

`components/ui/**` contains low-level shadcn/Base UI primitives only.

No domain semantics.

No protected fetching.

No Vouch workflow rules.

No hidden business logic.

No Vouch-specific settlement meaning.

## Reads

Reads go through:

`lib/fetchers/*`

Protected fetcher pipeline:

- authenticate
- authorize
- minimal select
- DTO mapping
- cache policy
- transport-safe return

Protected fetchers must not return raw Prisma models, raw provider payloads, raw Clerk objects, raw Stripe objects, raw KYC data, raw card data, or raw bank data.

## Writes

Writes go through:

`lib/actions/*`

Server action pipeline:

- authenticate
- authorize
- Zod validate
- transaction/provider operation
- audit event
- revalidate
- typed result or redirect

Transactions and integrations are dependencies, not public write entry points.

Internal app mutations must not use API routes.

Client components must not call `fetch("/api/...")` for Vouch domain mutations.

## Database

Prisma schema stores durable workflow facts.

Use:

- `lib/db/selects/*`
- `lib/db/transactions/*`

The database stores facts required for deterministic payment coordination.

The database must not model marketplace behavior, messaging, disputes, evidence review, ratings, reviews, appeals, public provider profiles, service listings, manual settlement awards, or subjective resolution flows.

Do not leak raw Prisma models to UI.

Do not store:

- raw provider payloads
- raw card data
- raw bank data
- raw KYC documents
- raw identity documents
- raw Clerk payloads
- raw Stripe objects
- message content
- evidence content
- screenshots
- meeting purpose details

## DTOs

DTOs live in:

`types/*`

DTO mappers live in:

`lib/dto/*`

All Date values crossing transport boundaries are ISO strings.

All money values are integer cents plus display labels where useful.

DTOs must be transport-safe.

DTOs must not expose raw provider objects, raw Prisma records, raw Clerk objects, or sensitive provider data.

## Zod

Schemas live in:

`schemas/*`

Use Zod for:

- server action input
- form input
- route params
- search params
- provider return params
- normalized webhook envelopes after signature verification

Client-side validation is UX only.

Server-side validation is authoritative.

## Domain logic

Vouch-specific state logic lives in:

`lib/vouch/*`

Expected files:

- `lib/vouch/constants.ts`
- `lib/vouch/fees.ts`
- `lib/vouch/lifecycle.ts`
- `lib/vouch/confirmation.ts`
- `lib/vouch/resolution.ts`
- `lib/vouch/idempotency.ts`

Domain logic owns deterministic state rules.

Domain logic must enforce:

- committed Vouch immutability
- bilateral confirmation requirement
- confirmation-window constraints
- one-sided confirmation non-release
- provider-backed settlement eligibility
- no manual settlement award
- no support override
- no discretionary resolution

## Provider integrations

Stripe SDK calls live only under:

`lib/integrations/stripe/*`

Clerk server integration lives behind:

`lib/auth/*`

Authz lives behind:

`lib/authz/*`

Stripe owns payment truth.

Clerk owns authentication truth.

Vouch owns workflow truth.

Webhooks reconcile provider truth.

Provider integrations must never create marketplace, messaging, dispute, evidence, review, or manual settlement surfaces.

## API routes

Only provider webhooks are allowed:

- `app/api/clerk/webhook-handler/route.ts`
- `app/api/stripe/webhooks/route.ts`

No internal app mutation API routes.

Client components must not call `fetch("/api/...")` for Vouch domain mutations.

Webhook route handlers may verify provider signatures and delegate processing.

Webhook route handlers must not contain inline business workflow logic, inline Prisma mutations, inline settlement decisions, or app-user DTO shaping.

## Payment architecture

Vouch uses provider-backed payment coordination.

Stripe handles:

- Checkout
- payment authorization
- payment method collection
- billing details
- manual-capture PaymentIntents
- application fee processing
- Stripe Customer management
- Stripe Connect onboarding
- KYC/compliance collection
- payout banking collection
- payout execution
- provider payment state
- provider settlement state

Vouch must retrieve current Stripe provider state before settlement-critical provider operations.

Vouch must never capture, cancel, void, or refund based only on local UI state, browser redirect state, stale local database state, or unilateral participant action.

## Confirmation architecture

Presence confirmation is deterministic and bilateral.

Code generation alone means nothing.

One-sided confirmation means nothing for settlement.

Only successful bilateral verification inside the configured confirmation window changes settlement eligibility.

Confirmation may not be replaced with:

- GPS confirmation
- manual support confirmation
- screenshots
- evidence upload
- arbitration
- subjective fallback review
- admin override

## Audit

Every important transition writes an audit event.

Audit is append-only.

Audit is not a dispute system.

Audit metadata must be safe and minimal.

Participant-facing timeline receives only participant-safe audit items.

Audit must not store subjective allegations, evidence content, raw provider payloads, webhook signatures, secret metadata, or support judgment.

## Final architecture invariant

The UI can request transitions.

Server actions validate transitions.

Transactions persist transitions.

Integrations retrieve provider truth.

Webhooks reconcile provider truth.

Audit records the deterministic story.

No layer may introduce discretionary settlement.

Outcome follows system state.

```

## .agents/docs/design-system.md
```md
# Vouch Design System

## Visual direction

Vouch uses a dark brutalist operational SaaS interface.

The interface should feel:

- deterministic
- protocol-driven
- high-contrast
- dense but intentional
- institutional
- precise
- non-decorative

The visual system must reinforce that Vouch is deterministic payment coordination infrastructure, not a marketplace, social app, dispute platform, or consumer scheduling tool.

## Required style

Use:

- dark foundation
- black/neutral panels
- bordered surfaces
- zero-radius or rounded-none panels
- uppercase display typography
- tight labels
- restrained `#1D4ED8` blue
- neutral text hierarchy
- subtle blur only where useful
- grid/radial backgrounds
- mobile-first layouts
- status text, not color alone

The design language should feel controlled, explicit, and operational.

## Avoid

Do not use:

- soft rounded SaaS cards
- pastel dashboards
- marketplace cards
- profile cards
- review/rating widgets
- chat-style UI
- consumer social patterns
- playful gradients
- ambiguous status colors without text
- trust-and-safety theater UI
- surveillance-style UI
- dispute-resolution UI
- evidence-submission UI
- provider discovery UI
- service listing UI

The interface must not imply that Vouch verifies people, judges behavior, reviews evidence, mediates disputes, guarantees safety, or decides who is right.

## Page structure

Every page should use:

- shell header from layout
- main content container
- page hero/header
- primary page body
- mapped reusable sections/panels/cards
- final callout panel where appropriate
- shell footer from layout

Pages should be scannable, consistent, and narrow.

The route surface must remain intentionally small.

## Shared components

Preferred shared components:

- `components/shared/page-hero.tsx`
- `components/shared/section-intro.tsx`
- `components/shared/callout-panel.tsx`
- `components/shared/card-grid.tsx`
- `components/shared/metric-grid.tsx`
- `components/shared/process-panel.tsx`
- `components/shared/content-section-list.tsx`
- `components/shared/surface.tsx`

Shared components must stay presentational.

They must not own domain rules, protected fetching, provider logic, settlement logic, or authorization logic.

## Vouch cards

The Vouch card is the primary dashboard unit.

A Vouch card displays:

- amount
- appointment date
- confirmation window
- status
- participant role
- next action
- archive state

Clicking a Vouch card opens:

`/vouches/[vouchId]`

A Vouch card must not become a marketplace listing, provider profile card, review card, dispute card, or messaging preview.

## Vouch detail

The Vouch detail page is the canonical action surface.

It owns:

- payment status
- confirmation status
- checkout link sharing
- presence confirmation
- invite acceptance
- archive action
- safe timeline/audit summary
- next action

No route sprawl.

No separate dispute, evidence, messaging, review, settings, or admin settlement surfaces.

The detail page displays what the protocol knows.

It does not invite subjective narrative.

## Status language

Every status must explain:

- what happened
- what happens next
- what cannot happen
- who can act
- what consequence applies

Do not rely on color alone.

Status text must make deterministic consequences clear.

Examples of acceptable status framing:

- â€œPayment is authorized. Settlement is waiting for bilateral confirmation.â€
- â€œOnly one participant confirmed. Settlement cannot occur.â€
- â€œThe confirmation window closed. Funds will not release unless provider state requires a different non-capture or refund path.â€
- â€œBoth participants confirmed. Vouch is checking provider state before settlement.â€

Avoid vague labels like:

- â€œpendingâ€
- â€œin reviewâ€
- â€œdisputedâ€
- â€œclaim submittedâ€
- â€œawaiting supportâ€
- â€œunder investigationâ€

## Copy rules

Use Vouch language:

- Outcome follows system state.
- Vouch asks what happened.
- The rule is known before money moves.
- No unilateral action forces settlement.
- No discretion surface exists to exploit.
- Protocol is final.
- Payment coordination, not custody.
- Provider-backed settlement logic.
- Bilateral confirmation.
- Non-discretionary execution.

Avoid marketplace language:

- book a provider
- find services
- hire merchants
- browse listings
- message provider
- review provider
- resolve dispute
- submit evidence
- claim outcome
- open a case
- request an award
- force release

## Legal and product framing in UI

The UI must clearly reflect:

- Vouch does not arrange meetings.
- Vouch does not verify meeting purpose.
- Vouch does not guarantee performance, services, safety, legality, or legitimacy.
- Vouch does not mediate disputes.
- Vouch does not reverse completed outcomes through discretion.
- Users independently arrange all interactions outside the platform.
- Funds release only if the protocol conditions are satisfied.

## Confirmation UI

Confirmation UI must reinforce:

- both participants must confirm
- each participant confirms as their scoped role
- confirmation is only valid inside the confirmation window
- code generation alone does not release funds
- one-sided confirmation does not release funds
- confirmation cannot be rewritten after success
- no support override exists

Do not use UI that implies GPS, screenshots, evidence, messaging, or admin review can substitute for bilateral confirmation.

## Payment UI

Payment UI must reinforce:

- Stripe handles payment authorization and payment method collection
- Vouch stores safe provider references and normalized provider state only
- browser redirects are not payment truth
- provider state determines capture, non-capture, cancellation, expiration, void, or refund behavior
- Vouch checks provider state before settlement-critical operations

Do not create internal fake payment pages or raw card-management pages.

Payment and Connect actions should send users to provider-hosted flows where required.

## Empty states and callouts

Empty states should direct users toward the next valid protocol action.

They must not promote browsing, discovery, service listings, public profiles, messaging, disputes, or reviews.

Callouts should explain the system rule, not soften it.

Good callout direction:

- â€œThe rule is known before money moves.â€
- â€œNo unilateral confirmation can force release.â€
- â€œProvider state determines the payment path after protocol failure.â€
- â€œArchived Vouches remain accessible, but read-only.â€

## Final design invariant

The interface must make the protocol visible.

The product should feel like deterministic infrastructure, not a social product.

Every screen should answer:

- What state is this in?
- Who can act?
- What rule applies?
- What happens if the rule is satisfied?
- What happens if it is not?

Outcome follows system state.

```

## .agents/docs/legal-and-copy.md
```md
# Vouch Legal and Copy Contract

## Legal positioning

Vouch is deterministic payment coordination infrastructure.

Vouch enables conditional payment release based on mutual confirmation of an in-person meeting.

Vouch coordinates protocol-defined payment outcomes through authenticated workflow state, provider-backed payment state, and bilateral presence confirmation.

Vouch does not determine fault, honesty, service quality, legal correctness, intent, or moral blame.

Vouch determines whether both participants confirmed presence inside the configured confirmation window.

Outcome follows system state.

## Legal source normalization rule

Uploaded legal source files may contain:

- source material
- placeholders
- draft phrasing
- informal language
- exploratory notes

Agents must preserve substantive legal/product rules while removing:

- jokes
- insults
- sarcasm
- placeholder text
- casual legal phrasing
- unsupported legal conclusions
- conversational filler

Production legal copy must remain:

- neutral
- professional
- concise
- operationally accurate
- aligned with Vouch product boundaries

## Missing legal values rule

Agents must not invent:

- legal entity names
- company addresses
- governing law
- effective dates
- version numbers
- support emails
- privacy contact emails
- legal contacts

When a required legal value is missing, use explicit placeholders:

```txt
[LEGAL_ENTITY_NAME_REQUIRED]
[GOVERNING_LAW_STATE_REQUIRED]
[SUPPORT_EMAIL_REQUIRED]
[PRIVACY_CONTACT_EMAIL_REQUIRED]
[EFFECTIVE_DATE_REQUIRED]
[TERMS_VERSION_REQUIRED]
[PRIVACY_VERSION_REQUIRED]
[USER_AGREEMENT_VERSION_REQUIRED]
```

## What Vouch is not

Vouch does not:

- arrange meetings
- facilitate services
- act as broker
- act as agent
- act as intermediary
- act as marketplace
- act as scheduler
- provide discovery
- provide public profiles
- provide messaging
- mediate disputes
- investigate claims
- review evidence
- review screenshots
- arbitrate outcomes
- reverse completed outcomes through Vouch discretion
- manually award funds
- manually rewrite confirmation truth
- provide support overrides
- endorse users
- verify meeting purpose
- guarantee safety
- guarantee legality
- guarantee legitimacy
- guarantee performance
- guarantee services
- guarantee outcomes

Users independently arrange all interactions outside the platform.

## Account-level agreement

At signup, users must accept:

- User Agreement
- Terms of Service
- Privacy Policy

Account-level agreement must be persisted in Vouch DB.

Do not store terms acceptance only in Clerk metadata.

Clerk authentication does not equal Vouch terms acceptance.

Per-Vouch disclaimer acceptance is separate from account-level agreement.

## Per-Vouch disclaimer

Before creating or accepting a Vouch, users must explicitly accept transaction-specific conditional payment terms.

The per-Vouch disclaimer must state:

- payment is conditional
- payment is governed by Vouch automated release rules
- funds release only if both parties confirm presence inside the configured confirmation window
- code generation alone does not release funds
- one-sided confirmation does not release funds
- funds return, are not captured, are canceled, expire, are voided, or are refunded according to provider state if confirmation fails within the allowed time
- Stripe or equivalent provider state determines available payment operations
- Vouch does not verify meeting purpose
- Vouch does not guarantee performance, services, safety, legality, legitimacy, or outcomes
- Vouch does not mediate disputes
- Vouch does not review evidence
- Vouch does not reverse completed outcomes through discretion
- transaction is final once protocol conditions are met
- user enters agreement at their own risk

## Privacy posture

Vouch collects only what is needed to:

- operate the platform
- verify identity where required
- process payments
- enable confirmation
- prevent fraud/abuse
- comply with legal obligations
- reconcile provider state
- maintain audit history

Vouch should not collect or store:

- meeting purpose
- details of what users are doing
- message content
- evidence content
- screenshots
- raw card data
- raw bank data
- raw identity documents
- raw KYC payloads
- full provider payloads
- raw Clerk payloads
- raw Stripe objects

Vouch stores safe provider references and normalized provider state only.

## Third-party services

Stripe or equivalent providers handle payment processing.

Stripe handles:

- Checkout
- payment authorization
- payment method collection
- billing details
- manual-capture PaymentIntents
- application fee processing
- Stripe Customer management
- Stripe Connect onboarding
- KYC/compliance collection
- payout banking collection
- payout execution
- provider payment state
- provider settlement state

Identity providers may handle KYC/verification.

Clerk handles authentication.

Clerk handles:

- sign-in
- sign-up
- session creation
- session renewal
- session security controls
- account portal account management
- auth provider lifecycle events

Vouch does not replace Stripe payment truth or Clerk authentication truth.

## Provider truth language

Use this consistently:

- Stripe owns payment truth.
- Clerk owns authentication truth.
- Vouch owns workflow truth.
- Webhooks reconcile provider truth.
- Outcome follows system state.

Do not imply that browser redirects, UI state, local optimism, or participant claims determine payment truth.

## Copy spine

Use this language consistently:

Vouch doesnâ€™t ask whoâ€™s right.

Vouch asks what happened.

No stories.

No screenshots.

No appeals.

No mediation.

No subjective judgment.

Vouch is deterministic payment coordination infrastructure.

Outcome follows system state.

No unilateral action forces settlement.

The rule is known before money moves.

Protocol is final.

## Core marketing line

Deterministic trust infrastructure for real-world commitments.

## Supporting copy

At Vouch, we mind our business. Not yours.

We do not pry.

We do not mediate.

We do not build surveillance systems disguised as trust.

Vouch aligns intent, accountability, and outcome by protocol.

Quietly private.

Mutually explicit.

Economically meaningful.

## Moat language

Anyone can copy software.

Copying trust infrastructure is harder.

Meaning:

- system design
- incentives
- operational integrity
- deterministic execution
- provider-backed payment rails
- immutable audit state

## Forbidden copy

Do not describe Vouch as:

- escrow
- marketplace
- broker
- scheduler
- dating app
- service directory
- provider search
- review platform
- messaging platform
- dispute platform
- arbitration tool
- payment guarantee
- safety guarantee
- fraud investigation tool
- evidence review system
- claim resolution system
- manual payout platform

Prefer:

- payment coordination
- commitment-backed workflow
- deterministic protocol
- provider-backed settlement logic
- conditional release
- bilateral confirmation
- non-discretionary execution
- authenticated workflow state
- protocol-defined outcome
- provider-backed payment state

## Status and consequence copy

Every status must explain:

- what happened
- what happens next
- what cannot happen
- who can act
- what consequence applies

Do not rely on color alone.

Do not use ambiguous terms that imply review, judgment, discretion, or support intervention.

Avoid:

- under review
- claim pending
- dispute opened
- support reviewing
- awaiting decision
- evidence submitted
- payout requested

Prefer:

- waiting for authorization
- payment authorized
- confirmation window open
- merchant confirmed
- customer confirmed
- bilateral confirmation complete
- confirmation incomplete
- provider state prevents capture
- non-capture pending
- completed
- expired
- archived

## Final legal and copy invariant

Vouch language must preserve the product boundary.

No copy may imply that Vouch decides who is right.

No copy may imply that Vouch guarantees safety, performance, legality, legitimacy, or payment outcome beyond protocol rules and provider state.

No copy may imply a manual discretion surface.

The rule is known before money moves.

Outcome follows system state.

```

## .agents/docs/launch-checklist.md
```md
# Vouch Launch Checklist

## Product invariant

Vouch is a narrow commitment-backed payment coordination system for appointments and in-person agreements.

Both participants confirm presence inside the confirmation window â†’ funds release.

Anything else â†’ funds do not release. Stripe provider state determines non-capture, cancellation, expiration, void, or refund.

Stripe owns provider payment truth.

Clerk owns authentication truth.

Vouch owns workflow truth.

Webhooks reconcile provider truth.

Outcome follows system state.

Vouch does not provide marketplace discovery, scheduling, messaging, reviews, disputes, evidence review, mediation, arbitration, escrow, manual awards, support overrides, or manual confirmation rewrites.

## Product boundary checklist

Before launch, confirm the app does not include:

- marketplace discovery
- public provider profiles
- service listings
- search or browse surfaces
- scheduling system
- internal messaging
- chat threads
- reviews
- ratings
- disputes
- claims
- appeals
- evidence uploads
- screenshot review
- arbitration tools
- manual settlement awards
- support override flows
- manual confirmation rewrites
- force-release controls
- force-refund controls
- internal fake payment pages
- internal payout-management pages

## Workflow checklist

Before launch, confirm:

- committed Vouch terms are immutable
- Vouch amount is immutable after commitment
- appointment date is immutable after commitment
- confirmation window is immutable after commitment
- provider references are immutable after commitment
- one-sided confirmation never releases funds
- code generation alone never releases funds
- confirmation outside the window is rejected
- duplicate confirmation is rejected
- successful bilateral confirmation locks confirmation truth
- completed Vouches are terminal
- expired Vouches are terminal
- archived Vouches are read-only and remain accessible by direct URL
- recovery state is internal-only and non-discretionary

## Payment checklist

Before launch, confirm:

- Stripe handles payment authorization
- Stripe handles payment method collection
- Stripe handles billing details
- Stripe handles Connect onboarding
- Stripe handles KYC/compliance collection
- Stripe handles payout banking collection
- Stripe handles payout execution
- Vouch stores only safe provider references and normalized provider state
- Vouch does not store raw Stripe objects
- Vouch does not store raw card data
- Vouch does not store raw bank data
- Vouch does not store raw KYC data
- Vouch retrieves current Stripe provider state before capture, cancellation, void, refund, or settlement reconciliation
- browser return URLs are not treated as payment truth
- provider authorization windows are enforced
- non-capture is preferred over refund whenever possible
- refunds are provider-backed fallback behavior, not discretionary remedies
- idempotency keys are used for settlement-affecting provider operations

## Confirmation checklist

Before launch, confirm:

- confirmation is bilateral
- confirmation is role-aware
- confirmation is valid only inside the configured confirmation window
- each participant can confirm only once
- merchant and customer confirmation codes are role-specific
- submitted codes validate the counterparty code
- offline confirmation, if enabled, proves valid time-bucket membership
- clock-skew tolerance is bounded
- GPS does not determine settlement truth
- screenshots do not determine settlement truth
- evidence uploads do not determine settlement truth
- support cannot manually confirm presence
- admin cannot rewrite confirmation truth

## Auth and readiness checklist

Before launch, confirm:

- Clerk handles authentication
- Vouch maintains a local user record
- local user status is enforced server-side
- account-level agreement is persisted in Vouch DB
- terms acceptance is not stored only in Clerk metadata
- per-Vouch disclaimer acceptance is separate from account-level agreement
- merchant readiness checks Stripe Connect and payout readiness
- customer readiness checks Stripe customer/payment-method readiness
- readiness gates are enforced before protected actions
- role is scoped to the Vouch, not global account type
- users can be merchant on one Vouch and customer on another

## Legal and copy checklist

Before launch, confirm all public and in-app copy avoids describing Vouch as:

- escrow
- marketplace
- broker
- scheduler
- dating app
- service directory
- provider search
- review platform
- messaging platform
- dispute platform
- arbitration tool
- payment guarantee
- safety guarantee

Preferred language:

- payment coordination
- commitment-backed workflow
- deterministic protocol
- provider-backed settlement logic
- conditional release
- bilateral confirmation
- non-discretionary execution
- outcome follows system state

## Data handling checklist

Before launch, confirm Vouch does not collect or store:

- meeting purpose
- details of what users are doing
- message content
- evidence content
- screenshots
- raw card data
- raw bank data
- raw identity documents
- raw KYC payloads
- full provider payloads
- raw Clerk payloads
- raw Stripe objects

Vouch may store only what is needed to:

- operate the platform
- verify identity where required
- process payments
- enable confirmation
- prevent fraud/abuse
- comply with legal obligations
- reconcile provider state
- maintain audit history

## Architecture checklist

Before launch, confirm:

- `app/**` is route shell only
- `features/**` owns page-level orchestration
- `components/**` is reusable UI only
- `components/ui/**` contains primitives only
- protected reads go through `lib/fetchers/*`
- writes go through `lib/actions/*`
- Stripe SDK calls live only under `lib/integrations/stripe/*`
- Clerk server access lives behind `lib/auth/*`
- authz lives behind `lib/authz/*`
- Vouch state logic lives under `lib/vouch/*`
- DTOs live in `types/*`
- DTO mappers live in `lib/dto/*`
- Zod schemas live in `schemas/*`
- provider webhooks are the only API routes
- no internal app mutation uses `/api/*`

## Required validation

Run:

`pnpm prisma:validate`

`pnpm validate:contracts`

`pnpm lint`

`pnpm typecheck`

`pnpm test`

`pnpm test:e2e`

`pnpm validate`

`pnpm validate:all`

## Launch invariant

Launch is acceptable only when:

- no layer contradicts the source of truth
- no route implies a forbidden product surface
- no UI implies discretionary judgment
- no code path enables unilateral settlement
- no provider state is treated as local assumption
- no settlement-critical operation skips provider retrieval
- no legal/copy language implies marketplace, escrow, dispute, safety guarantee, or mediation behavior
- every important transition writes safe audit state

Outcome follows system state.

```

## .agents/docs/product-doctrine.md
```md
# Vouch Product Doctrine

## Product definition

Vouch is deterministic payment coordination infrastructure for real-world commitments.

Vouch coordinates conditional payment release through authenticated workflow state, Stripe-backed payment state, and bilateral presence confirmation.

Vouch does not determine fault, honesty, service quality, legal correctness, intent, or moral blame.

Vouch determines whether both participants confirmed presence inside the configured confirmation window.

Outcome follows system state.

## Core doctrine

Vouch does not ask who is right.

Vouch asks what happened.

No stories.

No screenshots.

No appeals.

No mediation.

No subjective judgment.

If conditions are met, funds move.

If conditions fail, they do not.

Fraud thrives in ambiguity, exceptions, and manual intervention.

Vouch removes all three.

## Core settlement rule

Both participants successfully confirm inside the confirmation window:

PaymentIntent capture executes.

Settlement proceeds through Stripe Connect.

Anything else:

PaymentIntent non-capture, cancellation, expiration, void, or refund occurs according to provider state.

Code generation alone means nothing.

One-sided confirmation means nothing for settlement.

Only successful bilateral verification changes settlement eligibility.

## What Vouch handles

Vouch handles:

- authenticated workflow state
- Vouch lifecycle state
- appointment metadata
- confirmation windows
- bilateral presence confirmation
- confirmation-code derivation
- settlement eligibility decisions
- capture orchestration
- dashboard state
- archive state
- audit state
- provider reconciliation
- technical recovery state

Vouch does not handle:

- marketplace discovery
- scheduling
- messaging
- reviews
- ratings
- disputes
- evidence review
- arbitration
- manual awards
- support overrides
- manual confirmation rewrites
- public profiles
- service listings

## What Stripe handles

Stripe handles:

- Checkout
- payment authorization
- payment method collection
- billing details
- manual-capture PaymentIntents
- application fee processing
- Stripe Customer management
- Stripe Connect onboarding
- KYC/compliance collection
- payout banking collection
- payout execution
- provider payment state
- provider settlement state

Stripe owns payment truth.

Vouch mirrors Stripe payment state and combines provider truth with workflow truth to determine deterministic outcome.

Vouch must retrieve current Stripe provider state before settlement-critical operations.

## What Clerk handles

Clerk handles:

- authentication
- sign-in
- sign-up
- session creation
- session renewal
- session security controls
- account portal account management
- auth provider lifecycle events

Clerk owns authentication truth.

Clerk does not decide workflow truth.

Clerk does not decide payment truth.

Clerk does not decide settlement eligibility.

## Shared user model

Vouch uses one shared user-account model.

Users are not permanently separated into merchant-only or customer-only accounts.

The same authenticated user may:

- authorize payments as a customer
- onboard through Stripe Connect
- create Vouches as a merchant
- receive payouts as a merchant
- participate in different Vouches in different roles

Role is scoped to the Vouch.

A user may be merchant on one Vouch and customer on another.

Vouch has participants, not marketplace personas.

## Merchant readiness

A merchant must complete:

- authentication
- active local Vouch account
- current terms acceptance
- Stripe Connect onboarding
- payout readiness
- identity/compliance requirements required by Stripe

before creating committed Vouches.

The merchant independently arranges the real-world appointment outside Vouch.

The merchant is not discovered through Vouch.

The merchant is not a marketplace provider.

## Customer readiness

A customer must complete:

- authentication
- active local Vouch account
- current terms acceptance
- Stripe customer/payment-method readiness
- billing readiness required by Stripe

before authorizing payment participation.

The customer independently receives the Vouch link through an external communication channel.

The customer is not matched by Vouch.

Vouch does not operate messaging, discovery, negotiation, or scheduling.

## Committed Vouch immutability

After committed creation, a Vouch cannot be:

- edited
- renegotiated
- canceled by user
- reversed by user
- rewritten
- unsent
- recalled
- altered

Once authorized, it becomes inert until settlement eligibility resolves.

Once completed or expired, it is terminal.

The committed Vouch lifecycle is protocol-controlled.

No participant can force settlement.

No participant can force refund.

No support or admin actor can rewrite confirmation truth.

## Confirmation doctrine

Presence confirmation is bilateral, role-aware, and window-bound.

When the confirmation window opens, participants may derive or view short-lived role-specific confirmation codes.

Participants physically exchange codes.

The merchant submits the customer code.

The customer submits the merchant code.

Only bilateral successful verification changes settlement eligibility.

Confirmation must not be replaced by:

- GPS confirmation
- manual support confirmation
- screenshots
- uploaded evidence
- arbitration
- fallback subjective methods
- admin override

After bilateral confirmation succeeds:

- confirmation state locks permanently
- confirmations cannot be reversed
- confirmations cannot be deleted
- confirmations cannot be retried
- confirmations cannot be replaced

There is no undo, appeal, correction flow, or support override.

## Non-capture doctrine

Anything other than successful bilateral confirmation results in non-capture behavior whenever possible.

Examples:

- neither participant confirms
- only one participant confirms
- confirmation occurs outside the confirmation window
- confirmation validation fails
- provider authorization expires
- provider state invalidates settlement eligibility

In these cases:

- capture does not occur
- settlement does not occur
- provider expiration, cancellation, void, or refund behavior proceeds according to Stripe state

Vouch prefers non-capture over refund whenever possible.

Refund is a provider-backed fallback for already-captured funds.

Refund is not a discretionary remedy.

## Recovery doctrine

Committed Vouches create immutable recovery snapshots.

Snapshots contain:

- original terms
- provider references
- fee snapshot
- confirmation window
- participant references
- settlement rules

Recovery is internal-only.

Recovery is non-user-facing.

Recovery is restoration-only.

Recovery does not permit:

- term rewrite
- manual settlement award
- arbitration
- human payout decision
- support override
- confirmation rewrite
- participant replacement
- alternate payment rail

Technical recovery restores original committed state after technical failure.

Technical recovery does not decide who is right.

## Audit doctrine

Every important transition writes an audit event.

Audit is append-only.

Audit is not a dispute system.

Audit records deterministic system facts.

Audit must not store:

- subjective allegations
- evidence content
- screenshots
- message content
- raw provider payloads
- raw Clerk payloads
- raw Stripe objects
- raw identity documents
- raw card data
- raw bank data
- support judgment

Participant-facing timelines receive only participant-safe audit items.

## Final invariant

Stripe owns payment truth.

Clerk owns authentication truth.

Vouch owns workflow truth.

Webhooks reconcile provider truth.

Outcome follows system state.

No unilateral action forces settlement.

No discretion surface exists to exploit.

Protocol is final.

```

## .agents/execution/backlog.json
```json
{
  "source_date": "2026-05-16",
  "items": [
    {
      "id": "UI-001",
      "title": "Standardize Vouch UI inventory and design system",
      "status": "completed",
      "dependencies": [],
      "source_documents": [
        "C:/Users/scree/Documents/DevNotes/10 PROJECTS/Vouch/Vouch Source of Truth.md",
        "C:/Users/scree/Documents/DevNotes/10 PROJECTS/Vouch/vouch_page_taxonomy.md"
      ],
      "impacted_paths": [
        ".codex/docs",
        "components",
        "features",
        "app"
      ],
      "validation": [
        "pnpm validate:contracts",
        "pnpm typecheck"
      ]
    }
  ]
}

```

## .agents/execution/decisions.json
```json
{
  "source_date": "2026-05-16",
  "decisions": [
    {
      "id": "DEC-001",
      "title": "Use shared components by default",
      "status": "accepted",
      "rationale": "Specialized Vouch components are reserved for protocol state, Vouch object summaries, and Vouch detail operations."
    },
    {
      "id": "DEC-002",
      "title": "Keep Stripe-hosted provider surfaces",
      "status": "accepted",
      "rationale": "Payment, payment method, identity, payout onboarding, and authorization collection remain hosted by Stripe."
    }
  ]
}

```

## .agents/execution/handoff.json
```json
{
  "source_date": "2026-05-16",
  "status": "completed",
  "summary": "Vouch UI standardization implementation completed with contract validation, typecheck, contract tests, and targeted component test passing.",
  "next_actions": [
    "Run visual screenshot review after local server approval"
  ]
}

```

## .agents/execution/validation.json
```json
{
  "source_date": "2026-05-16",
  "runs": [
    {
      "command": "pnpm validate:contracts",
      "status": "failed",
      "reason": "Required .agents contract and execution artifacts were missing before this run."
    },
    {
      "command": "pnpm validate:contracts",
      "status": "passed",
      "reason": "Contract validation passed after required contract and execution artifacts were added."
    },
    {
      "command": "pnpm typecheck",
      "status": "failed",
      "reason": "Initial typecheck found an optional FieldError message typing issue and missing VouchStatusBadge component."
    },
    {
      "command": "pnpm typecheck",
      "status": "passed",
      "reason": "Typecheck passed after fixing FieldError message typing and adding VouchStatusBadge."
    },
    {
      "command": "pnpm vitest run tests/unit/components/vouch-status-badge.test.tsx",
      "status": "passed",
      "reason": "Targeted component test passed."
    },
    {
      "command": "pnpm vitest run tests/contract",
      "status": "passed",
      "reason": "Contract test suite passed after route/API contract updates."
    },
    {
      "command": "pnpm typecheck",
      "status": "passed",
      "reason": "Typecheck passed after moving new Vouch component labels into content-driven props."
    },
    {
      "command": "git diff --check",
      "status": "passed",
      "reason": "No whitespace errors were reported in the final diff."
    }
  ]
}

```

## .agents/execution/progress.json
```json
{
  "source_date": "2026-05-16",
  "items": [
    {
      "id": "UI-001",
      "status": "completed",
      "completed": [
        "Created UI inventory docs",
        "Created design system standards docs",
        "Added required Vouch-specific components",
        "Reworked create Vouch draft and confirm flow UI",
        "Validated contracts, typecheck, contract tests, and targeted status badge test"
      ]
    }
  ]
}

```

## .agents/instructions/implementation.agents.md
```md
# Vouch Implementation Instructions

## Operating Mode

Treat Vouch as a production SaaS codebase with strict source-of-truth contracts.

Do not improvise product scope.

Do not add convenience surfaces that violate the Vouch product boundary.

Smallest correct surface wins.

Vouch is a narrow commitment-backed payment coordination system.

Vouch is not:

- marketplace
- broker
- scheduler
- messaging app
- review/rating system
- dispute-resolution system
- escrow provider
- discovery platform
- admin arbitration surface

## Source Order

Use this authority order:

1. `.agents/docs/*.md`
2. `.agents/contracts/*.yaml`
3. `.agents/instructions/*.agents.md`
4. existing repo code
5. agent judgment

If code conflicts with docs or contracts, docs/contracts win.

If contracts conflict with docs, stop and report the contradiction before implementing.

If instructions conflict with docs or contracts, docs/contracts win.

Do not invent behavior to resolve contradictions.

## Before Changing Code

Before changing any file:

1. Identify the smallest surface of change.
2. Identify affected route/page/feature/action/fetcher/transaction/integration/schema/type/DTO/component.
3. Read relevant contracts.
4. Read relevant docs.
5. Inspect existing repo code.
6. Make the smallest conforming change.
7. Output complete affected files.

## Output Rule

When asked for implementation code:

- output complete affected files
- no snippets
- no partial patches
- no ellipses
- no pseudo-code
- no summary-only implementation

If a file changes, provide the whole file.

If blocked, provide the most complete compilable blocked-state file possible and state the exact missing context.

## App Router Rule

Route files stay thin.

Allowed in `app/**` route files:

- metadata
- params/searchParams handoff
- redirects when required
- Suspense boundary
- feature composition
- skeleton fallback
- static public page assembly

Forbidden in `app/**` route files:

- Prisma imports
- Stripe SDK imports
- domain mutations
- business transactions
- protected DTO shaping
- settlement logic
- provider reconciliation
- complex form logic

Correct pattern:

```txt
app page
-> Suspense if dynamic
-> page feature
-> skeleton
```

## Feature Rule

Server features may:

- orchestrate fetchers
- pass DTOs
- perform role-aware composition
- hand actions to client components

Server features must not:

- mutate provider state
- mutate database state directly
- call Prisma directly
- call Stripe SDKs directly

Client features may handle:

- drawer/dialog state
- form state
- transition state
- optimistic display where safe
- button interactions
- copy/share behavior

Client features must not create truth.

## Component Rule

Components may:

- render DTOs
- render content module data
- render presentational layout
- render buttons, panels, cards, badges, drawers, summaries

Components must not:

- call Prisma
- call Stripe SDKs
- call Clerk server APIs
- perform protected fetching
- perform domain mutations
- decide settlement
- own authorization truth
- own confirmation truth
- hard-code repeated long-form copy

## Read Pattern

Protected reads go through fetchers.

```txt
lib/fetchers/*
-> require active user
-> authorize access
-> use minimal select
-> map DTO
-> declare cache policy
-> return transport-safe data
```

Fetchers must not mutate state.

Fetchers must not return raw Prisma, Stripe, Clerk, webhook, identity, card, or bank objects.

## Write Pattern

Protected writes go through server actions.

```txt
lib/actions/*
-> require active user
-> authorize action
-> parse input with Zod
-> retrieve provider state if needed
-> call integration if needed
-> call transaction helper
-> write audit event
-> revalidate
-> return typed ActionResult or redirect
```

Server actions must not trust client state for:

- confirmation
- payment
- settlement
- readiness
- role
- fee math

## Stripe Pattern

All Stripe SDK calls live under:

```txt
lib/integrations/stripe/*
```

Before settlement-critical operations:

```txt
retrieve current PaymentIntent
compare provider state to local workflow state
apply only valid forward movement
use durable idempotency key
persist normalized provider result
write audit event
```

Never capture, cancel, void, or refund from stale local state alone.

Never finalize payment state from browser return.

Never use direct charges as canonical Vouch flow.

Never use invoice/product/price catalog flows for individual Vouches.

Vouch uses manual-capture PaymentIntents for Vouch payment authorization.

Stripe owns payment truth.

Vouch owns workflow truth.

## Clerk Pattern

All Clerk authentication access is centralized under:

```txt
lib/auth/*
```

All Vouch permission checks are centralized under:

```txt
lib/authz/*
```

Clerk session proves authentication.

Database state proves Vouch permissions.

Clerk must not decide:

- Vouch participation
- payment readiness
- payout readiness
- settlement
- confirmation validity
- Vouch role by metadata alone

The Clerk webhook handler must remain a webhook handler.

Do not rename or reframe it away from webhook-handler semantics.

## Confirmation Pattern

Confirmation actions must enforce:

- active user
- participant authorization
- open confirmation window
- valid role
- valid code derivation
- no duplicate confirmation
- server-side timestamp
- offline payload validity if applicable

One-sided confirmation never releases funds.

Late confirmation never releases funds.

Manual/system/support confirmation must not exist.

GPS is not settlement truth.

Screenshots/evidence must not influence settlement.

If both confirmations are valid inside the window, settlement evaluation may run.

If not, no settlement.

## Dashboard Pattern

Dashboard shows:

- status orientation
- Vouch card list
- next action
- bottom callout

Dashboard must not become:

- analytics dashboard
- marketplace feed
- messaging inbox
- review surface
- dispute panel
- kanban board
- provider discovery page

## Vouch Detail Pattern

Vouch detail is the canonical action surface.

It owns:

- payment status
- confirmation status
- checkout link sharing
- presence confirmation
- archive action
- role-aware next action
- safe timeline

Do not create route sprawl for sub-actions.

Use drawers or inline panels for protocol actions.

## Approved User-Facing Pages

Public:

```txt
/
/pricing
/faq
/legal/terms
/legal/privacy
/checkout/success
```

Auth:

```txt
/sign-in
/sign-up
```

Tenant:

```txt
/dashboard
/vouches/new
/vouches/new/confirm
/vouches/[vouchId]
```

External provider surfaces are not Vouch pages.

## Approved API Routes

Only provider webhook routes are allowed:

```txt
app/api/clerk/webhook-handler/route.ts
app/api/stripe/webhooks/route.ts
```

Internal app mutations must not use API routes.

Forbidden:

```txt
app/api/vouches/*
app/api/accounts/*
app/api/payment/setup/*
app/api/payout/setup/*
app/api/admin/*
```

## File Placement

Use these placements:

```txt
app/(tenant)/dashboard/page.tsx
features/dashboard/dashboard-page.tsx
features/dashboard/dashboard-page.client.tsx
components/dashboard/*

app/(tenant)/vouches/new/page.tsx
app/(tenant)/vouches/new/confirm/page.tsx
app/(tenant)/vouches/[vouchId]/page.tsx
features/vouches/*
components/vouches/*
components/forms/*

lib/actions/vouchActions.ts
lib/actions/paymentActions.ts
lib/actions/authActions.ts

lib/fetchers/vouchFetchers.ts
lib/fetchers/paymentFetchers.ts
lib/fetchers/authFetchers.ts
lib/fetchers/dashboardFetchers.ts

lib/db/selects/*
lib/db/transactions/*
lib/dto/*
lib/integrations/stripe/*
lib/auth/*
lib/authz/*
lib/vouch/*

schemas/*
types/*
```

## Design-System Rule

Every UI change must follow the Vouch design system:

- dark operational SaaS
- brutalist structure
- zero-radius panels
- high contrast
- black/neutral foundation
- restrained blue accent
- uppercase display typography
- dense intentional spacing
- bordered black/55 panels
- mobile-first layouts
- status text not color alone

Do not introduce soft consumer marketplace UI patterns.

## Forbidden Implementation Patterns

Do not implement:

- manual release button
- force refund button
- manual payout button
- admin outcome editor
- confirmation timestamp editor
- dispute form
- evidence upload
- review/rating UI
- marketplace cards
- provider search
- message thread
- public profiles
- service listings
- categories
- browse/search/discovery

## Validation Gates

Use scope-appropriate validation before reporting work complete.

Preferred full validation:

```txt
pnpm prisma:validate
pnpm validate:contracts
pnpm lint
pnpm typecheck
pnpm test
pnpm test:e2e
pnpm validate
pnpm validate:all
```

If a gate cannot be run, report:

- command not run
- reason it was not run
- expected risk
- exact user-run command needed

Do not claim validation passed unless the command actually passed.

## Completion Report

Final implementation report must contain only:

```txt
STATUS: COMPLETE | NOT COMPLETE

FILES DELIVERED:
- path
- path

VALIDATION:
- command: PASS | FAIL | NOT RUN

BLOCKERS:
- none
```

```

## .agents/instructions/validation.agents.md
```md
# Vouch Validation Instructions

## Purpose

Validation proves that the repo still conforms to the Vouch source-of-truth contracts after implementation or audit fixes.

Do not claim validation passed unless the command was actually run and passed.

If validation was not run, say `NOT RUN`.

## Standard Validation Ladder

Run the narrowest useful gate first, then widen.

Recommended order:

```txt
pnpm lint
pnpm typecheck
pnpm prisma:validate
pnpm validate:contracts
pnpm test
pnpm test:e2e
pnpm validate
```

## Basic Code Checks

```txt
pnpm lint
pnpm typecheck
```

## Prisma Checks

```txt
pnpm prisma:validate
```

## Contract Checks

```txt
pnpm validate:contracts
```

## Unit and Integration Tests

```txt
pnpm test
```

## E2E Tests

```txt
pnpm test:e2e
```

## Full Validation

```txt
pnpm validate
```

## Required Test Coverage

Payment and Stripe:

```txt
manual-capture PaymentIntent creation
application fee snapshot
Checkout Session creation
PaymentIntent status mapping
retrieve-before-settlement
idempotent capture
idempotent cancel/void
refund fallback
provider restriction handling
```

Webhooks:

```txt
Stripe signature verification
Clerk signature verification
provider event id dedupe
duplicate webhook harmless
late webhook reconciles only valid forward movement
unsupported webhook ignored
raw provider payload not exposed
```

Confirmation:

```txt
confirmation window enforcement
duplicate confirmation prevention
one-sided confirmation does not release
late confirmation does not release
valid bilateral confirmation triggers settlement evaluation
offline payload time bucket tolerance
invalid offline payload rejection
```

Auth/readiness:

```txt
authenticated tenant route required
local active user required
terms acceptance required
merchant payout readiness required for create
customer payment readiness required for authorization
role scoped to Vouch
self-acceptance rejected
```

Architecture:

```txt
no Prisma in app or components
no Stripe SDK outside lib/integrations/stripe
no internal app mutation API routes
protected reads use fetchers
writes use server actions
DTOs are transport-safe
```

Forbidden surfaces:

```txt
no marketplace routes
no search/browse routes
no messaging routes
no disputes/claims/appeals routes
no evidence upload
no ratings/reviews
no public provider profiles
no manual settlement controls
```

## Validation Report Format

Use this exact format:

```txt
VALIDATION STATUS: PASS | FAIL | NOT RUN

Commands:
- pnpm lint: PASS | FAIL | NOT RUN
- pnpm typecheck: PASS | FAIL | NOT RUN
- pnpm prisma:validate: PASS | FAIL | NOT RUN
- pnpm validate:contracts: PASS | FAIL | NOT RUN
- pnpm test: PASS | FAIL | NOT RUN
- pnpm test:e2e: PASS | FAIL | NOT RUN
- pnpm validate: PASS | FAIL | NOT RUN

Blockers:
- none
```

## Validation Rules

Do not say validation passed unless it was run.

Do not hide failed validation.

If a command fails, report:

```txt
command
failure summary
blocking file/path if known
next correction target
```

If validation cannot be run because the agent lacks repo/runtime access, report:

```txt
VALIDATION STATUS: NOT RUN
Blocker: no local runtime access
Required user command: [command]
```

```

## .agents/instructions/audit.agents.md
```md
# Vouch Audit Instructions

## Purpose

Audit the repo for conformance to Vouch source-of-truth contracts.

Do not merely summarize.

Find violations, classify severity, and identify corrected files.

When asked to fix, output complete corrected files.

## Source Order

Use this authority order:

1. `.agents/contracts/*.yaml`
2. `.agents/docs/*.md`
3. `.agents/instructions/*.agents.md`
4. existing repo code
5. agent judgment

If code conflicts with contracts, contracts win.

If docs conflict with contracts, stop and report.

## Audit Order

Audit in this order:

1. Product boundary
2. Route tree
3. App Router purity
4. Read/write boundaries
5. Stripe integration isolation
6. Clerk/auth/authz correctness
7. Prisma schema/state axes
8. Constants/types/Zod alignment
9. Transactions and idempotency
10. Webhook verification/dedupe/reconciliation
11. Confirmation rules
12. DTO safety
13. UI/design-system compliance
14. Tests and validation

## Product Boundary Checks

Fail if repo contains user-facing or domain behavior for:

```txt
marketplace
provider directory
search/browse/discovery
public profiles
ratings/reviews
messages/chat
disputes/claims/appeals
evidence/screenshots
manual release
manual refund award
manual payout
confirmation rewrite
admin arbitration
```

## Route Checks

Allowed tenant routes:

```txt
/dashboard
/vouches/new
/vouches/[vouchId]
```

Allowed provider routes:

```txt
/api/clerk/webhooks
/api/stripe/webhooks
```

Allowed public routes:

```txt
/
 /pricing
/faq
/legal/terms
/legal/privacy
/checkout/success
```

Allowed auth routes:

```txt
/sign-in
/sign-up
```

Fail if forbidden routes exist.

## App Router Purity Checks

Fail if `app/**` contains:

```txt
Prisma imports
Stripe SDK imports
business transactions
domain mutations
protected DTO shaping
settlement logic
provider reconciliation
large form logic
```

## Fetcher Checks

Every protected fetcher must:

```txt
authenticate
authorize
use minimal select
map DTO
return transport-safe data
declare cache policy
```

Fail if fetcher:

```txt
mutates state
returns raw Prisma records
returns raw provider objects
skips authorization
calls server actions
```

## Action Checks

Every server action must:

```txt
authenticate
authorize
Zod validate
call transaction/integration
write audit when state changes
revalidate
return typed ActionResult or redirect
```

Fail if action trusts client state for:

```txt
confirmation
payment
settlement
readiness
role
fee math
```

## Stripe Checks

Fail if:

```txt
Stripe SDK outside lib/integrations/stripe/*
capture without retrieve-before-settlement
cancel/refund without retrieve-before-settlement
browser return finalizes payment state
PaymentIntent is immediate capture for Vouch flow
direct charge is canonical flow
invoice is canonical flow
per-Vouch Product/Price catalog exists
idempotency missing
raw Stripe object exposed to UI
raw provider payload stored unnecessarily
```

## Clerk Checks

Fail if:

```txt
role stored as global Clerk metadata authority
terms acceptance stored only in Clerk metadata
Clerk decides Vouch participation
Clerk decides payment readiness
Clerk decides payout readiness
Clerk decides settlement
raw Clerk objects exposed to UI
raw session tokens stored or logged
Clerk webhook handler renamed away from webhook-handler semantics
```

The Clerk webhook handler must remain a webhook handler.

## State Checks

Canonical Vouch lifecycle only:

```txt
draft
committed
sent
accepted
authorized
confirmable
completed
expired
```

Fail if `VouchStatus` includes:

```txt
refunded
voided
canceled
failed
archived
provider_blocked
reconciliation_pending
recovery_required
```

Those belong to separate payment/settlement/archive/recovery axes.

## Confirmation Checks

Fail if:

```txt
one-sided confirmation can release funds
late confirmation can release funds
duplicate confirmation is possible
manual/system confirmation exists
GPS is settlement source of truth
screenshots/evidence can influence settlement
support can rewrite confirmation
```

## Webhook Checks

Every provider webhook must:

```txt
verify signature
record provider event id once
dedupe duplicate events
classify event
load current state
apply only valid forward movement
mark unsupported events ignored
avoid raw payload storage
```

Fail if duplicate webhook can cause:

```txt
duplicate capture
duplicate refund
duplicate audit transition
duplicate confirmation
duplicate lifecycle transition
```

## DTO Checks

Fail if UI receives:

```txt
raw Prisma models
raw Stripe objects
raw Clerk objects
raw webhook payloads
raw identity data
raw card/bank data
internal stack traces
secret provider IDs where unnecessary
```

## UI Checks

Fail if UI violates:

```txt
dark brutalist operational SaaS
zero-radius panels
high contrast
status text not color alone
no marketplace UI
no messaging UI
no dispute UI
no soft consumer review/provider-card patterns
```

## Test Checks

Required test coverage should exist for:

Payment and Stripe:

```txt
manual-capture PaymentIntent creation
application fee snapshot
Checkout Session creation
PaymentIntent status mapping
retrieve-before-settlement
idempotent capture
idempotent cancel/void
refund fallback
provider restriction handling
```

Webhooks:

```txt
Stripe signature verification
Clerk signature verification
provider event id dedupe
duplicate webhook harmless
late webhook reconciles only valid forward movement
unsupported webhook ignored
raw provider payload not exposed
```

Confirmation:

```txt
confirmation window enforcement
duplicate confirmation prevention
one-sided confirmation does not release
late confirmation does not release
valid bilateral confirmation triggers settlement evaluation
offline payload time bucket tolerance
invalid offline payload rejection
```

Auth/readiness:

```txt
authenticated tenant route required
local active user required
terms acceptance required
merchant payout readiness required for create
customer payment readiness required for authorization
role scoped to Vouch
self-acceptance rejected
```

Architecture:

```txt
no Prisma in app or components
no Stripe SDK outside lib/integrations/stripe
no internal app mutation API routes
protected reads use fetchers
writes use server actions
DTOs are transport-safe
```

## Audit Output Format

Use this exact format:

```txt
STATUS: PASS | FAIL | PARTIAL

CRITICAL:
- [file] issue
- required correction

HIGH:
- [file] issue
- required correction

MEDIUM:
- [file] issue
- required correction

LOW:
- [file] issue
- required correction

VALIDATION:
- command: result / not run
- blocker if any

NEXT FILES TO FIX:
- path
- path
```

Do not claim validation passed unless it was run and passed.

When asked to fix, output complete corrected files only.

```

