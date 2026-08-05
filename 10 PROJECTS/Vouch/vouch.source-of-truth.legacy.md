---
title: Vouch Source of Truth
type:
    - standard
scope: project
project: Vouch
domain: project
artifact: protocol-completeness
kind: work-package
namespace: vouch.project.map
authority: source-of-truth
parent:
    - "[[vouch.project.map]]"
depends_on:
    - "[[devnotes.projects.map]]"
supersedes:
tags:
    - vouch
    - projects/vouch
    - status/active
created: 05/12/2026
updated:
---

# Table of Contents

[[#1. Product Flows]]
[[#2. Pages and Route Map]]
[[#3. Roles]]
[[#4. Lifecycle States]]
[[#5. Prisma Schema]]
[[#6. Constants]]
[[#7. TypeScript Types]]
[[#8. Zod Schemas]]
[[#9. Database Selects]]
[[#10. DTO Mappers]]
[[#11. Database Transactions]]
[[#12. Audit Events]]
[[#13. Stripe Integration]]
[[#14. Clerk Integration]]
[[#15. Webhook Handlers]]
[[#16. Error Model]]
[[#17. Server Actions]]
[[#18. Fetchers]]
[[#19. Feature Modules]]
[[#20. Shared Components]]
[[#21. UI Primitives]]
[[#22. Route Shells]]
[[#23. Tests]]
[[#24. Validation Commands]]
[[#25. Launch Checklist]]

---

# 1. Product Flows

## Product Definition

Vouch is a commitment-backed payment coordination platform.

Vouch coordinates conditional payment release through deterministic workflow execution.

Vouch does not determine fault, intent, honesty, quality of service, or contractual correctness.

Vouch determines whether bilateral presence confirmation occurred inside the configured confirmation window.

Outcome follows system state.

---

## Core Doctrine

Vouch removes ambiguity by reducing settlement eligibility to deterministic bilateral confirmation rules.

Vouch does not provide:

- disputes

- mediation

- arbitration

- appeals

- evidence review

- screenshots

- manual settlement intervention

- unilateral payout decisions

- exception handling based on user testimony

Settlement eligibility is determined entirely by system state.

---

## System Responsibility Boundaries

### Stripe Handles

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

### Vouch Handles

Vouch handles:

- authenticated workflow state

- Vouch lifecycle state

- appointment metadata

- confirmation windows

- bilateral presence confirmation

- confirmation-code generation

- settlement eligibility decisions

- capture orchestration

- dashboard state

- archive state

- audit state

- provider reconciliation

---

### Core Settlement Rule

```txt
both participants successfully confirm inside the confirmation window
-> PaymentIntent capture executes
-> settlement proceeds through Stripe Connect

anything else
-> PaymentIntent non-capture / cancel / expiration according to provider state
```

Code generation alone means nothing.

Only successful bilateral verification changes state.

---

## Shared User Model

Vouch uses one shared user-account model.

Users are not permanently separated into customer accounts and merchant accounts.

The same authenticated user may:

- authorize payments as a customer

- onboard through Stripe Connect

- create Vouches as a merchant

- receive payouts as a merchant

- participate in multiple Vouches in different roles

Capabilities are determined by readiness state and Stripe onboarding state.

---

### Merchant Readiness

Merchant users must complete:

- authentication

- terms acceptance

- Stripe Connect onboarding

- payout readiness

- identity/compliance requirements required by Stripe

before they may create active Vouches.

---

### Customer Readiness

Customer users must complete:

- authentication

- terms acceptance

- Stripe customer/payment-method setup

- billing readiness required by Stripe

before they may authorize payment participation.

---

## Vouch Creation Flow

### Draft State

The merchant opens the create Vouch page.

The merchant enters:

- Vouch amount

- appointment date

- confirmation window

The merchant has not yet finalized creation.

No permanent Vouch exists yet.

No Stripe objects exist yet.

The merchant may freely abandon or delete the draft state.

---

### Committed State

The merchant reviews the Vouch summary.

The merchant accepts the disclaimer.

The merchant confirms creation.

Vouch then:

- creates the immutable Vouch record

- creates provider-linked Stripe objects

- creates the Vouch public identifier

- creates the Stripe Checkout flow

- creates the manual-capture PaymentIntent

- stores provider references

- writes audit events

- creates the immutable recovery snapshot

The merchant fee is charged immediately during committed creation.

The fee applies regardless of settlement outcome because protocol execution itself is the service.

The committed Vouch becomes immutable immediately.

The merchant may not:

- edit the Vouch

- alter pricing

- alter dates

- alter the confirmation window

- alter participants

- recreate the Vouch in place

- rewrite terms

- mutate provider references

The merchant may:

- share the Checkout link

- allow the Vouch to expire unused

The merchant may not cancel, unsend, or reverse the committed Vouch.

---

## Checkout Authorization Flow

The merchant distributes the Stripe-hosted Checkout link.

Distribution method is unrestricted.

The merchant may distribute the link through:

- SMS

- email

- copy/paste

- native share sheets

- external messaging systems

Vouch does not operate as a messaging platform.

The customer opens Stripe Checkout.

Stripe handles:

- payment authorization

- payment method collection

- billing collection

- customer payment state

If Stripe allows Checkout continuation or session recovery, Vouch follows Stripe provider state.

If Stripe expires or invalidates the Checkout/payment flow, the Vouch follows provider state.

Vouch does not create alternate recovery paths.

Vouch does not regenerate Checkout flows to rescue abandoned authorization.

---

### Authorized Waiting State

After successful authorization:

- the PaymentIntent exists

- funds are authorized

- manual capture remains pending

- the Vouch enters inert waiting state

The Vouch waits for the appointment and confirmation window.

The authorized Vouch cannot be:

- edited

- canceled

- renegotiated

- reversed

- manually settled

---

## Confirmation Window Flow

When the confirmation window opens:

- participants may open the confirmation screen

- participants may generate confirmation codes

- bilateral confirmation becomes possible

Outside the confirmation window:

- confirmation is impossible

- confirmation attempts fail automatically

---

### Confirmation Method

Vouch uses deterministic bilateral confirmation.

Vouch does not use:

- GPS confirmation

- manual support confirmation

- screenshots

- uploaded evidence

- arbitration

- fallback confirmation methods

---

### Confirmation-Code System

Each accepted Vouch contains immutable confirmation-secret material.

The confirmation system uses deterministic cryptographic derivation inspired by TOTP/HOTP-style standards.

When a participant opens the confirmation screen:

- the app derives a short-lived role-specific confirmation code

- the participant receives one active valid code

- the code remains stable during its validity period

- reopening the confirmation screen does not generate infinite new codes

- expired codes rotate into newly derived valid codes

Merchant and customer receive different role-derived codes.

The codes are:

- cryptographically derived

- deterministic

- short-lived

- unguessable

- role-specific

- time-bucket constrained

The system derives codes from:

- immutable confirmation-secret material

- participant role

- time bucket

- deterministic cryptographic derivation

The system does not use:

- static reusable codes

- lookup tables of future codes

- manually assigned confirmation strings

---

## Bilateral Confirmation Flow

Merchant opens confirmation screen.

Customer opens confirmation screen.

Merchant receives merchant confirmation code.

Customer receives customer confirmation code.

The participants physically exchange codes.

Merchant submits the customer code.

Customer submits the merchant code.

Only bilateral successful verification changes confirmation state.

Code generation alone means nothing.

Partial confirmation alone means nothing.

One-sided confirmation does not trigger settlement.

---

### Offline Confirmation Behavior

Confirmation supports offline-capable operation.

The app preloads encrypted confirmation material before the appointment.

If connectivity temporarily fails:

- devices may still derive valid confirmation codes

- devices may still validate exchanged codes locally

- confirmation payloads sync when connectivity returns

Settlement does not execute until confirmation sync successfully reconciles with Vouch servers.

Offline confirmation payloads must still validate:

- confirmation-window timing

- role correctness

- cryptographic derivation

- allowed clock-skew tolerance

---

### Confirmation Locking Rules

After bilateral confirmation succeeds:

- confirmation state locks permanently

- confirmations cannot be reversed

- confirmations cannot be deleted

- confirmations cannot be retried

- confirmations cannot be replaced

There is no:

- undo

- appeal

- correction flow

- support override

---

### Settlement Execution

Successful bilateral confirmation inside the confirmation window authorizes settlement execution.

Vouch retrieves current Stripe provider state before settlement actions execute.

Stripe remains authoritative for payment truth.

Vouch remains authoritative for workflow truth.

Settlement executes only if:

- bilateral confirmation is valid

- the PaymentIntent remains capturable

- provider state permits capture

---

### Non-Capture Rules

Anything other than successful bilateral confirmation results in non-capture behavior.

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

- provider expiration/cancel behavior proceeds according to Stripe state

Vouch prefers non-capture over refunds whenever possible.

---

## Recovery Snapshot Doctrine

Committed Vouches create immutable recovery snapshots.

Recovery snapshots contain:

- original Vouch terms

- provider references

- fee snapshots

- confirmation windows

- participant references

- settlement rules

Recovery snapshots are:

- internal-only

- immutable

- non-user-facing

- restoration-only

Recovery snapshots do not create replacement Vouches.

Recovery snapshots restore the original committed state after technical failure.

---

## Technical Failure Doctrine

Vouch may enter internal recovery state during technical failure.

Examples:

- persistence corruption

- reconciliation mismatch

- provider-sync failure

- capture reconciliation failure

Technical recovery state is:

- internal-only

- non-user-facing

- non-negotiable

- non-discretionary

Technical recovery does not permit:

- rewriting terms

- manual settlement awards

- arbitration

- human payout decisions

---

## Webhook Reconciliation Doctrine

Stripe webhooks reconcile provider truth into Vouch state.

Webhook processing is idempotent.

Each provider event ID processes only once.

Duplicate webhook deliveries are ignored safely.

Late webhook deliveries reconcile only if the provider event still represents valid forward state movement.

Vouch retrieves live provider state before critical settlement transitions.

---

## Provider Truth Doctrine

Stripe is authoritative for:

- payment state

- authorization state

- capture state

- cancellation state

- payout capability state

Vouch mirrors Stripe provider truth into local persistence.

Vouch combines provider truth with workflow truth to determine settlement outcome.

---

### Authorization Window Rules

Vouch creation and appointment scheduling must remain inside Stripe authorization timing limits.

Vouch may not create appointments that exceed provider capture windows.

Provider authorization deadlines determine the maximum valid settlement window.

---

### Archive Rules

Archived Vouches:

- disappear from active dashboard feeds

- preserve audit history

- preserve provider history

- remain accessible through direct URL access

Archived Vouches become read-only.

---

## Immutable Workflow Doctrine

Once committed, a Vouch cannot be:

- edited

- renegotiated

- canceled

- reversed

- rewritten

Once sent, a Vouch cannot be:

- unsent

- recalled

- altered

Once authorized, a Vouch becomes inert until settlement eligibility resolves.

Once completed or expired, the Vouch enters terminal state permanently.

The Vouch lifecycle is deterministic.

The state machine itself is the product.

# 2. Pages and Route Map

## Route Doctrine

Vouch uses the Next.js App Router with strict route-boundary enforcement.

Routes define application surface area.

Routes do not define business truth.

The route tree must stay intentionally small because Vouch is not a marketplace, scheduler, messaging system, dispute product, settings dashboard, admin arbitration surface, or public directory. Vouch is a narrow commitment-backed payment coordination system where outcome follows system state.

---

### Core Route Rule

Every page route must be thin.

A route file may:

```txt
define metadata
receive params/searchParams
compose one page-level feature component when dynamic orchestration is required
compose static shared components when no server orchestration is required
wrap dynamic content in Suspense
provide a skeleton fallback
redirect when required
hand off route context
```

A route file must not:

```txt
query Prisma
call Stripe SDKs
call Clerk business logic beyond route/session handoff
shape protected DTOs
perform authorization decisions directly
perform workflow mutations
perform provider mutations
perform settlement logic
perform webhook reconciliation logic
hard-code large page copy
```

---

### Write Flow Rule

All application writes go through:

```txt
lib/actions/*
```

This is absolute.

Transactions and integrations are not write entry points.

They are dependencies imported by server actions.

Correct write chain:

```txt
route/client form
-> server action
-> Zod validation
-> authentication
-> authorization
-> transaction and/or integration call
-> audit write
-> revalidation/redirect/result
```

Allowed action dependencies:

```txt
lib/db/transactions/*
lib/integrations/*
lib/auth/*
lib/authz/*
lib/vouch/*
schemas/*
types/*
```

Forbidden write patterns:

```txt
route -> transaction
route -> integration
component -> transaction
component -> integration
component -> Prisma
component -> Stripe SDK
client -> internal API route for app mutation
```

Internal app mutations must not be routed through `/api/*`.

`app/api/*` exists only for external provider webhook boundaries.

---

### Read Flow Rule

Protected reads go through:

```txt
lib/fetchers/*
```

Protected fetchers own:

```txt
authentication
authorization
minimal select
DTO mapping
cache policy
transport-safe return
```

Route files may call fetchers only through page-level feature orchestration where dynamic protected data is required.

Pure UI components never call fetchers.

---

## Route Groups

### Root App Files

The app root must provide global application boundaries.

```txt
app/layout.tsx
app/globals.css
app/not-found.tsx
app/global-error.tsx
```

Root responsibilities:

```txt
global metadata
font loading
global providers
global CSS
top-level not-found handling
top-level global error handling
```

---

### Public Route Group

```txt
app/(public)/
```

Required group files:

```txt
app/(public)/layout.tsx
app/(public)/loading.tsx
app/(public)/error.tsx
```

The public layout wraps all public children with the public shell.

```txt
PublicShell
-> PublicHeader
-> public main content
-> PublicFooter
```

Public routes are static or mostly static.

They do not require feature modules unless they later gain dynamic server orchestration.

Public routes import typed content modules and shared presentation components directly.

Correct public page pattern:

```txt
content/*
-> shared components
-> route page assembly
```

Public pages must not:

```txt
call protected fetchers
call server actions
query database state
call Stripe
call Clerk server business logic
import tenant-only components
hard-code long-form copy inside components
```

---

### Auth Route Group

```txt
app/(auth)/
```

Required group files:

```txt
app/(auth)/layout.tsx
app/(auth)/loading.tsx
app/(auth)/error.tsx
```

Auth routes must support Clerk’s required catch-all route structure.

```txt
app/(auth)/sign-in/[[...sign-in]]/page.tsx
app/(auth)/sign-up/[[...sign-up]]/page.tsx
```

Auth pages use custom React Hook Form forms.

Auth form components live under:

```txt
components/forms/*
```

Auth route pages compose:

```txt
AuthPageShell
React Hook Form auth form
shared auth/page content
```

Auth forms may use Clerk client hooks where appropriate, but they must remain form components, not route-level business logic dumps.

---

### Tenant Route Group

```txt
app/(tenant)/
```

Required group files:

```txt
app/(tenant)/layout.tsx
app/(tenant)/loading.tsx
app/(tenant)/error.tsx
```

The tenant layout wraps authenticated app pages with the tenant shell.

```txt
TenantShell
-> TenantHeader
-> TenantNav
-> tenant main content
-> TenantFooter
```

Tenant routes are protected.

Tenant navigation contains only:

```txt
Dashboard
Vouches
Connect
Payment
```

Tenant navigation behavior:

```txt
Dashboard -> /dashboard
Vouches -> /vouches/new or canonical Vouch creation entry
Connect -> Stripe-hosted Connect onboarding/account management action
Payment -> Stripe-hosted payment method/address management action
```

There are no internal setup, readiness, payout settings, payment settings, profile settings, marketplace, messaging, or dispute routes.

---

### API Route Group

```txt
app/api/
```

API routes are external provider boundaries only.

Required provider route handlers:

```txt
app/api/clerk/webhook-handler/route.ts
app/api/stripe/webhooks/route.ts
```

API route handlers may:

```txt
read raw request body when required
verify provider signatures
parse provider event envelopes
return provider-compatible responses
delegate processing to server actions or provider-processing modules
```

API route handlers must not:

```txt
contain business workflow logic
perform inline Prisma mutations
perform inline settlement decisions
perform inline DTO shaping for app pages
expose user-facing application mutations
act as internal app endpoints
```

Provider event persistence remains idempotent.

Clerk webhook handling syncs provider user events into Neon-backed user tables through action-owned or action-equivalent server write orchestration.

Stripe webhook handling reconciles provider truth into Vouch state without inventing Vouch business truth. Stripe remains authoritative for payment/provider state; Vouch remains authoritative for workflow state.

---

## Canonical Route Inventory

### Public Routes

```txt
app/page.tsx
app/(public)/faq/page.tsx
app/(public)/pricing/page.tsx
app/(public)/legal/terms/page.tsx
app/(public)/legal/privacy/page.tsx
app/(public)/checkout/success/page.tsx
```

---

### Auth Routes

```txt
app/(auth)/sign-in/[[...sign-in]]/page.tsx
app/(auth)/sign-up/[[...sign-up]]/page.tsx
```

---

### Tenant Routes

```txt
app/(tenant)/dashboard/page.tsx
app/(tenant)/vouches/new/page.tsx
app/(tenant)/vouches/new/confirm/page.tsx
app/(tenant)/vouches/[vouchId]/page.tsx
```

These are the only tenant pages.

Presence confirmation, checkout sharing, invite acceptance, archive behavior, and Vouch state review all resolve through the canonical Vouch detail experience.

---

### Provider Routes

```txt
app/api/clerk/webhook-handler/route.ts
app/api/stripe/webhooks/route.ts
```

---

## Removed Route Categories

The following route categories are not part of Vouch:

```txt
/setup
/settings
/settings/payment
/settings/payout
/settings/verification
/readiness
/account
/profile
/admin
/admin/settlement
/messages
/disputes
/claims
/appeals
/evidence
/reviews
/ratings
/search
/browse
/providers
/marketplace
```

Connect and Payment are external Stripe flows, not internal Vouch pages.

---

## Public Page Map

### Landing Page

Route:

```txt
/
```

File:

```txt
app/page.tsx
```

Purpose:

```txt
present Vouch positioning
explain deterministic payment coordination
route users toward sign-in/sign-up
establish the product’s visual and language system
```

The landing page is static.

It does not use a feature module.

It imports:

```txt
content/marketing.tsx
components/shared/page-hero.tsx
components/shared/process-panel.tsx
components/shared/metric-grid.tsx
components/shared/section-intro.tsx
components/shared/card-grid.tsx
components/shared/callout-panel.tsx
components/ui/button.tsx
```

Canonical structure:

```txt
PublicShell from layout
PageHero
ProcessPanel
MetricGrid
SectionIntro
CardGrid
CalloutPanel
```

---

### FAQ Page

Route:

```txt
/faq
```

File:

```txt
app/(public)/faq/page.tsx
```

Purpose:

```txt
answer product questions
clarify payment authorization
clarify confirmation behavior
clarify non-discretionary settlement
```

Static content source:

```txt
content/faq.tsx
```

Canonical structure:

```txt
PublicShell from layout
PageHero
ContentSectionList
CalloutPanel
```

---

### Pricing Page

Route:

```txt
/pricing
```

File:

```txt
app/(public)/pricing/page.tsx
```

Purpose:

```txt
explain pricing
explain fee display
explain payment authorization flow
explain protocol execution fee logic
```

Static content source:

```txt
content/pricing.tsx
```

Canonical structure:

```txt
PublicShell from layout
PageHero
ProcessPanel
MetricGrid
SectionIntro mapped from pricing content
CalloutPanel
```

---

### Terms Page

Route:

```txt
/legal/terms
```

File:

```txt
app/(public)/legal/terms/page.tsx
```

Purpose:

```txt
expose Terms of Service
support account-level agreement
support transaction-level consent references
```

Static content source:

```txt
content/legal.tsx
```

Canonical structure:

```txt
PublicShell from layout
PageHero
ContentSectionList
CalloutPanel
```

---

### Privacy Page

Route:

```txt
/legal/privacy
```

File:

```txt
app/(public)/legal/privacy/page.tsx
```

Purpose:

```txt
expose Privacy Policy
describe Vouch data handling
describe provider-managed data responsibilities
```

Static content source:

```txt
content/legal.tsx
```

Canonical structure:

```txt
PublicShell from layout
PageHero
ContentSectionList
CalloutPanel
```

---

### Checkout Success Route

Route:

```txt
/checkout/success
```

File:

```txt
app/(public)/checkout/success/page.tsx
```

Purpose:

```txt
receive Stripe-hosted Checkout return
display return-state context
route authenticated users to the relevant Vouch detail page
avoid trusting browser return state as payment truth
```

Rules:

```txt
browser return state is not authoritative
Stripe webhook/provider retrieval determines payment truth
page may display pending reconciliation state
page must not finalize payment state directly
page must not mutate provider state directly
```

---

## Auth Page Map

### Sign-In Page

Route:

```txt
/sign-in
```

File:

```txt
app/(auth)/sign-in/[[...sign-in]]/page.tsx
```

Purpose:

```txt
authenticate existing users through Clerk
support Clerk catch-all auth continuation
render custom React Hook Form sign-in UI
redirect authenticated users into tenant app
```

Canonical composition:

```txt
AuthPageShell
SignInForm
```

Form location:

```txt
components/forms/sign-in-form.client.tsx
```

The form uses:

```txt
React Hook Form
Zod validation
Clerk sign-in client APIs
shared form components
shadcn/ui primitives
```

---

### Sign-Up Page

Route:

```txt
/sign-up
```

File:

```txt
app/(auth)/sign-up/[[...sign-up]]/page.tsx
```

Purpose:

```txt
create a Vouch account through Clerk
support Clerk catch-all auth continuation
render custom React Hook Form sign-up UI
collect account agreement acceptance
redirect authenticated users into tenant app
```

Canonical composition:

```txt
AuthPageShell
SignUpForm
```

Form location:

```txt
components/forms/sign-up-form.client.tsx
```

The form uses:

```txt
React Hook Form
Zod validation
Clerk sign-up client APIs
shared form components
shadcn/ui primitives
```

---

## Tenant Page Map

### Dashboard Page

Route:

```txt
/dashboard
```

File:

```txt
app/(tenant)/dashboard/page.tsx
```

Purpose:

```txt
show the authenticated user’s Vouch overview
display operational metrics
display a vertical column of Vouch cards
end with a callout panel
```

Route page composition:

```txt
Suspense boundary
DashboardPageFeature
DashboardPageSkeleton
```

Feature files:

```txt
features/dashboard/dashboard-page.tsx
features/dashboard/dashboard-page.client.tsx
```

The server feature may orchestrate:

```txt
getDashboardData
authentication handoff
authorization handoff
DTO handoff
```

The client feature may orchestrate:

```txt
client-only interactions
filters if ever allowed
drawer/modal state
optimistic UI where appropriate
```

UI components:

```txt
components/shared/page-hero.tsx
components/shared/metric-grid.tsx
components/dashboard/dashboard-vouch-column.tsx
components/dashboard/dashboard-vouch-card.tsx
components/shared/callout-panel.tsx
```

Canonical structure:

```txt
TenantShell from layout
PageHero or PageHeader
MetricGrid
DashboardVouchColumn
CalloutPanel
```

Dashboard card displays:

```txt
amount
appointment date
confirmation window
status
participant role
next action
archive state
```

Dashboard must not contain:

```txt
marketplace feeds
messaging inboxes
analytics dashboards
kanban lanes
public provider cards
review/rating widgets
dispute panels
```

---

### Create Vouch Page

Route:

```txt
/vouches/new
```

File:

```txt
app/(tenant)/vouches/new/page.tsx
```

Purpose:

```txt
start Vouch creation
collect amount
collect appointment date
collect confirmation window
show fee estimate
show required readiness blockers inline
end with a callout panel
```

Route page composition:

```txt
Suspense boundary if protected dynamic readiness is loaded
CreateVouchPageFeature
CreateVouchPageSkeleton
```

Feature files:

```txt
features/vouches/create-vouch-page.tsx
features/vouches/create-vouch-page.client.tsx
```

Form component:

```txt
components/forms/create-vouch-form.client.tsx
```

UI components:

```txt
components/shared/page-hero.tsx
components/shared/section-intro.tsx
components/vouches/create-vouch-summary.tsx
components/shared/callout-panel.tsx
```

Canonical structure:

```txt
TenantShell from layout
PageHero or PageHeader
SectionIntro
CreateVouchForm
CreateVouchSummary
CalloutPanel
```

Rules:

```txt
React Hook Form owns client-side form state
Zod validates form input
server action owns write flow
client input is not authoritative
fee math is server-owned
no participant/customer field
no memo field
no messaging field
```

Write action:

```txt
createVouchDraftAction
```

or, if the implementation skips persisted drafts:

```txt
prepareCreateVouchAction
```

The final naming should be locked in the Server Actions section.

---

### Confirm Create Vouch Page

Route:

```txt
/vouches/new/confirm
```

File:

```txt
app/(tenant)/vouches/new/confirm/page.tsx
```

Purpose:

```txt
review Vouch details
accept per-Vouch disclaimer
commit immutable Vouch
create Stripe provider objects
redirect to dashboard or created Vouch detail
```

Route page composition:

```txt
Suspense boundary if draft/review state is dynamic
ConfirmCreateVouchPageFeature
ConfirmCreateVouchPageSkeleton
```

Feature files:

```txt
features/vouches/confirm-create-vouch-page.tsx
features/vouches/confirm-create-vouch-page.client.tsx
```

Form component:

```txt
components/forms/confirm-create-vouch-form.client.tsx
```

UI components:

```txt
components/shared/page-hero.tsx
components/vouches/confirm-vouch-summary.tsx
components/vouches/disclaimer-checkbox.tsx
components/shared/callout-panel.tsx
```

Canonical structure:

```txt
TenantShell from layout
PageHero or PageHeader
ConfirmVouchSummary
ConfirmCreateVouchForm
CalloutPanel
```

Commit action:

```txt
confirmCreateVouchAction
```

Committed creation writes:

```txt
immutable Vouch record
Stripe Checkout Session reference
manual-capture PaymentIntent reference
provider references
invitation/access state
audit event
revalidation
```

The committed Vouch becomes immutable.

---

### Vouch Detail Page

Route:

```txt
/vouches/[vouchId]
```

File:

```txt
app/(tenant)/vouches/[vouchId]/page.tsx
```

Purpose:

```txt
serve as the single canonical Vouch screen
show the whole Vouch state
show all role-aware Vouch actions
show payment/provider status
show confirmation status
show archive state
show next action
host drawers/modals for secondary actions
```

This is the central Vouch experience.

There should not be a separate page for every sub-action.

The Vouch detail page owns:

```txt
presence confirmation entry
invite acceptance experience
checkout link sharing
archive action
payment status review
confirmation status review
timeline/audit-safe review
```

Route page composition:

```txt
Suspense boundary
VouchDetailPageFeature
VouchDetailPageSkeleton
```

Feature files:

```txt
features/vouches/vouch-detail-page.tsx
features/vouches/vouch-detail-page.client.tsx
```

UI components:

```txt
components/shared/page-hero.tsx
components/vouches/vouch-detail-summary.tsx
components/vouches/payment-status-panel.tsx
components/vouches/confirmation-status-panel.tsx
components/vouches/vouch-actions-panel.tsx
components/vouches/copy-checkout-link-button.tsx
components/vouches/share-checkout-link-button.tsx
components/vouches/confirm-presence-button.tsx
components/vouches/archive-vouch-button.tsx
components/shared/callout-panel.tsx
components/ui/drawer.tsx
components/ui/dialog.tsx
```

Canonical structure:

```txt
TenantShell from layout
PageHero or PageHeader
VouchDetailSummary
PaymentStatusPanel
ConfirmationStatusPanel
VouchActionsPanel
CalloutPanel
```

Role-aware actions:

```txt
merchant:
  copy checkout link
  share checkout link
  confirm presence
  archive

customer:
  confirm presence
  archive
```

Secondary interactions may use:

```txt
Drawer
Dialog
AlertDialog
Popover
```

But they remain part of the Vouch detail experience.

Presence confirmation does not need a separate route.

Invite acceptance does not need a separate user-facing route.

---

## Invite Acceptance Doctrine

Invite acceptance must resolve into the canonical Vouch detail experience.

The user-facing mental model is:

```txt
open Vouch
review Vouch
accept/authorize/participate from the Vouch detail surface
```

If an invite token entry route is technically required, it may exist only as a transition adapter.

Adapter behavior:

```txt
receive token
authenticate user if needed
validate token server-side
resolve target Vouch
redirect to /vouches/[vouchId] with safe state
```

The adapter must not become a full invite acceptance page.

The Vouch detail page renders the actual acceptance state through a role-aware panel, drawer, or dialog.

---

## Presence Confirmation Doctrine

Presence confirmation is an action inside the Vouch detail experience.

The user-facing mental model is:

```txt
open Vouch detail
review current state
choose Confirm Presence
complete confirmation panel/drawer/dialog
return to updated Vouch detail state
```

Presence confirmation may use a modal, drawer, or inline panel.

It must not create route sprawl.

Confirmation rules remain server-owned:

```txt
active participant required
confirmation window must be open
duplicate confirmation rejected
one-sided confirmation does not release funds
both valid confirmations inside window trigger settlement action
late confirmation rejected
```

Only bilateral confirmation inside the configured confirmation window can authorize settlement.

---

## External Navigation Actions

### Connect Action

Navigation label:

```txt
Connect
```

Connect is not an internal page.

It triggers a server action that redirects to Stripe-hosted Connect onboarding or account management.

Action:

```txt
startStripeConnectAction
```

Flow:

```txt
click Connect
-> server action
-> authenticate
-> authorize
-> create/retrieve Stripe connected account
-> create Stripe-hosted Connect session
-> redirect to Stripe
```

Vouch does not host:

```txt
banking forms
tax forms
KYC forms
payout dashboard
Connect account dashboard
```

Stripe handles payout onboarding and payout readiness.

---

### Payment Action

Navigation label:

```txt
Payment
```

Payment is not an internal page.

It triggers a server action that redirects to a Stripe-hosted customer payment management flow.

Action:

```txt
startStripePaymentManagementAction
```

Flow:

```txt
click Payment
-> server action
-> authenticate
-> authorize
-> create/retrieve Stripe customer
-> create Stripe-hosted payment method/address management session
-> redirect to Stripe
```

Vouch does not host:

```txt
raw card forms
billing address forms
payment method dashboards
card update screens
```

Stripe handles payment method and billing collection.

---

## Page Composition Contract

Every page must follow the same composition philosophy.

### Public Static Page Shape

```txt
route page
-> imported content module
-> shared page header/hero component
-> shared body components
-> callout panel when appropriate
```

Example:

```txt
content/faq.tsx
-> PageHero
-> ContentSectionList
-> CalloutPanel
```

---

### Tenant Dynamic Page Shape

```txt
route page
-> Suspense boundary
-> page feature component
-> skeleton fallback
-> pure UI components
-> content module
```

Example:

```txt
app/(tenant)/dashboard/page.tsx
-> Suspense fallback={<DashboardPageSkeleton />}
-> DashboardPageFeature
-> DashboardPageClientFeature if needed
-> MetricGrid
-> DashboardVouchColumn
-> CalloutPanel
```

---

### Feature Component Rule

A dynamic tenant page may have one server feature and one client feature.

Pattern:

```txt
features/[domain]/[page-name].tsx
features/[domain]/[page-name].client.tsx
```

The server feature owns:

```txt
fetcher orchestration
action handoff
DTO handoff
role-aware page branching
server-only composition
```

The client feature owns:

```txt
client-only state
drawer/dialog state
form interaction wiring
optimistic UI if allowed
transition state
```

Feature components may coordinate UI but should not become reusable UI libraries.

Feature components do not contain low-level presentation systems.

---

### Pure UI Component Rule

Pure UI lives under:

```txt
components/*
```

Pure UI components own:

```txt
layout blocks
cards
panels
buttons
inputs
badges
status display
formatted summaries
mapped content rendering
```

Pure UI components must not:

```txt
call Prisma
call Stripe
call Clerk server APIs
perform protected fetching
perform mutations
enforce authorization
own domain truth
hard-code long-form page copy
```

---

### Content Module Rule

All reusable static copy and repeated section content must come from imported content modules.

Content modules live under:

```txt
content/*
```

Required current content modules:

```txt
content/marketing.tsx
content/faq.tsx
content/pricing.tsx
content/legal.tsx
content/dashboard.tsx
content/vouches.tsx
content/auth.tsx
```

Content modules export typed arrays and objects.

Components map over these exports.

Correct pattern:

```txt
content export
-> component prop
-> .map()
-> repeated cards, metrics, sections, steps, actions, or callouts
```

Forbidden pattern:

```txt
hard-coded repeated marketing copy inside UI components
hard-coded repeated dashboard copy inside UI components
hard-coded repeated Vouch page copy inside UI components
```

---

## Suspense and Loading Contract

### Dynamic Pages

Dynamic protected pages must use Suspense inside the route page.

Pattern:

```txt
<Suspense fallback={<PageSpecificSkeleton />}>
  <PageFeature />
</Suspense>
```

Skeleton components should be page-specific and should match the final layout shape.

Required skeleton examples:

```txt
components/dashboard/dashboard-page-skeleton.tsx
components/vouches/create-vouch-page-skeleton.tsx
components/vouches/confirm-create-vouch-page-skeleton.tsx
components/vouches/vouch-detail-page-skeleton.tsx
```

---

### Static or Route-Group Loading

Route groups must still provide:

```txt
loading.tsx
error.tsx
layout.tsx
```

Use `loading.tsx` for route-level loading boundaries.

Use explicit Suspense skeletons for dynamic tenant content that depends on protected fetchers.

---

## Page Layout Consistency Rule

Every public, auth, and tenant page should feel like the same product.

Every page should use the same general structure:

```txt
shell header from layout
main content container
page hero/header
primary page body
mapped reusable sections/panels/cards
final callout panel when appropriate
shell footer from layout
```

Shared layout components:

```txt
components/shared/page-hero.tsx
components/shared/section-intro.tsx
components/shared/callout-panel.tsx
components/shared/card-grid.tsx
components/shared/metric-grid.tsx
components/shared/process-panel.tsx
components/shared/content-section-list.tsx
components/shared/surface.tsx
```

Status must be communicated through text, not color alone.

The visual system must remain dark, operational, brutalist, high-contrast, square, and consistent with the landing page.

---

## Vouch Card Doctrine

The Vouch card is the primary dashboard unit.

A Vouch card represents one Vouch.

The card displays:

```txt
amount
appointment date
confirmation window
status
role
next action
archive state
```

Clicking a Vouch card opens:

```txt
/vouches/[vouchId]
```

The Vouch detail page contains the full rig.

The detail page, not separate routes, owns:

```txt
payment status
confirmation status
checkout link sharing
presence confirmation
invite acceptance
archive action
next action
safe timeline/audit summary
```

The application should not scatter Vouch behavior across many pages.

There is:

```txt
Dashboard with Vouch cards
Vouch detail page with everything else
```

That is the product surface.

---

## Forbidden Route and Surface Patterns

Do not create:

```txt
app/(tenant)/setup/page.tsx
app/(tenant)/settings/page.tsx
app/(tenant)/settings/payment/page.tsx
app/(tenant)/settings/payout/page.tsx
app/(tenant)/settings/verification/page.tsx
app/(tenant)/readiness/page.tsx
app/(tenant)/account/page.tsx
app/(tenant)/profile/page.tsx
app/(tenant)/messages/*
app/(tenant)/disputes/*
app/(tenant)/claims/*
app/(tenant)/appeals/*
app/(tenant)/evidence/*
app/(tenant)/reviews/*
app/(tenant)/ratings/*
app/(tenant)/providers/*
app/(tenant)/marketplace/*
app/(tenant)/search/*
app/(tenant)/browse/*
app/api/vouches/create/route.ts
app/api/vouches/confirm/route.ts
app/api/vouches/capture/route.ts
app/api/accounts/create/route.ts
app/api/accounts/session/route.ts
```

Do not create user-facing surfaces for:

```txt
manual settlement
force release
manual refund award
admin arbitration
evidence upload
screenshot review
support override
provider discovery
public profiles
service listings
messaging
reviews
ratings
```

Vouch does not decide who is right.

Vouch asks what happened.

Outcome follows system state.

---

## Final Approved Route Tree

```txt
app/
├── layout.tsx
├── globals.css
├── page.tsx
├── loading.tsx
├── not-found.tsx
├── global-error.tsx
│
├── (public)/
│   ├── layout.tsx
│   ├── loading.tsx
│   ├── error.tsx
│   ├── faq/
│   │   └── page.tsx
│   ├── pricing/
│   │   └── page.tsx
│   ├── legal/
│   │   ├── terms/
│   │   │   └── page.tsx
│   │   └── privacy/
│   │       └── page.tsx
│   └── checkout/
│       └── success/
│           └── page.tsx
│
├── (auth)/
│   ├── layout.tsx
│   ├── loading.tsx
│   ├── error.tsx
│   ├── sign-in/
│   │   └── [[...sign-in]]/
│   │       └── page.tsx
│   └── sign-up/
│       └── [[...sign-up]]/
│           └── page.tsx
│
├── (tenant)/
│   ├── layout.tsx
│   ├── loading.tsx
│   ├── error.tsx
│   ├── dashboard/
│   │   └── page.tsx
│   └── vouches/
│       ├── new/
│       │   ├── page.tsx
│       │   └── confirm/
│       │       └── page.tsx
│       └── [vouchId]/
│           └── page.tsx
│
└── api/
    ├── clerk/
    │   └── webhooks/
    │       └── route.ts
    └── stripe/
        └── webhooks/
            └── route.ts
```

This replaces the earlier mixed `/vouch` and `/vouches` route model with a canonical plural route surface while keeping the user-facing app intentionally narrow.

---

# 3. Roles

## Role Doctrine

Vouch uses a shared user-account model.

Users are not permanently separated into merchant-only or customer-only accounts.

The same authenticated user may participate in different Vouches in different roles.

A user may be:

```txt
merchant on one Vouch
customer on another Vouch
```

Role is contextual to the specific Vouch.

The role determines what the user may see, what actions they may take, and which readiness requirements apply. The included source already defines this shared-user model and role-aware behavior.

---

## Canonical Roles

Vouch has two primary participant roles:

```txt
Merchant
Customer
```

Implementation may also map these to payment-oriented language:

```txt
Merchant -> Payee
Customer -> Payer
```

User-facing product language may use either pair where appropriate, but the domain meaning must stay consistent.

---

## Merchant Role

### Definition

The merchant is the participant who creates the Vouch and may receive funds after successful bilateral confirmation.

The merchant is not a marketplace provider.

The merchant is not discovered through Vouch.

The merchant independently arranges the real-world appointment outside Vouch.

Vouch only coordinates the commitment-backed payment workflow.

---

### Merchant Capabilities

A merchant may:

```txt
create a Vouch
review Vouch terms before commitment
accept the per-Vouch disclaimer
commit the Vouch
share the Stripe-hosted payment authorization link
hold the Vouch unused
let the Vouch expire unused
open the Vouch detail page
confirm presence during the confirmation window
archive the Vouch from their dashboard view
receive settlement after successful bilateral confirmation
```

---

### Merchant Restrictions

A merchant may not:

```txt
edit a committed Vouch
cancel a committed Vouch
unsend a committed Vouch
rewrite appointment terms
change the confirmation window
change the amount
replace the customer
force settlement
force refund
manually award funds
rewrite confirmation truth
override Stripe provider state
create a dispute
submit evidence
appeal an outcome
```

Once the Vouch is committed, the merchant loses discretionary control over the lifecycle.

The merchant can distribute the authorization link, but cannot control the outcome.

Outcome follows system state.

---

### Merchant Readiness Requirements

Before creating a committed Vouch, the merchant must satisfy the required readiness gates:

```txt
authenticated Clerk session
active Vouch account
accepted current terms
Stripe Connect account readiness
payout readiness
identity/compliance requirements required by Stripe
```

Stripe owns Connect onboarding, KYC, payout banking, tax/compliance collection, and payout capability state.

Vouch owns whether the user is allowed to initiate the Vouch workflow based on provider-backed readiness state.

---

## Customer Role

### Definition

The customer is the participant who receives the Stripe-hosted payment authorization link, authorizes payment, and confirms presence during the confirmation window.

The customer is not found through Vouch.

The customer is not matched by Vouch.

The customer independently receives the link from the merchant through an external communication channel.

Vouch does not operate messaging, discovery, negotiation, or scheduling.

---

### Customer Capabilities

A customer may:

```txt
open a Vouch authorization link
authenticate through Clerk
accept required terms
complete Stripe-hosted payment authorization
open the Vouch detail page
review Vouch state
confirm presence during the confirmation window
archive the Vouch from their dashboard view
```

---

### Customer Restrictions

A customer may not:

```txt
edit the Vouch
change the amount
change the appointment date
change the confirmation window
force settlement
force refund
submit unilateral confirmation as settlement authority
rewrite confirmation truth
create a dispute
submit evidence
appeal an outcome
```

Customer authorization does not release funds.

Customer confirmation alone does not release funds.

Only successful bilateral confirmation inside the confirmation window can trigger settlement eligibility.

---

### Customer Readiness Requirements

Before becoming bound as the customer participant, the customer must satisfy the required readiness gates:

```txt
authenticated Clerk session
active Vouch account
accepted current terms
Stripe customer/payment-method readiness
billing readiness required by Stripe
```

Stripe owns payment method collection, billing details, authorization, and provider payment state.

Vouch owns workflow state and deterministic resolution.

---

## Shared Participant Rules

Both merchant and customer:

```txt
authenticate through Clerk
use the same dashboard structure
use the same Vouch detail page structure
receive role-aware UI
confirm presence through the same Vouch detail experience
are bound by deterministic system rules
cannot unilaterally force settlement
cannot invoke dispute resolution
cannot request manual adjudication
```

The Vouch detail page is role-aware.

It renders available actions based on:

```txt
authenticated user
participant role
Vouch lifecycle state
payment/provider state
confirmation-window state
confirmation state
archive state
```

---

### Role-Aware Action Matrix

| Action                  | Merchant | Customer |
| ----------------------- | -------: | -------: |
| Create Vouch            |      Yes |       No |
| Commit Vouch            |      Yes |       No |
| Share Checkout link     |      Yes |       No |
| Authorize payment       |       No |      Yes |
| Confirm presence        |      Yes |      Yes |
| Trigger release alone   |       No |       No |
| Archive from dashboard  |      Yes |      Yes |
| Edit committed Vouch    |       No |       No |
| Cancel committed Vouch  |       No |       No |
| Force refund            |       No |       No |
| Submit dispute/evidence |       No |       No |
| Rewrite confirmation    |       No |       No |

---

### Role Implementation Rule

Roles are not global identity categories.

Roles are scoped to a Vouch.

Correct model:

```txt
user
-> participant role on Vouch A: merchant
-> participant role on Vouch B: customer
```

Incorrect model:

```txt
merchant account type
customer account type
separate permanent user classes
marketplace provider profile
public customer profile
```

Vouch has participants, not marketplace personas.

---

# 4. Lifecycle States

## Lifecycle Doctrine

The Vouch lifecycle must be small, deterministic, and immutable after commitment.

The canonical Vouch lifecycle is:

```txt
Draft
Committed
Sent
Accepted
Authorized
Confirmable
Completed
Expired
```

These are the core Vouch states.

Payment status, provider status, archive status, webhook status, and operational failure status are separate state axes.

They must not bloat the canonical Vouch lifecycle.

---

## Canonical Lifecycle States

```txt
Draft
Committed
Sent
Accepted
Authorized
Confirmable
Completed
Expired
```

---

## Draft

### Definition

The merchant is preparing a Vouch.

The merchant is filling out:

```txt
amount
appointment date
confirmation window
disclaimer acceptance
```

Nothing permanent exists yet.

No Stripe object exists yet.

No PaymentIntent exists yet.

No Checkout Session exists yet.

No public Vouch identifier exists yet.

No customer is bound.

No funds are authorized.

---

### Draft Rules

The merchant may:

```txt
edit amount
edit appointment date
edit confirmation window
accept or unaccept disclaimer
abandon the draft
delete the draft if locally persisted
```

The merchant may not:

```txt
share the draft as a live Vouch
collect payment authorization
trigger Stripe settlement objects
bind a customer
create confirmation truth
```

Draft is the only freely mutable state.

---

## Committed

### Definition

The merchant submits the Vouch.

The Vouch becomes real.

The platform creates the durable protocol record and the required provider-backed payment infrastructure.

The platform fee is charged immediately because protocol execution itself is the service.

---

### Committed Creation Writes

Committed creation creates:

```txt
immutable Vouch record
public Vouch identifier
pricing snapshot
appointment snapshot
confirmation-window snapshot
disclaimer acceptance record
Stripe Checkout Session
manual-capture PaymentIntent
provider references
audit event
recovery snapshot
```

---

### Committed Rules

The merchant may:

```txt
send the payment authorization link
hold the Vouch unused
let the Vouch expire unused
view the Vouch detail page
archive the Vouch from dashboard view
```

The merchant may not:

```txt
edit the amount
edit the appointment date
edit the confirmation window
cancel the Vouch
refund the Vouch
recreate the Vouch in place
mutate provider references
rewrite terms
replace the Vouch record
```

Committed is the immutability boundary.

After this point, the lifecycle is protocol-controlled.

---

## Sent

### Definition

The merchant distributes the Stripe-hosted payment authorization link.

The Vouch exists publicly through the shared authorization path.

The merchant may send the link through external channels such as:

```txt
SMS
email
copy/paste
native share sheet
external messaging system
```

Vouch does not provide messaging.

Vouch does not track conversation context.

Vouch does not care how the link is delivered.

---

### Sent Rules

The merchant may:

```txt
copy the link
share the link
view the Vouch detail page
archive the Vouch from dashboard view
```

The merchant may not:

```txt
unsend the Vouch
recall the link
invalidate the Vouch manually
edit terms after sending
decide whether the customer is allowed to authorize
```

Once sent, the Vouch lifecycle is no longer merchant-controlled.

---

## Accepted

### Definition

The customer enters the Vouch workflow.

The customer authenticates.

The customer accepts required terms.

The customer proceeds through the Stripe-hosted payment authorization flow.

Accepted means the customer has engaged the Vouch as the counterparty and the system is attempting or has completed the customer-binding path.

---

### Accepted Rules

The customer may:

```txt
review the Vouch
accept required terms
complete Stripe-hosted authorization
return to the Vouch detail page
```

The customer may not:

```txt
edit the Vouch
change terms
change amount
change appointment details
force authorization state
force settlement
```

If authorization fails, expires, or is invalidated according to Stripe provider state, the Vouch resolves toward expiration or failure handling according to provider truth.

Accepted does not mean funds are released.

Accepted does not mean settlement is eligible.

---

## Authorized

### Definition

Stripe has confirmed that the PaymentIntent exists and funds are authorized/held.

Manual capture remains pending.

The Vouch enters inert waiting state.

The system now waits for the appointment and confirmation window.

---

### Authorized Rules

No participant may modify the Vouch.

No participant may cancel the Vouch.

No participant may renegotiate the Vouch.

No participant may force settlement.

No participant may force refund.

The system waits.

Stripe is authoritative for:

```txt
authorization state
PaymentIntent state
capturable status
authorization expiration
provider failure state
```

Vouch is authoritative for:

```txt
workflow state
appointment metadata
confirmation window
participant roles
confirmation truth
settlement eligibility
```

---

## Confirmable

### Definition

The confirmation window is open.

Participants may generate short-lived confirmation codes.

Participants may physically exchange codes.

Participants may submit the other participant’s code.

Bilateral confirmation becomes possible.

---

### Confirmable Rules

During the confirmation window:

```txt
merchant may generate merchant confirmation code
customer may generate customer confirmation code
merchant may submit customer code
customer may submit merchant code
each participant may confirm once
duplicate confirmation is rejected
late confirmation is rejected
early confirmation is rejected
```

Code generation alone means nothing.

Partial confirmation alone means nothing.

One-sided confirmation never triggers settlement.

Only successful bilateral verification changes settlement eligibility.

The uploaded source already states that only successful bilateral verification changes state and that one-sided confirmation does not trigger settlement.

---

## Completed

### Definition

Completed is a terminal state.

Both participants successfully confirmed inside the confirmation window.

The platform-controlled capture executes.

Settlement proceeds through Stripe Connect according to provider state.

---

### Completed Rules

Completed means:

```txt
bilateral confirmation succeeded
confirmation timing was valid
confirmation roles were valid
PaymentIntent was capturable
capture was executed or entered provider-backed release processing
settlement proceeds through Stripe Connect
```

After completion:

```txt
confirmation truth is locked
the Vouch cannot be edited
the Vouch cannot be reversed by Vouch
the Vouch cannot be appealed through Vouch
the Vouch cannot be manually rewritten
```

Completed is final from Vouch’s workflow perspective.

---

## Expired

### Definition

Expired is a terminal state.

Anything other than successful bilateral confirmation inside the confirmation window resolves to Expired at the Vouch lifecycle level.

This includes:

```txt
customer never authorizes
authorization fails
authorization expires
neither participant confirms
only one participant confirms
confirmation occurs too early
confirmation occurs too late
confirmation validation fails
provider state prevents capture
```

---

### Expired Rules

Expired means:

```txt
capture does not occur
settlement does not occur
provider non-capture/cancel/expiration behavior proceeds according to Stripe state
```

Vouch prefers non-capture over refund whenever possible.

If the PaymentIntent was only authorized, the authorization is canceled, voided, or allowed to expire according to provider state.

If funds were already captured due to an exceptional technical sequence, provider refund handling belongs to the separate payment/provider state axis.

Expired is the Vouch lifecycle result.

Refunded, voided, canceled, failed, and provider-expired are payment/provider statuses, not canonical Vouch lifecycle states.

---

## Lifecycle Transition Map

```txt
Draft
  -> Committed

Committed
  -> Sent
  -> Expired

Sent
  -> Accepted
  -> Expired

Accepted
  -> Authorized
  -> Expired

Authorized
  -> Confirmable
  -> Expired

Confirmable
  -> Completed
  -> Expired

Completed
  -> terminal

Expired
  -> terminal
```

---

## State Axis Separation

The canonical Vouch lifecycle must stay clean.

Do not overload `VouchStatus` with every provider or UI state.

### Vouch Lifecycle State

```txt
Draft
Committed
Sent
Accepted
Authorized
Confirmable
Completed
Expired
```

#### Confirmation State

```txt
Unconfirmed
Merchant Confirmed
Customer Confirmed
Both Confirmed
```

#### Payment Provider State

```txt
Requires Payment Method
Requires Confirmation
Requires Capture
Processing
Succeeded
Canceled
Payment Failed
Expired
Refunded
```

#### Settlement State

```txt
Pending
Capture Pending
Captured
Non-Captured
Voided
Refunded
Failed
```

#### Archive State

```txt
Active
Archived
```

Archive is not a lifecycle state.

Archive is a visibility state.

Archived Vouches disappear from the active dashboard feed but preserve audit and provider history.

---

## State Reliability Doctrine

### Purpose

The canonical Vouch lifecycle stays intentionally small:

```txt
Draft
Committed
Sent
Accepted
Authorized
Confirmable
Completed
Expired
```

Provider truth, webhook delivery, offline confirmation, technical recovery, payout restrictions, and capture failures do not create new canonical lifecycle states by default.

They are reliability layers around the lifecycle.

The reliability layer exists to ensure:

```txt
no duplicate transition
no double capture
no double refund
no duplicate audit transition
no stale local payment truth
no manual payout path
no discretionary recovery path
```

Outcome follows system state.

---

### Provider Truth Rule

Stripe is authoritative for payment state.

Vouch is authoritative for workflow state.

Stripe owns:

```txt
PaymentIntent state
authorization state
capture eligibility
capture result
cancelation state
refund state
connected account capability state
payout restriction state
```

Vouch owns:

```txt
Vouch lifecycle state
participant role state
appointment metadata
confirmation window
presence confirmation truth
settlement eligibility
archive visibility
audit history
```

Vouch does not infer payment truth from browser redirects, local UI state, or stale database state.

Vouch mirrors Stripe provider truth into local persistence, then combines that provider truth with Vouch workflow truth to determine the correct deterministic outcome.

---

### Stripe Retrieve-Before-Settlement Rule

Before any settlement-critical provider operation, Vouch must retrieve current Stripe provider state.

Required before:

```txt
capture
cancel
void
refund
provider retry
settlement reconciliation
```

This prevents stale local state from triggering invalid provider operations.

Correct settlement sequence:

```txt
load current Vouch workflow state
load current local payment state
retrieve current Stripe PaymentIntent
compare provider state against Vouch workflow state
apply only valid forward movement
persist provider-backed result
write audit event
revalidate affected surfaces
```

Vouch must never capture based only on local database status.

Vouch must never refund based only on local database status.

Vouch must never trust the browser return URL as payment truth.

Stripe’s own docs state that manual-capture PaymentIntents are capturable when the status is `requires_capture`; uncaptured PaymentIntents are canceled after a set number of days, 7 by default. ([Stripe Docs](https://docs.stripe.com/api/payment_intents/capture?utm_source=chatgpt.com "Capture a PaymentIntent | Stripe API Reference"))

---

### Webhook Idempotency Rule

Every Stripe webhook event ID is recorded once.

If the same event arrives again, Vouch acknowledges it but does not re-run the transition.

Duplicate delivery is harmless.

Required webhook behavior:

```txt
receive event
verify Stripe signature
extract provider event ID
check webhook event ledger
if provider event ID already processed:
  acknowledge without transition
if provider event ID not processed:
  classify event
  load current Vouch/payment state
  apply only valid forward transition
  record provider event ID as processed
  write audit event if transition occurred
  acknowledge
```

Duplicate webhook delivery must not cause:

```txt
double capture
double refund
duplicate confirmation
duplicate lifecycle transition
duplicate audit transition
duplicate notification
duplicate recovery mutation
```

---

### Late Webhook Rule

Late webhooks are not automatically wrong.

Late webhooks are reconciled against current state.

If a late webhook still represents valid forward movement, Vouch applies it.

If a late webhook conflicts with the current state machine, Vouch records it as acknowledged/stale and does not mutate lifecycle truth.

Late webhook behavior:

```txt
receive late provider event
verify event identity
load current Vouch state
load current payment/provider state
compare provider event against current state
if event represents valid forward movement:
  apply transition
else:
  mark event acknowledged/stale
  do not mutate Vouch lifecycle
```

Late webhook must not:

```txt
move a terminal Vouch backward
reopen an expired Vouch
reopen a completed Vouch
overwrite confirmation truth
trigger second capture
trigger second refund
rewrite audit history
```

---

#### Webhook Reconciliation Invariant

Stripe webhooks are:

```txt
idempotent
deduped by provider event ID
signature verified
classified before processing
reconciled against current state
applied only as valid forward movement
```

Webhook events reconcile provider truth.

Webhook events do not invent Vouch business truth.

A webhook can update payment/provider state.

A webhook cannot decide presence confirmation.

A webhook cannot decide who is right.

A webhook cannot create a discretionary payout.

---

### Offline Confirmation Sync Rule

Offline confirmation is allowed only if the confirmation payload proves it was generated inside the confirmation window.

When the device comes back online, Vouch verifies the signed or derived timestamp bucket before accepting the confirmation.

Offline confirmation payloads must prove:

```txt
Vouch identity
participant identity
participant role
confirmation window membership
time bucket
cryptographic derivation validity
allowed clock-skew tolerance
payload integrity
```

Valid offline confirmation:

```txt
payload generated inside confirmation window
timestamp bucket is valid
role derivation matches participant role
confirmation secret material matches Vouch
clock skew is within tolerance
server reconciliation succeeds
```

Invalid offline confirmation:

```txt
payload generated outside confirmation window
timestamp bucket too early
timestamp bucket too late
role derivation mismatch
payload signature invalid
clock skew exceeds tolerance
participant already confirmed
Vouch already terminal
```

Offline confirmation does not execute settlement locally.

Offline confirmation only creates a candidate confirmation payload.

Settlement waits until server reconciliation succeeds.

---

### Clock-Skew Rule

When online, Vouch uses server time.

When offline, Vouch may allow a narrow clock-skew tolerance.

Canonical tolerance:

```txt
current five-minute bucket
one adjacent five-minute bucket
```

Nothing beyond that is valid.

Allowed:

```txt
current bucket
immediately previous bucket
immediately next bucket
```

Rejected:

```txt
anything more than one bucket early
anything more than one bucket late
manually edited timestamps
device-local timestamp claims without cryptographic derivation
payloads outside the confirmation window
```

The confirmation window remains authoritative.

Clock tolerance exists only to avoid punishing minor device drift.

Clock tolerance does not extend the confirmation window.

---

### Authorization Window Rule

Vouch cannot create or accept a Vouch if the appointment and confirmation window exceed Stripe’s capture window.

The system must enforce provider-capture feasibility before the Vouch becomes operationally valid.

Because Stripe authorization windows vary by card network, payment method, transaction type, and account eligibility, Vouch must use Stripe’s actual returned authorization deadline after authorization.

Stripe documents that `payment_method_details.card.capture_before` indicates when an authorization expires and recommends relying on `capture_before` because authorization rules can change. ([Stripe Docs](https://docs.stripe.com/payments/place-a-hold-on-a-payment-method?utm_source=chatgpt.com "Place a hold on a payment method"))

### Pre-Authorization Scheduling Rule

Before authorization exists, Vouch uses a conservative scheduling limit.

Default conservative constraint:

```txt
appointment confirmation window must fall inside the shortest supported manual-capture authorization window
```

For ordinary online card payments, Stripe documents 7 days for most major card-network card-not-present authorizations, with Visa merchant-initiated online transactions at 5 days. ([Stripe Docs](https://docs.stripe.com/payments/place-a-hold-on-a-payment-method?utm_source=chatgpt.com "Place a hold on a payment method"))

### Post-Authorization Deadline Rule

After authorization, Vouch stores the provider deadline from Stripe.

Persist:

```txt
stripePaymentIntentId
latestChargeId
captureBefore
authorizationExpiresAt
providerStatus
amountCapturable
```

The real deadline is the provider-backed deadline.

If `capture_before` is earlier than the Vouch confirmation deadline, the Vouch must resolve before provider expiration or move toward non-capture/expiration according to provider state.

---

### Recovery Snapshot Rule

A committed Vouch creates an immutable recovery snapshot.

The recovery snapshot contains:

```txt
original Vouch terms
amount
fees
customer total
appointment date
confirmation window
participant references
provider references
settlement rules
disclaimer acceptance
audit anchor
```

The snapshot exists for technical recovery only.

The snapshot never permits:

```txt
changing terms
rewriting amount
moving appointment date
changing confirmation window
replacing participant
manual settlement award
manual refund decision
arbitration
support override
```

If live state and snapshot conflict, Vouch enters internal recovery state.

Recovery uses the immutable committed snapshot to restore original terms.

Recovery does not create a replacement Vouch.

Recovery does not create a new deal.

Recovery does not give support or admin discretion.

---

#### Capture Failure After Bilateral Confirmation

If both participants confirm successfully but capture fails, Vouch must not invent a manual payout path.

Correct behavior:

```txt
retrieve current PaymentIntent state
if PaymentIntent is capturable:
  retry capture idempotently
if PaymentIntent is not capturable:
  persist provider failure state
  record technical failure
  write audit event
  expose safe failure status
```

Capture failure does not allow:

```txt
manual payout
manual fund award
confirmation rewrite
participant appeal
support override
alternate settlement rail
```

The provider state controls what can happen next.

The workflow truth remains:

```txt
both participants confirmed
capture failed at provider layer
```

That is an operational failure state, not a discretionary dispute.

---

### Connected Account Restriction Rule

Stripe capability state controls payout capability.

If the connected account becomes restricted before payout, Vouch records the provider restriction and follows Stripe’s allowed state.

Correct behavior:

```txt
retrieve connected account state
map payout capability state
persist provider restriction
block unsupported payout movement
show safe provider-restricted status
continue webhook reconciliation
```

Vouch must not create:

```txt
alternate payout path
manual payout flow
off-platform settlement instruction
support-mediated payout
replacement beneficiary
```

If Stripe blocks payout, Vouch reflects that provider truth.

Vouch does not bypass Stripe capability state.

---

### No Double-Execution Rule

Every settlement-affecting operation must use durable idempotency.

Required idempotency surfaces:

```txt
webhook event processing
PaymentIntent capture
PaymentIntent cancel/void
refund creation
provider retry
audit transition write
confirmation write
resolution job attempt
```

The same logical operation must produce the same durable idempotency key.

Duplicate execution must collapse into the original operation.

---

#### Reliability State Separation

These are not canonical Vouch lifecycle states:

```txt
Refunded
Voided
Canceled
Capture Failed
Refund Failed
Payout Blocked
Provider Restricted
Webhook Stale
Recovery Required
Reconciliation Pending
```

They are provider, settlement, or operational sub-states.

Canonical lifecycle remains:

```txt
Draft
Committed
Sent
Accepted
Authorized
Confirmable
Completed
Expired
```

Provider sub-state explains what happened underneath the lifecycle.

Example:

```txt
Vouch lifecycle: Expired
Payment provider state: Authorization canceled
Settlement state: Non-captured
Webhook state: Reconciled
```

Example:

```txt
Vouch lifecycle: Completed
Payment provider state: Capture failed
Settlement state: Release failed
Operational state: Provider retry eligible
```

The lifecycle tells the product story.

The provider state tells the payment truth.

The operational state tells the recovery status.

---

## Final Reliability Invariant

```txt
Stripe owns payment truth.
Vouch owns workflow truth.
Webhooks reconcile provider truth.
Settlement retrieves provider truth before action.
Offline confirmation must prove valid window timing.
Recovery restores original committed terms only.
Provider restrictions are obeyed.
Duplicate events do not duplicate transitions.
Late events apply only valid forward movement.
No manual payout path exists.
No discretion surface exists.
```

Outcome follows system state.

# 5. Prisma Schema

## Schema Doctrine

The Prisma schema is the durable source of workflow truth.

The database stores:

```txt
authenticated user identity references
provider readiness state
immutable Vouch terms
participant roles
payment provider references
confirmation truth
webhook idempotency records
audit history
archive visibility
technical recovery state
```

The database must not model marketplace behavior, messaging, disputes, reviews, ratings, evidence, appeals, public provider profiles, service listings, manual settlement awards, or subjective resolution flows.

Vouch only stores the facts required to execute deterministic payment coordination.

Stripe owns payment/provider truth.

Vouch mirrors Stripe payment truth and combines it with Vouch workflow truth.

---

### Current Schema Normalization Note

The uploaded `schema.prisma` already contains most of the right structural pieces:

```txt
User
VerificationProfile
PaymentCustomer
ConnectedAccount
TermsAcceptance
Vouch
Invitation
PresenceConfirmation
PaymentRecord
RefundRecord
ProviderWebhookEvent
PaymentWebhookEvent
AuditEvent
NotificationEvent
AnalyticsEvent
OperationalRetry
```

But the schema still contains legacy or overly broad state language that should be normalized before it becomes the final contract.

Required corrections:

```txt
VouchStatus must use the canonical lifecycle states.
ConfirmationMethod must remove gps/system as user-facing confirmation methods.
Refunded/voided/canceled/payment-failed/provider-restricted states should move to payment/provider/settlement axes, not Vouch lifecycle.
Admin operational models must remain safe retry/inspection only, never arbitration.
Setup/settings route assumptions must not leak into schema naming.
```

The schema shape is close.

The enum/state model needs tightening.

---

## Canonical Schema Responsibilities

The Prisma schema must support these state axes separately:

```txt
Vouch lifecycle state
participant role state
confirmation state
payment provider state
settlement state
webhook processing state
archive visibility state
technical recovery state
```

Do not collapse every operational state into `VouchStatus`.

The lifecycle tells the product story.

The payment state tells provider truth.

The settlement state tells money-movement progress.

The webhook state tells reconciliation status.

The recovery state tells whether technical restoration is needed.

---

## Required Enum Model

### UserStatus

```prisma
enum UserStatus {
  active
  disabled
}
```

Purpose:

```txt
controls whether an authenticated user may participate in protected workflows
```

---

### VerificationStatus

```prisma
enum VerificationStatus {
  unstarted
  pending
  verified
  rejected
  requires_action
  expired
}
```

Purpose:

```txt
tracks provider-backed identity/adult verification readiness where required
```

---

### PaymentReadinessStatus

```prisma
enum PaymentReadinessStatus {
  not_started
  requires_action
  ready
  failed
}
```

Purpose:

```txt
tracks whether a user can authorize payment through Stripe
```

---

### PayoutReadinessStatus

```prisma
enum PayoutReadinessStatus {
  not_started
  requires_action
  ready
  restricted
  failed
}
```

Purpose:

```txt
tracks whether a user can receive funds through Stripe Connect
```

---

### VouchStatus

The canonical lifecycle enum should be:

```prisma
enum VouchStatus {
  draft
  committed
  sent
  accepted
  authorized
  confirmable
  completed
  expired
}
```

These are the only canonical Vouch lifecycle states.

Do not include provider/payment states here.

Do not include archive state here.

Do not include refund state here.

Do not include operational failure state here.

---

### ParticipantRole

```prisma
enum ParticipantRole {
  merchant
  customer
}
```

Implementation may map these internally to payer/payee where payment logic requires it.

Product meaning:

```txt
merchant = Vouch creator / intended recipient / Stripe Connect account owner
customer = paying participant / Stripe customer / payment authorizer
```

If the implementation keeps `payer` and `payee`, the naming must be documented clearly:

```txt
payer = customer
payee = merchant
```

Avoid mixing merchant/customer and payer/payee ambiguously.

---

### ConfirmationStatus

```prisma
enum ConfirmationStatus {
  pending
  confirmed
  rejected
}
```

Purpose:

```txt
tracks whether a participant’s submitted confirmation was accepted as valid protocol truth
```

Do not encode window state here.

Window state is derived from timestamps.

---

### AggregateConfirmationStatus

```prisma
enum AggregateConfirmationStatus {
  none_confirmed
  merchant_confirmed
  customer_confirmed
  both_confirmed
}
```

Purpose:

```txt
summarizes bilateral confirmation state for DTOs and resolution logic
```

Only `both_confirmed` may authorize settlement evaluation.

One-sided confirmation never releases funds.

---

### ConfirmationMethod

Canonical confirmation method:

```prisma
enum ConfirmationMethod {
  code_exchange
  offline_code_exchange
}
```

Remove:

```txt
gps
system
manual
```

Vouch does not use GPS confirmation, support confirmation, screenshots, evidence, arbitration, or fallback subjective methods.

---

### PaymentProvider

```prisma
enum PaymentProvider {
  stripe
}
```

Purpose:

```txt
keeps provider references explicit without pretending Vouch owns payment rails
```

---

### VerificationProvider

```prisma
enum VerificationProvider {
  stripe_identity
}
```

Purpose:

```txt
tracks provider-backed identity/adult verification references when required
```

---

### WebhookProvider

```prisma
enum WebhookProvider {
  clerk
  stripe
  stripe_identity
}
```

Purpose:

```txt
dedupes external provider events by provider and provider event ID
```

---

### ProviderWebhookStatus

```prisma
enum ProviderWebhookStatus {
  received
  processed
  ignored
  failed
}
```

Purpose:

```txt
records webhook processing state without re-running duplicate transitions
```

---

### PaymentStatus

```prisma
enum PaymentStatus {
  not_started
  checkout_created
  requires_payment_method
  requires_capture
  authorized
  capture_processing
  captured
  canceled
  expired
  failed
}
```

Purpose:

```txt
mirrors safe Stripe payment state without exposing full Stripe objects
```

Stripe remains authoritative for actual payment state.

---

### SettlementStatus

```prisma
enum SettlementStatus {
  pending
  non_capture_pending
  non_captured
  capture_pending
  captured
  refund_pending
  refunded
  provider_blocked
  failed
}
```

Purpose:

```txt
tracks settlement execution after combining Vouch workflow truth with Stripe provider truth
```

This is where `refunded`, `voided`, `provider_blocked`, and `failed` belong.

They do not belong in `VouchStatus`.

---

### ArchiveStatus

```prisma
enum ArchiveStatus {
  active
  archived
}
```

Purpose:

```txt
controls dashboard visibility without changing lifecycle truth
```

Archive is not a lifecycle state.

Archived Vouches disappear from active dashboard feeds while preserving audit and provider history.

---

### RecoveryStatus

```prisma
enum RecoveryStatus {
  normal
  recovery_required
  recovery_in_progress
  recovered
  recovery_failed
}
```

Purpose:

```txt
tracks internal-only technical recovery state
```

Recovery does not permit rewriting terms, arbitration, or manual settlement awards.

---

## Required Core Models

### User

The `User` model stores the local account record linked to Clerk.

Required fields:

```txt
id
clerkUserId
email
phone
displayName
status
createdAt
updatedAt
```

Required relations:

```txt
verificationProfile
paymentCustomer
connectedAccount
termsAcceptances
merchantVouches
customerVouches
presenceConfirmations
auditEvents
notificationEvents
analyticsEvents
```

Rules:

```txt
clerkUserId must be unique
email may be nullable
no public profile fields
no marketplace biography
no ratings/reviews metadata
no service-category fields
```

---

### VerificationProfile

Stores provider-backed identity/adult verification readiness.

Required fields:

```txt
id
userId
identityStatus
adultStatus
provider
providerReference
createdAt
updatedAt
```

Rules:

```txt
one verification profile per user
no raw identity document storage
no biometric payload storage
no full provider payload storage
only safe provider references
```

---

### PaymentCustomer

Stores Stripe customer readiness for the paying participant.

Required fields:

```txt
id
userId
provider
providerCustomerId
readiness
createdAt
updatedAt
```

Rules:

```txt
one payment customer per user per provider
providerCustomerId must be unique
no raw card data
no raw billing payloads
no payment method secrets
```

---

### ConnectedAccount

Stores Stripe Connect readiness for the receiving participant.

Required fields:

```txt
id
userId
provider
providerAccountId
readiness
chargesEnabled
payoutsEnabled
detailsSubmitted
createdAt
updatedAt
```

Rules:

```txt
one connected account per user per provider
providerAccountId must be unique
no raw bank data
no tax payload storage
no full KYC payload storage
capability state is mirrored from Stripe
```

Stripe Connect handles KYC, compliance, payout banking, and payout capability state.

---

### TermsAcceptance

Stores accepted legal/version state.

Required fields:

```txt
id
userId
termsVersion
acceptedAt
ipHash
userAgentHash
```

Rules:

```txt
unique userId + termsVersion
store hashes only for IP/user-agent
do not store unnecessary raw sensitive request data
```

---

## Vouch Domain Models

### Vouch

The `Vouch` model stores immutable workflow terms and canonical lifecycle state.

Required fields:

```txt
id
publicId
merchantId
customerId
status
archiveStatus
recoveryStatus
currency
protectedAmountCents
vouchServiceFeeCents
processingFeeOffsetCents
applicationFeeAmountCents
customerTotalCents
merchantReceivesCents
appointmentStartsAt
confirmationOpensAt
confirmationExpiresAt
committedAt
sentAt
acceptedAt
authorizedAt
confirmableAt
completedAt
expiredAt
createdAt
updatedAt
```

Required relations:

```txt
merchant User
customer User?
invitation Invitation?
presenceConfirmations PresenceConfirmation[]
paymentRecord PaymentRecord?
refundRecords RefundRecord[]
auditEvents through entity reference
notificationEvents
paymentWebhookEvents
recoverySnapshot VouchRecoverySnapshot?
```

Rules:

```txt
publicId must be unique
committed-and-later terms are immutable
money values are stored as integer cents
currency is normalized lowercase ISO code
confirmationOpensAt must be before confirmationExpiresAt
appointment/confirmation timing must fit provider authorization constraints
customerId is nullable until accepted
archive status is separate from lifecycle status
recovery status is internal only
```

Committed Vouches create immutable provider-linked records, provider references, audit events, and a recovery snapshot.

---

### VouchRecoverySnapshot

Committed Vouches need an immutable internal recovery snapshot.

Required fields:

```txt
id
vouchId
snapshotVersion
originalTermsJson
pricingSnapshotJson
providerReferencesJson
settlementRulesJson
createdAt
```

Rules:

```txt
one recovery snapshot per committed Vouch
internal-only
immutable
restoration-only
not user-facing
does not create replacement Vouches
does not permit term changes
```

Recovery snapshots restore original committed state after technical failure only.

---

### Invitation

The `Invitation` model stores controlled access to a Vouch.

Required fields:

```txt
id
vouchId
tokenHash
recipientEmail
status
expiresAt
openedAt
acceptedAt
declinedAt
createdAt
updatedAt
```

Rules:

```txt
one active invitation per Vouch unless future contract says otherwise
tokenHash must be unique
raw token is never stored
invitation does not create messaging
invitation does not create marketplace discovery
acceptance cannot bypass auth/readiness rules
```

---

### PresenceConfirmation

The `PresenceConfirmation` model stores each participant’s confirmation fact.

Required fields:

```txt
id
vouchId
userId
participantRole
status
method
confirmedAt
serverReceivedAt
timeBucket
clockSkewAccepted
offlinePayloadHash
createdAt
```

Rules:

```txt
one confirmation per Vouch per participant role
one confirmation per Vouch per user
confirmation must be inside the confirmation window
duplicate confirmation must be impossible at database level
offline payloads must prove valid time-bucket membership
confirmation cannot be deleted or rewritten
```

Required unique constraints:

```txt
unique(vouchId, participantRole)
unique(vouchId, userId)
```

The source doctrine requires confirmation timing, role correctness, cryptographic derivation, and clock-skew tolerance to be validated before offline confirmations count.

---

## Payment Models

### PaymentRecord

The `PaymentRecord` model stores safe Stripe PaymentIntent and Checkout references.

Required fields:

```txt
id
vouchId
provider
providerPaymentIntentId
providerCheckoutSessionId
providerChargeId
providerTransferId
status
settlementStatus
amountCents
currency
protectedAmountCents
vouchServiceFeeCents
processingFeeOffsetCents
applicationFeeAmountCents
customerTotalCents
merchantReceivesCents
amountCapturableCents
captureBefore
authorizedAt
capturedAt
canceledAt
failedAt
lastProviderSyncAt
lastErrorCode
lastErrorMessage
createdAt
updatedAt
```

Rules:

```txt
one payment record per Vouch
providerPaymentIntentId must be unique when present
providerCheckoutSessionId must be unique when present
store safe provider references only
do not store full Stripe objects
do not store raw card data
do not store raw bank data
```

The PaymentIntent is the authoritative lifecycle object for the payment attempt, and Vouch should generally remain in authorization/manual-capture mode until deterministic outcome is known.

---

### RefundRecord

The `RefundRecord` model stores explicit refund operations only when refund is required.

Required fields:

```txt
id
vouchId
paymentRecordId
providerRefundId
status
reason
amountCents
createdAt
updatedAt
```

Rules:

```txt
refund is separate from non-capture
refund is only used after captured funds require reversal
non-capture/cancel/expiration is preferred whenever possible
providerRefundId must be unique when present
```

Authorization hold release, capture, cancel, and refund are separate payment outcomes.

---

## Webhook Models

### ProviderWebhookEvent

The `ProviderWebhookEvent` model is the generic webhook idempotency ledger.

Required fields:

```txt
id
provider
providerEventId
eventType
status
processed
receivedAt
processedAt
processingError
safeMetadata
```

Required unique constraint:

```txt
unique(provider, providerEventId)
```

Rules:

```txt
record every provider event ID once
acknowledge duplicate events without rerunning transitions
do not store full provider payloads
store only safe metadata
late events reconcile only if they represent valid forward movement
```

Stripe webhook processing must be idempotent, deduped, and reconciled against current state before applying transitions.

---

### PaymentWebhookEvent

The `PaymentWebhookEvent` model is the payment-specific projection of Stripe webhook events.

Required fields:

```txt
id
provider
providerEventId
eventType
providerWebhookEventId
vouchId
paymentRecordId
refundRecordId
processed
receivedAt
processedAt
processingError
safeMetadata
```

Rules:

```txt
providerEventId must be unique
may link to Vouch
may link to PaymentRecord
may link to RefundRecord
does not duplicate full provider payload
supports operational payment/webhook views
```

---

## Clerk Provider Sync Models

The schema may keep Clerk projection tables if they support idempotent provider synchronization.

Allowed models:

```txt
ClerkSession
ClerkEmail
ClerkSms
ClerkInvitation
```

Rules:

```txt
used only for provider sync
not user-facing product models
not messaging features
not invitation/discovery features
no raw sensitive payloads
no marketplace behavior
```

Clerk webhook handling should sync user/auth provider state into local tables through idempotent server write orchestration.

---

## Audit Model

### AuditEvent

The `AuditEvent` model stores a replayable operational story without subjective disputes.

Required fields:

```txt
id
eventName
actorType
actorUserId
entityType
entityId
requestId
participantSafe
metadata
createdAt
```

Rules:

```txt
every important transition writes an audit event
participantSafe controls user-visible timeline exposure
metadata must be safe and minimal
audit is append-only
audit does not create dispute resolution
```

Important transition examples:

```txt
vouch.created
vouch.committed
vouch.sent
vouch.accepted
payment.authorized
confirmation.merchant_confirmed
confirmation.customer_confirmed
confirmation.both_confirmed
settlement.capture_requested
settlement.captured
vouch.completed
vouch.expired
provider.webhook_processed
provider.reconciliation_failed
```

The trust model requires every important transition to write audit state while avoiding subjective disputes.

---

## Notification Model

### NotificationEvent

The `NotificationEvent` model may exist only as an operational notification ledger.

Required fields:

```txt
id
eventName
channel
status
recipientUserId
vouchId
providerMessageId
errorCode
createdAt
sentAt
failedAt
```

Rules:

```txt
notification is not messaging
notification is not chat
notification is not negotiation
notification is not dispute communication
notification events are system-generated only
```

---

## Analytics Model

### AnalyticsEvent

The `AnalyticsEvent` model may exist for product instrumentation.

Required fields:

```txt
id
eventName
eventGroup
environment
userId
sessionId
requestId
occurredAt
createdAt
properties
```

Rules:

```txt
no raw provider payloads
no sensitive payment data
no identity document data
no dispute/evidence categories
```

---

## Operational Retry Model

### OperationalRetry

The `OperationalRetry` model may exist only for safe technical retries.

Allowed retry operations:

```txt
retry_notification_send
retry_provider_reconciliation
retry_webhook_processing
retry_refund_status_sync
retry_capture_status_sync
```

Forbidden operations:

```txt
force_release
manual_award
manual_refund_decision
rewrite_confirmation
edit_confirmation_timestamp
override_outcome
```

Operational retry may inspect and retry safe provider operations.

Operational retry may not arbitrate.

Operational retry may not decide who is right.

Operational retry may not create a manual settlement path.

---

## Required Database Constraints

### Identity Constraints

```txt
User.clerkUserId unique
PaymentCustomer.providerCustomerId unique
ConnectedAccount.providerAccountId unique
TermsAcceptance unique(userId, termsVersion)
```

---

### Vouch Constraints

```txt
Vouch.publicId unique
Vouch.confirmationOpensAt < Vouch.confirmationExpiresAt enforced in application logic
Vouch.customerTotalCents >= Vouch.protectedAmountCents enforced in application logic
Vouch.committedAt required when status != draft enforced in application logic
```

Prisma cannot express all check constraints portably unless using raw SQL migrations, so server actions and transaction helpers must enforce domain invariants.

---

### Confirmation Constraints

```txt
PresenceConfirmation unique(vouchId, participantRole)
PresenceConfirmation unique(vouchId, userId)
```

These constraints prevent duplicate participant confirmation at the database level.

---

### Webhook Constraints

```txt
ProviderWebhookEvent unique(provider, providerEventId)
PaymentWebhookEvent providerEventId unique
```

These constraints prevent duplicate webhook processing.

---

### Provider Reference Constraints

```txt
PaymentRecord.providerPaymentIntentId unique when present
PaymentRecord.providerCheckoutSessionId unique when present
RefundRecord.providerRefundId unique when present
```

---

## Required Indexes

### Vouch Indexes

```txt
merchantId
customerId
status
archiveStatus
confirmationExpiresAt
merchantId + status + confirmationExpiresAt
customerId + status + confirmationExpiresAt
merchantId + createdAt
customerId + createdAt
```

---

### Payment Indexes

```txt
provider
status
settlementStatus
providerPaymentIntentId
providerCheckoutSessionId
providerChargeId
captureBefore
lastProviderSyncAt
```

---

### Confirmation Indexes

```txt
vouchId
userId
participantRole
confirmedAt
timeBucket
```

---

### Webhook Indexes

```txt
provider
providerEventId
eventType
status
processed
receivedAt
processedAt
```

---

### Audit Indexes

```txt
eventName
actorType
actorUserId
entityType + entityId
entityType + entityId + createdAt
participantSafe
createdAt
```

---

## Fields That Must Not Exist

Do not add fields for:

```txt
publicProfileSlug
providerBio
serviceCategory
serviceListingId
searchTags
ratingAverage
reviewCount
reviewBody
messageThreadId
chatRoomId
disputeCaseId
claimId
appealId
evidenceUploadId
manualAwardAmountCents
forceReleaseReason
adminOutcomeDecision
supportJudgment
winnerUserId
loserUserId
```

These fields would violate the product boundary.

Vouch has no marketplace, no messaging, no reviews, no dispute system, no evidence review, and no manual settlement decision layer.

---

## Schema Acceptance Criteria

The Prisma schema is acceptable only when:

```txt
canonical VouchStatus uses Draft/Committed/Sent/Accepted/Authorized/Confirmable/Completed/Expired
payment/provider states are separate from Vouch lifecycle state
archive state is separate from Vouch lifecycle state
recovery state is internal-only
Stripe provider references are safe and minimal
Clerk provider sync is idempotent
webhook event IDs are unique per provider
confirmation duplicate prevention exists at database level
pricing snapshot fields are frozen on commit
recovery snapshot exists for committed Vouches
no marketplace/dispute/messaging/review fields exist
no raw Stripe objects are stored
no raw Clerk payloads are stored
no raw identity documents are stored
no raw bank/card data is stored
schema supports server-action-owned writes
schema supports fetcher-owned protected reads
schema validates with pnpm prisma:validate
```

This schema contract preserves the product rule:

```txt
both participants confirm inside the confirmation window
-> capture/release through Stripe

anything else
-> non-capture/cancel/expiration/refund according to provider state
```

The database stores facts.

The actions enforce transitions.

The UI displays the result.

Outcome follows system state.

---

# 6. Constants

## Constants Doctrine

Constants are the shared vocabulary of the system.

Constants must prevent drift between:

```txt
Prisma enums
TypeScript unions
Zod schemas
DTO variants
state-machine helpers
UI labels
tests
```

A lifecycle value, role value, provider value, audit event name, or route value must not be retyped manually across the codebase.

Constants are not business logic.

Constants define allowable values.

Business logic decides when values change.

---

## Required Constants Surface

Canonical constants should live under:

```txt
lib/vouch/constants.ts
```

Cross-domain constants may also be split later only if the file becomes too large:

```txt
lib/vouch/constants.ts
lib/payments/constants.ts
lib/audit/constants.ts
lib/routes/constants.ts
```

For the roadmap, one canonical constants file is acceptable.

---

### Vouch Lifecycle Constants

```ts
export const VOUCH_STATUS_VALUES = [
    "draft",
    "committed",
    "sent",
    "accepted",
    "authorized",
    "confirmable",
    "completed",
    "expired",
] as const
```

Rules:

```txt
Do not include refunded.
Do not include canceled.
Do not include failed.
Do not include archived.
Do not include payment provider states.
```

Those belong to separate axes.

The current repo still uses older Vouch status values in `types/vouch.ts`, including `pending`, `active`, `refunded`, `canceled`, and `failed`; those need to be replaced by the canonical lifecycle constants.

---

### Participant Role Constants

```ts
export const PARTICIPANT_ROLE_VALUES = ["merchant", "customer"] as const
```

If implementation keeps payment-oriented aliases, they must be derived, not competing source values:

```ts
export const PAYMENT_ROLE_MAP = {
    merchant: "payee",
    customer: "payer",
} as const
```

Canonical product roles:

```txt
merchant
customer
```

Payment aliases:

```txt
merchant -> payee
customer -> payer
```

Do not let both naming systems become independent domain sources.

---

### Confirmation Constants

```ts
export const CONFIRMATION_STATUS_VALUES = [
    "not_confirmed",
    "confirmed",
    "invalid",
] as const

export const AGGREGATE_CONFIRMATION_STATUS_VALUES = [
    "none_confirmed",
    "merchant_confirmed",
    "customer_confirmed",
    "both_confirmed",
] as const

export const CONFIRMATION_METHOD_VALUES = [
    "code_exchange",
    "offline_code_exchange",
] as const
```

The repo currently exposes `manual`, `gps`, and `system` as confirmation methods. That must be normalized because Vouch’s canonical confirmation method is deterministic bilateral code exchange, not GPS, admin/system confirmation, or subjective/manual override.

---

### Payment Constants

```ts
export const PAYMENT_PROVIDER_VALUES = ["stripe"] as const

export const PAYMENT_READINESS_STATUS_VALUES = [
    "not_started",
    "requires_action",
    "ready",
    "failed",
] as const

export const PAYOUT_READINESS_STATUS_VALUES = [
    "not_started",
    "requires_action",
    "ready",
    "restricted",
    "failed",
] as const
```

Payment provider state must remain separate from Vouch lifecycle state.

The current repo already has payment and payout readiness unions in `types/payment.ts`; those can be retained, but payment execution states should be normalized around provider truth and settlement truth.

---

### Settlement Constants

```ts
export const SETTLEMENT_STATUS_VALUES = [
    "pending",
    "capture_pending",
    "captured",
    "non_capture_pending",
    "non_captured",
    "refund_pending",
    "refunded",
    "provider_blocked",
    "failed",
] as const
```

Rules:

```txt
captured/refunded/provider_blocked/failed are settlement statuses.
They are not canonical Vouch lifecycle statuses.
```

---

### Archive Constants

```ts
export const ARCHIVE_STATUS_VALUES = ["active", "archived"] as const
```

Archive is dashboard visibility.

Archive is not lifecycle.

---

### Webhook Constants

```ts
export const WEBHOOK_PROVIDER_VALUES = ["clerk", "stripe"] as const

export const WEBHOOK_PROCESSING_STATUS_VALUES = [
    "received",
    "processed",
    "ignored",
    "failed",
] as const
```

Rules:

```txt
provider event ID is recorded once
duplicate event is acknowledged without rerunning transition
late event applies only valid forward movement
```

---

### Route Constants

```ts
export const APP_ROUTES = {
    home: "/",
    faq: "/faq",
    pricing: "/pricing",
    terms: "/legal/terms",
    privacy: "/legal/privacy",
    signIn: "/sign-in",
    signUp: "/sign-up",
    dashboard: "/dashboard",
    newVouch: "/vouches/new",
    confirmNewVouch: "/vouches/new/confirm",
    vouchDetail: "/vouches",
    checkoutSuccess: "/checkout/success",
} as const
```

Forbidden route constants must not exist for:

```txt
settings
setup
readiness
messages
disputes
reviews
ratings
marketplace
providers
search
browse
manual settlement
```

---

### Pricing Constants

```ts
export const SUPPORTED_CURRENCY_VALUES = ["usd"] as const

export const MIN_VOUCH_AMOUNT_CENTS = 100
export const VOUCH_PLATFORM_FEE_BPS = 500
export const MIN_VOUCH_PLATFORM_FEE_CENTS = 500
```

Fee rule:

```txt
Vouch fee = max(5% of customer total, 500 cents)
```

The fee calculation itself belongs in:

```txt
lib/vouch/fees.ts
```

Constants only define the policy values.

---

### Time Constants

```ts
export const CONFIRMATION_CODE_BUCKET_SECONDS = 300
export const OFFLINE_CONFIRMATION_ALLOWED_BUCKET_SKEW = 1
```

Meaning:

```txt
five-minute bucket
one adjacent bucket allowed for offline clock skew
nothing beyond that
```

---

## Constants Acceptance Criteria

Constants are acceptable only when:

```txt
canonical lifecycle values exist once
roles exist once
confirmation methods exclude GPS/manual/system override semantics
route constants do not include removed setup/settings routes
payment/settlement values are separate from Vouch lifecycle values
Zod schemas import or derive from constants
TypeScript unions derive from constants
tests import constants instead of duplicating string arrays
```

---

# 7. TypeScript Types

## Type Doctrine

TypeScript types define transport-safe application contracts.

Types must represent what app code is allowed to pass between:

```txt
fetchers
actions
features
components
DTO mappers
tests
integration boundaries
```

Types must not expose:

```txt
raw Prisma models
raw Stripe objects
raw Clerk payloads
raw webhook payloads
raw identity/KYC data
raw bank/card data
```

The connected repo currently has the expected type surface, including `types/vouch.ts`, `types/payment.ts`, and `types/audit.ts`, but the Vouch unions need normalization to the canonical lifecycle and confirmation model.

---

## Required Type Files

Retained core type files:

```txt
types/common.ts
types/auth.ts
types/user.ts
types/payment.ts
types/vouch.ts
types/dashboard.ts
types/audit.ts
types/action-result.ts
types/webhooks.ts
```

Files that should be reviewed before retention:

```txt
types/admin.ts
types/analytics.ts
types/notification.ts
types/settings.ts
types/system.ts
```

Review rule:

```txt
Retain only if they support operational inspection, telemetry, notification delivery, or system safety.
Remove or quarantine anything that implies marketplace, messaging, settings pages, admin arbitration, disputes, evidence, or manual settlement.
```

---

### Common Types

`types/common.ts` owns shared primitives:

```ts
export type ID = string
export type PublicID = string
export type UserID = string
export type VouchID = string
export type InvitationToken = string
export type ISODateTime = string
export type CurrencyCode = "usd"
export type MoneyCents = number
export type PercentageBasisPoints = number
```

Rules:

```txt
Money is always integer cents.
Dates crossing transport boundaries are ISO strings.
Provider IDs are strings but should use semantic aliases where useful.
```

---

### Vouch Types

`types/vouch.ts` must define:

```ts
export type VouchStatus =
    | "draft"
    | "committed"
    | "sent"
    | "accepted"
    | "authorized"
    | "confirmable"
    | "completed"
    | "expired"

export type ParticipantRole = "merchant" | "customer"

export type ConfirmationStatus = "not_confirmed" | "confirmed" | "invalid"

export type AggregateConfirmationStatus =
    | "none_confirmed"
    | "merchant_confirmed"
    | "customer_confirmed"
    | "both_confirmed"

export type ConfirmationMethod = "code_exchange" | "offline_code_exchange"
```

Current repo correction:

```txt
Replace pending/active/refunded/canceled/failed VouchStatus values.
Replace payer/payee or make them payment aliases only.
Replace manual/gps/system confirmation methods.
```

The current repo version still exposes the old lifecycle and method unions.

---

### Vouch Input Types

Required input contracts:

```ts
export interface CreateVouchDraftInput {
    amountCents: MoneyCents
    currency: CurrencyCode
    appointmentStartsAt: ISODateTime
    confirmationOpensAt: ISODateTime
    confirmationExpiresAt: ISODateTime
}

export interface ConfirmCreateVouchInput {
    draftId?: string
    amountCents: MoneyCents
    currency: CurrencyCode
    appointmentStartsAt: ISODateTime
    confirmationOpensAt: ISODateTime
    confirmationExpiresAt: ISODateTime
    disclaimerAccepted: true
}

export interface ConfirmPresenceInput {
    vouchId: VouchID
    submittedCode: string
    method: ConfirmationMethod
}

export interface ArchiveVouchInput {
    vouchId: VouchID
}
```

No input type should include:

```txt
customer email
memo
private note
service category
message body
dispute reason
evidence upload
manual award reason
```

---

### Payment Types

`types/payment.ts` should retain:

```ts
export type PaymentProvider = "stripe"
export type PaymentReadinessStatus =
    | "not_started"
    | "requires_action"
    | "ready"
    | "failed"

export type PayoutReadinessStatus =
    | "not_started"
    | "requires_action"
    | "ready"
    | "restricted"
    | "failed"
```

Payment execution types should be normalized:

```ts
export type PaymentStatus =
    | "not_started"
    | "checkout_created"
    | "requires_payment_method"
    | "requires_capture"
    | "authorized"
    | "capture_processing"
    | "captured"
    | "canceled"
    | "expired"
    | "failed"

export type SettlementStatus =
    | "pending"
    | "capture_pending"
    | "captured"
    | "non_capture_pending"
    | "non_captured"
    | "refund_pending"
    | "refunded"
    | "provider_blocked"
    | "failed"
```

The current repo already separates payment readiness and payout readiness, but payment statuses include release/refund language that should be aligned with the settlement axis.

---

### Dashboard Types

Dashboard types should support:

```ts
export interface DashboardMetricsDTO {
    openCount: number
    completedCount: number
    expiredCount: number
    archivedCount: number
}

export interface DashboardVouchCardDTO {
    id: VouchID
    publicId: PublicID
    amountCents: MoneyCents
    currency: CurrencyCode
    appointmentStartsAt: ISODateTime
    confirmationOpensAt: ISODateTime
    confirmationExpiresAt: ISODateTime
    status: VouchStatus
    role: ParticipantRole
    nextAction: string
    archiveStatus: "active" | "archived"
}
```

Dashboard remains:

```txt
metric grid
vertical Vouch card column
callout panel
```

No analytics dashboard, marketplace feed, inbox, or lifecycle kanban.

---

### Action Result Type

`types/action-result.ts` should define one server-action response shape:

```ts
export type ActionResult<T = undefined> =
    | {
          ok: true
          data: T
          message?: string
          redirectTo?: string
      }
    | {
          ok: false
          code: string
          message: string
          fieldErrors?: Record<string, string[]>
          formError?: string
      }
```

Rules:

```txt
server actions return typed results or redirect
components do not parse thrown provider errors
safe messages only
no raw provider payloads
```

---

### Webhook Types

`types/webhooks.ts` should define normalized provider event contracts:

```ts
export interface ProviderWebhookEnvelope {
    provider: "clerk" | "stripe"
    providerEventId: string
    eventType: string
    receivedAt: ISODateTime
    safeMetadata?: Record<string, unknown>
}

export interface WebhookProcessingResult {
    providerEventId: string
    status: "processed" | "ignored" | "failed"
    transitionApplied: boolean
}
```

Rules:

```txt
dedupe by provider event ID
do not expose raw provider payloads
late events apply only valid forward movement
```

---

## TypeScript Acceptance Criteria

Types are acceptable only when:

```txt
unions derive from constants
VouchStatus matches canonical lifecycle
payment and settlement status are separate
archive status is separate
roles are scoped to Vouch participation
DTO types are transport-safe
action results are typed
webhook types are normalized and provider-safe
no type exposes raw Prisma/Stripe/Clerk objects
```

---

# 8. Zod Schemas

## Schema Doctrine

Zod schemas validate every external or user-controlled boundary.

Zod validates:

```txt
form input
server action input
route params
search params
provider return params
webhook envelopes after signature verification
```

Zod does not create truth.

Server actions create truth after:

```txt
authentication
authorization
validation
transaction/provider operation
audit write
revalidation
```

The current repo has `schemas/vouch.ts`, but it mirrors the older Vouch lifecycle and old confirmation methods, so it must be normalized alongside the TypeScript types.

---

## Required Schema Files

Retained schema files:

```txt
schemas/common.ts
schemas/auth.ts
schemas/user.ts
schemas/payment.ts
schemas/vouch.ts
schemas/dashboard.ts
schemas/audit.ts
schemas/webhooks.ts
```

Review before retention:

```txt
schemas/admin.ts
schemas/analytics.ts
schemas/notification.ts
schemas/settings.ts
schemas/system.ts
```

Remove or quarantine schemas that imply:

```txt
settings pages
setup pages
marketplace discovery
messaging
disputes
reviews
ratings
evidence
manual settlement
```

---

### Common Schemas

`schemas/common.ts` owns:

```txt
ID validation
public ID validation
currency validation
money cents coercion
ISO date validation
safe metadata validation
safe internal return path validation
pagination/search-param helpers when needed
```

Required helpers:

```ts
export const currencyCodeSchema = z.literal("usd")
export const moneyCentsSchema = z.number().int().nonnegative()
export const positiveMoneyCentsSchema = z.number().int().min(100)
export const safeMetadataSchema = z.record(z.string(), z.unknown())
```

---

### Vouch Schemas

`schemas/vouch.ts` must derive enums from constants.

Required schemas:

```txt
vouchStatusSchema
participantRoleSchema
confirmationStatusSchema
aggregateConfirmationStatusSchema
confirmationMethodSchema
createVouchDraftSchema
confirmCreateVouchSchema
confirmPresenceSchema
archiveVouchSchema
vouchIdParamSchema
vouchListSearchParamsSchema
```

Canonical enum schemas:

```ts
export const vouchStatusSchema = z.enum(VOUCH_STATUS_VALUES)
export const participantRoleSchema = z.enum(PARTICIPANT_ROLE_VALUES)
export const confirmationMethodSchema = z.enum(CONFIRMATION_METHOD_VALUES)
```

The current repo version still includes `manual`, `gps`, and `system` confirmation methods and older list/detail variants; those should be replaced.

---

### Create Vouch Draft Schema

```ts
export const createVouchDraftSchema = z
    .object({
        amountCents: positiveMoneyCentsSchema,
        currency: z.literal("usd").default("usd"),
        appointmentStartsAt: z.coerce.date(),
        confirmationOpensAt: z.coerce.date(),
        confirmationExpiresAt: z.coerce.date(),
    })
    .superRefine((value, ctx) => {
        if (value.confirmationOpensAt >= value.confirmationExpiresAt) {
            ctx.addIssue({
                code: "custom",
                path: ["confirmationExpiresAt"],
                message:
                    "Confirmation expiration must be after confirmation opening.",
            })
        }

        if (value.appointmentStartsAt > value.confirmationExpiresAt) {
            ctx.addIssue({
                code: "custom",
                path: ["appointmentStartsAt"],
                message:
                    "Appointment must occur before the confirmation deadline.",
            })
        }
    })
```

No recipient field.

No memo field.

No private note field.

---

### Confirm Create Vouch Schema

```ts
export const confirmCreateVouchSchema = createVouchDraftSchema.extend({
    disclaimerAccepted: z.literal(true, {
        error: "You must accept the conditional payment disclaimer before creating this Vouch.",
    }),
})
```

Rules:

```txt
disclaimer acceptance required
server action still owns final validation
client-side validation is UX only
```

---

### Confirm Presence Schema

```ts
export const confirmPresenceSchema = z.object({
    vouchId: vouchIdSchema,
    submittedCode: z.string().trim().min(4).max(12),
    method: confirmationMethodSchema.default("code_exchange"),
})
```

Rules:

```txt
no GPS schema
no system/manual override schema
no screenshot/evidence schema
no support-confirmation schema
```

---

### Payment Schemas

`schemas/payment.ts` validates:

```txt
Stripe Connect redirect action input
Stripe payment management redirect action input
provider return params
payment operation ids
idempotency keys
safe provider failure payloads
webhook normalization inputs
```

The current repo has broad payment schema coverage already, including setup, payout, provider returns, operations, webhook headers/envelopes, idempotency keys, and failure inputs.

Normalize naming away from internal settings/setup pages.

The actions remain:

```txt
startStripeConnectAction
startStripePaymentManagementAction
refreshProviderStateAction if needed internally
```

Not:

```txt
startSettingsPaymentAction
startSetupAction
```

---

### Webhook Schemas

`schemas/webhooks.ts` should validate normalized envelopes after signature verification.

```ts
export const providerWebhookEnvelopeSchema = z.object({
    provider: z.enum(["clerk", "stripe"]),
    providerEventId: z.string().trim().min(1),
    eventType: z.string().trim().min(1),
    safeMetadata: safeMetadataSchema.optional(),
})
```

Rules:

```txt
raw webhook verification happens before normalization
raw provider payloads are not stored as app DTOs
provider event ID is mandatory
```

---

## Zod Acceptance Criteria

Schemas are acceptable only when:

```txt
all action inputs have schemas
all route params have schemas
all search params have schemas
all provider return params have schemas
schemas derive enum values from constants
schemas align with TypeScript types
schemas reject removed lifecycle values
schemas reject GPS/manual/system confirmation methods
schemas do not include dispute/evidence/messaging fields
server-side validation remains authoritative
```

---

# 9. Database Selects

## Select Doctrine

Database selects define the allowed Prisma query shape for protected reads.

Selects must be:

```txt
minimal
explicit
DTO-oriented
transport-safe
role-aware when needed
```

Selects do not return raw Prisma models.

Selects do not perform authorization.

Selects do not mutate state.

Selects support fetchers and DTO mappers.

The connected repo already has `lib/db/selects/vouch.selects.ts`, `payment.selects.ts`, `confirmation.selects.ts`, `invitation.selects.ts`, `user.selects.ts`, and related selects. The Vouch select file currently exposes the older `payer/payee`, old status fields, and admin variants that need review against the narrowed product surface.

---

## Required Select Files

```txt
lib/db/selects/user.selects.ts
lib/db/selects/payment.selects.ts
lib/db/selects/vouch.selects.ts
lib/db/selects/confirmation.selects.ts
lib/db/selects/invitation.selects.ts
lib/db/selects/audit.selects.ts
lib/db/selects/webhook.selects.ts
```

Review before retention:

```txt
lib/db/selects/notification.selects.ts
lib/db/selects/analytics.selects.ts
lib/db/selects/admin.selects.ts
lib/db/selects/system.selects.ts
```

No `setup.selects.ts` is needed if setup/settings pages are removed, but readiness fields may still be selected through user/payment/connected-account selects.

---

### User Selects

User selects should expose:

```txt
id
clerkUserId
email
displayName
status
createdAt
updatedAt
```

Safe participant identity select:

```txt
id
displayName
```

Do not expose:

```txt
raw Clerk payload
private auth metadata
raw provider sync payload
sensitive identity verification details
```

---

### Payment Readiness Selects

Payment readiness select should expose:

```txt
user id
Stripe customer id safe reference
payment readiness
last sync timestamp
safe failure code/message
```

Payout readiness select should expose:

```txt
user id
Stripe connected account id safe reference
payout readiness
charges enabled
payouts enabled
details submitted
last sync timestamp
safe failure code/message
```

Do not expose:

```txt
raw card data
raw bank data
raw KYC data
full Stripe account object
full Stripe customer object
```

---

### Vouch Card Select

Dashboard card select should support:

```txt
id
publicId
merchantId
customerId
amount/pricing display values
currency
status
archiveStatus
appointmentStartsAt
confirmationOpensAt
confirmationExpiresAt
createdAt
updatedAt
participant summaries
payment summary
confirmation summary
next-action derivation inputs
```

It must not pull full audit logs, full webhook logs, raw provider payloads, or unnecessary notification data for dashboard cards.

Current repo note:

`vouch.selects.ts` currently pulls `notificationEvents` on detail and includes admin variants; those should be retained only if they support safe operational inspection and should not leak into participant DTOs.

---

### Vouch Detail Select

Vouch detail select should support the single canonical Vouch detail page.

Required data:

```txt
Vouch terms
role inputs
payment provider summary
confirmation status summary
checkout link safe reference
archive status
participant-safe timeline inputs
next-action inputs
```

Do not create separate selects for route-sprawl states such as separate confirm pages, dispute pages, or settings pages.

The detail page is the canonical Vouch surface.

---

### Confirmation Selects

Confirmation selects should expose:

```txt
vouchId
userId
participantRole
status
method
confirmedAt
serverReceivedAt
timeBucket
clockSkewAccepted
```

Eligibility selects should expose only what resolution logic needs:

```txt
participant ids
confirmation window timestamps
current confirmations
current lifecycle status
payment record id/status
```

The repo’s confirmation transaction already checks duplicate confirmation, window timing, and participant authorization; the select layer should support the same checks without overfetching.

---

### Invitation Selects

Invitation selects should support token lookup and Vouch resolution only.

Required:

```txt
id
vouchId
tokenHash
status
expiresAt
acceptedAt
declinedAt
```

Do not expose:

```txt
raw token
message body
thread id
chat state
```

Invitation is controlled access, not messaging.

---

### Webhook Selects

Webhook selects should support idempotency and safe operational inspection.

Required:

```txt
provider
providerEventId
eventType
status
processedAt
processingError
safeMetadata
```

Rules:

```txt
never select full provider payloads for app DTOs
dedupe by provider + providerEventId
late events reconcile only valid forward movement
```

---

## Select Acceptance Criteria

Selects are acceptable only when:

```txt
each protected read has a minimal select
selects do not expose raw Prisma models
selects do not expose raw provider payloads
dashboard card select is smaller than detail select
detail select supports the single Vouch detail page
admin/system selects are not used by participant pages
removed setup/settings routes do not drive select design
```

---

# 10. DTO Mappers

## DTO Mapper Doctrine

DTO mappers convert selected database rows into transport-safe objects.

Fetchers use:

```txt
select
-> DTO mapper
-> cache policy
-> transport-safe return
```

DTO mappers are the boundary between persistence shape and UI shape.

Components never receive raw Prisma records.

Components receive DTOs.

---

## Required Mapper Files

```txt
lib/dto/user.mappers.ts
lib/dto/payment.mappers.ts
lib/dto/vouch.mappers.ts
lib/dto/dashboard.mappers.ts
lib/dto/audit.mappers.ts
lib/dto/webhook.mappers.ts
```

Alternative allowed location:

```txt
lib/mappers/*
```

Pick one convention and use it everywhere.

---

### Mapper Rules

DTO mappers may:

```txt
format selected DB rows into DTOs
derive safe display status
derive next action labels
derive role-aware UI booleans
derive participant-safe timeline items
convert Dates to ISO strings
hide internal/provider fields
```

DTO mappers may not:

```txt
query Prisma
call Stripe
call Clerk
mutate data
authorize users
settle payments
write audit events
perform server actions
```

---

### Dashboard DTO Mapper

Input:

```txt
selected Vouch card rows
current user id
dashboard metrics source
```

Output:

```ts
export interface DashboardPageDTO {
    metrics: DashboardMetricsDTO
    vouches: DashboardVouchCardDTO[]
    emptyState: {
        title: string
        body: string
        actionLabel: string
        actionHref: string
    }
}
```

Dashboard card DTO:

```ts
export interface DashboardVouchCardDTO {
    id: string
    publicId: string
    amountLabel: string
    appointmentLabel: string
    confirmationWindowLabel: string
    statusLabel: string
    roleLabel: "Merchant" | "Customer"
    nextActionLabel: string
    href: string
    archiveStatus: "active" | "archived"
}
```

---

### Vouch Detail DTO Mapper

Input:

```txt
selected Vouch detail row
current user id
current server time
```

Output:

```ts
export interface VouchDetailDTO {
    id: string
    publicId: string
    status: VouchStatus
    statusLabel: string
    role: ParticipantRole
    amount: MoneyDisplayDTO
    appointment: VouchAppointmentDTO
    confirmation: VouchConfirmationDTO
    payment: VouchPaymentSummaryDTO
    actions: VouchActionDTO[]
    timeline: VouchTimelineItemDTO[]
    callout: PageCalloutDTO
}
```

Derived booleans:

```txt
canShareCheckoutLink
canConfirmPresence
canArchive
canOpenStripePayment
canOpenStripeConnect
```

Do not expose raw flags like:

```txt
canForceRelease
canManualRefund
canOpenDispute
canUploadEvidence
```

Those should not exist.

---

### Payment DTO Mapper

Payment DTOs expose safe provider status only:

```ts
export interface VouchPaymentSummaryDTO {
    provider: "stripe"
    safeProviderStatus: string
    paymentStatus: PaymentStatus
    settlementStatus: SettlementStatus
    checkoutUrl?: string
    paymentIntentReference?: string
    captureBefore?: string
    consequenceText: string
}
```

Rules:

```txt
show safe provider references only
do not expose full Stripe IDs if not needed
do not expose raw Stripe objects
do not expose card/bank/KYC data
```

---

### Confirmation DTO Mapper

Confirmation DTO:

```ts
export interface VouchConfirmationDTO {
    aggregateStatus: AggregateConfirmationStatus
    merchantConfirmed: boolean
    customerConfirmed: boolean
    windowState: "before_window" | "open" | "closed"
    confirmationOpensAt: string
    confirmationExpiresAt: string
    canCurrentUserConfirm: boolean
    consequenceText: string
}
```

Window state is derived.

Do not persist `before_window/open/closed` as separate confirmation truth.

---

### Audit DTO Mapper

Audit mapper creates participant-safe timeline items:

```ts
export interface VouchTimelineItemDTO {
    id: string
    label: string
    body: string
    occurredAt: string
    participantSafe: boolean
}
```

Rules:

```txt
participant pages only receive participantSafe audit items
internal provider errors are summarized safely
no raw metadata unless explicitly safe
no admin/system-only data in participant DTOs
```

---

## DTO Mapper Acceptance Criteria

DTO mappers are acceptable only when:

```txt
all Date values become ISO strings
all money values have cents and display label
all provider state is safe
all UI booleans are derived server-side
components receive DTOs only
no mapper queries the database
no mapper mutates state
no mapper leaks raw provider objects
```

---

# 11. Database Transactions

## Transaction Doctrine

Database transactions are atomic write primitives.

They are not application write entry points.

All application writes go through:

```txt
lib/actions/*
```

Actions import transaction helpers.

Correct chain:

```txt
server action
-> authenticate
-> authorize
-> Zod validate
-> provider integration if needed
-> database transaction helper
-> audit event
-> revalidate/redirect/result
```

The connected repo already has transaction files for Vouch, confirmation, invitation, setup, verification, and system operations, but Vouch transactions currently use old status transitions like `pending`, `active`, `refunded`, `canceled`, and `failed`.

---

## Required Transaction Files

```txt
lib/db/transactions/vouchTransactions.ts
lib/db/transactions/paymentTransactions.ts
lib/db/transactions/confirmationTransactions.ts
lib/db/transactions/invitationTransactions.ts
lib/db/transactions/userTransactions.ts
lib/db/transactions/webhookTransactions.ts
lib/db/transactions/auditTransactions.ts
lib/db/transactions/systemTransactions.ts
```

Current repo note:

```txt
paymentTransactions.ts is missing in the inspected repo inventory.
```

The uploaded master-plan inventory also flags the missing dedicated payment transaction file.

---

### Vouch Transactions

Required transaction helpers:

```txt
createDraftVouchTx
commitVouchTx
markVouchSentTx
bindCustomerAndMarkAcceptedTx
markVouchAuthorizedTx
markVouchConfirmableTx
markVouchCompletedTx
markVouchExpiredTx
archiveVouchTx
restoreVouchFromRecoverySnapshotTx
```

Rules:

```txt
draft is mutable
committed and later are immutable
completed and expired are terminal
no backward transitions
no manual cancel after commit
no manual refund decision
```

Replace old transaction helpers that encode removed lifecycle states:

```txt
cancelPendingVouchTx
markVouchRefundedTx
markVouchCanceledTx
markVouchFailedTx
expireVouchWithRefundTx
```

Provider refund/failure belongs in payment/settlement transactions, not canonical Vouch lifecycle state.

The current repo has these old helpers today.

---

### Payment Transactions

Required file:

```txt
lib/db/transactions/paymentTransactions.ts
```

Required helpers:

```txt
createPaymentRecordTx
attachCheckoutSessionTx
markPaymentAuthorizedTx
persistCaptureBeforeTx
markCapturePendingTx
markPaymentCapturedTx
markPaymentCanceledTx
markPaymentExpiredTx
markPaymentFailedTx
markSettlementNonCapturedTx
markSettlementProviderBlockedTx
createRefundRecordTx
markRefundPendingTx
markRefundSucceededTx
markRefundFailedTx
```

Rules:

```txt
payment state mirrors Stripe
settlement state records Vouch money-movement result
retrieve Stripe before settlement in actions/integrations
transaction persists verified provider-backed result
```

---

### Confirmation Transactions

Required helpers:

```txt
assertNoDuplicateConfirmationTx
createPresenceConfirmationTx
createOfflinePresenceConfirmationTx
getAggregateConfirmationStatusTx
lockBilateralConfirmationTx
```

Rules:

```txt
one confirmation per Vouch per participant role
one confirmation per Vouch per user
confirmation must be inside the confirmation window
offline payload must prove valid time bucket
duplicate confirmation rejected transactionally
```

The current repo already implements duplicate checks, participant authorization, and confirmation-window checks in `confirmationTransactions.ts`; it needs to swap role/method naming to merchant/customer and code-exchange semantics.

---

### Webhook Transactions

Required helpers:

```txt
recordProviderWebhookReceivedTx
claimProviderWebhookEventTx
markProviderWebhookProcessedTx
markProviderWebhookIgnoredTx
markProviderWebhookFailedTx
recordStripePaymentWebhookProjectionTx
recordClerkUserSyncProjectionTx
```

Rules:

```txt
provider + providerEventId unique
duplicate event acknowledged without transition
late event compared against current state
only valid forward movement is applied
```

Webhook transactions do not decide business meaning alone.

They support action/integration-owned reconciliation.

---

### Audit Transactions

Required helpers:

```txt
writeAuditEventTx
writeParticipantSafeAuditEventTx
writeProviderAuditEventTx
writeSystemAuditEventTx
```

Audit writes must be part of the same transaction as critical state changes when possible.

Rules:

```txt
no duplicate audit transition for duplicate webhook
audit is append-only
metadata is safe and minimal
participantSafe controls user timeline exposure
```

---

### System Transactions

The current repo has `systemTransactions.ts`, but it writes system audit using `entityType: "User"` and `entityId: "system"` for provider/system errors; that should be normalized to a real system or operational entity shape if the Prisma schema supports it.

Required helpers:

```txt
recordOperationalErrorTx
recordServerActionFailureTx
recordProviderUnavailableTx
recordRecoveryRequiredTx
recordRecoveryCompletedTx
recordRecoveryFailedTx
```

Rules:

```txt
system transactions are internal-only
no user-facing dispute state
no manual settlement operation
no admin payout decision
```

---

## Transaction Acceptance Criteria

Transactions are acceptable only when:

```txt
all app writes are called through server actions
transactions are atomic
critical transitions write audit events
Vouch lifecycle transitions use canonical states
payment/provider transitions stay out of VouchStatus
duplicate confirmation is impossible
duplicate webhook processing is impossible
provider retries are idempotent
no transaction implements force release/manual award/manual dispute outcome
```

---

# 12. Audit Events

## Audit Doctrine

Audit events record the deterministic story of the system.

Audit is not dispute resolution.

Audit is not evidence review.

Audit is not a place for subjective claims.

Audit records:

```txt
who/what triggered a transition
what entity changed
what deterministic event occurred
when it occurred
safe metadata needed for replay or inspection
```

The connected repo already has a broad audit event type union in `types/audit.ts`; it needs cleanup so lifecycle events match the canonical state model and admin events remain inspection/retry only.

---

## Audit Actor Types

Canonical actor types:

```ts
export const AUDIT_ACTOR_TYPE_VALUES = [
    "user",
    "system",
    "stripe",
    "clerk",
] as const
```

Optional internal-only actor:

```txt
admin
```

Only if admin remains limited to:

```txt
safe inspection
safe retry
operational troubleshooting
```

Admin must not arbitrate outcomes.

---

## Audit Entity Types

Canonical entity types:

```ts
export const AUDIT_ENTITY_TYPE_VALUES = [
    "User",
    "PaymentCustomer",
    "ConnectedAccount",
    "TermsAcceptance",
    "Vouch",
    "Invitation",
    "PresenceConfirmation",
    "PaymentRecord",
    "RefundRecord",
    "ProviderWebhookEvent",
    "RecoverySnapshot",
] as const
```

Remove or avoid entity types that imply:

```txt
Dispute
Claim
Appeal
Evidence
MessageThread
Review
Rating
MarketplaceProvider
ServiceListing
```

---

## User Audit Events

```txt
user.created
user.disabled
user.terms.accepted
user.payment_customer.created
user.payment_readiness.updated
user.connected_account.created
user.payout_readiness.updated
```

Do not audit normal page views unless needed for internal security.

Avoid noisy audit events like routine dashboard views.

---

## Vouch Lifecycle Audit Events

```txt
vouch.draft_created
vouch.committed
vouch.sent
vouch.accepted
vouch.authorized
vouch.confirmable
vouch.completed
vouch.expired
vouch.archived
```

Rules:

```txt
one lifecycle transition = one audit event
no duplicate transition audit from duplicate webhook
no backward transition audit
no manual outcome audit
```

Replace older audit events tied to removed states:

```txt
vouch.canceled
vouch.refunded
vouch.failed
```

Those should become payment/settlement/provider events when applicable.

The repo currently includes `vouch.canceled`, `vouch.refunded`, and `vouch.failed`; these should be normalized.

---

## Confirmation Audit Events

```txt
confirmation.code.generated
confirmation.merchant_submitted
confirmation.customer_submitted
confirmation.merchant_confirmed
confirmation.customer_confirmed
confirmation.both_confirmed
confirmation.rejected_duplicate
confirmation.rejected_before_window
confirmation.rejected_after_window
confirmation.rejected_invalid_code
confirmation.offline_payload_synced
confirmation.offline_payload_rejected
```

Rules:

```txt
code generation alone does not change settlement truth
participant confirmation is recorded once
both_confirmed is the only confirmation aggregate that can trigger settlement evaluation
```

---

## Payment Audit Events

```txt
payment.checkout_created
payment.authorization_started
payment.authorized
payment.authorization_failed
payment.authorization_expired
payment.capture_requested
payment.capture_succeeded
payment.capture_failed
payment.cancel_requested
payment.canceled
payment.non_captured
payment.refund_requested
payment.refund_succeeded
payment.refund_failed
payment.provider_restricted
```

Rules:

```txt
Stripe owns provider payment truth
Vouch records provider-backed transitions
capture/refund/cancel retries are idempotent
```

---

## Webhook Audit Events

```txt
webhook.received
webhook.processed
webhook.ignored_duplicate
webhook.ignored_stale
webhook.failed
webhook.reconciled_forward
```

Rules:

```txt
provider event ID recorded once
duplicates do not rerun transitions
late events apply only valid forward movement
```

Current repo audit names include payment webhook received/processed/ignored events; these can be retained but should be generalized or aligned with provider webhook naming.

---

## Recovery Audit Events

```txt
recovery.required
recovery.snapshot_restored
recovery.completed
recovery.failed
```

Rules:

```txt
technical recovery only
snapshot restores original committed terms
no term rewrite
no manual award
no arbitration
```

---

## Audit Metadata Rules

Allowed metadata:

```txt
safe provider reference
previous status
next status
request id
idempotency key hash
reason code
safe failure code
safe message
```

Forbidden metadata:

```txt
raw Stripe object
raw Clerk payload
raw identity document data
raw bank/card data
message content
evidence text
screenshots
subjective user accusations
support judgment
```

---

## Participant-Safe Audit Timeline

Participant-facing audit timeline may show:

```txt
Vouch committed
Payment link sent
Payment authorized
Confirmation window opened
Merchant confirmed
Customer confirmed
Both confirmed
Capture requested
Completed
Expired
Archived
```

Participant-facing audit timeline must not show:

```txt
raw provider payloads
internal stack traces
secret metadata
webhook signatures
internal retry internals
admin-only notes
```

---

## Audit Acceptance Criteria

Audit events are acceptable only when:

```txt
every important transition writes exactly one audit event
duplicate webhook does not duplicate audit
late webhook does not rewrite audit history
audit event names match canonical lifecycle
payment/provider events are separate from Vouch lifecycle events
participantSafe controls user-visible timeline exposure
metadata is safe and minimal
no audit event implies dispute, evidence, appeal, or manual settlement
```

---

# 13. Stripe Integration

## Stripe Integration Doctrine

Stripe is Vouch’s provider rail.

Stripe is not Vouch’s product surface.

Stripe handles payment authorization, payment method collection, manual-capture PaymentIntents, application fee processing, Connect onboarding, payout capability, payout execution, provider payment state, and provider settlement state.

Vouch handles workflow state, participant roles, appointment metadata, confirmation windows, bilateral confirmation truth, settlement eligibility, capture orchestration, provider reconciliation, archive state, recovery state, and audit history.

Stripe can confirm payment facts.

Stripe cannot decide Vouch business meaning.

Vouch can determine workflow eligibility.

Vouch cannot invent provider truth.

The Stripe integration exists to translate deterministic Vouch state into provider-safe Stripe operations.

The integration must never introduce:

```txt
marketplace discovery
provider listings
service categories
public profiles
ratings
reviews
messaging
disputes
claims
appeals
evidence
manual fund awards
manual confirmation rewrites
force release controls
support-driven settlement decisions
```

---

## Stripe Workbench Blueprint Status

Stripe Workbench blueprints are API-shape references only.

They are not Vouch architecture.

They are not route design.

They are not product language.

They are not permission models.

They are not source-of-truth workflow rules.

Workbench blueprints may be used to confirm:

```txt
available Stripe endpoints
required Stripe parameters
provider object relationships
Connect onboarding mechanics
PaymentIntent destination charge parameters
Checkout Session payment_intent_data shape
webhook event names
```

Workbench blueprints must not be copied directly into Vouch as:

```txt
chapter names
step names
demo routes
demo products
demo descriptions
demo file structures
marketplace language
immediate-confirm charge behavior
direct charge defaults
invoice payment flows
```

Vouch names functions, files, schemas, and actions after domain operations.

Correct examples:

```txt
createConnectedAccount
createConnectedAccountOnboardingLink
createVouchPaymentIntent
createVouchCheckoutSession
captureConfirmedVouchPayment
cancelUnconfirmedVouchPayment
refundCapturedVouchPayment
recordStripeWebhookEvent
mapStripePaymentIntentStatus
mapStripeConnectedAccountReadiness
```

Forbidden examples:

```txt
chapter1
step2
create-account-chapter
createCharge
paymentIntentRequest
create-direct-charge
create-destination-obo-charge
learn-accounts-v2-marketplace
```

---

### Canonical Stripe Architecture Surface

All Stripe SDK calls must live under:

```txt
lib/integrations/stripe/*
```

Required Stripe integration modules:

```txt
lib/integrations/stripe/client.ts
lib/integrations/stripe/config.ts
lib/integrations/stripe/connect.ts
lib/integrations/stripe/checkout.ts
lib/integrations/stripe/payment-intents.ts
lib/integrations/stripe/refunds.ts
lib/integrations/stripe/status-map.ts
lib/integrations/stripe/webhook-events.ts
```

Server action orchestration lives under:

```txt
lib/actions/paymentActions.ts
lib/actions/vouchActions.ts
```

Database writes live under:

```txt
lib/db/transactions/setupTransactions.ts
lib/db/transactions/vouchTransactions.ts
lib/db/transactions/confirmationTransactions.ts
lib/db/transactions/systemTransactions.ts
```

Protected reads live under:

```txt
lib/fetchers/paymentFetchers.ts
lib/fetchers/setupFetchers.ts
lib/fetchers/vouchFetchers.ts
```

Schemas live under:

```txt
schemas/payment.ts
schemas/vouch.ts
schemas/setup.ts
```

DTOs live under:

```txt
types/payment.ts
types/vouch.ts
types/setup.ts
types/webhooks.ts
types/action-result.ts
```

App route handlers are allowed only for external provider boundaries:

```txt
app/api/stripe/webhooks/route.ts
```

App route handlers must not contain Stripe business logic.

App pages must not call Stripe SDKs.

Client components must not call Stripe SDKs.

Internal app mutations must not route through `/api/*`.

---

### Stripe Client Rule

The Stripe client must be initialized in:

```txt
lib/integrations/stripe/client.ts
```

The Stripe client must use:

```txt
STRIPE_SECRET_KEY
```

The publishable key must use:

```txt
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY
```

Webhook verification must use:

```txt
STRIPE_WEBHOOK_SECRET
```

Environment variables must be placeholders in documentation and examples.

Do not hard-code Stripe keys.

Do not paste live keys into source files.

Do not infer or pin a Stripe API version unless the project intentionally locks one through configuration.

If the Stripe blueprint does not specify an API version, Vouch does not invent one inside implementation instructions.

---

## Accounts v2 and Connect Onboarding

Stripe connected accounts represent users who may receive funds.

In Vouch language, this is payee payout readiness.

A connected account does not create a marketplace profile.

A connected account does not create provider discovery.

A connected account does not create public merchant identity inside Vouch.

A connected account only proves that Stripe can collect required information and determine payout capability for the account.

---

### Connected Account Creation

Connected account creation belongs in:

```txt
lib/integrations/stripe/connect.ts
```

The user-triggered action belongs in:

```txt
lib/actions/paymentActions.ts
```

The local persistence belongs in:

```txt
lib/db/transactions/setupTransactions.ts
```

The canonical integration function is:

```txt
createConnectedAccount
```

The canonical action is:

```txt
createStripeConnectedAccountAction
```

Accounts v2 blueprint parameters may be translated into Vouch as follows:

```txt
display_name -> user/account display name used only for Stripe onboarding
contact_email -> authenticated user's verified email or account email
identity.country -> supported connected account country
identity.business_details.phone -> optional provider-collected or user-provided phone when required
dashboard -> configured Stripe-hosted dashboard access mode
defaults.responsibilities.losses_collector -> configured responsibility model
defaults.responsibilities.fees_collector -> configured responsibility model
configuration.merchant -> enabled only if required for destination-charge/on_behalf_of flow
configuration.recipient -> enabled when payout/transfer recipient capability is required
include -> provider response expansion only, not raw payload persistence
```

Vouch stores only safe provider references and normalized readiness state.

Persist:

```txt
user id
stripe connected account id
dashboard/access mode
merchant configuration status
recipient configuration status
payout readiness status
capability status
restriction status
last provider sync timestamp
safe provider status summary
```

Do not store:

```txt
raw KYC documents
raw bank account data
raw identity payloads
full Stripe account objects
full provider response bodies
sensitive beneficial owner data
```

---

#### Account Onboarding Links

Stripe-hosted onboarding or update links are provider flows.

They are not Vouch settings pages.

The canonical integration functions are:

```txt
createConnectedAccountOnboardingLink
createConnectedAccountUpdateLink
```

The canonical actions are:

```txt
startPayoutSetupAction
refreshPayoutReadinessAction
```

The Account Link flow must:

```txt
authenticate user
authorize account ownership
load existing connected account reference
create a Stripe-hosted account onboarding or update link
return redirect/action result
write audit event when appropriate
revalidate setup/payment surfaces
```

The Account Link must use Vouch-controlled return and refresh URLs.

Return URLs are not readiness truth.

Refresh URLs must regenerate a safe provider link only after authentication and ownership checks.

After a return from Stripe-hosted onboarding, Vouch must retrieve current Stripe account state before marking payout readiness.

Browser return state is not authoritative.

---

### Payer and Payee Readiness

Vouch has two separate Stripe readiness tracks.

They must never be collapsed.

---

#### Payer Readiness

Payer readiness means the user can authorize payment.

Required before authorizing payment participation:

```txt
authenticated user
active Vouch account
accepted account terms
accepted per-Vouch transaction disclaimer
Stripe customer/payment method readiness
billing readiness if required by Stripe
identity/adult readiness if required by setup gate
provider-backed readiness state persisted locally
```

Payer readiness is not payout readiness.

Payer readiness does not mean the user can receive funds.

---

#### Payee Readiness

Payee readiness means the user can receive funds.

Required before creating or becoming bound as payee when payout capability is required:

```txt
authenticated user
active Vouch account
accepted account terms
accepted per-Vouch transaction disclaimer where applicable
Stripe connected account exists
Stripe onboarding is complete enough for the flow
required merchant/recipient configuration is active or sufficient
payout or transfer capability is active or sufficient
identity/compliance readiness required by Stripe
provider-backed readiness state persisted locally
```

Payee readiness is not payer readiness.

Payee readiness does not mean a Vouch is settlement-eligible.

---

#### Checkout Session Role

Stripe Checkout is the hosted payment authorization surface.

Vouch uses Checkout to avoid collecting raw card details and to keep payment method collection inside Stripe.

Checkout may create or confirm the underlying PaymentIntent according to Stripe state.

Vouch does not treat a Checkout browser redirect as payment truth.

Vouch does not finalize authorization based on:

```txt
success_url visit
cancel_url visit
query params
client-side status
local optimistic state
```

Vouch finalizes local payment state only from:

```txt
Stripe webhook reconciliation
explicit retrieve of current PaymentIntent state
provider-backed reconciliation action
```

The canonical integration function is:

```txt
createVouchCheckoutSession
```

The Checkout Session must be bound to:

```txt
Vouch id or precommit reference
payer user id if known
payee user id
connected account id
customer total cents
application fee amount cents
confirmation window
appointment timestamp
settlement rule version
recovery snapshot id
```

Metadata must be safe.

Metadata must not contain sensitive personal, legal, medical, meeting-purpose, or dispute-style content.

---

## PaymentIntent Model

Each committed Vouch maps to one provider-backed payment authorization object.

The canonical Stripe object is a manual-capture PaymentIntent.

The PaymentIntent is the provider-side lifecycle object for the customer’s payment authorization.

The Vouch is the workflow-side lifecycle object for the commitment.

They are not the same thing.

---

### PaymentIntent Creation

PaymentIntent creation belongs in:

```txt
lib/integrations/stripe/payment-intents.ts
```

The canonical function is:

```txt
createVouchPaymentIntent
```

Core creation parameters:

```txt
amount = customer total amount in cents
currency = normalized supported currency
capture_method = manual
application_fee_amount = Vouch fee amount in cents
transfer_data.destination = payee connected account id when using destination charge flow
on_behalf_of = payee connected account id when required by Connect settlement configuration
metadata = safe Vouch references only
```

PaymentIntent creation must use a durable idempotency key.

The idempotency key must be derived from the Vouch commit operation, not from client state.

PaymentIntent creation must not use:

```txt
confirm: true
```

unless the flow explicitly intends to confirm immediately through a server-owned provider flow and the resulting state machine still preserves manual capture.

For the canonical Vouch Checkout flow, confirmation is normally delegated to Stripe Checkout.

---

### PaymentIntent Persistence

Persist normalized provider fields.

Required local fields:

```txt
stripePaymentIntentId
stripeCheckoutSessionId
stripeCustomerId
stripeConnectedAccountId
customerTotalCents
vouchAmountCents
applicationFeeAmountCents
payeeReceivableAmountCents
currency
captureMethod
providerPaymentStatus
providerCaptureStatus
providerCancellationStatus
providerRefundStatus
providerAuthorizationDeadline
lastProviderSyncAt
lastProviderEventId
```

Do not persist full Stripe objects.

Do not persist raw provider payloads beyond minimal redacted event diagnostics.

---

## Destination Charge Model

Vouch’s default Connect settlement model is platform-orchestrated destination charge behavior.

The platform creates the payment flow.

The connected account receives the provider-routed proceeds when capture succeeds.

The platform receives the application fee according to the configured Stripe parameters.

This model supports Vouch because:

```txt
Vouch controls protocol execution
Stripe controls payment authorization/capture
Stripe Connect controls payout eligibility
the connected account receives settlement through provider rails
provider state remains retrievable by the platform
application fee is explicit and provider-backed
```

The Workbench destination/on_behalf_of blueprint is directionally relevant.

It must be adapted for Vouch by adding:

```txt
manual capture
Checkout-hosted authorization where applicable
Vouch metadata binding
immutable fee snapshot
provider retrieve-before-settlement
idempotent capture/cancel/refund
webhook reconciliation
deterministic non-capture rules
```

The Workbench immediate `confirm: true` direct PaymentIntent behavior is not the canonical Vouch flow.

Vouch must not immediately capture or settle at payment authorization.

Authorization creates consequence.

Confirmation determines settlement eligibility.

Capture executes only after bilateral confirmation and provider-state validation.

---

### Direct Charge Blueprint Rejection

The direct charge blueprint is not canonical for Vouch.

Direct charges made on the connected account through the `Stripe-Account` header can be useful in other Connect products, but they are not Vouch’s default settlement primitive.

Direct charge flow is rejected as the core Vouch model because it weakens the platform-controlled protocol boundary and does not match the source-of-truth settlement model.

Vouch should not create connected-account direct charges for Vouches unless a future contract explicitly changes the payment architecture.

Any future direct-charge exception must prove:

```txt
manual capture remains supported
provider state remains retrievable for settlement resolution
application fee collection remains explicit
Vouch can still enforce retrieve-before-settlement
webhook reconciliation remains idempotent
no discretionary payment controls are introduced
no marketplace framing is introduced
```

Until then, direct charges are non-canonical.

---

### Invoice Blueprint Rejection

The hosted invoice blueprint is not part of the canonical Vouch commitment flow.

Invoices represent a pay-later billing workflow.

Vouch represents a commitment-backed authorization-first workflow.

Invoice flows are rejected for Vouch creation because they introduce:

```txt
invoice terms
days-until-due semantics
hosted invoice lifecycle
collection behavior outside confirmation protocol
billing language that weakens the commitment model
```

Vouch uses authorization-first PaymentIntent behavior.

Vouch does not use invoice payment as the settlement gate.

---

### Product and Price Blueprint Rejection

One-time Checkout product/price blueprints are not canonical for individual Vouches.

A Vouch is not a catalog product.

A Vouch is not a reusable SKU.

A Vouch is not a marketplace listing.

Each committed Vouch has its own immutable transaction terms:

```txt
amount
fee snapshot
appointment time
confirmation window
participants
provider references
settlement rule version
recovery snapshot
```

Stripe Products and Prices may exist for platform subscription billing or non-Vouch SaaS billing only if future contracts introduce that surface.

They must not represent individual Vouches.

---

## Fee Model

Fee calculation belongs only in:

```txt
lib/vouch/fees.ts
```

Canonical fee rule:

```txt
Vouch fee = max(5% of customer total, 500 cents)
```

Persist the fee snapshot at commit time.

The fee snapshot must include:

```txt
vouch amount cents
customer total cents
application fee amount cents
payee receivable amount cents
currency
fee rule version
created timestamp
```

The fee snapshot is immutable.

Do not recalculate historical Vouch fees from current pricing rules.

Do not allow client-provided fee totals to become authoritative.

The server calculates all fee values.

The database persists the resulting snapshot.

Stripe receives the provider-safe amount fields.

---

## Settlement Execution

Settlement execution means translating confirmed Vouch workflow truth into a Stripe provider operation.

Settlement execution is authorized only when:

```txt
both participants confirmed inside the confirmation window
confirmation roles are valid
confirmation payloads are valid
confirmation state has locked
PaymentIntent exists
PaymentIntent is currently capturable
provider state permits capture
```

Before capture, Vouch must retrieve the current Stripe PaymentIntent.

Vouch must compare:

```txt
current Vouch lifecycle state
current confirmation truth
current local payment record
current Stripe PaymentIntent state
authorization deadline
capturable amount
previous capture/cancel/refund attempts
terminal provider state
```

If provider state permits capture, Vouch captures with a durable idempotency key.

If provider state does not permit capture, Vouch records a provider-backed failure or recovery state.

Vouch must never capture based only on local database status.

Vouch must never capture based on UI state.

Vouch must never capture based on a browser return URL.

Vouch must never capture because one party confirmed.

Vouch must never capture because support believes someone attended.

---

### Non-Capture, Cancellation, Void, and Refund

Anything other than successful bilateral confirmation inside the valid window resolves away from capture.

Examples:

```txt
neither participant confirms
only payer confirms
only payee confirms
confirmation happens too early
confirmation happens too late
confirmation validation fails
authorization expires
provider invalidates capturability
payment fails
connected account becomes restricted before settlement
```

Vouch must retrieve current Stripe state before deciding the provider operation.

Provider operation selection:

```txt
requires_payment_method -> mark payment failed or incomplete
requires_capture -> cancel/void if settlement is not eligible
processing -> mark reconciliation pending
succeeded/captured -> refund only if reversal is contractually required
canceled -> persist non-capture/canceled state
payment_failed -> persist failed payment state
unknown/conflicting -> recovery required or reconciliation pending
```

Non-capture is preferred over refund whenever possible.

Refund is a fallback for already-captured funds.

Refund is not a discretionary remedy.

Refund is not a dispute outcome.

Refund is a provider operation chosen by deterministic state.

---

### Capture Failure

If bilateral confirmation succeeds but capture fails:

```txt
retrieve current PaymentIntent
classify provider failure
persist provider-backed failure state
write audit event
mark release failed or recovery required
expose safe user-facing failure state
schedule or allow safe operational retry only if provider state permits
```

Capture failure must not create:

```txt
manual payout
alternate payment rail
manual award
admin settlement decision
confirmation rewrite
support override
appeal path
evidence upload
```

If provider state later becomes capturable, retry may proceed through deterministic provider retry logic with an idempotency key.

If provider state becomes terminal or uncapturable, Vouch records the provider-backed terminal outcome.

---

### Connected Account Restriction

Stripe connected account state controls payout capability.

If Stripe restricts the connected account:

```txt
Vouch records payout restriction
Vouch blocks new payee-bound flows where required
Vouch prevents settlement operations that provider state does not permit
Vouch exposes safe payout-restricted UI
Vouch writes audit events
```

A connected account restriction does not allow:

```txt
manual payout
off-platform payout
alternate rail payout
replacement payee account
force release
support override
```

Stripe capability state is the source of truth for payout readiness.

Vouch readiness state mirrors Stripe capability state.

---

## Webhook Handling

Stripe webhook route:

```txt
app/api/stripe/webhooks/route.ts
```

Route handler responsibilities:

```txt
read raw request body
verify Stripe signature
construct Stripe event
delegate classification and processing
return provider-compatible response
```

Route handler must not:

```txt
perform inline Prisma mutations
perform inline settlement decisions
perform inline DTO shaping
perform business workflow logic
call UI revalidation directly without action/module boundary
```

Webhook classification belongs in:

```txt
lib/integrations/stripe/webhook-events.ts
```

Webhook persistence belongs in:

```txt
lib/db/transactions/systemTransactions.ts
```

Webhook orchestration belongs in:

```txt
lib/actions/paymentActions.ts
```

Minimum events:

```txt
account.updated
setup_intent.succeeded
setup_intent.setup_failed
checkout.session.completed
checkout.session.expired
payment_intent.requires_capture
payment_intent.succeeded
payment_intent.canceled
payment_intent.payment_failed
refund.created
refund.updated
charge.refunded
```

Webhook processing rules:

```txt
verify signature
extract provider event id
dedupe by provider event id
classify event
load current local workflow/payment state
retrieve current provider state when needed
apply only valid forward movement
persist normalized provider state
write audit event if state changed
acknowledge duplicate events without mutation
mark stale conflicting events acknowledged without lifecycle mutation
```

Webhook events can update payment/provider state.

Webhook events cannot decide confirmation truth.

Webhook events cannot decide who is right.

Webhook events cannot force payout.

Webhook events cannot reopen terminal Vouches.

Webhook events cannot overwrite confirmation records.

---

### Idempotency

Idempotency is mandatory for every provider operation that can create, mutate, or retry money movement.

Durable idempotency keys are required for:

```txt
connected account creation
account onboarding link creation where retry-sensitive
Checkout Session creation
PaymentIntent creation
PaymentIntent capture
PaymentIntent cancellation
refund creation
provider retry attempts
webhook event persistence
audit transition writes
confirmation writes
resolution job attempts
```

Idempotency keys must be server-generated.

Idempotency keys must be stable across safe retries.

Idempotency keys must not be derived from client timestamps alone.

Idempotency keys must not contain sensitive user data.

---

### Provider Status Mapping

Stripe provider statuses must map into Vouch payment and settlement sub-states.

Provider status does not directly equal Vouch lifecycle status.

Vouch lifecycle remains:

```txt
Draft
Committed
Sent
Accepted
Authorized
Confirmable
Completed
Expired
```

Payment/provider state may include:

```txt
not_started
checkout_created
requires_payment_method
requires_confirmation
requires_action
processing
requires_capture
authorized
capture_processing
captured
canceled
expired
failed
refunded
refund_pending
refund_failed
provider_blocked
reconciliation_pending
recovery_required
```

Rules:

```txt
requires_capture -> payment authorized / capturable
succeeded after capture -> captured / completed if workflow truth is satisfied
canceled -> non-captured / expired or canceled according to workflow state
payment_failed -> payment failed
refund.created -> refund pending
refund.updated or charge.refunded -> refunded or refund failed depending provider state
account restricted -> payout blocked / provider restricted
unknown provider state -> reconciliation pending or recovery required
```

Never collapse provider status and Vouch lifecycle into one enum.

---

### Stripe Metadata Rules

Stripe metadata must contain only safe internal references.

Allowed metadata:

```txt
vouchId
paymentRecordId
payerUserId
payeeUserId
settlementRuleVersion
feeRuleVersion
confirmationWindowStart
confirmationWindowEnd
recoverySnapshotId
environment
```

Avoid metadata that exposes:

```txt
meeting purpose
private notes
message content
legal conclusions
identity document details
raw location data
user allegations
dispute language
sensitive personal context
```

Metadata exists for reconciliation.

Metadata is not a user-facing record.

Metadata is not evidence.

---

### Provider Data Storage Rules

Vouch stores normalized provider state, not raw provider payloads.

Allowed storage:

```txt
provider object id
provider event id
provider status
provider capability summary
provider restriction summary
provider amount fields
provider currency
provider timestamps
redacted diagnostics
last sync timestamp
```

Forbidden storage:

```txt
raw card data
raw bank account data
raw identity documents
full Stripe payloads
sensitive KYC data
full billing details beyond what Vouch needs
unredacted webhook bodies
```

Provider event storage must be sufficient for idempotency, reconciliation, audit, and safe debugging.

It must not become a shadow copy of Stripe.

---

### Recovery and Reconciliation

Stripe integration failures produce operational states, not discretionary outcome states.

Recovery states include:

```txt
reconciliation_pending
recovery_required
provider_blocked
capture_failed
refund_failed
payout_blocked
webhook_stale
```

Recovery may:

```txt
retrieve provider state
retry idempotent provider operations
repair local provider mirror state
write audit events
surface safe status to the user
```

Recovery may not:

```txt
change Vouch terms
change participants
change confirmation timestamps
delete confirmations
rewrite settlement eligibility
manually award funds
manually refund outside provider rules
invent alternate payment rails
```

The recovery system restores provider/workflow consistency.

It does not adjudicate outcomes.

---

## Stripe Integration Acceptance Criteria

Stripe integration is correct only when:

```txt
Stripe SDK calls are isolated under lib/integrations/stripe/*
no app page calls Stripe
no component calls Stripe
no internal mutation uses app/api/*
app/api/stripe/webhooks/route.ts is the only Stripe route handler
connected account setup gates payee payout readiness
payer payment readiness and payee payout readiness are separate
manual-capture PaymentIntents are used for Vouches
Checkout return URLs are not payment truth
PaymentIntent requires_capture maps to authorized/capturable payment state
destination charge parameters are used only through canonical integration modules
application fees are provider-backed and snapshot-backed
current PaymentIntent state is retrieved before capture/cancel/refund
capture is idempotent
cancel/void is idempotent
refund is idempotent
webhook processing is signature-verified
webhook event IDs are deduped
late webhooks reconcile only valid forward movement
provider status does not overwrite Vouch workflow truth
Vouch lifecycle and payment/provider sub-states remain separate
no direct-charge blueprint is used as canonical Vouch flow
no invoice blueprint is used as canonical Vouch flow
no product/price blueprint represents individual Vouches
no marketplace framing enters code, routes, UI, docs, or tests
no dispute/evidence/manual award surface exists
tests cover payment creation, status mapping, webhook dedupe, retrieve-before-settlement, idempotent capture, idempotent cancellation, refund fallback, account readiness, and forbidden surfaces
```

---

# 14. Clerk Integration

## Clerk Integration Doctrine

Clerk is Vouch’s authentication and session provider.

Clerk is not Vouch’s domain authority.

Clerk handles:

```txt
user authentication
sign-in
sign-up
session creation
session renewal
session security controls
account portal account management
email/phone verification when configured
multi-factor authentication when configured
auth provider lifecycle events
```

Vouch handles:

```txt
local user record
Vouch account status
terms acceptance
per-Vouch disclaimer acceptance
role-aware authorization
readiness gating
participant permissions
workflow access
audit state
provider sync state
```

Clerk confirms who the user is for application access.

Clerk does not decide:

```txt
whether a user may create a Vouch
whether a user may accept a Vouch
whether a user may confirm presence
whether a Vouch is settlement-eligible
whether funds release
whether funds refund, void, or non-capture
```

Those decisions belong to Vouch state, Stripe state, readiness state, and deterministic workflow rules.

---

## Clerk Boundary Rule

Clerk owns authentication truth.

Vouch owns authorization truth.

Authentication answers:

```txt
who is signed in?
is the session valid?
what Clerk user does this session belong to?
```

Authorization answers:

```txt
is this user an active Vouch user?
has this user accepted current terms?
is this user a participant on this Vouch?
what role does this user have on this Vouch?
is this user allowed to perform this action now?
does this action pass readiness gates?
```

Clerk may provide the authenticated user identity.

Vouch must still enforce domain permissions server-side.

No client-side Clerk state is authoritative for Vouch workflow mutation.

---

## Canonical Clerk Architecture Surface

Clerk integration must be isolated behind Vouch auth modules.

Required auth modules:

```txt
lib/auth/clerk.ts
lib/auth/session.ts
lib/auth/user.ts
lib/auth/account.ts
```

Required authorization modules:

```txt
lib/authz/vouch.ts
lib/authz/setup.ts
lib/authz/payment.ts
```

Required action/fetcher surfaces:

```txt
lib/fetchers/authFetchers.ts
lib/fetchers/setupFetchers.ts
lib/actions/authActions.ts
lib/actions/setupActions.ts
```

Required transaction surfaces:

```txt
lib/db/transactions/userTransactions.ts
lib/db/transactions/setupTransactions.ts
lib/db/transactions/systemTransactions.ts
```

Required DTO/types:

```txt
types/auth.ts
types/user.ts
types/setup.ts
types/action-result.ts
types/webhooks.ts
```

Required schemas:

```txt
schemas/auth.ts
schemas/setup.ts
```

Required Clerk provider route boundary:

```txt
app/api/clerk/webhook-handler/route.ts
```

Clerk route handlers may verify and delegate provider events.

They must not become general application APIs.

---

### Environment Variables

Clerk configuration must use environment variables.

Required:

```txt
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY
CLERK_SECRET_KEY
CLERK_WEBHOOK_SIGNING_SECRET
```

Recommended app URL configuration:

```txt
NEXT_PUBLIC_CLERK_SIGN_IN_URL=/sign-in
NEXT_PUBLIC_CLERK_SIGN_UP_URL=/sign-up
NEXT_PUBLIC_CLERK_AFTER_SIGN_IN_URL=/dashboard
NEXT_PUBLIC_CLERK_AFTER_SIGN_UP_URL=/dashboard
```

Do not hard-code Clerk secrets.

Do not expose server secrets to the client.

Do not store Clerk API keys in source files.

---

### Clerk Provider Placement

The root application must wrap the app in Clerk’s provider at the top-level application boundary.

Canonical location:

```txt
app/layout.tsx
```

The root provider may include:

```txt
ClerkProvider
theme-safe appearance configuration
navigation URL configuration
```

The root layout must not contain Vouch authorization logic.

The root layout must not query Prisma.

The root layout must not decide readiness.

The root layout only establishes global provider context.

---

### Route Protection

Route protection belongs in the project’s Next.js middleware/proxy layer and server-side auth helpers.

Protected routes:

```txt
/dashboard
/vouches
/vouches/new
/vouches/[vouchId]
```

Auth routes:

```txt
/sign-in
/sign-up
```

Public routes:

```txt
/
/faq
/pricing
/legal/terms
/legal/privacy
/checkout/success
```

Provider routes:

```txt
/api/clerk/webhook-handler
/api/stripe/webhooks
```

Provider webhook routes must not require a user session.

They must verify provider signatures instead.

Tenant routes require a valid Clerk session.

A valid Clerk session alone is not enough to perform Vouch mutations.

Every protected mutation still follows:

```txt
authenticate
authorize
Zod validate
transaction/provider operation
audit event
revalidate
typed result or redirect
```

---

### Auth Routes

Clerk auth routes use the required catch-all route structure.

```txt
app/(auth)/sign-in/[[...sign-in]]/page.tsx
app/(auth)/sign-up/[[...sign-up]]/page.tsx
```

Auth pages must remain route shells.

They compose:

```txt
AuthPageShell
SignInForm
SignUpForm
auth page content
```

Custom auth form components live under:

```txt
components/forms/sign-in-form.client.tsx
components/forms/sign-up-form.client.tsx
```

Auth forms may use Clerk client hooks.

Auth forms may use:

```txt
React Hook Form
Zod
Clerk sign-in client APIs
Clerk sign-up client APIs
shadcn/Base UI primitives
Vouch design tokens
```

Auth route pages must not:

```txt
query Prisma
call Stripe
perform Vouch readiness decisions
perform Vouch authorization decisions
write terms acceptance directly
create Vouch records
mutate payment state
```

---

### Sign-In Flow

The sign-in flow authenticates an existing user through Clerk.

Canonical sequence:

```txt
render custom sign-in form
submit credentials or provider auth through Clerk client API
Clerk creates/activates session
set active session through Clerk client API
redirect to tenant entry point
server fetcher loads Vouch account state
setup/readiness gates determine next UI state
```

After sign-in, Vouch must load local user state server-side.

Do not infer local Vouch readiness from the sign-in screen.

Do not treat successful sign-in as terms acceptance.

Do not treat successful sign-in as payment readiness.

Do not treat successful sign-in as payout readiness.

---

### Sign-Up Flow

The sign-up flow creates a Clerk user and initiates the local Vouch user lifecycle.

Canonical sequence:

```txt
render custom sign-up form
collect required auth fields
collect account agreement acceptance
submit sign-up through Clerk client API
complete Clerk verification steps
activate Clerk session
sync or create local Vouch user record
persist account agreement acceptance
redirect to tenant entry point
show setup/readiness next steps
```

The sign-up form may collect explicit agreement to:

```txt
User Agreement
Terms of Service
Privacy Policy
```

Terms acceptance must be persisted in Vouch’s database.

Clerk user creation alone is not terms acceptance.

Terms acceptance must include:

```txt
user id
terms version
privacy version
user agreement version
accepted timestamp
source
safe request metadata
```

Per-Vouch disclaimer acceptance is separate from account-level terms acceptance.

---

### Clerk Account Portal

Clerk Account Portal is allowed for authentication/account self-management.

Allowed account portal functions:

```txt
manage email address
manage phone number
manage password
manage MFA
manage connected auth methods
manage active sessions
basic account security settings
```

Account Portal must not become a Vouch settings dashboard.

Account Portal must not manage:

```txt
Vouch readiness
Stripe payment method setup
Stripe payout setup
terms acceptance
per-Vouch disclaimer acceptance
presence confirmation
settlement state
refunds
captures
disputes
evidence
manual awards
```

Vouch may provide an account menu action that opens Clerk Account Portal.

Vouch must not create an internal profile/settings route unless a future contract explicitly restores one.

Clerk profile changes must sync into Vouch only where needed for safe display, account status, or communication.

---

### Local User Model

Vouch must maintain a local user record mapped to Clerk.

Canonical local user fields:

```txt
id
clerkUserId
primaryEmail
displayName
avatarUrl
status
createdAt
updatedAt
lastClerkSyncAt
disabledAt
deletedAt
```

Optional safe fields:

```txt
primaryPhone
emailVerified
phoneVerified
lastSignInAt
```

Do not store:

```txt
passwords
password hashes
raw OAuth tokens
raw Clerk session tokens
raw Clerk webhook payloads
full Clerk user objects
unnecessary identity provider data
```

Clerk user ID is the external identity reference.

Vouch user ID is the internal domain reference.

Domain records should reference Vouch user IDs where possible.

Provider references remain external references.

---

### User Status

Vouch user status is local domain state.

Canonical user statuses:

```txt
active
disabled
deleted
restricted
```

Status meaning:

```txt
active -> user may enter protected app subject to readiness and authorization gates
disabled -> user cannot perform protected app actions
deleted -> user is no longer active in Vouch
restricted -> user is blocked from specific flows due to compliance/provider/domain rules
```

Clerk may disable or delete authentication access.

Vouch must mirror that state locally through webhook sync.

Local disabled or restricted state must be enforced by Vouch auth helpers and action authorization.

---

### Auth Helpers

Protected server code must not call Clerk directly everywhere.

Use Vouch auth helpers.

Required helper surface:

```txt
getAuthContext
requireAuthContext
requireActiveUser
requireActiveVouchAccount
getCurrentUserId
getCurrentClerkUserId
```

`getAuthContext` returns a transport-safe server-only auth snapshot:

```txt
clerkUserId
vouchUserId
sessionId
isAuthenticated
userStatus
email
safeDisplayName
```

`requireActiveUser` must:

```txt
verify Clerk session
load local Vouch user
verify local user is active
return server-only auth context
```

Auth helpers must not:

```txt
decide Vouch participant permissions
decide settlement eligibility
decide payment readiness
decide payout readiness
return raw Clerk user objects
return raw session tokens
```

Participant permissions belong in `lib/authz/*`.

---

### Authorization Helpers

Authorization is domain-specific.

Required authz checks:

```txt
authorizeDashboardAccess
authorizeCreateVouch
authorizeViewVouch
authorizeAcceptVouch
authorizeConfirmPresence
authorizeArchiveVouch
authorizeRefreshReadiness
authorizeProviderReturnRefresh
```

Authorization must consider:

```txt
authenticated local user
local user status
Vouch participant role
Vouch lifecycle state
invitation state
payment/provider state
confirmation window state
readiness gates
terms acceptance
archive state
```

Authorization must not rely on client state.

Authorization must not rely only on Clerk session claims.

Authorization must not rely on route params without database verification.

---

## Session Tokens

Clerk session tokens are authentication transport.

They are not Vouch workflow truth.

Vouch may use Clerk session claims for convenience only when they are safe, current enough, and non-authoritative.

Allowed session-token uses:

```txt
identify authenticated Clerk user
carry safe user/session metadata
support server-side auth checks
support middleware/proxy route protection
```

Forbidden session-token uses:

```txt
settlement eligibility
presence confirmation truth
payment authorization truth
payout readiness truth
terms acceptance truth without database verification
role truth without Vouch participant lookup
admin override authority
```

Session claims can become stale.

Critical Vouch gates must load current server-side state.

---

### Force Token Refresh

When Vouch or Clerk changes auth-relevant metadata, the client session may need a forced token refresh.

Trigger token refresh after changes that affect:

```txt
account status
safe display metadata
verified contact metadata
Clerk public metadata used by UI
Clerk private metadata used by server auth context
session claims used for route visibility
```

Token refresh does not replace database reads.

Token refresh is only a session consistency mechanism.

After force refresh, protected actions must still:

```txt
authenticate
authorize
load current Vouch database state
load required provider-backed readiness state
validate requested transition
```

Do not use forced token refresh to bypass server revalidation.

Do not use forced token refresh as proof of payment readiness, payout readiness, or Vouch participation.

---

### Secure Session Rules

Clerk session configuration must favor secure defaults.

Required posture:

```txt
server-side auth checks on protected routes
httpOnly provider-managed cookies where Clerk controls them
secure cookies in production
same-site protections appropriate to Clerk/Next.js configuration
short-lived session/token assumptions
server-side authorization for mutations
provider webhook signature verification
```

Vouch must not:

```txt
store raw session tokens in the database
log raw session tokens
send session tokens to Stripe
send session tokens to clients manually
use localStorage as auth authority
use client-only auth guards for protected mutations
```

Client auth state may improve UX.

Server auth state controls access.

---

## Clerk Webhooks

Clerk webhook route:

```txt
app/api/clerk/webhook-handler/route.ts
```

The route handler must:

```txt
read raw body
verify Clerk/Svix signature
parse event envelope
extract provider event id
delegate processing
return provider-compatible response
```

Webhook processing belongs outside the route handler.

Canonical processing surface:

```txt
lib/actions/authActions.ts
lib/db/transactions/systemTransactions.ts
lib/db/transactions/userTransactions.ts
```

Minimum Clerk events:

```txt
user.created
user.updated
user.deleted
session.created
session.ended
```

Optional events if used:

```txt
email.created
sms.created
organization.* only if organizations are ever introduced by contract
```

Vouch currently does not use organizations.

Do not introduce organizations unless a future source-of-truth contract requires them.

Webhook events must be idempotent.

Every Clerk webhook event ID must be recorded once.

Duplicate Clerk webhook delivery must be acknowledged without rerunning mutations.

Late Clerk webhooks must reconcile only valid forward movement.

---

### Clerk Webhook Event Handling

#### `user.created`

Create or upsert local Vouch user.

Persist:

```txt
clerkUserId
primary email if available
safe display name if available
avatar URL if available
verified contact flags if needed
created timestamp
last sync timestamp
```

Write audit event:

```txt
user.created
```

Do not mark terms accepted unless explicit Vouch terms acceptance exists.

---

#### `user.updated`

Update safe mirrored user fields.

Allowed updates:

```txt
primary email
display name
avatar URL
verified contact flags
disabled/restricted sync if available
last sync timestamp
```

Write audit event only when meaningful domain-visible state changes.

Avoid noisy audit for every provider metadata change.

---

#### `user.deleted`

Mark local user as deleted or disabled.

Do not hard-delete domain history required for audit, legal, payment, or settlement records.

Deletion must not erase:

```txt
Vouch records
PaymentRecord records
AuditEvent records
ProviderWebhookEvent records
RecoverySnapshot records
TermsAcceptance records required for compliance
```

Deleted users cannot initiate new Vouch actions.

Existing historical records must remain internally consistent.

---

#### `session.created`

Optional audit/security event.

Use only if needed for security monitoring.

Do not create noisy participant-facing audit events for routine sessions.

---

#### `session.ended`

Optional audit/security event.

Use only if needed for account security.

Session ending does not change Vouch lifecycle state.

Session ending does not void, refund, capture, or confirm anything.

---

## Terms and Agreement Acceptance

Vouch has two agreement layers.

Account-level agreement:

```txt
User Agreement
Terms of Service
Privacy Policy
```

Per-Vouch agreement:

```txt
transaction-specific confirmation disclaimer
```

Clerk sign-up may collect account-level agreement acceptance.

Vouch must persist that acceptance locally.

Per-Vouch disclaimer acceptance must occur before the user creates or accepts a committed Vouch.

Terms acceptance must not be stored only in Clerk metadata.

Clerk metadata may mirror a safe latest accepted version for UX, but the Vouch database remains the authority.

---

## Account Creation and Local Sync

Local user creation can occur through either:

```txt
sign-up action flow
Clerk user.created webhook
first authenticated server fetcher
```

The implementation must be idempotent.

If the user exists locally, update safe fields.

If the user does not exist locally, create a minimal local user record.

No Vouch action may proceed until local user existence is confirmed.

Required helper:

```txt
ensureLocalUserForClerkUser
```

This helper belongs in:

```txt
lib/db/transactions/userTransactions.ts
```

It must be called only from server-side auth/action/fetcher flow.

---

### Auth Fetchers

Required auth fetchers:

```txt
getCurrentAuthState
getCurrentUserAccountState
getAccountAgreementState
getAuthRedirectTarget
```

Protected fetcher pattern:

```txt
authenticate
load local user
authorize account visibility
minimal select
DTO mapping
cache policy
transport-safe return
```

Fetchers must not:

```txt
mutate user records except through explicitly approved sync helper
call Stripe mutations
return raw Clerk objects
return raw Prisma objects
return secret auth/provider fields
```

---

### Auth Actions

Required auth/setup actions:

```txt
acceptAccountAgreementAction
refreshAuthSessionStateAction
openAccountPortalAction
syncCurrentUserAction
```

Rules:

```txt
all actions authenticate first
all actions load local Vouch user
all actions validate input through Zod
all actions write audit events when state changes
all actions return typed ActionResult or redirect
```

`openAccountPortalAction` may create or return a Clerk Account Portal redirect where supported.

It must not mutate Vouch payment, payout, or settlement state.

---

### Account Portal Return Handling

Returning from Clerk Account Portal is not domain truth.

After account portal return:

```txt
authenticate current user
refresh safe local user fields if needed
revalidate account/dashboard surfaces
show current setup/readiness state
```

Do not assume:

```txt
email changed successfully
phone changed successfully
MFA changed successfully
account state changed
```

Provider state must be read or synced.

---

### Clerk Metadata Rules

Clerk metadata may store only safe, non-authoritative convenience data.

Allowed public metadata:

```txt
safe display preferences
onboarding UI hints
latest accepted account terms version for display only
```

Allowed private metadata:

```txt
internal Vouch user id
safe account status mirror
last sync marker
```

Forbidden metadata:

```txt
payment method details
Stripe connected account secrets
bank data
card data
identity document data
full Vouch lifecycle state
settlement eligibility
confirmation codes
confirmation payloads
dispute/evidence content
sensitive meeting details
```

Do not use Clerk metadata as the database for Vouch.

---

## Clerk and Stripe Separation

Clerk identity/session state and Stripe provider state must remain separate.

Clerk answers:

```txt
is this user authenticated?
which Clerk user is this?
is the session valid?
```

Stripe answers:

```txt
is payment authorized?
is PaymentIntent capturable?
is connected account payout-capable?
is provider operation allowed?
```

Vouch answers:

```txt
is the user a participant?
which role do they hold?
is the Vouch active?
is the confirmation window open?
are both confirmations valid?
what deterministic resolution applies?
```

Do not treat Clerk verification as Stripe KYC.

Do not treat Stripe onboarding as Clerk authentication.

Do not treat Vouch terms acceptance as Clerk sign-up completion alone.

---

### Role-Aware Access

A signed-in Clerk user may be:

```txt
merchant on one Vouch
customer on another Vouch
neither participant on a third Vouch
```

Role is computed from Vouch participation records.

Role is not global Clerk metadata.

Role is not a permanent account type.

Role is not inferred from email.

Role is not inferred from Stripe connected-account presence.

Access checks must load the Vouch and participant relation before returning protected Vouch detail data or allowing actions.

---

### Invite and Auth Interaction

A public invite link may be opened without an active session.

If unauthenticated:

```txt
show safe invite context only
prompt sign-in or sign-up
preserve invite token through Clerk auth continuation
return to invite acceptance flow after auth
```

If authenticated:

```txt
load invite state
deny self-acceptance
verify user readiness
bind authenticated user only through accept action
```

Invite token presence does not authorize settlement.

Invite token presence does not confirm identity alone.

Invite token presence does not bypass terms or readiness gates.

---

### Confirmation and Auth Interaction

Presence confirmation requires:

```txt
valid Clerk session
active local Vouch user
participant authorization
open confirmation window
no duplicate confirmation
valid confirmation payload
```

Authentication alone cannot confirm presence.

Client-side session state cannot confirm presence.

Only the server action can write confirmation truth.

---

## Clerk Audit Events

Canonical Clerk/auth audit events:

```txt
auth.user.created
auth.user.synced
auth.user.updated
auth.user.deleted
auth.session.created
auth.session.ended
auth.account_portal.opened
auth.account_agreement.accepted
auth.session.refresh_requested
```

Participant-facing timelines should not show routine auth events.

Security/admin timelines may show safe auth events.

Audit metadata may include:

```txt
clerkUserId
vouchUserId
providerEventId
previousStatus
nextStatus
safe email hash
termsVersion
requestId
```

Audit metadata must not include:

```txt
raw Clerk payload
session token
webhook signature
password data
OAuth token
raw identity provider profile
```

---

### Failure Model

Auth failure states:

```txt
unauthenticated
local_user_missing
local_user_disabled
local_user_deleted
terms_required
session_stale
provider_sync_pending
webhook_invalid
webhook_duplicate
webhook_stale
```

User-facing behavior:

```txt
unauthenticated -> redirect to sign-in/sign-up
local_user_missing -> attempt safe sync or show account setup error
local_user_disabled -> show account unavailable state
terms_required -> show terms acceptance flow
session_stale -> refresh or require sign-in
provider_sync_pending -> show retry/refresh state
```

Auth failures must not expose:

```txt
internal provider payloads
stack traces
secret IDs
webhook verification details
authorization internals
```

---

### UI Requirements

Auth UI must follow the Vouch design system.

Required styling posture:

```txt
dark brutalist operational SaaS
rounded-none
border border-neutral-700
bg-black/55
text-white
text-neutral-400
uppercase labels and headings
restrained #1D4ED8 action color
dense intentional spacing
status text not color alone
```

Auth pages must make the product contract visible:

```txt
Vouch is payment coordination
Vouch does not arrange meetings
Vouch does not mediate disputes
Outcome follows system state
Both confirmations are required for release
```

Sign-up must clearly include account agreement acceptance.

Per-Vouch disclaimer remains separate and must not be hidden inside account sign-up.

---

### Forbidden Clerk Patterns

Do not create:

```txt
custom password storage
custom session table as auth authority
localStorage auth authority
client-only route protection
Clerk organization model
team/workspace model
profile marketplace pages
public user profiles
provider profile pages
admin user impersonation flow
manual account approval as settlement control
```

Do not store:

```txt
raw Clerk sessions
raw OAuth tokens
raw webhook payloads
password data
full provider identity payloads
unnecessary contact data
```

Do not use Clerk to decide:

```txt
settlement
refund
capture
non-capture
confirmation validity
provider payment state
payout readiness
dispute outcomes
```

---

## Clerk Integration Acceptance Criteria

The Clerk integration is acceptable only when:

```txt
ClerkProvider is configured at the root provider boundary
auth routes use Clerk catch-all structure
custom sign-in and sign-up pages render through route shells
auth forms use Clerk client APIs only inside client form components
tenant routes require a valid Clerk session
provider webhook routes do not require user session
app/api/clerk/webhook-handler/route.ts verifies Clerk/Svix signatures
Clerk webhook event IDs are idempotently stored
duplicate Clerk webhooks do not duplicate local mutations
local users are mapped to Clerk users
local user status is enforced server-side
account-level terms acceptance is persisted in Vouch DB
per-Vouch disclaimer acceptance remains separate
raw Clerk objects are not returned to UI
raw session tokens are not stored or logged
Clerk metadata is convenience-only, not domain truth
auth helpers centralize Clerk access
authz helpers enforce Vouch permissions
protected fetchers authenticate and authorize before returning DTOs
server actions authenticate and authorize before mutation
role is contextual per Vouch, not global Clerk metadata
Account Portal is allowed only for auth/account management
Account Portal does not become Vouch settings or payment management
Clerk auth state and Stripe provider state remain separate
no Clerk path creates marketplace, messaging, dispute, profile, review, or discovery surfaces
```

---

# 15. Webhook Handlers

## Webhook Handler Doctrine

Webhook handlers are Vouch’s only API routes.

They exist only because external providers need HTTPS endpoints.

Vouch does not use API routes for internal application mutations.

Internal app writes go through server actions and server-only processors.

Provider webhooks enter through API route handlers, but business logic does not live in those route handlers.

The webhook route is the boundary.

The processor owns orchestration.

The transaction layer owns durable writes.

The integration layer owns provider-specific verification, classification, and retrieval.

---

## Approved API Routes

The only approved API routes are:

```txt
app/api/clerk/webhook-handler/route.ts
app/api/stripe/webhooks/route.ts
```

No other API routes are part of Vouch.

Do not create:

```txt
app/api/vouches/create/route.ts
app/api/vouches/confirm/route.ts
app/api/vouches/capture/route.ts
app/api/vouches/refund/route.ts
app/api/accounts/create/route.ts
app/api/accounts/session/route.ts
app/api/payment/setup/route.ts
app/api/payout/setup/route.ts
app/api/admin/settlement/route.ts
```

Internal application writes must not use:

```txt
fetch("/api/...")
```

from Vouch client components or features.

Correct internal write flow:

```txt
client form or navigation action
-> server action
-> authenticate
-> authorize
-> Zod validate
-> transaction and/or provider integration
-> audit
-> revalidate
-> typed result or redirect
```

Correct external provider flow:

```txt
provider
-> webhook route
-> signature verification
-> server-only processor
-> idempotency ledger
-> transaction and/or provider integration
-> audit
-> provider-compatible response
```

---

## Route Handler Responsibilities

Webhook route handlers may:

```txt
read raw request body
read provider signature headers
verify provider signatures
construct or parse provider event envelopes
delegate to server-only webhook processors
return provider-compatible JSON responses
```

Webhook route handlers must not:

```txt
query Prisma directly
perform inline settlement logic
perform inline user sync logic
perform inline provider reconciliation
shape page DTOs
call UI revalidation directly unless delegated result requires it
perform app-user authorization
trust unverified payloads
store raw provider payloads
```

A route handler should be boring.

It receives, verifies, delegates, responds.

---

## Dependency Direction

Webhook dependency direction must be one-way.

Correct dependency graph:

```txt
app/api/[provider]/webhooks/route.ts
-> lib/integrations/[provider]/webhook-events.ts
-> lib/actions/[domain]Actions.ts or lib/webhooks/[provider].ts
-> lib/db/transactions/*
-> lib/integrations/[provider]/*
-> lib/vouch/*
-> schemas/*
-> types/*
```

Transactions must not import:

```txt
app/*
route handlers
React components
features/*
server actions that call them
```

Integrations must not import:

```txt
app/*
components/*
features/*
Prisma transactions unless explicitly acting as a provider persistence adapter
```

Route handlers must not import:

```txt
Prisma client
domain transactions directly
Vouch settlement state machine directly
Stripe capture/refund functions directly
Clerk user mutation transactions directly
```

Preferred route import pattern:

```txt
route.ts
-> verifyProviderWebhookEvent
-> processProviderWebhookEvent
```

---

## Processor Naming Rule

Webhook processors may live in either:

```txt
lib/actions/authActions.ts
lib/actions/paymentActions.ts
```

or a dedicated server-only processor layer:

```txt
lib/webhooks/clerk.ts
lib/webhooks/stripe.ts
```

If using `lib/actions/*`, the exported processor must be treated as server-only system orchestration.

It is not a client-invokable form action.

Preferred names:

```txt
processClerkWebhookEvent
processStripeWebhookEvent
handleVerifiedClerkWebhook
handleVerifiedStripeWebhook
```

Avoid names that imply user intent:

```txt
submitWebhookAction
syncUserButtonAction
captureFromWebhookAction
refundFromWebhookAction
```

Provider webhooks are system events, not user actions.

---

## Idempotency Rule

Every webhook event must be processed idempotently.

Each provider event ID is recorded once.

Duplicate delivery must be acknowledged without rerunning transitions.

Canonical ledger model:

```txt
ProviderWebhookEvent
```

Required uniqueness:

```txt
unique(provider, providerEventId)
```

Required status values:

```txt
received
processed
ignored
failed
```

Required behavior:

```txt
receive event
verify signature
extract provider event id
attempt to record provider event id
if already processed:
  return duplicate/ignored success
if new:
  classify event
  process event
  mark processed, ignored, or failed
  return provider-compatible response
```

Duplicate webhook delivery must not cause:

```txt
duplicate user creation
duplicate local account mutation
duplicate payment authorization transition
duplicate capture
duplicate cancellation
duplicate refund
duplicate audit event
duplicate notification
duplicate recovery job
```

---

## Provider Event Ledger

The provider webhook ledger is the first durable write.

Required fields:

```txt
id
provider
providerEventId
eventType
status
receivedAt
processedAt
processingError
safeMetadata
```

Provider values:

```txt
clerk
stripe
```

Event IDs:

```txt
Clerk -> svix-id header or verified event id where available
Stripe -> event.id for v1 events or v2 event notification id
```

The ledger stores safe metadata only.

Allowed safe metadata:

```txt
provider object id
provider event type
local user id if already known
local vouch id if already known
payment record id if already known
connected account id if already safe
livemode
environment
processing classification
```

Forbidden ledger metadata:

```txt
raw webhook payload
raw session token
raw card data
raw bank data
raw KYC data
raw identity document data
raw OAuth token
webhook signature
full provider object
sensitive billing details
```

---

## Clerk Webhook Handler

Canonical route:

```txt
app/api/clerk/webhook-handler/route.ts
```

Current repo normalization note:

```txt
app/api/clerk/webhook-handler/route.ts
-> should be renamed or replaced with:
app/api/clerk/webhook-handler/route.ts
```

The current repo already follows the correct shape by delegating the route to Clerk webhook helpers and then to auth processing. The final source-of-truth path should still be `/api/clerk/webhook-handler`.

---

### Clerk Route Responsibilities

The Clerk webhook route must:

```txt
read the request
verify the Clerk/Svix signature
extract the provider event id
delegate verified event processing
return JSON response
```

The Clerk webhook route must not:

```txt
upsert users directly
write audit events directly
write webhook ledger directly
parse unsupported provider objects inline
perform Vouch authorization
touch Stripe state
```

---

### Clerk Verification Layer

Clerk verification belongs in:

```txt
lib/auth/webhooks.ts
```

Required functions:

```txt
verifyClerkWebhook
handleVerifiedClerkWebhook
```

The verification layer may use Clerk’s webhook verification utility.

The verification layer must use:

```txt
CLERK_WEBHOOK_SECRET
```

or the canonical project environment variable if already locked as:

```txt
CLERK_WEBHOOK_SIGNING_SECRET
```

Pick one environment variable name and use it consistently across:

```txt
.env.example
lib/env.ts
Clerk section
Webhook section
deployment environment
```

Do not support both names indefinitely.

---

### Clerk Processor

Clerk processing belongs in:

```txt
lib/actions/authActions.ts
```

or:

```txt
lib/webhooks/clerk.ts
```

Canonical function:

```txt
processClerkWebhookEvent
```

Required sequence:

```txt
validate normalized Clerk event shape
record provider webhook received
if duplicate:
  return duplicate success
classify event type
if unsupported:
  mark ignored
  return ignored success
process supported event
write local user/provider projection changes transactionally
write safe audit event if meaningful
mark provider webhook processed
return processed success
if failure:
  mark provider webhook failed
  return failed response
```

---

### Clerk Events

Minimum supported Clerk events:

```txt
user.created
user.updated
user.deleted
session.created
session.ended
```

Optional provider projection events:

```txt
session.pending
session.removed
session.revoked
email.created
sms.created
invitation.created
invitation.accepted
invitation.revoked
```

Unsupported events must be:

```txt
signature verified
ledger recorded
marked ignored
acknowledged successfully
```

Unsupported events must not fail repeatedly forever.

---

### Clerk User Sync Rules

`user.created` and `user.updated` may upsert safe local user fields.

Allowed synced fields:

```txt
clerkUserId
primary email
phone
display name
avatar URL if used
verified contact flags if used
status mirror if relevant
last sync timestamp
```

`user.deleted` must disable or mark deleted locally.

It must not hard-delete domain history.

Do not delete:

```txt
Vouch records
PaymentRecord records
PresenceConfirmation records
TermsAcceptance records
AuditEvent records
ProviderWebhookEvent records
RecoverySnapshot records
```

Clerk deletion affects future access.

It does not rewrite historical workflow truth.

---

### Clerk Session Projection Rules

Session events are authentication-provider projections.

They may support security inspection and local sync.

They must not change Vouch lifecycle state.

Session events must not:

```txt
authorize settlement
confirm presence
void payment
capture payment
refund payment
archive Vouches
accept Vouch terms
accept per-Vouch disclaimers
```

A session starts or ends.

A Vouch does not complete or expire because a session starts or ends.

---

## Stripe Webhook Handler

Canonical route:

```txt
app/api/stripe/webhooks/route.ts
```

The repo already has Stripe webhook classification and verification support in:

```txt
lib/integrations/stripe/webhook-events.ts
```

That module verifies Stripe webhook signatures and supports both Stripe v1 events and v2 core event notifications.

---

### Stripe Route Responsibilities

The Stripe webhook route must:

```txt
read raw request body as text or bytes
read stripe-signature header
verify Stripe signature
construct Stripe event or parse v2 event notification
delegate verified event processing
return provider-compatible JSON response
```

The Stripe webhook route must not:

```txt
capture PaymentIntents inline
cancel PaymentIntents inline
refund payments inline
update ConnectedAccount readiness inline
write PaymentRecord state inline
decide Vouch lifecycle state inline
trust browser return state
store raw provider payload
```

---

### Stripe Verification Layer

Stripe verification belongs in:

```txt
lib/integrations/stripe/webhook-events.ts
```

Required functions:

```txt
verifyStripeWebhookEvent
isStripeV2WebhookEvent
isStripePaymentIntentEvent
isStripeCheckoutSessionEvent
isStripeRefundEvent
isStripeSetupIntentEvent
isStripeAccountEvent
isStripeIdentityEvent
```

Stripe verification must use:

```txt
STRIPE_WEBHOOK_SECRET
```

The route must pass the raw body into verification.

Do not JSON-parse the body before Stripe signature verification.

Do not mutate the raw body before verification.

Do not accept unsigned Stripe webhook payloads.

---

### Stripe Processor

Stripe processing belongs in:

```txt
lib/actions/paymentActions.ts
```

or:

```txt
lib/webhooks/stripe.ts
```

Canonical function:

```txt
processStripeWebhookEvent
```

Required sequence:

```txt
verify or receive verified Stripe event
extract provider event id
record provider webhook received
if duplicate:
  return duplicate success
classify event type
if unsupported:
  mark ignored
  return ignored success
load relevant local records by safe provider references or metadata
retrieve live provider state when event affects settlement-critical state
apply only valid forward movement
persist normalized provider state
write payment-specific webhook projection if applicable
write audit event if state changed
mark provider webhook processed
return processed success
if processing fails:
  mark provider webhook failed
  return failed response
```

Stripe webhooks reconcile provider truth.

Stripe webhooks do not invent Vouch business truth.

---

## Stripe Event Families

Minimum Stripe event families:

```txt
checkout.session.completed
checkout.session.expired
payment_intent.requires_capture
payment_intent.succeeded
payment_intent.canceled
payment_intent.payment_failed
refund.created
refund.updated
charge.refunded
setup_intent.succeeded
setup_intent.setup_failed
account.updated
v2.core.account.updated
v2.core.account[configuration.merchant].capability_status_updated
v2.core.account[configuration.recipient].capability_status_updated
```

Optional if the repo keeps Identity readiness:

```txt
identity.verification_session.verified
identity.verification_session.requires_input
identity.verification_session.canceled
```

Unsupported Stripe events must be:

```txt
signature verified
ledger recorded
marked ignored
acknowledged successfully
```

Unsupported events must not repeatedly fail the webhook endpoint.

---

## Stripe Connect Webhook Scopes

Vouch must distinguish Stripe platform-scope and connected-account-scope events.

Platform-scope events may include:

```txt
Checkout Sessions created by the platform
PaymentIntents created by the platform
destination charge events
application fee events
v2 account events emitted to the platform
customer/payment method readiness events
```

Connected-account-scope events may include:

```txt
v1 account.updated
direct charge events if ever used
connected account payout events
connected account external account updates
```

Vouch’s canonical model is platform-orchestrated destination-charge behavior.

Direct charges are not canonical.

If connected-account scoped events are enabled, processing must extract the connected account reference from the provider event and retrieve provider state with the correct Stripe account context.

For Accounts v2 events, the related object reference identifies the connected account and should be used to retrieve the relevant account state when needed.

---

## Stripe Event Handling Rules

### `checkout.session.completed`

May update Checkout/authorization progress.

Must not treat browser return as truth.

Required behavior:

```txt
load Checkout Session reference
load PaymentIntent reference if available
retrieve current PaymentIntent when needed
persist provider payment state
transition payment state only if valid
write audit event if authorization becomes provider-confirmed
```

Does not by itself release funds.

---

### `checkout.session.expired`

May mark checkout authorization path expired or incomplete.

Required behavior:

```txt
load local PaymentRecord by Checkout Session id
retrieve PaymentIntent if present and necessary
persist checkout expiration
resolve Vouch toward Expired only when workflow/provider state requires it
```

Does not create refund by default.

---

### `payment_intent.requires_capture`

This is the important manual-capture authorization state.

Required behavior:

```txt
load PaymentRecord by PaymentIntent id
persist authorized/capturable provider state
persist amount capturable if available
persist capture deadline if available
transition Vouch to Authorized only if workflow state allows
write audit event
```

Does not capture.

Does not complete the Vouch.

Does not release funds.

---

### `payment_intent.succeeded`

In a manual-capture Vouch flow, this usually means capture succeeded.

Required behavior:

```txt
load PaymentRecord by PaymentIntent id
retrieve current PaymentIntent if needed
persist captured provider state
mark settlement captured if capture was expected
transition Vouch to Completed only if bilateral confirmation truth exists
otherwise mark reconciliation required
write audit event
```

A succeeded PaymentIntent cannot invent confirmation truth.

If `payment_intent.succeeded` arrives before Vouch has valid bilateral confirmation, the system must not silently mark the Vouch completed.

It must enter reconciliation or recovery state.

---

### `payment_intent.canceled`

Required behavior:

```txt
load PaymentRecord by PaymentIntent id
persist canceled/non-captured provider state
transition Vouch toward Expired only if lifecycle state allows
write audit event
```

Canceled provider state does not erase the Vouch.

It records provider non-capture truth.

---

### `payment_intent.payment_failed`

Required behavior:

```txt
load PaymentRecord by PaymentIntent id
persist failed provider state
transition Vouch toward Expired or failed-payment sub-state according to workflow
write audit event
```

Payment failure is provider truth.

It is not a dispute outcome.

---

### `refund.created` / `refund.updated` / `charge.refunded`

Required behavior:

```txt
load RefundRecord or PaymentRecord by provider references
persist refund pending/succeeded/failed status
write audit event
do not rewrite confirmation truth
do not reopen completed or expired lifecycle state
```

Refund is a provider operation.

Refund is not discretionary dispute resolution.

---

### `setup_intent.succeeded`

Required behavior:

```txt
load user/payment customer by Stripe customer reference
persist payment readiness
write safe audit event
revalidate relevant setup/dashboard surfaces
```

Does not authorize a Vouch payment.

Payment method readiness is not payment authorization.

---

### `setup_intent.setup_failed`

Required behavior:

```txt
load user/payment customer by Stripe customer reference if available
persist payment readiness requires_action or failed
write safe audit event
```

Does not affect existing Vouch settlement unless an active authorization depends on it.

---

### `account.updated` and Accounts v2 capability events

Required behavior:

```txt
identify connected account
retrieve current connected account state if needed
map payout/merchant/recipient capability state
persist payout readiness
persist restriction summary
write safe audit event
block future payee-bound flows if restricted
```

Connected account restriction must not create:

```txt
manual payout
alternate payout rail
support-mediated payout
replacement beneficiary
force release
```

---

## Live Provider Retrieval Rule

Webhook payloads are notifications, not final local truth.

For settlement-critical transitions, Vouch must retrieve current provider state before mutating final local settlement state.

Required provider retrieval before:

```txt
capture
cancel
void
refund
provider retry
marking capturable state final
classifying capture failure
classifying refund failure
classifying connected-account restriction
```

Webhook payloads may trigger reconciliation.

They do not replace current provider retrieval for money movement.

---

## Late Event Rule

Late webhooks are reconciled against current state.

If the late event represents valid forward movement, Vouch applies it.

If the late event conflicts with the current state machine, Vouch records it as stale/ignored and does not mutate lifecycle truth.

Late events must not:

```txt
move terminal Vouches backward
reopen Completed Vouches
reopen Expired Vouches
overwrite confirmation truth
trigger second capture
trigger second refund
delete audit history
```

---

## Event Processing Outcomes

Every webhook processor returns a normalized result:

```txt
processed
duplicate
ignored
failed
stale
```

Meaning:

```txt
processed -> event was new and caused or confirmed valid processing
duplicate -> event ID was already processed; no mutation rerun
ignored -> event type is unsupported or irrelevant
failed -> processing failed and should be inspected/retried
stale -> event was valid but no longer represents valid forward movement
```

The route converts this into provider-compatible response behavior.

In general:

```txt
processed -> 200
duplicate -> 200
ignored -> 200
stale -> 200
failed -> 500 only if retry is useful and safe
signature invalid -> 400
missing signature -> 400
```

Do not return 500 for unsupported events.

Unsupported events should not poison webhook delivery.

---

## Transaction Ownership

Webhook processors may call transaction helpers.

Required transaction helpers:

```txt
recordProviderWebhookReceivedTx
markProviderWebhookProcessedTx
markProviderWebhookIgnoredTx
markProviderWebhookFailedTx
recordPaymentWebhookProjectionTx
upsertUserFromClerkTx
disableUserFromClerkTx
upsertClerkSessionProjectionTx
syncPaymentIntentProviderStateTx
syncCheckoutSessionProviderStateTx
syncRefundProviderStateTx
syncConnectedAccountReadinessTx
transitionVouchFromProviderStateTx
writeAuditEventTx
```

These belong under:

```txt
lib/db/transactions/systemTransactions.ts
lib/db/transactions/authTransactions.ts
lib/db/transactions/paymentTransactions.ts
lib/db/transactions/vouchTransactions.ts
```

Current repo note:

```txt
recordProviderWebhookReceived
markProviderWebhookProcessed
markProviderWebhookIgnored
markProviderWebhookFailed
```

currently live in `lib/actions/paymentActions.ts` and are reused by Clerk processing. They should be normalized into `systemTransactions.ts` or a dedicated webhook transaction module so auth webhook processing does not depend on payment action naming.

---

## Revalidation Rule

Webhook processors may revalidate affected UI surfaces only after durable state changes.

Allowed revalidation targets:

```txt
/dashboard
/vouches/[vouchId]
/vouches/new
```

Legacy targets to remove from final source-of-truth:

```txt
/setup
/settings
/settings/payment
/settings/payout
/vouches/[vouchId]/confirm
/admin/webhooks
/admin/payments
```

The final source-of-truth route map has no internal setup/settings/admin pages.

Webhook revalidation must follow the current approved route inventory.

---

## Security Rules

Webhook security requirements:

```txt
verify provider signature before processing
use raw request body for Stripe verification
use Clerk/Svix signature verification for Clerk
reject missing required signature headers
do not log raw provider payloads
do not log secrets
do not expose stack traces in provider responses
store safe metadata only
dedupe provider event IDs
treat webhook endpoints as unauthenticated provider endpoints
do not use Clerk session auth on provider webhook routes
```

Provider webhook routes are not user-authenticated.

They are provider-authenticated through signatures.

---

## Raw Body Rules

Stripe requires the exact raw body for signature verification.

Stripe route must use:

```txt
await request.text()
```

or an equivalent raw body read compatible with the Stripe SDK.

Do not call:

```txt
await request.json()
```

before signature verification.

Clerk verification should use the Clerk-provided webhook verification utility and required headers.

---

## Error Handling Rule

Webhook error behavior must be intentional.

Return `400` for:

```txt
missing signature
invalid signature
unparseable verified envelope
```

Return `200` for:

```txt
processed event
duplicate event
ignored unsupported event
stale but acknowledged event
```

Return `500` only when:

```txt
processing failed after valid verification
provider should retry
retry is safe because idempotency is enforced
```

Never expose internal error details to the provider response.

Persist internal safe failure detail in the webhook ledger.

---

## Audit Rule

Webhook processing writes audit events only for meaningful state changes.

Audit event examples:

```txt
provider.webhook.received
provider.webhook.processed
provider.webhook.ignored
provider.webhook.failed
auth.user.created
auth.user.updated
auth.user.deleted
payment.checkout.completed
payment.authorization.created
payment.authorization.failed
payment.capture.succeeded
payment.capture.failed
payment.canceled
payment.refund.pending
payment.refund.succeeded
payment.refund.failed
payout.account.updated
payout.account.restricted
provider.reconciliation.required
```

Do not create noisy participant-facing audit events for routine session events unless they materially affect account security or access.

Participant-safe audit visibility must be explicit.

---

## Forbidden Webhook Behavior

Webhook processing must never create:

```txt
manual settlement
manual payout
manual refund award
manual confirmation
confirmation timestamp rewrite
appeal path
evidence review
dispute case
message thread
rating/review event
marketplace provider profile
support override
admin arbitration
```

Webhook processing must never allow:

```txt
Stripe payment state to invent confirmation truth
Clerk auth state to invent payment readiness
browser return state to finalize payment
one-sided confirmation to release funds
duplicate webhook to rerun settlement
late webhook to move terminal state backward
```

---

## Final Webhook Architecture

```txt
app/api/clerk/webhook-handler/route.ts
  -> lib/auth/webhooks.ts
  -> processClerkWebhookEvent
  -> system/auth transactions
  -> audit
  -> safe response

app/api/stripe/webhooks/route.ts
  -> lib/integrations/stripe/webhook-events.ts
  -> processStripeWebhookEvent
  -> system/payment/vouch transactions
  -> Stripe provider retrieval when needed
  -> audit
  -> safe response
```

---

## Webhook Handler Acceptance Criteria

Webhook handlers are acceptable only when:

```txt
only app/api/clerk/webhook-handler/route.ts and app/api/stripe/webhooks/route.ts exist as API routes
no internal app mutations use API routes
routes verify provider signatures before processing
Stripe route uses raw body for verification
Clerk route uses Clerk/Svix signature verification
routes delegate to server-only processors
routes do not contain business logic
processors record provider event IDs idempotently
duplicate events return success without rerunning transitions
unsupported events are marked ignored and acknowledged
late events apply only valid forward movement
provider payload storage is minimal and redacted
Clerk events sync local user/auth projection only
Stripe events reconcile provider payment/payout truth only
Stripe events do not invent Vouch confirmation truth
provider state is retrieved before settlement-critical mutations
transactions own durable writes
audit events are append-only and safe
failed processing is marked failed for retry/inspection
no webhook creates marketplace, messaging, dispute, evidence, review, manual payout, or manual settlement surfaces
```

---

# 16. Error Model

## Error Model Doctrine

Errors are part of the deterministic system.

An error is not a dispute.

An error is not an appeal.

An error is not a discretionary settlement opportunity.

An error is a classified failure to complete a requested operation, provider operation, validation step, authorization check, state transition, or reconciliation step.

Vouch errors must be:

```txt
typed
safe
user-actionable where possible
non-leaky
auditable when state-changing
separate from lifecycle truth
separate from provider truth
```

Errors must never create:

```txt
manual settlement
manual payout
manual refund award
manual confirmation rewrite
appeal path
evidence review
support override
admin arbitration
```

Outcome still follows system state.

---

## Error Boundary Rule

Vouch has different error surfaces for different layers.

```txt
UI error state
-> safe display only

Action error
-> typed ActionResult failure

Fetcher error
-> safe blocked/not-found/unauthorized state or thrown route boundary error

Provider error
-> normalized safe provider failure

Webhook error
-> ledger status + provider-compatible response

Transaction error
-> rollback + safe action/fetcher failure

Recovery error
-> internal recovery state, never discretionary outcome
```

The layer that detects an error must not automatically decide the final business outcome unless that layer owns the relevant state transition.

---

## Canonical Action Result Shape

Server actions return one typed result shape.

Canonical file:

```txt
types/action-result.ts
```

Canonical result:

```ts
export type FieldErrors = Record<string, string[]>

export type ActionResult<TData = void> =
    | {
          ok: true
          data: TData
      }
    | {
          ok: false
          code?: string
          formError?: string
          fieldErrors?: FieldErrors
      }
```

The connected repo already uses this pattern in `types/action-result.ts`.

Rules:

```txt
success returns ok: true and data
failure returns ok: false and safe error fields
fieldErrors are for form-specific validation
formError is for user-facing action-level failure
code is for programmatic branching
```

Actions may redirect instead of returning `ActionResult` only when redirect is the intended successful control flow.

Actions must not return raw exceptions.

Actions must not return raw Stripe errors.

Actions must not return raw Clerk errors.

Actions must not return Prisma errors.

---

## Error Code Categories

All action and system errors should use stable uppercase codes.

Canonical categories:

```txt
VALIDATION_FAILED
UNAUTHENTICATED
AUTHZ_DENIED
NOT_FOUND
STATE_CONFLICT
DUPLICATE_OPERATION
WINDOW_CLOSED
WINDOW_NOT_OPEN
READINESS_REQUIRED
TERMS_REQUIRED
DISCLAIMER_REQUIRED
PROVIDER_REQUIRED
PROVIDER_UNAVAILABLE
PROVIDER_RESTRICTED
PROVIDER_STATE_CONFLICT
PAYMENT_NOT_AUTHORIZED
PAYMENT_NOT_CAPTURABLE
CAPTURE_FAILED
CANCEL_FAILED
REFUND_FAILED
WEBHOOK_INVALID
WEBHOOK_DUPLICATE
WEBHOOK_STALE
RECONCILIATION_REQUIRED
RECOVERY_REQUIRED
INTERNAL_ERROR
```

Codes must be stable enough for:

```txt
client form branching
feature-level state rendering
tests
logging
audit metadata
operational retry classification
```

Do not create user-facing prose as the primary error contract.

Use codes for logic.

Use safe messages for display.

---

## Validation Errors

Validation errors occur when input fails Zod parsing.

Sources:

```txt
form input
server action input
route params
search params
provider return params
webhook-normalized envelopes after signature verification
```

Validation failures return:

```txt
code: VALIDATION_FAILED
formError: safe summary
fieldErrors: field-level messages when applicable
```

Rules:

```txt
client-side validation is UX only
server-side validation is authoritative
invalid input never reaches transaction helpers
invalid input never reaches provider mutation calls
invalid input never creates audit transition events unless security/audit policy requires it
```

Validation errors do not mutate state.

---

## Authentication Errors

Authentication errors occur when no valid Clerk session exists.

Canonical code:

```txt
UNAUTHENTICATED
```

Behavior:

```txt
protected page/fetcher -> redirect to sign-in or return unauthenticated page state
server action -> return ActionResult failure or redirect to sign-in when appropriate
provider webhook route -> never uses user-session authentication
```

Authentication failure must not reveal:

```txt
whether a Vouch exists
whether a user exists
participant identity
provider references
internal authorization rules
```

---

## Authorization Errors

Authorization errors occur when the authenticated user is not allowed to perform the requested operation.

Canonical code:

```txt
AUTHZ_DENIED
```

Authorization checks may include:

```txt
active local user
Vouch participant relation
participant role
Vouch lifecycle state
archive state
terms state
readiness state
payment/provider state
confirmation-window state
```

Authorization failure should usually display as:

```txt
not found
unavailable
not allowed
```

depending on surface.

Do not leak whether another user owns the Vouch.

Do not expose participant emails or provider IDs in authz failures.

---

## Not Found Errors

Canonical code:

```txt
NOT_FOUND
```

Use for:

```txt
missing Vouch
missing draft
missing invitation
missing payment record
missing provider reference
missing local user record
```

For protected Vouch surfaces, not-found and unauthorized may intentionally collapse into:

```txt
unauthorized_or_not_found
```

This prevents existence leaks.

---

## State Conflict Errors

Canonical code:

```txt
STATE_CONFLICT
```

State conflicts occur when requested action does not match current deterministic state.

Examples:

```txt
confirming a terminal Vouch
archiving a draft that does not exist
committing an already committed Vouch
accepting an already accepted Vouch
confirming before the window opens
confirming after the window closes
capturing when payment is not capturable
canceling a captured PaymentIntent
refunding an uncaptured authorization
```

State conflict errors must be resolved by reloading current state.

They must not create manual override paths.

---

## Duplicate Operation Errors

Canonical code:

```txt
DUPLICATE_OPERATION
```

Duplicate operation examples:

```txt
duplicate presence confirmation
duplicate webhook delivery
duplicate capture request
duplicate cancel request
duplicate refund request
duplicate archive request
duplicate terms acceptance
```

Duplicate operations should be harmless.

Some duplicates return a safe success-equivalent result.

Others return a typed no-op failure.

Rule:

```txt
duplicate money movement must collapse through durable idempotency
duplicate confirmation must not rewrite confirmation truth
duplicate webhook must not rerun transitions
```

---

## Confirmation Window Errors

Canonical codes:

```txt
WINDOW_NOT_OPEN
WINDOW_CLOSED
```

Rules:

```txt
early confirmation fails
late confirmation fails
confirmation outside window does not create settlement eligibility
offline confirmation must prove valid bucket membership
clock skew tolerance does not extend the confirmation window
```

Confirmation window errors do not create disputes.

They produce deterministic non-confirmation behavior.

---

## Readiness Errors

Canonical code:

```txt
READINESS_REQUIRED
```

Readiness failures occur when a user lacks required setup state.

Merchant readiness blockers may include:

```txt
terms required
Stripe Connect required
payout readiness required
identity/compliance required by Stripe
provider restriction
```

Customer readiness blockers may include:

```txt
terms required
Stripe customer/payment method required
billing readiness required by Stripe
payment provider failure
```

Readiness errors must be shown as setup blockers or next-action states.

They must not become settings-page sprawl.

Connect and Payment are Stripe-hosted redirect actions, not internal settings pages.

---

## Terms and Disclaimer Errors

Canonical codes:

```txt
TERMS_REQUIRED
DISCLAIMER_REQUIRED
```

Account-level terms are required before protected participation.

Per-Vouch disclaimer acceptance is required before committing or accepting a Vouch.

The legal reference documents state that users agree Vouch is a payment coordination tool, that users independently assume risk, and that outcomes are final, automated, and not subject to dispute through Vouch.

Per-Vouch disclaimer acceptance is separate and applies to the specific conditional payment movement.

Errors must distinguish:

```txt
account agreement missing
per-Vouch disclaimer missing
```

Do not collapse them.

---

## Provider Errors

Provider errors come from Stripe or Clerk.

Provider errors must be normalized.

Provider errors must not leak raw payloads.

Canonical provider codes:

```txt
PROVIDER_REQUIRED
PROVIDER_UNAVAILABLE
PROVIDER_RESTRICTED
PROVIDER_STATE_CONFLICT
PAYMENT_NOT_AUTHORIZED
PAYMENT_NOT_CAPTURABLE
CAPTURE_FAILED
CANCEL_FAILED
REFUND_FAILED
```

Provider error metadata may include:

```txt
provider
safe provider object reference
safe status
safe reason code
operation
idempotency key hash
```

Provider error metadata must not include:

```txt
raw Stripe object
raw Clerk object
card details
bank details
KYC payload
webhook signature
secret key
session token
raw request body
```

---

## Stripe Payment Errors

Stripe payment errors must respect provider truth.

Examples:

```txt
PaymentIntent missing
PaymentIntent requires payment method
PaymentIntent not capturable
PaymentIntent already canceled
PaymentIntent already captured
PaymentIntent authorization expired
connected account restricted
refund failed
capture failed
```

Rules:

```txt
retrieve current Stripe state before settlement-critical operations
local state alone is insufficient
browser return is not payment truth
provider error does not create Vouch discretion
```

If capture fails after bilateral confirmation:

```txt
persist provider failure state
write audit event
mark recovery/reconciliation state if needed
show safe failure status
retry only if provider state permits
```

Do not create a manual payout path.

---

## Clerk Errors

Clerk errors are authentication/session/provider-sync errors.

Examples:

```txt
invalid session
missing user
stale session claims
webhook signature invalid
Clerk user deleted
local user sync failed
```

Rules:

```txt
Clerk confirms identity/session
Clerk does not decide Vouch authorization
Clerk does not decide settlement
Clerk does not decide payment readiness
```

Clerk provider errors should never mutate Vouch lifecycle state.

---

## Webhook Errors

Canonical webhook codes:

```txt
WEBHOOK_INVALID
WEBHOOK_DUPLICATE
WEBHOOK_STALE
RECONCILIATION_REQUIRED
```

Webhook behavior:

```txt
invalid signature -> 400
missing signature -> 400
duplicate event -> 200 no-op
ignored unsupported event -> 200 no-op
stale event -> 200 acknowledged no lifecycle mutation
processing failure -> 500 only when retry is useful and idempotent
```

Webhook errors must be recorded in the provider webhook ledger.

Webhook processing must not fail repeatedly for unsupported events.

Unsupported events are ignored after verification and ledger recording.

---

## Recovery Errors

Canonical code:

```txt
RECOVERY_REQUIRED
```

Recovery is technical.

Recovery is not discretionary.

Recovery may occur when:

```txt
provider state and local state conflict
capture state cannot be reconciled
refund state cannot be reconciled
webhook processing partially failed
payment record is missing expected provider reference
recovery snapshot is needed to restore committed state
```

Recovery may:

```txt
retrieve provider state
retry idempotent provider operations
repair local provider mirror state
write audit events
surface safe status
```

Recovery may not:

```txt
change terms
change amount
change participant
change confirmation window
delete confirmation truth
manually award funds
manually refund outside provider rules
invent alternate rails
```

---

## User-Facing Error Copy

User-facing error copy must be safe and operational.

Good examples:

```txt
This Vouch cannot be confirmed yet.
The confirmation window has closed.
This action is no longer available.
Payment authorization is not ready.
Stripe says this payment is not capturable.
Your payout account requires action in Stripe.
We could not verify this provider event.
This Vouch is already terminal.
```

Bad examples:

```txt
The other party lied.
Support will decide who is right.
Upload screenshots to prove attendance.
We will manually review this.
Admin can release funds.
We can override the provider.
```

Vouch does not ask who is right.

Vouch asks what happened.

---

## Error Logging Rules

Log enough for debugging.

Do not log secrets.

Allowed logs:

```txt
request id
operation name
error code
safe message
provider
safe provider object id
user id when already authorized
Vouch id when authorized
webhook event id
idempotency key hash
```

Forbidden logs:

```txt
raw card data
raw bank data
raw identity document data
raw Stripe object
raw Clerk session token
raw webhook signature
raw OAuth token
raw provider request body
passwords
```

---

## Error Model Acceptance Criteria

The error model is acceptable only when:

```txt
server actions return typed ActionResult failures
fetchers return safe state or throw route-boundary errors intentionally
provider errors are normalized
validation errors include fieldErrors
authorization failures do not leak entity existence
Stripe failures do not create manual settlement paths
Clerk failures do not mutate Vouch lifecycle
webhook errors are recorded idempotently
duplicates are harmless
late events cannot move terminal state backward
recovery errors remain technical and non-discretionary
no error state creates disputes, evidence, appeals, messaging, reviews, manual payout, or force release
```

---

# 17. Server Actions

## Server Action Doctrine

Server actions are the only internal application write entry points.

All user-triggered writes go through:

```txt
lib/actions/*
```

Provider-triggered webhook processing enters through API routes, then delegates to server-only processors or action-equivalent orchestration.

Transactions and integrations are dependencies.

They are not application entry points.

Correct write chain:

```txt
client form or navigation action
-> server action
-> authenticate
-> authorize
-> Zod validate
-> transaction and/or provider integration
-> audit event
-> revalidate
-> typed result or redirect
```

The uploaded source-of-truth route section already defines this write-flow rule as absolute.

---

## Required Action Files

Canonical action surface:

```txt
lib/actions/authActions.ts
lib/actions/paymentActions.ts
lib/actions/vouchActions.ts
lib/actions/webhookActions.ts
```

Optional split if files become too large:

```txt
lib/actions/termsActions.ts
lib/actions/recoveryActions.ts
```

Avoid broad action files that imply removed surfaces:

```txt
settingsActions.ts
adminSettlementActions.ts
disputeActions.ts
messageActions.ts
reviewActions.ts
marketplaceActions.ts
```

Current repo note:

```txt
settingsActions.ts
adminActions.ts
notificationActions.ts
setupActions.ts
verificationActions.ts
```

must be reviewed.

Retain only behavior that supports the final route surface, provider readiness, system safety, operational notification, or internal retry.

Remove or quarantine anything that implies user-facing settings pages, admin arbitration, marketplace behavior, disputes, messaging, or manual settlement.

---

## Action Result Rule

Actions return:

```txt
ActionResult<T>
```

or redirect.

They do not return raw Prisma rows.

They do not return raw provider objects.

They do not throw raw provider errors to the client.

Use:

```txt
actionSuccess(data)
actionFailure(code, formError, fieldErrors?)
```

The repo’s current `ActionResult` helper already follows this basic contract.

---

## Action Ordering Rule

Every protected server action follows:

```txt
authenticate
authorize
Zod validate
load minimal current state
verify state transition is allowed
perform provider operation if needed
perform database transaction
write audit event
revalidate affected paths/tags
return typed result or redirect
```

For actions where validation is needed before authorization can identify the target entity, the safe variant is:

```txt
authenticate
Zod validate route/action identifiers
load minimal target
authorize
continue
```

Do not run provider operations before:

```txt
authentication
authorization
validation
current-state checks
```

Do not write audit transitions before the state change succeeds unless recording a security or provider failure event.

---

## Auth Actions

Canonical file:

```txt
lib/actions/authActions.ts
```

Required actions/processors:

```txt
syncCurrentUserAction
acceptAccountAgreementAction
refreshAuthSessionStateAction
processClerkWebhookEvent
```

Allowed responsibilities:

```txt
sync Clerk user into local User
persist account-level agreement acceptance
refresh safe local auth/account projection
process verified Clerk webhook events
write auth-related audit events
```

Forbidden responsibilities:

```txt
create Vouch settlement truth
decide participant authorization
mutate Stripe payment state
mark payment readiness without provider-backed state
capture/refund/cancel payments
```

---

## Payment Actions

Canonical file:

```txt
lib/actions/paymentActions.ts
```

Required actions:

```txt
startStripeConnectAction
startStripePaymentManagementAction
refreshPaymentReadinessAction
refreshPayoutReadinessAction
processStripeWebhookEvent
captureConfirmedVouchPaymentAction
cancelUnconfirmedVouchPaymentAction
refundCapturedVouchPaymentAction
```

Naming note:

Existing action names such as:

```txt
startPayoutSetupAction
startPaymentMethodSetupAction
createStripeConnectedAccountAction
createStripeAccountSessionAction
```

may be kept internally if already implemented, but the source-of-truth user-facing navigation actions should normalize to:

```txt
startStripeConnectAction
startStripePaymentManagementAction
```

because `Connect` and `Payment` are navigation actions, not internal setup/settings pages.

---

### Stripe Connect Action Flow

```txt
startStripeConnectAction
-> authenticate
-> authorize active user
-> load or create ConnectedAccount
-> create Stripe-hosted onboarding/account-management link or session
-> persist provider readiness transition when applicable
-> write audit event
-> redirect to Stripe
```

Rules:

```txt
Vouch does not host banking forms
Vouch does not host tax forms
Vouch does not host payout dashboards
Stripe handles Connect onboarding
return from Stripe is not readiness truth
readiness must be refreshed from provider state
```

---

### Stripe Payment Management Action Flow

```txt
startStripePaymentManagementAction
-> authenticate
-> authorize active user
-> load or create Stripe Customer
-> create Stripe-hosted payment method/address management flow
-> persist safe local provider reference
-> write audit event
-> redirect to Stripe
```

Rules:

```txt
Vouch does not host raw card forms
Vouch does not host billing forms
Vouch does not store card data
payment readiness must be provider-backed
```

---

## Vouch Actions

Canonical file:

```txt
lib/actions/vouchActions.ts
```

Required actions:

```txt
createVouchDraftAction
confirmCreateVouchAction
confirmPresenceAction
archiveVouchAction
deleteDraftVouchAction
```

Optional, only if invite adapter remains:

```txt
acceptVouchAction
```

But invite acceptance should resolve into the canonical Vouch detail experience, not a full separate route.

---

### Create Draft Action

```txt
createVouchDraftAction
```

Purpose:

```txt
validate Vouch draft input
calculate fee preview server-side
persist draft only if implementation uses durable drafts
return review state or redirect to /vouches/new/confirm
```

Rules:

```txt
draft has no Stripe objects
draft is mutable
draft may be abandoned
draft may be deleted
draft cannot be shared as a live Vouch
```

If the implementation skips persisted drafts, use:

```txt
prepareCreateVouchAction
```

instead of pretending a database draft exists.

Pick one model and use it consistently.

---

### Confirm Create Vouch Action

```txt
confirmCreateVouchAction
```

Purpose:

```txt
commit immutable Vouch
create Stripe Checkout flow
create or attach manual-capture PaymentIntent
persist provider references
write audit event
create recovery snapshot
return created Vouch result or redirect
```

Required sequence:

```txt
authenticate
authorize merchant readiness
Zod validate
verify disclaimer acceptance
verify appointment and confirmation timing
verify provider authorization window feasibility
calculate server-side pricing snapshot
create Stripe Checkout Session / manual-capture PaymentIntent through integration
write Vouch + PaymentRecord + recovery snapshot transaction
write audit event
revalidate dashboard and Vouch surfaces
return typed result or redirect
```

Rules:

```txt
client amount is not authoritative until server validation
fee math is server-owned
committed Vouch becomes immutable
no customer field
no memo field
no messaging field
no marketplace field
```

---

### Confirm Presence Action

```txt
confirmPresenceAction
```

Purpose:

```txt
record participant confirmation
derive bilateral confirmation truth
trigger settlement evaluation if both confirmations are valid
```

Required sequence:

```txt
authenticate
authorize active participant
Zod validate
load minimal Vouch + participant + confirmation + payment state
verify lifecycle allows confirmation
verify confirmation window is open
verify submitted code is valid
prevent duplicate confirmation
write PresenceConfirmation transaction
derive aggregate confirmation status
if both confirmed:
  retrieve current Stripe PaymentIntent
  if capturable:
    capture idempotently
    persist provider-backed result
    transition Vouch/settlement state
  else:
    persist provider conflict or recovery state
else:
  persist waiting state only
write audit event
revalidate Vouch detail and dashboard
return typed result
```

Rules:

```txt
one-sided confirmation never releases funds
late confirmation never releases funds
duplicate confirmation cannot rewrite truth
provider state must be retrieved before capture
capture must use durable idempotency
```

---

### Archive Vouch Action

```txt
archiveVouchAction
```

Purpose:

```txt
hide Vouch from active dashboard feed for current user or archive status model
preserve provider history
preserve audit history
preserve payment records
```

Required sequence:

```txt
authenticate
authorize participant
Zod validate
verify Vouch exists and user participates
write archive state
write audit event
revalidate dashboard
return typed result
```

Rules:

```txt
archive is visibility state
archive is not lifecycle state
archive does not cancel payment
archive does not refund
archive does not affect settlement
```

---

### Delete Draft Action

```txt
deleteDraftVouchAction
```

Purpose:

```txt
delete abandoned draft only when no provider activity exists
```

Rules:

```txt
allowed only for drafts
no Stripe object may exist
no PaymentIntent may exist
no Checkout Session may exist
no committed recovery snapshot may exist
provider-linked Vouches cannot be hard deleted
```

---

## Webhook Processor Actions

Webhook processors are server-only system orchestration.

They may live in:

```txt
lib/actions/authActions.ts
lib/actions/paymentActions.ts
```

or:

```txt
lib/webhooks/clerk.ts
lib/webhooks/stripe.ts
```

Canonical processors:

```txt
processClerkWebhookEvent
processStripeWebhookEvent
```

Rules:

```txt
not user-invoked
not form actions
called only after provider signature verification
record provider webhook event id
dedupe duplicates
apply only valid forward movement
mark processed, ignored, stale, or failed
```

Webhook processors may call transactions and provider integrations.

Webhook route handlers may not contain business logic.

---

## Revalidation Rules

Actions revalidate only the approved route surface.

Approved route revalidation:

```txt
/dashboard
/vouches/new
/vouches/new/confirm
/vouches/[vouchId]
/checkout/success
```

Do not revalidate removed route surfaces:

```txt
/setup
/settings
/settings/payment
/settings/payout
/settings/verification
/admin
/admin/payments
/admin/webhooks
```

If a current implementation still revalidates old settings/setup/admin paths, those calls should be removed during normalization.

---

## Idempotency Rules

Idempotency is required for actions that create or mutate durable protocol/provider state.

Required idempotency surfaces:

```txt
confirmCreateVouchAction
confirmPresenceAction when it can trigger capture
captureConfirmedVouchPaymentAction
cancelUnconfirmedVouchPaymentAction
refundCapturedVouchPaymentAction
processStripeWebhookEvent
processClerkWebhookEvent
deleteDraftVouchAction when retryable
archiveVouchAction when retryable
```

Idempotency keys must be:

```txt
server-generated
stable for the logical operation
safe to log only as hashes
not derived from client timestamps alone
not containing sensitive user data
```

---

## Provider Operation Rules

Actions may call provider integrations.

Provider integrations live under:

```txt
lib/integrations/stripe/*
lib/auth/*
```

Actions must retrieve current provider state before settlement-critical provider mutations:

```txt
capture
cancel
void
refund
provider retry
```

Actions must not assume local database state is enough for provider operations.

Stripe is provider truth.

Vouch is workflow truth.

The action combines both.

---

## Audit Rules

Every meaningful state transition writes an audit event.

Required action audit examples:

```txt
user.terms.accepted
vouch.draft_created
vouch.committed
vouch.sent
vouch.accepted
vouch.authorized
confirmation.merchant_confirmed
confirmation.customer_confirmed
confirmation.both_confirmed
payment.capture_requested
payment.capture_succeeded
payment.capture_failed
payment.canceled
payment.non_captured
payment.refund_requested
payment.refund_succeeded
vouch.completed
vouch.expired
vouch.archived
provider.reconciliation_required
```

Duplicate operations must not duplicate audit transitions.

---

## Forbidden Server Actions

Do not create actions named or shaped like:

```txt
forceReleaseAction
manualPayoutAction
manualRefundAwardAction
overrideConfirmationAction
editConfirmationTimestampAction
submitDisputeAction
uploadEvidenceAction
openMessageThreadAction
createReviewAction
rateProviderAction
searchProvidersAction
publishProfileAction
```

Do not create action payload fields like:

```txt
winnerUserId
loserUserId
manualAwardAmountCents
supportJudgment
disputeReason
evidenceUrl
reviewBody
rating
serviceCategory
providerProfileSlug
```

These violate the product boundary.

---

## Server Action Acceptance Criteria

Server actions are acceptable only when:

```txt
all app writes go through lib/actions/*
actions authenticate before protected work
actions authorize before protected mutation
actions validate input with Zod
actions use transaction helpers for durable writes
actions use integration modules for provider calls
actions write audit events for meaningful transitions
actions revalidate only approved surfaces
actions return typed ActionResult or redirect
actions never return raw Prisma/Stripe/Clerk objects
actions retrieve provider state before capture/cancel/refund
actions use idempotency for provider and settlement operations
actions preserve lifecycle/provider/settlement state separation
actions do not implement marketplace, messaging, disputes, evidence, reviews, manual payout, or force release
```

---

# 18. Fetchers

## Fetcher Doctrine

Fetchers are the protected read authority.

All protected reads go through:

```txt
lib/fetchers/*
```

Fetchers own:

```txt
authentication
authorization
minimal select
DTO mapping
cache policy
transport-safe return
```

Fetchers do not mutate state.

Fetchers do not create truth.

Fetchers do not call provider mutation APIs.

Fetchers read persisted truth and return safe DTOs or safe page states.

The uploaded source-of-truth document already defines this protected-read rule.

---

## Required Fetcher Files

Canonical fetcher surface:

```txt
lib/fetchers/authFetchers.ts
lib/fetchers/dashboardFetchers.ts
lib/fetchers/vouchFetchers.ts
lib/fetchers/paymentFetchers.ts
lib/fetchers/auditFetchers.ts
```

Optional if retained for internal provider readiness only:

```txt
lib/fetchers/verificationFetchers.ts
```

Review and normalize:

```txt
lib/fetchers/setupFetchers.ts
lib/fetchers/settingsFetchers.ts
lib/fetchers/adminFetchers.ts
lib/fetchers/analyticsFetchers.ts
```

Retention rule:

```txt
retain only if the fetcher supports approved route surfaces, provider readiness, internal safety, telemetry, or participant-safe audit display
remove or quarantine if it exists only to support removed setup/settings/admin routes
```

The connected repo currently contains broad fetcher inventory, including `vouchFetchers.ts`, `paymentFetchers.ts`, `dashboardFetchers.ts`, `setupFetchers.ts`, `settingsFetchers.ts`, `adminFetchers.ts`, `auditFetchers.ts`, and related files.

---

## Fetcher Chain

Every protected fetcher follows:

```txt
authenticate
authorize
parse route/search params if needed
load minimal selected database rows
map to DTO
apply cache policy
return transport-safe data
```

Fetchers must not:

```txt
mutate database state
call Stripe mutation APIs
call Clerk mutation APIs
write audit events
write provider webhook state
capture payments
cancel payments
refund payments
confirm presence
archive Vouches
return raw Prisma models
return raw Stripe objects
return raw Clerk objects
```

---

## Auth Fetchers

Canonical file:

```txt
lib/fetchers/authFetchers.ts
```

Required fetchers/helpers:

```txt
getCurrentAuthState
requireActiveUser
requireActiveVouchAccount
getCurrentUserAccountState
getAccountAgreementState
```

Responsibilities:

```txt
read Clerk session
load local User
verify local user status
return safe auth/account snapshot
```

Return safe fields only:

```txt
userId
clerkUserId
email
displayName
status
termsState
safe role/capability summary if needed
```

Auth fetchers must not decide Vouch-specific participant authorization.

Participant authorization belongs in authz helpers and Vouch fetchers.

---

## Dashboard Fetchers

Canonical file:

```txt
lib/fetchers/dashboardFetchers.ts
```

Required fetcher:

```txt
getDashboardData
```

Purpose:

```txt
load authenticated user's dashboard DTO
show metric grid
show active Vouch card column
show empty/callout state
```

Required sequence:

```txt
authenticate
authorize active user
select user's participant Vouches
exclude archived cards from active feed
select minimal card fields
map to dashboard DTO
return transport-safe dashboard data
```

Dashboard DTO includes:

```txt
metrics
active Vouch cards
empty state
callout content
```

Dashboard must not fetch:

```txt
full audit logs
full webhook payloads
raw provider objects
admin diagnostics
unrelated users
marketplace listings
messages
reviews
disputes
```

---

## Vouch Fetchers

Canonical file:

```txt
lib/fetchers/vouchFetchers.ts
```

Required fetchers:

```txt
getCreateVouchPageData
getConfirmCreateVouchPageData
getVouchDetail
getParticipantSafeVouchTimeline
getVouchPaymentSummary
getVouchConfirmationSummary
```

The current repo’s `vouchFetchers.ts` already imports `server-only`, uses `requireActiveUser`, uses explicit selects, maps dates to ISO strings, and reads participant Vouches through `payerId/payeeId` checks.

Normalization required:

```txt
payer/payee naming should be mapped to customer/merchant or documented as payment aliases
old statuses like pending/active/refunded/failed must normalize to canonical lifecycle + provider/settlement sub-states
separate confirm route fetchers should collapse into the canonical Vouch detail experience where possible
invite route fetchers should become adapter-only if retained
```

---

### Create Vouch Page Data

```txt
getCreateVouchPageData
```

Purpose:

```txt
load merchant readiness
load fee policy constants
return create form defaults
return blockers if merchant cannot create
```

Rules:

```txt
does not create draft
does not create Stripe objects
does not mutate readiness
does not call Stripe mutation APIs
```

It may display Connect readiness and Payment readiness as blocker states, but it must not create internal setup pages.

---

### Confirm Create Vouch Page Data

```txt
getConfirmCreateVouchPageData
```

Purpose:

```txt
load draft/review state
show fee snapshot preview
show per-Vouch disclaimer requirement
show final commitment consequence
```

Rules:

```txt
does not commit Vouch
does not create PaymentIntent
does not create Checkout Session
does not write disclaimer acceptance
```

The confirm action owns writes.

The fetcher displays current review state.

---

### Vouch Detail Fetcher

```txt
getVouchDetail
```

Purpose:

```txt
load the single canonical Vouch detail surface
return role-aware DTO
return payment/provider summary
return confirmation summary
return available actions
return participant-safe timeline
return next-action/consequence text
```

Required sequence:

```txt
authenticate
parse vouchId
load Vouch by id/publicId and participant relation
authorize current user is merchant or customer
select detail fields
derive participant role
derive action availability
map to VouchDetailDTO
return transport-safe DTO
```

The Vouch detail fetcher owns the read side for:

```txt
checkout link sharing display
presence confirmation entry state
archive visibility
payment status display
confirmation status display
invite/acceptance state if applicable
participant-safe timeline
```

Do not create separate protected read surfaces for:

```txt
disputes
evidence
messages
reviews
ratings
marketplace provider profiles
manual settlement
```

---

## Payment Fetchers

Canonical file:

```txt
lib/fetchers/paymentFetchers.ts
```

Required fetchers:

```txt
getPaymentReadiness
getPayoutReadiness
getPaymentProviderSummary
getConnectedAccountProviderSummary
```

Purpose:

```txt
read provider-backed readiness state
return safe status for UI blockers and navigation actions
```

Rules:

```txt
may read local mirrored provider state
may call provider retrieve only if explicitly designed as refresh/reconciliation read
must not mutate provider state
must not create Stripe objects
must not create account links
must not capture/cancel/refund
```

If a provider refresh mutates local readiness, it is no longer a fetcher.

It must be an action:

```txt
refreshPaymentReadinessAction
refreshPayoutReadinessAction
```

---

## Audit Fetchers

Canonical file:

```txt
lib/fetchers/auditFetchers.ts
```

Required fetcher:

```txt
getParticipantSafeAuditTimeline
```

Purpose:

```txt
return user-visible replayable timeline for a Vouch
```

Rules:

```txt
only participantSafe audit events
only for authorized participants
safe metadata only
no raw provider payloads
no internal stack traces
no secret ids
```

Audit timeline is not evidence.

Audit timeline is not dispute review.

It is the system's deterministic transition history.

---

## Public Fetchers

Public pages generally do not need fetchers.

Static public pages use:

```txt
content/*
shared components
route assembly
```

Public pages must not call protected fetchers.

Public pages must not expose provider status.

Public pages must not query private Vouch data.

---

## Fetcher Cache Policy

Fetcher cache policy must be explicit.

Protected user-specific data should default to:

```txt
noStore()
```

or equivalent user-safe dynamic rendering.

Allowed caching:

```txt
static public content
non-user-specific constants
safe pricing policy constants
public marketing/legal content
```

Do not cache:

```txt
authenticated dashboard data globally
Vouch detail data globally
payment readiness globally
payout readiness globally
provider status globally
participant-safe audit timelines globally
```

The current repo uses `unstable_noStore` in `vouchFetchers.ts` for protected reads, which matches the correct posture.

---

## DTO Mapping Rule

Fetchers must return DTOs or safe page states.

DTO mapping must convert:

```txt
Date -> ISO string
money cents -> cents + display label where needed
Prisma enum -> canonical transport union
provider state -> safe status summary
authorization failure -> safe unavailable state
```

Fetchers must not return:

```txt
Prisma rows
full relation graphs
Stripe objects
Clerk objects
raw webhook payloads
raw audit metadata
```

If a fetcher currently returns mapped raw select objects, it should be normalized through:

```txt
lib/dto/*
```

or:

```txt
lib/mappers/*
```

Pick one convention and use it everywhere.

---

## Fetcher Authorization Rule

Fetchers must enforce read authorization.

Examples:

```txt
dashboard -> current user only
Vouch detail -> current user must be merchant or customer participant
audit timeline -> current user must be participant
payment readiness -> current user only unless internal system context
payout readiness -> current user only unless internal system context
```

Forbidden read behavior:

```txt
read any Vouch by id without participant check
read another user's payment readiness from tenant surface
read raw provider references for unrelated users
return existence details to unauthorized users
```

---

## Safe Unavailable States

Fetchers may return safe page variants instead of throwing.

Examples:

```txt
unauthorized_or_not_found
blocked
not_ready
before_window
window_open
window_closed
already_confirmed
waiting_for_other_party
provider_restricted
reconciliation_pending
```

These variants are display states.

They do not mutate state.

They do not create lifecycle truth.

The action or resolution job owns state transitions.

---

## Forbidden Fetcher Patterns

Do not create fetchers that:

```txt
call capture
call refund
call cancel
write audit
write confirmation
write archive state
create Stripe Checkout Sessions
create Stripe Connect links
create Stripe Customers
create PaymentIntents
sync webhook state
process provider events
```

Do not create fetchers for removed product surfaces:

```txt
getDisputePageData
getEvidenceUploadData
getMessageThreadData
getProviderSearchResults
getMarketplaceListings
getReviews
getRatings
getAdminSettlementDecisionData
```

---

## Fetcher Acceptance Criteria

Fetchers are acceptable only when:

```txt
all protected reads go through lib/fetchers/*
fetchers authenticate before private reads
fetchers authorize before entity reads
fetchers use minimal selects
fetchers map to DTOs or safe page states
fetchers use explicit cache policy
fetchers do not mutate state
fetchers do not call provider mutation APIs
fetchers do not return raw Prisma rows
fetchers do not return raw Stripe/Clerk objects
dashboard fetcher returns active user Vouch cards only
Vouch detail fetcher is the canonical read surface
participant-safe audit fetcher filters participantSafe events
payment fetchers expose safe provider summaries only
removed setup/settings/admin route assumptions do not drive final fetcher design
no fetcher supports marketplace, messaging, disputes, evidence, reviews, manual payout, or force release
```

---

# 19. Feature Modules

## Feature Module Doctrine

Feature modules are route-level orchestration.

Feature modules are not reusable UI libraries.

Feature modules sit between route shells and pure components.

Feature modules coordinate:

```txt
protected fetchers
DTO handoff
server/client composition
Suspense boundaries
route-level branching
action-result mapping
redirect decisions
drawer/dialog/modal state
form orchestration
optimistic UI where explicitly safe
```

Feature modules must not own:

```txt
Prisma queries
Stripe SDK calls
Clerk server SDK business logic
authorization rules
settlement logic
database transactions
provider reconciliation
domain state machines
reusable low-level UI
large static copy blocks
```

Feature modules may import fetchers and actions.

Feature modules may pass actions into client components.

Feature modules may branch on DTO state.

Feature modules may decide which pure components render.

Feature modules do not create business truth.

---

## Feature Layer Position

Correct flow:

```txt
app route shell
-> feature module
-> fetcher/action handoff
-> pure components
```

For protected reads:

```txt
route shell
-> server feature
-> fetcher
-> DTO
-> pure components
```

For writes:

```txt
client form/component
-> server action
-> transaction/provider integration
-> revalidate
-> feature receives updated fetcher state
```

Feature modules must not skip the fetcher/action boundary.

Forbidden flow:

```txt
feature -> Prisma
feature -> Stripe SDK
feature -> Clerk server mutation
feature -> database transaction directly
feature -> provider settlement operation directly
```

---

## Required Feature Tree

Canonical feature tree:

```txt
features/
├── auth/
│   ├── sign-in-page.tsx
│   └── sign-up-page.tsx
│
├── dashboard/
│   ├── dashboard-page.tsx
│   └── dashboard-page.client.tsx
│
└── vouches/
    ├── create-vouch-page.tsx
    ├── create-vouch-page.client.tsx
    ├── confirm-create-vouch-page.tsx
    ├── confirm-create-vouch-page.client.tsx
    ├── vouch-detail-page.tsx
    └── vouch-detail-page.client.tsx
```

Optional feature files only when they are route-level orchestration:

```txt
features/checkout/checkout-success-page.tsx
features/checkout/checkout-success-page.client.tsx
```

Do not create feature modules for removed surfaces:

```txt
features/setup/*
features/settings/*
features/admin/*
features/messages/*
features/disputes/*
features/evidence/*
features/reviews/*
features/marketplace/*
features/providers/*
features/search/*
features/browse/*
```

If current repo files exist for these surfaces, they must be reviewed and either removed, folded into approved readiness/actions, or quarantined as implementation drift.

---

## Auth Features

Canonical files:

```txt
features/auth/sign-in-page.tsx
features/auth/sign-up-page.tsx
```

Auth features orchestrate custom Clerk auth UI.

They may use:

```txt
React Hook Form
Zod client-side validation
Clerk client hooks
AuthPageShell
form components
UI primitives
```

Auth features may handle:

```txt
email input
password input
verification code input
resend verification
sign-in reset
sign-up reset
agreement checkbox UX
post-auth redirect target
safe form-level errors
safe field-level errors
```

Auth features must not:

```txt
query Prisma
persist terms acceptance directly
call Stripe
create Vouch records
perform payment readiness decisions
perform payout readiness decisions
perform Vouch authorization
perform settlement logic
```

Sign-up may collect account agreement acceptance in the form.

The server-side auth action or sync flow owns durable terms persistence.

---

## Dashboard Feature

Canonical files:

```txt
features/dashboard/dashboard-page.tsx
features/dashboard/dashboard-page.client.tsx
```

The dashboard feature renders the authenticated user’s Vouch overview.

It may orchestrate:

```txt
getDashboardData
DashboardPageDTO
Dashboard metrics
Dashboard Vouch card column
Dashboard empty state
Dashboard callout panel
```

Canonical dashboard layout:

```txt
PageHero or SectionIntro
MetricGrid
DashboardVouchColumn
CalloutPanel
```

Dashboard must remain narrow.

It must not render:

```txt
analytics dashboard
admin dashboard
marketplace feed
provider directory
messages inbox
kanban lifecycle board
scheduling calendar
review/rating widgets
dispute panels
evidence panels
```

Current repo normalization note:

```txt
Dashboard currently renders multiple sections such as action required, pending, completed.
Final contract should normalize toward one active Vouch card column unless product source explicitly keeps sections.
Dashboard currently links to /setup in a setup blocker path.
Final contract removes /setup as an internal route; blocker actions should trigger Connect or Payment redirect actions or safe inline readiness callouts.
Dashboard currently uses payer/payee role labels.
Final contract should use merchant/customer as canonical product roles or document payer/payee as payment aliases only.
```

---

## Create Vouch Feature

Canonical files:

```txt
features/vouches/create-vouch-page.tsx
features/vouches/create-vouch-page.client.tsx
```

Purpose:

```txt
render the create Vouch page
load merchant readiness
render create Vouch form
show fee estimate
show readiness blockers inline
hand off submit to createVouchDraftAction or prepareCreateVouchAction
```

Server feature responsibilities:

```txt
call getCreateVouchPageData
receive create-page DTO
render blocked or ready state
pass defaults and policy values into client feature/form
compose page-level UI
```

Client feature responsibilities:

```txt
React Hook Form orchestration
amount/date/window input state
client-side Zod validation
fee-preview display if locally provided
submit transition state
action result display
redirect/result handling
```

Create Vouch feature must not include:

```txt
customer email field
recipient selector
memo field
private note field
message body
service category
marketplace listing data
```

The create page collects:

```txt
amount
appointment date
confirmation window
```

Server action owns final validation and fee math.

---

## Confirm Create Vouch Feature

Canonical files:

```txt
features/vouches/confirm-create-vouch-page.tsx
features/vouches/confirm-create-vouch-page.client.tsx
```

Purpose:

```txt
review Vouch draft/review state
show immutable commitment summary
show fee/customer total summary
show confirmation window
collect per-Vouch disclaimer acceptance
commit Vouch through confirmCreateVouchAction
```

Server feature responsibilities:

```txt
call getConfirmCreateVouchPageData
load draft/review state
render not-found/expired draft states safely
render confirmation summary
pass action wiring to client form
```

Client feature responsibilities:

```txt
disclaimer checkbox state
submit pending state
ActionResult error display
redirect/result handling
```

Confirm feature must not:

```txt
create Stripe objects directly
query Prisma directly
calculate authoritative fees client-side
persist disclaimer acceptance directly
mutate provider state
```

The server action owns committed creation.

---

## Vouch Detail Feature

Canonical files:

```txt
features/vouches/vouch-detail-page.tsx
features/vouches/vouch-detail-page.client.tsx
```

Purpose:

```txt
serve as the single canonical Vouch experience
render complete Vouch state
render role-aware available actions
render payment/provider summary
render confirmation summary
render participant-safe timeline
render checkout link sharing
render archive action
render presence confirmation entry
```

Server feature responsibilities:

```txt
call getVouchDetail
receive VouchDetailDTO
render unauthorized_or_not_found safely
compose detail summary panels
pass action availability into client feature
```

Client feature responsibilities:

```txt
copy checkout link
native share action
drawer/dialog state
presence confirmation panel state
archive confirmation dialog
ActionResult state display
transition/pending states
```

The Vouch detail feature owns these experiences:

```txt
checkout link sharing
presence confirmation
invite/acceptance state if needed
archive action
payment status review
confirmation status review
safe audit timeline
```

The Vouch detail feature must not create separate feature routes for:

```txt
/vouches/[vouchId]/confirm
/vouches/[vouchId]/payment
/vouches/[vouchId]/timeline
/vouches/[vouchId]/dispute
/vouches/[vouchId]/messages
```

All secondary interactions stay inside the canonical detail surface through panels, drawers, dialogs, or inline sections.

---

## Checkout Success Feature

Optional canonical files:

```txt
features/checkout/checkout-success-page.tsx
features/checkout/checkout-success-page.client.tsx
```

Purpose:

```txt
display safe Stripe Checkout return state
avoid trusting browser return as payment truth
route user to dashboard or Vouch detail
show reconciliation pending copy if needed
```

Rules:

```txt
browser return is not authoritative
no payment finalization in feature
no provider mutation in feature
no Prisma query directly in feature
```

If data is needed, use a fetcher.

If reconciliation is needed, use a server action.

---

## Feature and Content Relationship

Feature modules should import content modules for reusable page copy.

Allowed content imports:

```txt
content/auth.tsx
content/dashboard.tsx
content/vouches.tsx
content/checkout.tsx
```

Feature modules may pass content to shared components.

Feature modules must not hard-code large repeated copy blocks.

Correct pattern:

```txt
content export
-> feature module
-> shared/pure component props
```

---

## Feature Naming Rules

Use domain-page names:

```txt
dashboard-page.tsx
create-vouch-page.tsx
confirm-create-vouch-page.tsx
vouch-detail-page.tsx
sign-in-page.tsx
sign-up-page.tsx
```

Avoid state-explosion feature files:

```txt
vouch-detail-refunded.tsx
vouch-detail-failed-release.tsx
confirm-before-window-state.tsx
confirm-provider-failure-state.tsx
accept-vouch-payout-required-state.tsx
```

State-specific rendering should usually be data-driven inside the canonical page feature and pure components.

Create separate files only when complexity justifies it.

Do not mirror every lifecycle or provider sub-state as a separate feature module.

---

## Feature Acceptance Criteria

Feature modules are acceptable only when:

```txt
features orchestrate route-level composition
features call fetchers for protected reads
features hand actions to forms/components
features do not query Prisma
features do not call Stripe SDKs
features do not call Clerk server mutation APIs
features do not enforce core authz rules directly
features do not own settlement logic
features do not become reusable UI libraries
features do not create route sprawl
features keep Vouch detail as the canonical action surface
features use content modules for repeated copy
features render DTOs only
features preserve the dark brutalist Vouch design system
features do not implement marketplace, messaging, disputes, evidence, reviews, manual payout, or force release
```

---

# 20. Shared Components

## Shared Component Doctrine

Shared components are pure presentation.

Shared components render structure, layout, repeated visual patterns, formatting, and reusable interface blocks.

Shared components do not create business truth.

Shared components may receive DTOs and safe props.

Shared components must not import protected fetchers, server actions, Prisma, Stripe SDKs, Clerk server SDKs, or authz helpers.

Shared components may import:

```txt
components/ui/*
components/brand/*
lib/utils
formatting helpers
safe display types
icons
Next Link
```

Shared components must not import:

```txt
lib/db/*
lib/actions/*
lib/fetchers/*
lib/integrations/*
lib/auth/*
lib/authz/*
@/prisma/*
```

---

## Required Shared Component Tree

Canonical shared component tree:

```txt
components/
├── auth/
│   ├── auth-page-shell.tsx
│   └── user-menu.tsx
│
├── brand/
│   ├── logo-lockup.tsx
│   └── verification-mark.tsx
│
├── navigation/
│   ├── public-shell.tsx
│   ├── public-header.tsx
│   ├── public-footer.tsx
│   ├── mobile-bottom-nav.tsx
│   ├── tenant-shell.tsx
│   ├── tenant-header.tsx
│   ├── tenant-footer.tsx
│   ├── tenant-nav.tsx
│   ├── connect-nav-action.tsx
│   └── payment-nav-action.tsx
│
├── forms/
│   ├── field-group.tsx
│   ├── form-error.tsx
│   ├── submit-button.tsx
│   ├── sign-in-form.client.tsx
│   ├── sign-up-form.client.tsx
│   ├── create-vouch-form.client.tsx
│   └── confirm-create-vouch-form.client.tsx
│
├── feedback/
│   ├── empty-state.tsx
│   ├── loading-state.tsx
│   └── error-state.tsx
│
├── shared/
│   ├── action-row.tsx
│   ├── callout-panel.tsx
│   ├── card-grid.tsx
│   ├── content-section-list.tsx
│   ├── cta-panel.tsx
│   ├── metric-grid.tsx
│   ├── page-hero.tsx
│   ├── process-panel.tsx
│   ├── section-intro.tsx
│   ├── summary-list.tsx
│   └── surface.tsx
│
├── dashboard/
│   ├── dashboard-page-skeleton.tsx
│   ├── dashboard-vouch-column.tsx
│   ├── dashboard-vouch-card.tsx
│   └── dashboard-vouch-card-actions.tsx
│
└── vouches/
    ├── amount-input.tsx
    ├── appointment-date-input.tsx
    ├── archive-vouch-button.tsx
    ├── confirmation-status-panel.tsx
    ├── confirmation-window-input.tsx
    ├── confirm-presence-button.tsx
    ├── confirm-vouch-summary.tsx
    ├── copy-checkout-link-button.tsx
    ├── create-vouch-summary.tsx
    ├── disclaimer-checkbox.tsx
    ├── payment-status-panel.tsx
    ├── share-checkout-link-button.tsx
    ├── stripe-checkout-panel.tsx
    ├── vouch-actions-panel.tsx
    ├── vouch-detail-summary.tsx
    ├── vouch-next-action.tsx
    ├── vouch-role-badge.tsx
    └── vouch-status-badge.tsx
```

Use plural `components/vouches/*` to match canonical `/vouches/*` route language.

If current repo uses `components/vouch/*`, normalize naming during cleanup.

---

## Shared Components vs Domain Components

Shared components under:

```txt
components/shared/*
```

must be domain-light.

They render reusable page and panel patterns.

Domain components under:

```txt
components/dashboard/*
components/vouches/*
components/forms/*
```

may render Vouch-specific labels and DTO fields.

Neither shared nor domain components may enforce protected business rules.

Allowed in domain components:

```txt
display role labels
display status labels
display amount labels
display action buttons when props say available
render disabled state based on props
invoke passed server action from form where appropriate
show safe ActionResult errors
```

Forbidden in domain components:

```txt
calculate authorization
calculate settlement eligibility
retrieve provider state
query Vouch state
mutate Vouch state outside passed action
decide if funds release
decide if payment cancels/refunds
```

---

## Public Shell Components

Canonical files:

```txt
components/navigation/public-shell.tsx
components/navigation/public-header.tsx
components/navigation/public-footer.tsx
components/navigation/mobile-bottom-nav.tsx
```

Purpose:

```txt
provide public site frame
render logo
render public nav links
render sign-in/get-started actions
render footer links
preserve public visual system
```

Public nav links:

```txt
Pricing
FAQ
Terms
Privacy
Sign in
Get started
```

Public shell must not:

```txt
read protected session data directly
query Prisma
show tenant navigation
show Vouch cards
show provider readiness
show payment state
```

---

## Tenant Shell Components

Canonical files:

```txt
components/navigation/tenant-shell.tsx
components/navigation/tenant-header.tsx
components/navigation/tenant-footer.tsx
components/navigation/tenant-nav.tsx
components/navigation/connect-nav-action.tsx
components/navigation/payment-nav-action.tsx
```

Tenant navigation contains only:

```txt
Dashboard
Vouches
Connect
Payment
```

Tenant navigation mapping:

```txt
Dashboard -> /dashboard
Vouches -> /vouches/new or canonical Vouch creation entry
Connect -> startStripeConnectAction
Payment -> startStripePaymentManagementAction
```

Connect and Payment are actions, not internal pages.

Tenant shell must not create links to:

```txt
/setup
/settings
/settings/payment
/settings/payout
/settings/verification
/admin
/messages
/disputes
/reviews
/marketplace
```

Connect and Payment nav action components may render forms/buttons that submit server actions.

They must not call Stripe SDKs directly.

---

## Auth Components

Canonical file:

```txt
components/auth/auth-page-shell.tsx
```

Purpose:

```txt
provide shared auth page frame
render Vouch brand
render auth principle copy
render side panel/callout content
host sign-in/sign-up forms
```

Auth shell must not:

```txt
call Clerk server APIs
query Prisma
persist account agreement
perform readiness checks
call Stripe
```

Auth form components may use Clerk client hooks.

Auth form components may use React Hook Form and Zod.

Auth form components must not perform Vouch domain mutations directly except through approved server actions when needed.

---

## Form Components

Canonical files:

```txt
components/forms/field-group.tsx
components/forms/form-error.tsx
components/forms/submit-button.tsx
components/forms/sign-in-form.client.tsx
components/forms/sign-up-form.client.tsx
components/forms/create-vouch-form.client.tsx
components/forms/confirm-create-vouch-form.client.tsx
```

Rules:

```txt
React Hook Form owns client-side form state
Zod client parsing is UX only
server-side validation is authoritative
forms submit to server actions or Clerk client auth APIs
forms display ActionResult failures safely
```

Vouch form fields:

```txt
amount
appointment date
confirmation window
disclaimer acceptance
confirmation code
archive confirmation where needed
```

Forbidden form fields:

```txt
customer email
memo
private note
service category
message body
dispute reason
evidence upload
manual award reason
rating
review
```

---

## Shared Surface Components

Canonical files:

```txt
components/shared/surface.tsx
components/shared/page-hero.tsx
components/shared/section-intro.tsx
components/shared/callout-panel.tsx
components/shared/cta-panel.tsx
components/shared/action-row.tsx
components/shared/card-grid.tsx
components/shared/metric-grid.tsx
components/shared/process-panel.tsx
components/shared/content-section-list.tsx
components/shared/summary-list.tsx
```

Shared surface rules:

```txt
square panels
dark neutral foundation
high contrast
uppercase display headings where appropriate
dense but intentional spacing
status communicated through text
restrained blue accent
mobile-first layout
```

The shared `Surface` component is the base panel primitive for Vouch’s dark brutalist layout.

It should remain the default wrapper for panels, summaries, cards, and callouts unless a lower-level UI primitive is more appropriate.

---

## Dashboard Components

Canonical files:

```txt
components/dashboard/dashboard-page-skeleton.tsx
components/dashboard/dashboard-vouch-column.tsx
components/dashboard/dashboard-vouch-card.tsx
components/dashboard/dashboard-vouch-card-actions.tsx
```

Dashboard Vouch card displays:

```txt
amount
appointment date
confirmation window
status
role
next action
archive state
```

Dashboard components must not display:

```txt
marketplace listings
provider discovery
review/rating metadata
message previews
dispute badges
evidence counts
admin intervention states
```

Dashboard card click target:

```txt
/vouches/[vouchId]
```

---

## Vouch Components

Canonical files:

```txt
components/vouches/vouch-detail-summary.tsx
components/vouches/payment-status-panel.tsx
components/vouches/confirmation-status-panel.tsx
components/vouches/vouch-actions-panel.tsx
components/vouches/stripe-checkout-panel.tsx
components/vouches/copy-checkout-link-button.tsx
components/vouches/share-checkout-link-button.tsx
components/vouches/confirm-presence-button.tsx
components/vouches/archive-vouch-button.tsx
components/vouches/vouch-status-badge.tsx
components/vouches/vouch-role-badge.tsx
components/vouches/vouch-next-action.tsx
components/vouches/create-vouch-summary.tsx
components/vouches/confirm-vouch-summary.tsx
components/vouches/disclaimer-checkbox.tsx
```

Vouch components may display:

```txt
Vouch amount
fees
customer total
appointment date
confirmation window
role
status
next action
Checkout link
safe Stripe status
confirmation state
archive state
participant-safe timeline
```

Vouch components must not display:

```txt
raw Stripe objects
raw Clerk objects
raw provider payloads
raw webhook bodies
private identity data
bank data
card data
evidence
messages
reviews
ratings
dispute status
support judgment
```

---

## Status Component Rules

Status components must use text, not color alone.

Acceptable status display:

```txt
label text
short explanation
deadline/window
required action
consequence text
icon if helpful
color as secondary accent
```

Unacceptable status display:

```txt
green means success
red means failure
icon-only status
color-only badge
ambiguous provider jargon without explanation
```

Every payment/Vouch screen should show:

```txt
amount
status
required action
deadline/window
consequence
```

---

## Component Acceptance Criteria

Shared components are acceptable only when:

```txt
components are pure presentation
components receive DTOs or safe props
components do not query Prisma
components do not call fetchers
components do not call Stripe SDKs
components do not call Clerk server APIs
components do not enforce authz
components do not decide settlement
components do not mutate domain state except through passed action props/forms
components preserve Vouch visual system
components communicate status through text
components do not introduce marketplace, messaging, disputes, evidence, reviews, manual payout, or force release
```

---

# 21. UI Primitives

## UI Primitive Doctrine

UI primitives are low-level reusable interface building blocks.

They are the smallest design-system components.

UI primitives must be domain-agnostic.

UI primitives do not know what a Vouch is.

UI primitives do not know what Stripe is.

UI primitives do not know what Clerk is.

UI primitives do not perform protected reads or writes.

UI primitives render accessible UI foundations used by shared and domain components.

---

## Approved UI Primitive Directory

Canonical directory:

```txt
components/ui/
```

Approved primitives:

```txt
components/ui/alert.tsx
components/ui/alert-dialog.tsx
components/ui/badge.tsx
components/ui/button.tsx
components/ui/calendar.tsx
components/ui/card.tsx
components/ui/checkbox.tsx
components/ui/collapsible.tsx
components/ui/dialog.tsx
components/ui/drawer.tsx
components/ui/dropdown-menu.tsx
components/ui/field.tsx
components/ui/input.tsx
components/ui/input-group.tsx
components/ui/label.tsx
components/ui/popover.tsx
components/ui/progress.tsx
components/ui/radio-group.tsx
components/ui/scroll-area.tsx
components/ui/separator.tsx
components/ui/skeleton.tsx
components/ui/sonner.tsx
components/ui/switch.tsx
components/ui/table.tsx
components/ui/tabs.tsx
components/ui/textarea.tsx
components/ui/tooltip.tsx
```

Do not add primitives unless a real repeated UI need exists.

Do not create domain primitives under `components/ui`.

---

## UI Primitive Import Rules

UI primitives may import:

```txt
React
Radix/Base UI primitives
class-variance-authority
tailwind-merge / cn
lucide icons only where primitive requires it
```

UI primitives must not import:

```txt
Prisma
Stripe
Clerk server APIs
server actions
fetchers
auth helpers
authz helpers
domain schemas
domain DTO mappers
Vouch state helpers
payment helpers
```

UI primitives may import shared utilities:

```txt
lib/utils
```

only when those utilities are presentation-safe.

---

## Design Primitive Rules

All primitives must preserve the Vouch visual language.

Required baseline:

```txt
rounded-none
high contrast
black/neutral foundation
bordered surfaces
uppercase action labels where appropriate
dense spacing
mobile-first responsive behavior
focus-visible accessibility
disabled state clarity
text-based status support
```

Primary action color:

```txt
#1D4ED8
```

Primitives may use CSS variables where configured.

Do not hard-code random colors when a token or existing pattern exists.

Do not introduce soft SaaS styling:

```txt
rounded-lg
pastel panels
low-contrast gray text
overly rounded cards
gradient candy buttons
marketplace card styling
review-star styling
```

---

## Button Primitive

Canonical file:

```txt
components/ui/button.tsx
```

Button must support:

```txt
primary
secondary
outline
ghost
link
destructive only if non-domain and visually safe
cta size
default size
small size
icon-safe layout
render/asChild pattern where used
pending/disabled styling through props or composition
```

Button labels should remain text-readable.

Buttons must not encode domain semantics like:

```txt
release funds
force payout
approve dispute
```

Domain labels come from higher components.

---

## Field/Input Primitives

Canonical files:

```txt
components/ui/field.tsx
components/ui/input.tsx
components/ui/input-group.tsx
components/ui/label.tsx
components/ui/checkbox.tsx
components/ui/textarea.tsx
```

Field primitives must support:

```txt
label
description
error
required indicator where needed
disabled state
focus state
aria-describedby wiring
```

Field primitives must not know Vouch schemas.

Form components provide labels, names, and validation messages.

---

## Dialog/Drawer/AlertDialog Primitives

Canonical files:

```txt
components/ui/dialog.tsx
components/ui/drawer.tsx
components/ui/alert-dialog.tsx
```

Allowed use:

```txt
presence confirmation panel
archive confirmation
copy/share helper
disclaimer review
safe blocked-state explanation
```

Forbidden use:

```txt
dispute submission
evidence upload
manual settlement approval
support override
manual refund award
rating/review form
```

The primitive itself remains domain-agnostic.

Domain components decide where it appears.

---

## Badge Primitive

Canonical file:

```txt
components/ui/badge.tsx
```

Badge may render text status labels.

Badge must not rely on color alone.

Badges should support:

```txt
neutral
blue
warning
danger
success
outline
```

Only if those variants are already part of the design system.

Status meaning must still be text-visible.

---

## Card Primitive

Canonical file:

```txt
components/ui/card.tsx
```

Card should remain low-level.

For Vouch branded panels, prefer:

```txt
components/shared/surface.tsx
```

Use `Card` only where shadcn/Base UI compatibility or form layout requires it.

Do not create marketplace listing cards through `Card`.

---

## Tabs Primitive

Canonical file:

```txt
components/ui/tabs.tsx
```

Tabs are approved as a primitive but should be used sparingly.

Tabs must not drive the dashboard surface.

Dashboard should remain a vertical Vouch card column unless a future contract changes it.

Do not create tabs for:

```txt
disputes
messages
reviews
marketplace categories
provider browsing
```

---

## Table Primitive

Canonical file:

```txt
components/ui/table.tsx
```

Tables are approved but not primary participant UX.

Allowed use:

```txt
internal operational review if retained
safe provider event inspection if internal-only
test/dev diagnostics if not user-facing
```

Participant-facing Vouch UX should prefer cards, panels, summaries, and timelines.

Do not build admin arbitration tables.

---

## Toast/Sonner Primitive

Canonical file:

```txt
components/ui/sonner.tsx
```

Toast messages must be safe and operational.

Allowed:

```txt
Copied Checkout link.
Vouch archived.
Confirmation submitted.
Action unavailable.
Provider state is still reconciling.
```

Forbidden:

```txt
Funds manually released.
Dispute submitted.
Evidence uploaded.
Support will decide.
```

---

## UI Primitive Accessibility Rules

Every primitive must support:

```txt
keyboard navigation
visible focus states
screen-reader labels where needed
aria-invalid for invalid fields
aria-describedby for error/description wiring
semantic HTML where possible
disabled state semantics
```

Do not remove accessibility defaults from Radix/Base UI primitives.

Do not hide focus outlines without replacement.

---

## UI Primitive Acceptance Criteria

UI primitives are acceptable only when:

```txt
they are domain-agnostic
they do not import server/domain code
they do not perform protected reads
they do not perform mutations
they preserve square brutalist visual language
they remain accessible
they support text-based status communication
they are composable by shared/domain components
they do not introduce marketplace, messaging, dispute, evidence, review, manual payout, or force-release semantics
```

---

# 22. Route Shells

## Route Shell Doctrine

Route shells define application surface area.

Route shells do not define business truth.

Route shells are thin App Router files under:

```txt
app/**
```

A route shell may:

```txt
define metadata
receive params
receive searchParams
compose one feature component
compose static public content components
wrap dynamic content in Suspense
provide page-specific skeleton fallback
redirect when route-level auth requires it
call notFound when route params are structurally invalid
export route segment config when needed
```

A route shell must not:

```txt
query Prisma
call Stripe SDKs
call Clerk business logic beyond route/session handoff
shape protected DTOs
perform authorization decisions directly
perform workflow mutations
perform provider mutations
perform settlement logic
perform webhook reconciliation logic
hard-code large repeated page copy
```

Current repo evidence shows the desired pattern in `app/(tenant)/dashboard/page.tsx`, which only imports and renders the dashboard feature.

---

## Canonical Route Tree

Final route tree:

```txt
app/
├── layout.tsx
├── globals.css
├── page.tsx
├── loading.tsx
├── not-found.tsx
├── global-error.tsx
│
├── (public)/
│   ├── layout.tsx
│   ├── loading.tsx
│   ├── error.tsx
│   ├── faq/
│   │   └── page.tsx
│   ├── pricing/
│   │   └── page.tsx
│   ├── legal/
│   │   ├── terms/
│   │   │   └── page.tsx
│   │   └── privacy/
│   │       └── page.tsx
│   └── checkout/
│       └── success/
│           └── page.tsx
│
├── (auth)/
│   ├── layout.tsx
│   ├── loading.tsx
│   ├── error.tsx
│   ├── sign-in/
│   │   └── [[...sign-in]]/
│   │       └── page.tsx
│   └── sign-up/
│       └── [[...sign-up]]/
│           └── page.tsx
│
├── (tenant)/
│   ├── layout.tsx
│   ├── loading.tsx
│   ├── error.tsx
│   ├── dashboard/
│   │   └── page.tsx
│   └── vouches/
│       ├── new/
│       │   ├── page.tsx
│       │   └── confirm/
│       │       └── page.tsx
│       └── [vouchId]/
│           └── page.tsx
│
└── api/
    ├── clerk/
    │   └── webhooks/
    │       └── route.ts
    └── stripe/
        └── webhooks/
            └── route.ts
```

No other route shells are part of Vouch.

---

## Root Route Files

Required root files:

```txt
app/layout.tsx
app/globals.css
app/page.tsx
app/loading.tsx
app/not-found.tsx
app/global-error.tsx
```

Root layout responsibilities:

```txt
html/body structure
global metadata
font configuration
ClerkProvider
global providers
global CSS import
theme/design-system body classes
```

Root layout must not:

```txt
query Prisma
load authenticated Vouch state
perform readiness checks
call Stripe
call payment actions
```

Root page:

```txt
app/page.tsx
```

renders the public landing page.

Landing page may import:

```txt
content/marketing.tsx
components/shared/*
components/navigation through public layout
```

Landing page does not require a feature module unless dynamic orchestration is introduced later.

---

## Public Route Shells

Canonical public routes:

```txt
app/(public)/layout.tsx
app/(public)/faq/page.tsx
app/(public)/pricing/page.tsx
app/(public)/legal/terms/page.tsx
app/(public)/legal/privacy/page.tsx
app/(public)/checkout/success/page.tsx
app/(public)/loading.tsx
app/(public)/error.tsx
```

Public layout:

```txt
PublicShell
-> PublicHeader
-> public main
-> PublicFooter
```

Static public page shape:

```txt
route shell
-> content module
-> shared components
```

Public pages may import:

```txt
content/*
components/shared/*
components/ui/*
```

Public pages must not:

```txt
call protected fetchers
call server actions
query database
call Stripe
call Clerk server business logic
import tenant-only components
```

---

## Checkout Success Route Shell

Canonical file:

```txt
app/(public)/checkout/success/page.tsx
```

Purpose:

```txt
receive Stripe-hosted Checkout browser return
show safe pending/completed contextual copy
route authenticated users to dashboard or Vouch detail
```

Rules:

```txt
browser return is not authoritative
query params are not payment truth
page must not finalize payment state
page must not capture
page must not cancel
page must not refund
page may display reconciliation pending state
page may link to dashboard or Vouch detail
```

If the route needs protected state, it delegates to:

```txt
features/checkout/checkout-success-page.tsx
lib/fetchers/paymentFetchers.ts
```

or to a safe reconciliation action only when explicitly triggered.

---

## Auth Route Shells

Canonical auth routes:

```txt
app/(auth)/layout.tsx
app/(auth)/sign-in/[[...sign-in]]/page.tsx
app/(auth)/sign-up/[[...sign-up]]/page.tsx
app/(auth)/loading.tsx
app/(auth)/error.tsx
```

Auth pages compose:

```txt
AuthPageShell
SignInForm or SignUpForm
```

Auth route shells must support Clerk catch-all route continuation.

Auth route shells must not:

```txt
query Prisma
call Stripe
perform Vouch readiness checks
perform Vouch authorization
write terms acceptance directly
create Vouch records
mutate payment state
```

Auth form/client features may use Clerk client APIs.

Server persistence happens through approved auth actions and webhook sync.

---

## Tenant Route Shells

Canonical tenant routes:

```txt
app/(tenant)/layout.tsx
app/(tenant)/dashboard/page.tsx
app/(tenant)/vouches/new/page.tsx
app/(tenant)/vouches/new/confirm/page.tsx
app/(tenant)/vouches/[vouchId]/page.tsx
app/(tenant)/loading.tsx
app/(tenant)/error.tsx
```

Tenant layout:

```txt
TenantShell
-> TenantHeader
-> TenantNav
-> tenant main
-> TenantFooter
```

Tenant route shell shape:

```tsx
import { Suspense } from "react"

import { PageFeature } from "@/features/[domain]/[page-feature]"
import { PageSkeleton } from "@/components/[domain]/[page-skeleton]"

export default function Route() {
    return (
        <Suspense fallback={<PageSkeleton />}>
            <PageFeature />
        </Suspense>
    )
}
```

If a route does not yet need Suspense, it may render the feature directly, but the final contract prefers explicit Suspense for protected dynamic pages.

---

## Dashboard Route Shell

Canonical file:

```txt
app/(tenant)/dashboard/page.tsx
```

Expected shape:

```tsx
import { Suspense } from "react"

import { DashboardPage } from "@/features/dashboard/dashboard-page"
import { DashboardPageSkeleton } from "@/components/dashboard/dashboard-page-skeleton"

export default function DashboardRoute() {
    return (
        <Suspense fallback={<DashboardPageSkeleton />}>
            <DashboardPage />
        </Suspense>
    )
}
```

Route shell must not:

```txt
call getDashboardData directly
shape dashboard DTOs
query Prisma
render dashboard card logic inline
```

---

## Create Vouch Route Shell

Canonical file:

```txt
app/(tenant)/vouches/new/page.tsx
```

Expected shape:

```tsx
import { Suspense } from "react"

import { CreateVouchPage } from "@/features/vouches/create-vouch-page"
import { CreateVouchPageSkeleton } from "@/components/vouches/create-vouch-page-skeleton"

export default function NewVouchRoute() {
    return (
        <Suspense fallback={<CreateVouchPageSkeleton />}>
            <CreateVouchPage />
        </Suspense>
    )
}
```

Route shell must not:

```txt
calculate fees
read readiness directly
create drafts
commit Vouches
call Stripe
```

---

## Confirm Create Vouch Route Shell

Canonical file:

```txt
app/(tenant)/vouches/new/confirm/page.tsx
```

Expected shape:

```tsx
import { Suspense } from "react"

import { ConfirmCreateVouchPage } from "@/features/vouches/confirm-create-vouch-page"
import { ConfirmCreateVouchPageSkeleton } from "@/components/vouches/confirm-create-vouch-page-skeleton"

export default function ConfirmNewVouchRoute() {
    return (
        <Suspense fallback={<ConfirmCreateVouchPageSkeleton />}>
            <ConfirmCreateVouchPage />
        </Suspense>
    )
}
```

Route shell must not:

```txt
persist disclaimer acceptance
create PaymentIntent
create Checkout Session
commit Vouch
write audit
```

---

## Vouch Detail Route Shell

Canonical file:

```txt
app/(tenant)/vouches/[vouchId]/page.tsx
```

Expected shape:

```tsx
import { Suspense } from "react"

import { VouchDetailPage } from "@/features/vouches/vouch-detail-page"
import { VouchDetailPageSkeleton } from "@/components/vouches/vouch-detail-page-skeleton"

type VouchDetailRouteProps = {
    params: Promise<{
        vouchId: string
    }>
}

export default async function VouchDetailRoute({
    params,
}: VouchDetailRouteProps) {
    const { vouchId } = await params

    return (
        <Suspense fallback={<VouchDetailPageSkeleton />}>
            <VouchDetailPage vouchId={vouchId} />
        </Suspense>
    )
}
```

Route shell may parse params.

Route shell may pass params to the feature.

Route shell must not:

```txt
authorize participant access directly
query Vouch directly
shape VouchDetailDTO
perform presence confirmation
archive Vouch
settle payment
```

---

## Provider Route Handlers

Provider API routes are the only API routes.

Canonical route handlers:

```txt
app/api/clerk/webhook-handler/route.ts
app/api/stripe/webhooks/route.ts
```

Provider route handlers may:

```txt
read raw body
read provider signature headers
verify signatures
parse provider envelopes
delegate to server-only processors
return provider-compatible responses
```

Provider route handlers must not:

```txt
act as internal app mutation endpoints
perform inline Prisma mutations
perform inline settlement decisions
shape protected DTOs
call UI components
trust unverified payloads
```

No internal app writes use:

```txt
fetch("/api/...")
```

Internal app writes use server actions.

---

## Removed Route Shells

Remove or do not create:

```txt
app/(tenant)/setup/page.tsx
app/(tenant)/settings/page.tsx
app/(tenant)/settings/payment/page.tsx
app/(tenant)/settings/payout/page.tsx
app/(tenant)/settings/verification/page.tsx
app/(tenant)/readiness/page.tsx
app/(tenant)/account/page.tsx
app/(tenant)/profile/page.tsx
app/(tenant)/admin/*
app/(tenant)/messages/*
app/(tenant)/disputes/*
app/(tenant)/claims/*
app/(tenant)/appeals/*
app/(tenant)/evidence/*
app/(tenant)/reviews/*
app/(tenant)/ratings/*
app/(tenant)/providers/*
app/(tenant)/marketplace/*
app/(tenant)/search/*
app/(tenant)/browse/*
app/api/vouches/create/route.ts
app/api/vouches/confirm/route.ts
app/api/vouches/capture/route.ts
app/api/vouches/refund/route.ts
app/api/accounts/create/route.ts
app/api/accounts/session/route.ts
```

Connect and Payment are external Stripe actions, not internal route shells.

Presence confirmation is inside the Vouch detail page, not its own route.

Invite acceptance is inside the Vouch detail experience or an adapter-only redirect path, not a full route surface.

---

## Loading and Error Route Files

Each route group should include:

```txt
layout.tsx
loading.tsx
error.tsx
```

Root should include:

```txt
not-found.tsx
global-error.tsx
loading.tsx
```

Loading files render page-frame-compatible skeletons.

Error files render safe error states.

Error files must not expose:

```txt
raw provider errors
stack traces
webhook payloads
secrets
internal database details
```

Error pages must not create support/dispute/manual settlement paths.

---

## Metadata Rules

Route shells may define metadata for public/auth pages.

Metadata must not leak protected data.

Allowed metadata:

```txt
static title
static description
public canonical route info
```

Forbidden metadata:

```txt
Vouch amount
participant identity
payment status
provider IDs
confirmation status
private appointment details
```

Dynamic protected Vouch metadata should be avoided unless implemented with safe fetchers and strict authorization.

---

## Route Shell Acceptance Criteria

Route shells are acceptable only when:

```txt
route tree matches final approved route inventory
route files are thin
public pages use content modules and shared components
auth pages use AuthPageShell and auth forms
tenant pages delegate to feature modules
dynamic tenant pages use Suspense and skeletons
route shells do not query Prisma
route shells do not call Stripe
route shells do not perform domain mutations
route shells do not shape protected DTOs
route shells do not enforce business authz directly
provider API routes are limited to Clerk and Stripe webhooks
no internal app mutation uses app/api/*
removed setup/settings/admin/marketplace/messaging/dispute route shells do not exist
presence confirmation resolves through Vouch detail
Connect and Payment resolve through server actions to Stripe-hosted flows
```

---

# 23. Tests

## Test Doctrine

Tests prove that Vouch remains a deterministic protocol.

Tests must verify:

```txt
workflow truth
provider truth separation
role-scoped authorization
confirmation-window enforcement
bilateral confirmation rules
non-capture rules
webhook idempotency
route-boundary discipline
architecture boundaries
forbidden product surfaces
```

Tests do not encode subjective outcome logic.

Tests must not introduce:

```txt
disputes
evidence review
manual settlement
manual payout
force release
support override
marketplace discovery
messaging
reviews
ratings
```

A passing test suite means:

```txt
the product rule still holds
the route surface is still narrow
state transitions remain deterministic
provider events remain idempotent
business logic remains outside UI/routes
```

---

## Test Stack

Vouch uses:

```txt
Vitest
Testing Library
Playwright
Prisma validation
Contract validation scripts
TypeScript compiler
ESLint
```

Current repo scripts include:

```bash
pnpm lint
pnpm typecheck
pnpm prisma:validate
pnpm validate:contracts
pnpm test
pnpm test:e2e
pnpm validate
pnpm validate:all
```

---

## Test Directory Structure

Canonical test organization:

```txt
tests/
├── unit/
│   ├── auth/
│   ├── authz/
│   ├── vouch/
│   ├── payments/
│   ├── confirmations/
│   ├── webhooks/
│   ├── dto/
│   ├── schemas/
│   └── architecture/
│
├── integration/
│   ├── actions/
│   ├── fetchers/
│   ├── transactions/
│   ├── stripe/
│   ├── clerk/
│   └── webhooks/
│
├── e2e/
│   ├── public.spec.ts
│   ├── auth.spec.ts
│   ├── merchant-create-vouch.spec.ts
│   ├── customer-authorize-vouch.spec.ts
│   ├── bilateral-confirmation.spec.ts
│   ├── non-capture.spec.ts
│   └── archive.spec.ts
│
└── fixtures/
    ├── users.ts
    ├── vouches.ts
    ├── payments.ts
    ├── webhooks.ts
    └── clocks.ts
```

If the repo uses colocated `*.test.ts` files, that is acceptable as long as the same coverage exists.

---

## Unit Tests

Unit tests cover deterministic pure logic.

Required unit coverage:

```txt
fee math
lifecycle transition rules
confirmation-window validation
confirmation-code derivation
offline confirmation bucket validation
clock-skew tolerance
aggregate confirmation derivation
payment status mapping
settlement status mapping
webhook event classification
ActionResult helpers
DTO mappers
Zod schemas
route constants
forbidden route constants
forbidden status values
```

Unit tests must not require:

```txt
live Stripe
live Clerk
live Neon
browser automation
network calls
```

---

## Fee Math Tests

Required file pattern:

```txt
tests/unit/vouch/fees.test.ts
```

Must cover:

```txt
minimum fee applies
percentage fee applies above minimum
money stays integer cents
USD is the only supported launch currency
fee snapshot values reconcile
customer total is calculated server-side
merchant receivable amount is calculated server-side
client-provided fee totals are ignored
historical fee snapshots are not recalculated from current rules
```

Acceptance:

```txt
Vouch fee = max(5% of customer total, 500 cents)
```

or the exact fee formula locked in `lib/vouch/fees.ts`.

---

## Lifecycle Tests

Required file pattern:

```txt
tests/unit/vouch/lifecycle.test.ts
```

Must cover allowed transitions:

```txt
draft -> committed
committed -> sent
sent -> accepted
accepted -> authorized
authorized -> confirmable
confirmable -> completed
confirmable -> expired
```

Must reject:

```txt
completed -> any non-terminal state
expired -> any non-terminal state
authorized -> draft
committed -> draft
manual cancel after commit
manual refund as Vouch lifecycle state
manual force release
```

Canonical lifecycle values:

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

Tests must assert that these are not lifecycle values:

```txt
refunded
voided
canceled
failed
provider_blocked
reconciliation_pending
recovery_required
archived
```

Those belong to separate state axes.

---

## Confirmation Tests

Required file pattern:

```txt
tests/unit/confirmations/confirmation-rules.test.ts
```

Must cover:

```txt
merchant code and customer code are role-specific
code generation alone does not confirm presence
one-sided confirmation does not trigger settlement
both confirmations inside the window produce both_confirmed
confirmation before window is rejected
confirmation after window is rejected
duplicate participant confirmation is rejected
duplicate user confirmation is rejected
offline payload must prove valid time bucket
one adjacent five-minute bucket may be accepted for clock skew
anything beyond allowed skew is rejected
confirmation cannot be rewritten after bilateral success
```

Forbidden methods must be rejected:

```txt
gps
manual
system
support
screenshot
evidence
```

---

## Payment and Settlement Tests

Required file pattern:

```txt
tests/unit/payments/settlement-rules.test.ts
```

Must cover:

```txt
requires_capture maps to authorized/capturable payment state
successful bilateral confirmation can request capture
one-sided confirmation cannot request capture
missing confirmation cannot request capture
expired confirmation window cannot request capture
provider uncapturable state blocks capture
provider canceled state produces non-capture/canceled settlement state
captured state uses refund only when deterministic reversal is required
non-capture is preferred over refund whenever possible
provider restricted state blocks unsupported settlement movement
capture failure records provider-backed failure state
capture failure does not create manual payout path
```

Tests must enforce retrieve-before-settlement by verifying settlement orchestration never captures from local state alone.

---

## Stripe Integration Unit Tests

Required file patterns:

```txt
tests/unit/stripe/status-map.test.ts
tests/unit/stripe/payment-intents.test.ts
tests/unit/stripe/webhook-events.test.ts
```

Must cover:

```txt
PaymentIntent status mapping
Checkout Session status mapping
Refund status mapping
connected account readiness mapping
safe metadata construction
idempotency key construction
webhook event classification
unsupported webhook event ignored after verification
provider status does not overwrite Vouch workflow truth
```

Must reject:

```txt
direct charge canonical flow
invoice canonical flow
Product/Price per-Vouch transaction flow
immediate capture at authorization
marketplace product/listing language
```

---

## Clerk Integration Unit Tests

Required file patterns:

```txt
tests/unit/clerk/auth-context.test.ts
tests/unit/clerk/webhook-events.test.ts
```

Must cover:

```txt
valid Clerk session maps to local auth context
missing local user blocks protected app access
disabled local user blocks protected actions
Clerk user.created upserts local user
Clerk user.updated updates safe fields only
Clerk user.deleted disables/deletes local user projection
session.created does not create Vouch workflow truth
session.ended does not mutate Vouch lifecycle
duplicate Clerk webhook is harmless
```

Must enforce:

```txt
Clerk owns authentication truth
Vouch owns authorization truth
Clerk metadata is not payment readiness truth
Clerk metadata is not Vouch participant truth
```

---

## Webhook Tests

Required file patterns:

```txt
tests/unit/webhooks/idempotency.test.ts
tests/integration/webhooks/stripe-webhook-processing.test.ts
tests/integration/webhooks/clerk-webhook-processing.test.ts
```

Must cover:

```txt
signature verification required
missing signature rejected
invalid signature rejected
provider event ID recorded once
duplicate event acknowledged without transition
late valid forward event reconciles
late stale event is acknowledged without lifecycle mutation
terminal Vouch cannot be reopened
duplicate webhook cannot duplicate audit event
duplicate webhook cannot duplicate capture
duplicate webhook cannot duplicate refund
unsupported event is ignored safely
processing failure is retry-safe
```

Webhook tests must prove:

```txt
webhooks reconcile provider truth
webhooks do not invent Vouch workflow truth
webhooks do not decide confirmation truth
```

---

## Server Action Tests

Required file pattern:

```txt
tests/integration/actions/*.test.ts
```

Must cover:

```txt
actions authenticate before protected work
actions authorize before protected mutation
actions validate with Zod
actions reject invalid input safely
actions call transaction helpers for writes
actions call integration modules for provider operations
actions write audit events for meaningful transitions
actions revalidate approved routes only
actions return typed ActionResult or redirect
actions never return raw Prisma rows
actions never return raw Stripe objects
actions never return raw Clerk objects
```

Required action coverage:

```txt
createVouchDraftAction
confirmCreateVouchAction
confirmPresenceAction
archiveVouchAction
deleteDraftVouchAction
startStripeConnectAction
startStripePaymentManagementAction
refreshPaymentReadinessAction
refreshPayoutReadinessAction
processStripeWebhookEvent
processClerkWebhookEvent
```

---

## Fetcher Tests

Required file pattern:

```txt
tests/integration/fetchers/*.test.ts
```

Must cover:

```txt
protected fetchers require authentication
protected fetchers enforce authorization
dashboard fetcher returns only current user Vouches
dashboard fetcher excludes archived Vouches from active feed
Vouch detail fetcher requires participant access
payment readiness fetcher returns safe provider summary
payout readiness fetcher returns safe provider summary
audit timeline fetcher returns participantSafe events only
fetchers return DTOs or safe page states
fetchers do not mutate state
fetchers do not call provider mutation APIs
```

---

## Transaction Tests

Required file pattern:

```txt
tests/integration/transactions/*.test.ts
```

Must cover:

```txt
commit creates immutable Vouch state
commit creates recovery snapshot
commit persists pricing snapshot
archive preserves provider/audit history
draft delete is allowed only before provider activity
provider-linked Vouches are not hard deleted
confirmation duplicate prevention works at transaction/database level
webhook provider event uniqueness works at database level
audit event writes are append-only
payment state and Vouch lifecycle state remain separate
```

---

## DTO Mapper Tests

Required file pattern:

```txt
tests/unit/dto/*.test.ts
```

Must cover:

```txt
Date values convert to ISO strings
money values convert to cents/display labels
provider state is safely summarized
participant-safe timeline filters correctly
current user role is derived correctly
next action labels are derived safely
forbidden flags do not exist
```

Forbidden DTO fields:

```txt
canForceRelease
canManualRefund
canOpenDispute
canUploadEvidence
supportJudgment
winnerUserId
loserUserId
manualAwardAmountCents
```

---

## Architecture Boundary Tests

Required file pattern:

```txt
tests/unit/architecture/boundaries.test.ts
```

These tests should scan source files.

Must enforce:

```txt
app/** does not import Prisma
app/** does not import Stripe SDK
app/** does not import lib/db/transactions
app/** does not import lib/integrations
components/** does not import Prisma
components/** does not import lib/fetchers
components/** does not import lib/actions except approved form action props where unavoidable
components/** does not import lib/db
components/** does not import lib/integrations
components/ui/** does not import domain modules
features/** does not import Prisma
features/** does not import Stripe SDK
features/** does not import lib/db/transactions
Stripe SDK imports exist only under lib/integrations/stripe/*
internal app mutation route handlers do not exist under app/api/*
```

Forbidden route scan must fail if these exist:

```txt
/setup
/settings
/settings/payment
/settings/payout
/settings/verification
/readiness
/account
/profile
/admin
/messages
/disputes
/claims
/appeals
/evidence
/reviews
/ratings
/search
/browse
/providers
/marketplace
```

Allowed API routes only:

```txt
app/api/clerk/webhook-handler/route.ts
app/api/stripe/webhooks/route.ts
```

---

## Contract Tests

Required command:

```bash
pnpm validate:contracts
```

Contract validation must enforce:

```txt
approved route tree
forbidden route categories
approved API route count
canonical lifecycle values
canonical confirmation methods
payment/provider state separation
required action/fetcher/transaction files
forbidden schema/type fields
forbidden component imports
forbidden provider SDK locations
no marketplace/dispute/messaging/review terminology in app surfaces
```

Contract tests should be deterministic and fast.

Contract tests should fail loudly on boundary drift.

---

## Component Tests

Required file pattern:

```txt
tests/unit/components/*.test.tsx
```

Must cover:

```txt
forms render expected fields only
create Vouch form has amount/date/window only
confirm create form requires disclaimer acceptance
dashboard card shows amount/date/window/status/role/next action
Vouch detail panels show text-based status
status badges include readable text
buttons expose disabled/pending state accessibly
error states do not expose raw provider errors
```

Component tests must not require live providers.

---

## E2E Tests

Required files:

```txt
tests/e2e/public.spec.ts
tests/e2e/auth.spec.ts
tests/e2e/merchant-create-vouch.spec.ts
tests/e2e/customer-authorize-vouch.spec.ts
tests/e2e/bilateral-confirmation.spec.ts
tests/e2e/non-capture.spec.ts
tests/e2e/archive.spec.ts
```

E2E coverage must prove the launch path:

```txt
public pages render
auth pages render
merchant can reach create Vouch flow
merchant can complete readiness-gated creation when mocked ready
merchant receives Checkout link after commit
customer can authorize through mocked Stripe return/webhook path
both participants can confirm inside window
successful bilateral confirmation resolves to capture/completed
one-sided or missing confirmation resolves to non-capture/expired
archived Vouch leaves active dashboard feed
Vouch detail remains accessible by direct URL
```

E2E tests must not depend on live money movement.

Use provider mocks, Stripe test mode fixtures, or deterministic webhook fixtures.

---

## Security and Safety Tests

Required coverage:

```txt
unauthenticated user cannot access tenant routes
non-participant cannot view Vouch detail
non-participant cannot confirm presence
merchant cannot force release
customer cannot force refund
completed Vouch cannot be mutated
expired Vouch cannot be reopened
browser Checkout success URL does not finalize payment state
webhook without signature is rejected
duplicate webhook does not rerun transition
raw provider payloads are not exposed to participant UI
```

---

## Test Data Rules

Fixtures must be explicit and safe.

Allowed fixtures:

```txt
mock Clerk user ids
mock Stripe customer ids
mock Stripe connected account ids
mock PaymentIntent ids
mock Checkout Session ids
mock provider event ids
fixed timestamps
fixed confirmation windows
fixed fee snapshots
```

Forbidden fixtures:

```txt
real card data
real bank data
real identity documents
real API keys
real session tokens
production webhook payloads
unredacted customer data
```

---

## Test Acceptance Criteria

The test suite is acceptable only when:

```txt
unit tests cover deterministic business rules
integration tests cover actions/fetchers/transactions/webhooks
E2E tests cover the launch-critical happy paths and failure paths
architecture tests enforce app/features/components/lib boundaries
contract tests enforce route and product-surface boundaries
webhook tests prove idempotency
payment tests prove retrieve-before-settlement
confirmation tests prove bilateral-window rule
forbidden product surfaces fail tests if introduced
tests run with pnpm test
E2E tests run with pnpm test:e2e
full validation runs with pnpm validate:all
```

---

# 24. Validation Commands

## Validation Doctrine

Validation commands are the operational gates before commit, before merge, before deploy, and before launch.

Validation must prove:

```txt
code compiles
types align
Prisma schema is valid
contracts hold
tests pass
E2E flows pass when required
architecture boundaries hold
forbidden surfaces remain absent
```

Validation is not optional.

A change is not complete until the relevant validation scope passes or the failure is explicitly documented as a blocker.

---

## Package Scripts

Current repo scripts include:

```bash
pnpm lint
pnpm lint:fix
pnpm typecheck
pnpm format
pnpm format:check
pnpm test
pnpm test:watch
pnpm test:coverage
pnpm test:e2e
pnpm test:e2e:ui
pnpm prisma:generate
pnpm prisma:validate
pnpm validate:contracts
pnpm validate
pnpm validate:all
pnpm build
```

Canonical validation scripts:

```bash
pnpm lint
pnpm typecheck
pnpm prisma:validate
pnpm validate:contracts
pnpm test
pnpm test:e2e
pnpm validate
pnpm validate:all
```

---

## Fast Local Validation

Use after small non-schema edits:

```bash
pnpm lint
pnpm typecheck
pnpm test
```

Use for:

```txt
component edits
feature edits
server action edits
fetcher edits
mapper edits
schema/type edits
copy/content edits with TypeScript impact
```

---

## Schema Validation

Use after Prisma changes:

```bash
pnpm prisma:validate
pnpm typecheck
pnpm test
```

Use after edits to:

```txt
prisma/schema.prisma
lib/db/selects/*
lib/db/transactions/*
types/*
schemas/*
DTO mappers
state constants
```

If generated Prisma types are stale, run:

```bash
pnpm prisma:generate
```

Then re-run:

```bash
pnpm typecheck
pnpm test
```

---

## Contract Validation

Use after architecture, route, state, or source-of-truth-sensitive changes:

```bash
pnpm validate:contracts
```

Contract validation must run after changes to:

```txt
app/**
features/**
components/**
components/ui/**
lib/actions/**
lib/fetchers/**
lib/db/**
lib/integrations/**
schemas/**
types/**
.agents/**
scripts/validate-contracts.mjs
```

Contract validation must fail on:

```txt
forbidden route creation
forbidden API route creation
Stripe SDK import outside lib/integrations/stripe/*
Prisma import inside app/features/components
transaction import inside app/components/features
fetcher import inside components
domain import inside components/ui
forbidden lifecycle values
forbidden confirmation methods
forbidden marketplace/dispute/messaging/review surfaces
```

---

## Standard Validation Gate

Use before commit:

```bash
pnpm validate
```

Current repo definition:

```bash
pnpm lint && pnpm typecheck && pnpm prisma:validate && pnpm validate:contracts && pnpm test
```

This is the default completion gate for normal implementation work.

A task is not complete until `pnpm validate` passes.

---

## Full Validation Gate

Use before release, deploy, or major merge:

```bash
pnpm validate:all
```

Current repo definition:

```bash
pnpm validate && pnpm test:e2e
```

This is the launch gate.

A release candidate is not complete until `pnpm validate:all` passes.

---

## Build Validation

Use before deploy or when App Router/runtime behavior changed:

```bash
pnpm build
```

Required after changes to:

```txt
Next.js config
app route tree
layouts
middleware/proxy
server actions
route handlers
provider integrations
environment variable usage
dynamic rendering/caching
server/client boundaries
```

Recommended pre-deploy gate:

```bash
pnpm validate:all
pnpm build
```

---

## Formatting Validation

Use before broad source cleanup or PR polish:

```bash
pnpm format:check
```

Use automatic formatting only when the change surface is controlled:

```bash
pnpm format
```

Do not use formatting as a substitute for lint/type/test validation.

---

## Coverage Validation

Use periodically before launch:

```bash
pnpm test:coverage
```

Coverage must focus on critical logic, not superficial line coverage.

Critical coverage targets:

```txt
fee math
state transitions
confirmation rules
webhook idempotency
payment status mapping
Stripe retrieve-before-settlement
authorization gates
server action failure paths
forbidden route/import scans
```

---

## E2E Validation

Use before release and after route/auth/provider-flow changes:

```bash
pnpm test:e2e
```

Use interactive mode only for debugging:

```bash
pnpm test:e2e:ui
```

Required after changes to:

```txt
auth routes
tenant layout
dashboard route
Vouch creation flow
Vouch detail flow
confirmation flow
Stripe return route
provider webhook route handlers
navigation actions
```

---

## Database Validation

Use local dev database commands intentionally.

Schema validation:

```bash
pnpm prisma:validate
```

Generate Prisma client:

```bash
pnpm prisma:generate
```

Apply production migrations:

```bash
pnpm db:migrate
```

Create development migration:

```bash
pnpm db:migrate:dev
```

Push schema only when explicitly appropriate for local/dev prototyping:

```bash
pnpm db:push
```

Reset local database only when safe:

```bash
pnpm db:reset
```

Seed local database:

```bash
pnpm db:seed
```

Open Prisma Studio:

```bash
pnpm db:studio
```

Never run destructive database commands against production without explicit operator intent.

---

## Validation by Change Type

### Public UI/content change

```bash
pnpm lint
pnpm typecheck
pnpm test
```

If routes/layouts changed:

```bash
pnpm build
```

---

### Component or feature change

```bash
pnpm validate
```

If protected route behavior changed:

```bash
pnpm test:e2e
```

---

### Server action/fetcher change

```bash
pnpm validate
```

If route behavior or user flow changed:

```bash
pnpm test:e2e
```

---

### Prisma/schema/transaction change

```bash
pnpm prisma:validate
pnpm typecheck
pnpm test
pnpm validate:contracts
```

If database migration exists:

```bash
pnpm db:migrate:dev
pnpm validate
```

---

### Stripe integration change

```bash
pnpm validate
pnpm test:e2e
pnpm build
```

Must include targeted tests for:

```txt
PaymentIntent creation
Checkout Session creation
capture
cancel/void
refund fallback
status mapping
webhook dedupe
retrieve-before-settlement
connected account readiness
```

---

### Clerk integration change

```bash
pnpm validate
pnpm test:e2e
pnpm build
```

Must include targeted tests for:

```txt
sign-in
sign-up
session sync
local user sync
terms persistence
Clerk webhook verification
Clerk webhook dedupe
disabled/deleted user handling
```

---

### Webhook handler change

```bash
pnpm validate
pnpm test:e2e
pnpm build
```

Must include targeted tests for:

```txt
signature verification
duplicate event handling
late event handling
unsupported event handling
provider state reconciliation
safe failure/retry behavior
```

---

### Route tree or architecture change

```bash
pnpm validate:contracts
pnpm validate
pnpm test:e2e
pnpm build
```

Must confirm:

```txt
only approved routes exist
only approved API routes exist
route shells are thin
no internal app mutation API routes exist
forbidden surfaces are absent
```

---

## Validation Failure Rule

If validation fails:

```txt
do not ship
do not merge
do not deploy
do not mark task complete
```

Fix the root cause.

Then re-run the failed command.

Then re-run the relevant gate.

If the failure is external, unavailable, or environment-specific, record:

```txt
command run
exact failure
environment
suspected cause
blocked validation gate
required next action
```

Do not hide validation failures.

Do not replace validation with confidence.

---

## Validation Acceptance Criteria

Validation is acceptable only when:

```txt
pnpm lint passes
pnpm typecheck passes
pnpm prisma:validate passes
pnpm validate:contracts passes
pnpm test passes
pnpm test:e2e passes for release candidates
pnpm build passes before deploy
no forbidden route/API surface exists
no boundary violation exists
no provider SDK leak exists
no raw provider/Prisma object leaks to UI
no lifecycle/provider state collapse exists
```

---

# 25. Launch Checklist

## Launch Doctrine

Launch means Vouch is safe to expose as a narrow commitment-backed payment coordination system.

Launch does not mean every possible future feature exists.

Launch requires the core invariant to hold:

```txt
both parties confirm presence inside the confirmation window
-> capture/release through Stripe

anything else
-> non-capture / cancel / expiration / refund fallback according to provider state
```

Launch is blocked by anything that creates ambiguity, discretion, manual settlement, provider-state guessing, or route-surface drift.

---

## Product Scope Checklist

Launch requires:

```txt
Vouch is positioned as commitment-backed payment coordination
Vouch is not positioned as escrow
Vouch is not positioned as a marketplace
Vouch is not positioned as a broker
Vouch is not positioned as a scheduler
Vouch is not positioned as a messaging app
Vouch is not positioned as a dispute-resolution service
Vouch is not positioned as a review/rating platform
```

Forbidden product surfaces absent:

```txt
marketplace discovery
public provider profiles
service listings
categories
ratings
reviews
messaging
disputes
claims
appeals
evidence upload
manual fund awards
manual confirmation rewrites
force release controls
support settlement override
```

---

## Route Surface Checklist

Approved public routes exist:

```txt
/
 /faq
 /pricing
 /legal/terms
 /legal/privacy
 /checkout/success
```

Approved auth routes exist:

```txt
/sign-in
/sign-up
```

Approved tenant routes exist:

```txt
/dashboard
/vouches/new
/vouches/new/confirm
/vouches/[vouchId]
```

Approved provider routes exist:

```txt
/api/clerk/webhook-handler
/api/stripe/webhooks
```

Removed route categories do not exist:

```txt
/setup
/settings
/settings/payment
/settings/payout
/settings/verification
/readiness
/account
/profile
/admin
/messages
/disputes
/claims
/appeals
/evidence
/reviews
/ratings
/search
/browse
/providers
/marketplace
```

---

## Architecture Checklist

Required boundaries hold:

```txt
app/** is route shell only
features/** orchestrates route-level composition
components/** is pure UI
components/ui/** is domain-agnostic primitive UI
lib/fetchers/** owns protected reads
lib/actions/** owns application writes
lib/db/transactions/** owns atomic write primitives
lib/integrations/stripe/** owns Stripe SDK calls
lib/auth/** owns auth helpers
lib/authz/** owns authorization helpers
schemas/** owns Zod validation
types/** owns transport-safe contracts
```

Forbidden boundary violations absent:

```txt
Prisma in app/**
Prisma in components/**
Stripe SDK in app/**
Stripe SDK in components/**
Stripe SDK outside lib/integrations/stripe/**
transactions imported by routes/components/features
fetchers imported by pure UI components
internal mutations through app/api/*
domain logic in components/ui/**
```

---

## Auth and Clerk Checklist

Launch requires:

```txt
ClerkProvider configured at root
sign-in route works
sign-up route works
custom auth forms work
session creation works
local user sync works
account terms acceptance persists in Vouch DB
protected tenant routes require auth
provider webhook routes do not require user session
Clerk webhook signature verification works
Clerk webhook idempotency works
duplicate Clerk webhook is harmless
deleted/disabled Clerk user blocks protected app actions
```

Clerk must not be used as authority for:

```txt
Vouch participation
settlement eligibility
payment readiness
payout readiness
terms truth without DB persistence
presence confirmation truth
```

---

## Stripe Checklist

Launch requires:

```txt
Stripe client isolated under lib/integrations/stripe/*
Stripe keys loaded from environment variables
Stripe Checkout Session creation works
manual-capture PaymentIntent flow works
PaymentIntent uses capture_method=manual
application fee amount is provider-backed
connected account onboarding works
payment/customer setup flow works
payout readiness sync works
payment readiness sync works
Checkout return URL does not finalize payment state
Stripe webhook signature verification works
Stripe webhook idempotency works
duplicate Stripe webhook is harmless
late Stripe webhook reconciles only valid forward movement
current PaymentIntent state is retrieved before capture/cancel/refund
capture uses durable idempotency
cancel/void uses durable idempotency
refund fallback uses durable idempotency
provider restriction blocks unsupported settlement movement
```

Stripe must not introduce:

```txt
marketplace framing
direct charge canonical flow
invoice canonical flow
per-Vouch Product/Price catalog flow
immediate capture at authorization
manual payout escape hatch
off-platform settlement instruction
```

---

## Database and State Checklist

Launch requires:

```txt
Prisma schema validates
canonical lifecycle states are normalized
payment/provider states are separate from Vouch lifecycle
settlement states are separate from Vouch lifecycle
archive state is separate from Vouch lifecycle
recovery state is internal-only
webhook provider event IDs are unique per provider
presence confirmation duplicate prevention exists
pricing snapshots persist at commit
recovery snapshot persists at commit
safe provider references persist
raw provider payloads are not stored as app DTOs
raw card/bank/identity data is not stored
```

Canonical lifecycle only:

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

Forbidden lifecycle values absent:

```txt
refunded
voided
canceled
failed
provider_blocked
archived
reconciliation_pending
recovery_required
```

---

## Vouch Creation Checklist

Launch requires:

```txt
merchant readiness gate works
create page collects amount/date/window only
no customer field exists
no memo field exists
no messaging field exists
fee preview is server-aligned
confirm page displays immutable summary
per-Vouch disclaimer acceptance is required
commit action creates immutable Vouch
commit action creates provider-linked Stripe objects
commit action writes audit event
commit action creates recovery snapshot
committed Vouch cannot be edited
committed Vouch cannot be canceled by user
Checkout link can be copied/shared externally
```

---

## Customer Authorization Checklist

Launch requires:

```txt
customer can open Checkout authorization link
customer must authenticate when required
customer must satisfy account terms
customer payment readiness is provider-backed
Stripe Checkout handles payment method collection
Vouch does not host raw card forms
authorization state is based on Stripe webhook/retrieve
browser return URL is not payment truth
authorized Vouch becomes inert until confirmation window
```

---

## Confirmation Checklist

Launch requires:

```txt
confirmation opens only inside configured window
early confirmation is rejected
late confirmation is rejected
merchant and customer codes are role-specific
code generation alone does not confirm
one-sided confirmation does not release funds
duplicate confirmation is rejected
both valid confirmations inside window lock confirmation truth
confirmation truth cannot be rewritten
confirmation truth cannot be deleted
offline payloads validate time bucket if offline support ships
clock skew tolerance is narrow and bounded
```

Forbidden confirmation methods absent:

```txt
GPS confirmation
manual support confirmation
system/admin confirmation
screenshot confirmation
evidence confirmation
appeal correction
```

---

## Settlement Checklist

Launch requires:

```txt
bilateral confirmation triggers settlement evaluation
settlement retrieves current Stripe PaymentIntent
capture only occurs when provider state permits
capture uses idempotency key
capture success updates payment/settlement state
completed Vouch becomes terminal
anything other than bilateral confirmation resolves away from capture
non-capture preferred over refund
refund used only after captured funds require deterministic reversal
capture failure records provider-backed failure state
capture failure does not create manual payout
provider restriction blocks unsupported payout movement
```

Forbidden settlement paths absent:

```txt
force release
manual payout
manual fund award
manual refund decision
support override
admin arbitration
alternate payment rail
confirmation rewrite
```

---

## Webhook Checklist

Launch requires:

```txt
app/api/clerk/webhook-handler/route.ts exists
app/api/stripe/webhooks/route.ts exists
no other internal mutation API routes exist
raw body handling works where required
provider signature verification works
provider event ID extraction works
webhook event ledger records every event once
duplicate event returns success/no-op
unsupported event returns success/no-op after verification
late stale event does not mutate lifecycle
late valid forward event reconciles safely
webhook processing writes safe audit events
webhook processing never rewrites confirmation truth
webhook processing never reopens terminal Vouches
webhook processing never double captures
webhook processing never double refunds
```

---

## UI Checklist

Launch requires:

```txt
public pages render
auth pages render
tenant shell renders
dashboard renders active Vouch cards
dashboard empty state renders
Vouch create page renders
Vouch confirm page renders
Vouch detail page renders
Checkout success route renders safe pending/return state
Connect nav action redirects to Stripe-hosted flow
Payment nav action redirects to Stripe-hosted flow
status is communicated through text
mobile layout works
keyboard/focus states work
forms show field errors
actions show pending/disabled states
provider failures show safe messages only
```

Visual system holds:

```txt
dark neutral foundation
square panels
high contrast
restrained #1D4ED8 blue
uppercase operational typography
dense intentional spacing
bordered black/55 panels
mobile-first layout
```

---

## Legal and Copy Checklist

Launch requires:

```txt
Terms page exists
Privacy page exists
User agreement acceptance is captured during account flow
per-Vouch disclaimer acceptance is captured before commit
public copy does not call Vouch escrow
public copy does not promise dispute resolution
public copy does not promise manual refund review
public copy does not promise guaranteed payout outside provider state
pricing copy explains protocol execution fee
checkout/confirmation copy explains deterministic outcome
failure copy is safe and non-discretionary
```

Forbidden copy:

```txt
we decide who is right
submit evidence
appeal the outcome
support will review
manual release
manual refund award
escrow adjudication
marketplace provider
book a service
rate this provider
message the other party
```

---

## Observability and Recovery Checklist

Launch requires:

```txt
audit events write for critical transitions
participant-safe timeline filters correctly
provider event IDs are traceable
safe provider references are stored
operational failures have safe error codes
recovery_required is internal-only
reconciliation_pending is provider/operational state only
technical recovery restores original committed terms only
no recovery path rewrites terms
no recovery path changes participants
no recovery path manually awards funds
```

---

## Environment Checklist

Required environment variables:

```txt
DATABASE_URL
CLERK_SECRET_KEY
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY
CLERK_WEBHOOK_SIGNING_SECRET
NEXT_PUBLIC_CLERK_SIGN_IN_URL
NEXT_PUBLIC_CLERK_SIGN_UP_URL
NEXT_PUBLIC_CLERK_AFTER_SIGN_IN_URL
NEXT_PUBLIC_CLERK_AFTER_SIGN_UP_URL
STRIPE_SECRET_KEY
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY
STRIPE_WEBHOOK_SECRET
NEXT_PUBLIC_APP_URL
```

Environment rules:

```txt
no live secrets in source
no secrets in logs
test mode Stripe keys for non-production
production keys only in production environment
webhook secrets configured per environment
Clerk webhook endpoint configured per environment
Stripe webhook endpoint configured per environment
```

---

## Validation Checklist

Before launch, these must pass:

```bash
pnpm lint
pnpm typecheck
pnpm prisma:validate
pnpm validate:contracts
pnpm test
pnpm test:e2e
pnpm validate:all
pnpm build
```

Launch is blocked if any of these fail.

---

## Manual QA Checklist

Manual QA must cover:

```txt
visit landing page
visit FAQ
visit pricing
visit terms
visit privacy
sign up
sign in
open dashboard
click Connect and verify Stripe-hosted redirect starts
click Payment and verify Stripe-hosted redirect starts
create Vouch as ready merchant
review confirm page
accept disclaimer
commit Vouch
copy Checkout link
open Vouch detail
simulate customer authorization through Stripe test flow/webhook
confirm presence as merchant
confirm presence as customer
verify completed/captured state after bilateral confirmation
create another Vouch and let only one party confirm
verify expired/non-captured behavior
archive Vouch
verify archived Vouch leaves active dashboard
verify archived Vouch remains accessible by direct URL
```

Manual QA must also confirm forbidden surfaces are absent from navigation and route access.

---

## Launch Blockers

Launch is blocked by:

```txt
failing validation gate
missing Stripe webhook verification
missing Clerk webhook verification
non-idempotent webhook processing
capture without retrieve-before-settlement
capture from browser return state
manual release path
manual refund award path
dispute/evidence route or component
marketplace/search/provider listing route
messaging route or component
raw Stripe object exposed to UI
raw Clerk object exposed to UI
Prisma in components
Stripe SDK outside integration layer
internal app mutation API routes
Vouch lifecycle polluted by provider states
confirmation duplicate not prevented
terms/disclaimer acceptance missing
provider-linked Vouch hard delete
```

---

## Launch Acceptance Criteria

Vouch is launch-ready only when:

```txt
the approved route tree is the only route tree
public/auth/tenant/API surfaces match source-of-truth
all provider SDK calls are isolated
all protected reads use fetchers
all writes use server actions
all critical writes use transactions
all critical transitions write audit events
Stripe payment truth is reconciled safely
Clerk auth truth is synced safely
webhooks are idempotent
confirmation is bilateral and window-bound
settlement retrieves provider truth before movement
non-capture path works
archive path works
error states are safe
tests pass
validation passes
build passes
no forbidden product surface exists
```

Final launch invariant:

```txt
Stripe owns payment truth.
Clerk owns authentication truth.
Vouch owns workflow truth.
Webhooks reconcile provider truth.
Actions enforce transitions.
Transactions persist facts.
Fetchers return safe DTOs.
Components display results.
Outcome follows system state.
```
