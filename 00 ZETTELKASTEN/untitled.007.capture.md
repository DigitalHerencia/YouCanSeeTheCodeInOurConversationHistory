---
title: Untitled
type:
scope:
project:
domain:
artifact:
kind:
namespace:
authority:
parent:
depends_on:
supersedes:
tags: []
created: 05/12/2026
updated:
---
# Vouch Master Plan

## 1. Product Definition

### Overview

Vouch is a commitment-backed payment coordination platform.

Vouch coordinates conditional payment release through deterministic workflow rules.

Stripe handles:

- customer payment collection
- Stripe Checkout
- billing details
- payment authorization
- manual capture capability
- connected account onboarding
- merchant identity verification
- KYC/compliance collection
- payout bank collection
- payout management
- application fee processing
- payment method management

Vouch handles:

- authenticated user workflow
- Vouch creation
- appointment metadata
- confirmation windows
- bilateral presence confirmation
- deterministic settlement orchestration
- dashboard state
- Vouch detail state
- archive state
- audit state

### Core Purpose

The purpose of Vouch is to create economically meaningful commitment coordination through deterministic protocol execution.

### Core Rule

```txt
both confirmations inside confirmation window
-> capture funds
-> release to merchant

anything else
-> non-capture / cancel / expire / void according to provider state
```

Outcome follows system state.

### Deterministic Settlement Doctrine

Presence confirmation does not happen on Stripe.

Stripe handles:

```txt
Checkout
payment method collection
billing details
payment authorization
manual capture
application fees
connected-account routing
```

Vouch handles:

```txt
presence confirmation
confirmation window validation
bilateral attestation
settlement decision
capture orchestration
audit state
```

---

## 2. User Roles

## Merchant

Merchant users:

- create Vouches
- share Stripe Checkout authorization links
- confirm presence
- receive settlement after successful bilateral confirmation

## Customer

Customer users:

- receive Stripe Checkout authorization links
- authorize payment through Stripe Checkout
- confirm presence
- participate in bilateral settlement confirmation

## Shared User Model

Both merchants and customers:

- authenticate through Clerk
- access the same dashboard structure
- access the same Vouch detail page structure
- use role-aware actions and status rendering

## Role-Aware Behavior

The application changes available actions based on:

- authenticated user
- participant role
- settlement state
- confirmation state
- payment state

---

# 3. Navigation

## Primary Navigation

```txt
Dashboard
Vouch
Connect
Payment
```

## Dashboard

Internal route:

```txt
/dashboard
```

## Vouch

Internal route:

```txt
/vouch
```

## Connect

`Connect` is not an internal Vouch page.

It is a navigation action that redirects the user to Stripe-hosted Connect onboarding/account management.

Flow:

```txt
click Connect
-> authenticate user
-> create/retrieve Stripe connected account
-> create Stripe Connect onboarding/account-management session
-> redirect to Stripe
```

## Payment

`Payment` is not an internal Vouch page.

It is a navigation action that redirects the user to a Stripe-hosted payment management surface.

Flow:

```txt
click Payment
-> authenticate user
-> create/retrieve Stripe customer
-> create Stripe-hosted payment management session
-> redirect to Stripe
```

---

# 4. Route Tree

## Approved Public Routes

```txt
app/page.tsx
app/(public)/faq/page.tsx
app/(public)/pricing/page.tsx
app/(public)/legal/terms/page.tsx
app/(public)/legal/privacy/page.tsx
```

## Approved Auth Routes

```txt
app/(auth)/sign-in/[[...sign-in]]/page.tsx
app/(auth)/sign-up/[[...sign-up]]/page.tsx
```

## Target Tenant Routes

```txt
app/(tenant)/dashboard/page.tsx
app/(tenant)/vouch/page.tsx
app/(tenant)/vouch/confirm/page.tsx
app/(tenant)/vouch/[vouchId]/page.tsx
```

## Target API Routes

```txt
app/api/stripe/webhooks/route.ts
```

## Public Checkout Return Route

```txt
app/(public)/checkout/success/page.tsx
```

Connect and Payment are redirect actions, not application pages.

---

# 5. Public Surface

## Landing Page

Route:

```txt
/
```

Purpose:

- present Vouch’s core product positioning
- explain the protocol-level value proposition
- route users toward sign-in/sign-up or application entry
- preserve the approved public brand language and landing-page design direction

## FAQ Page

Route:

```txt
/faq
```

Purpose:

- answer public product questions
- clarify the Vouch mechanism
- reduce confusion around payment authorization, confirmation, and release behavior

## Pricing Page

Route:

```txt
/pricing
```

Purpose:

- explain Vouch pricing at a public level
- communicate fees as customer-facing combined fees where appropriate
- avoid unnecessary breakdown complexity unless required by product/legal copy

## Terms Page

Route:

```txt
/legal/terms
```

Purpose:

- expose public Terms of Service
- support account acceptance and transaction-level consent flows

## Privacy Page

Route:

```txt
/legal/privacy
```

Purpose:

- expose public Privacy Policy
- explain what Vouch and providers collect or process

---

# 6. Authentication Surface

## Auth Routes

```txt
app/(auth)/sign-in/[[...sign-in]]/page.tsx
app/(auth)/sign-up/[[...sign-up]]/page.tsx
```

## Auth Feature Files

```txt
features/auth/sign-in-page.tsx
features/auth/sign-up-page.tsx
```

## Sign In

Route:

```txt
/sign-in
```

Purpose:

- authenticate existing users through Clerk
- preserve approved auth-page layout and styling
- route authenticated users into the app according to session state

## Sign Up

Route:

```txt
/sign-up
```

Purpose:

- create a new Vouch account through Clerk
- preserve approved onboarding/auth shell
- support later Vouch/Stripe flows after account creation

---

# 7. Form Architecture

All first-party forms use React Hook Form.

This includes:

- sign-in forms
- sign-up forms
- sign-out forms or sign-out confirmation controls when implemented as a form
- create Vouch form
- Vouch confirmation/disclaimer form
- presence confirmation form when implemented as a form
- archive/delete confirmation forms when implemented as forms

Rules:

- React Hook Form owns client-side form state.
- Zod schemas define validation contracts where user input exists.
- Server-side validation remains authoritative.
- Client-side validation is UX only.
- Form components stay in `components/**` unless they are route-level orchestration.
- Server actions own writes, redirects, provider operations, and persistence.

---

# 8. User Flows

## Merchant Onboarding Flow

```txt
click Connect
-> authenticate
-> create/retrieve connected account
-> redirect to Stripe Connect onboarding
-> Stripe handles KYC/banking/compliance
-> return to Vouch
```

## Customer Onboarding Flow

```txt
receive Stripe Checkout link
-> open Checkout
-> enter payment method
-> authorize payment
-> return to Vouch dashboard
```

## Create Vouch Flow

```txt
merchant opens /vouch
merchant enters amount/date/window
merchant submits React Hook Form
merchant lands on /vouch/confirm
merchant accepts disclaimer
merchant confirms
create Vouch + Stripe objects
redirect to dashboard
```

## Checkout Authorization Flow

```txt
merchant shares Checkout link
customer opens Stripe Checkout
customer authorizes payment
Stripe redirects customer back to Vouch
bind payment/customer state to Vouch
redirect customer to dashboard
```

## Presence Confirmation Flow

```txt
merchant opens Vouch detail page
customer opens Vouch detail page
both independently confirm presence
if both confirmations exist inside confirmation window:
  capture PaymentIntent
  release funds
otherwise:
  non-capture/cancel/expire
```

## Settlement Flow

```txt
both confirmations inside confirmation window
-> capture funds
-> release to merchant

anything else
-> non-capture / cancel / expire
```

## Archive Flow

```txt
archive Vouch
-> remove from active dashboard feed
-> preserve provider/audit history
```

---

# 9. Stripe Flows

## Stripe Checkout

Customer payment authorization occurs entirely on Stripe-hosted Checkout.

Vouch does not:

- host raw card forms
- collect card numbers directly
- manage billing address forms directly

## Stripe Connect

Stripe Connect handles:

- identity verification
- KYC
- payout bank setup
- tax/compliance collection
- payout management

Vouch does not host:

- payout forms
- tax forms
- banking forms
- payout dashboards

## PaymentIntent Lifecycle

```txt
create manual-capture PaymentIntent
-> customer authorizes payment
-> Vouch waits for bilateral confirmation
-> capture or non-capture according to state
```

## Application Fees

The Vouch fee is collected through Stripe application fee mechanics.

The fee applies regardless of settlement outcome because protocol execution itself is the service.

## Manual Capture

PaymentIntent requirement:

```txt
capture_method = manual
```

## Webhook Reconciliation

Stripe webhooks reconcile provider truth into Vouch state.

---

# 10. Dashboard Behavior

## Dashboard Philosophy

The dashboard is intentionally minimal.

## Dashboard Layout

The dashboard consists only of:

```txt
a vertical column of Vouch cards
```

There are no:

- tabs
- analytics panels
- status sections
- kanban boards
- lifecycle columns
- marketplace feeds
- inboxes
- scheduling panels

## Dashboard Cards

Each card displays:

```txt
Vouch amount
Appointment date
Confirmation window
Status
User role
Next action
```

## Card States

Cards support:

```txt
Open
Archive
```

## Empty States

Dashboard empty state is intentionally minimal.

---

# 11. Vouch Creation Behavior

## Create Vouch Page

Route:

```txt
/vouch
```

The page contains only the create Vouch form.

## Create Vouch Form

The create Vouch form must be implemented with React Hook Form.

Fields:

```txt
Vouch amount
Appointment date
Confirmation window
```

No customer field.

No memo field.

## Amount Input Rules

The amount field:

- supports USD only
- formats as currency
- rejects arbitrary text
- stores values server-side as integer cents

Example:

```txt
$100.00 -> 10000
```

## Fee Calculation Rules

The UI does not separately expose:

```txt
Stripe fee
Vouch fee
```

The UI exposes:

```txt
Fees
```

Example:

```txt
Vouch amount: $100.00
Fees: $8.20
Customer total: $108.20
```

## Confirmation Window Rules

Settlement eligibility depends entirely on bilateral confirmation inside the configured confirmation window.

## Draft Behavior

Drafts with no Stripe/provider activity may be deleted.

---

# 12. Vouch Confirmation Behavior

## Confirmation Page

Route:

```txt
/vouch/confirm
```

The page displays:

```txt
Vouch amount
Fees
Customer total
Appointment date
Confirmation window
Disclaimer acceptance checkbox
Confirm Vouch button
```

## Disclaimer Acceptance

Merchant must explicitly accept the disclaimer before finalizing creation.

## Final Confirmation Action

After confirmation:

```txt
create Vouch record
create Stripe Checkout Session
create manual-capture PaymentIntent
store Checkout Session ID
store Checkout URL
store PaymentIntent ID
write audit event
redirect merchant to dashboard
```

## Audit Writes

Vouch creation writes audit events.

---

# 13. Vouch Detail Behavior

## Shared Detail Page

Route:

```txt
/vouch/[vouchId]
```

Both merchant and customer open the same route.

The page is role-aware.

## Merchant Actions

```txt
Copy Checkout Link
Share Checkout Link
Archive
Confirm Presence
```

## Customer Actions

```txt
Confirm Presence
Archive
```

## Stripe Information Display

The detail page displays:

```txt
Stripe Checkout Session ID
Stripe PaymentIntent ID
Stripe payment authorization status
```

## Checkout Link Sharing

Example share payload:

```txt
You’ve received a Vouch.

Amount: $100.00
Appointment: May 20, 2026
Confirmation window: 2:30 PM – 3:30 PM

Authorize payment here:
{stripe_checkout_url}
```

## Presence Confirmation UI

Presence confirmation happens entirely inside Vouch.

---

# 14. Archive and Delete Rules

## Archive Rules

Archive:

```txt
removes card from active dashboard feed
preserves audit history
preserves Stripe/provider history
```

## Delete Rules

Delete only applies to drafts with no provider activity.

## Draft Deletion

Drafts may be deleted before Stripe objects exist.

## Provider-Linked Protection Rules

Provider-linked Vouches should not be hard deleted.

---

# 15. State Model

## Vouch States

```txt
Draft
Pending Authorization
Authorized
Awaiting Confirmation
Completed
Expired
Archived
```

## Confirmation States

```txt
Unconfirmed
Merchant Confirmed
Customer Confirmed
Both Confirmed
```

## Settlement States

```txt
Pending
Captured
Non-Captured
Canceled
Expired
```

## Archive States

```txt
Active
Archived
```

## Stripe Status Mapping

Stripe provider states are mapped into Vouch-safe status values.

---

# 16. Payment Model

## Customer Authorization

Customer authorization occurs through Stripe Checkout.

## Manual Capture

PaymentIntents use manual capture.

## Non-Capture

If bilateral confirmation conditions fail, the PaymentIntent is not captured.

## Settlement Execution

Settlement execution occurs only after bilateral confirmation.

## Provider Truth Rules

Stripe provider state is authoritative for payment state.

---

# 17. Fee Model

## Combined Fee Display

Fees are displayed as a single combined line item.

## Application Fee Mechanics

Vouch fees are collected through Stripe application fees.

## Fee Persistence Rules

The fee applies regardless of settlement outcome.

## Fee Outcome Rules

Protocol execution itself is the service.

---

# 18. Webhook Model

## Stripe Webhooks

Stripe webhooks reconcile provider truth into Vouch state.

## Idempotency Rules

Webhook processing must be idempotent.

## Reconciliation Rules

Provider truth reconciles into local persistence.

## Provider State Sync

Local state mirrors Stripe provider truth.

---

# 19. Authentication and Authorization Model

## Clerk Authentication

Authentication is handled through Clerk.

## Session Ownership

Only authenticated users may access protected routes.

## Merchant Access Rules

Merchants may create and manage Vouches they own.

## Customer Access Rules

Customers may access Vouches they participate in.

## Shared Access Rules

Access is role-aware and Vouch-scoped.

---

# 20. Data Model

## User Model

Stores authenticated user references.

## Vouch Model

Stores Vouch workflow metadata.

## Payment Model

Stores Stripe/provider payment references.

## Confirmation Model

Stores bilateral confirmation state.

## Audit Model

Stores workflow/audit events.

---

# 21. DTO Model

## Dashboard DTOs

Dashboard card DTOs:

```txt
id
displayId
amountCents
appointmentDate
confirmationWindowStart
confirmationWindowEnd
status
role
nextAction
isArchived
```

## Vouch DTOs

Vouch detail DTOs:

```txt
id
displayId
amountCents
feesCents
customerTotalCents
appointmentDate
confirmationWindowStart
confirmationWindowEnd
status
role
stripeCheckoutSessionId
stripeCheckoutUrl
stripePaymentIntentId
stripePaymentStatus
payerConfirmationStatus
payeeConfirmationStatus
settlementStatus
canConfirmPresence
canShareCheckoutLink
canArchive
```

## Payment DTOs

Payment DTOs expose Stripe-safe transport values only.

## Transport Safety Rules

No raw Stripe objects or Prisma models are exposed.

---

# 22. Schema Model

## Create Vouch Schema

```txt
createVouchDraftSchema
confirmCreateVouchSchema
```

## Confirmation Schema

```txt
confirmPresenceSchema
```

## Archive Schema

```txt
archiveVouchSchema
deleteDraftVouchSchema
```

## Validation Rules

Server-side validation is authoritative.

---

# 23. Fetcher Model

## Dashboard Fetchers

```txt
getDashboardVouches
```

## Vouch Fetchers

```txt
getCreateVouchPageData
getConfirmVouchPageData
getVouchDetail
```

## Protected Read Rules

Protected reads:

```txt
authenticate
authorize
minimal select
DTO mapping
transport-safe return
```

## DTO Mapping Rules

Fetchers return transport-safe DTOs only.

---

# 24. Action Model

## Vouch Actions

```txt
createVouchDraftAction
confirmCreateVouchAction
confirmPresenceAction
archiveVouchAction
deleteDraftVouchAction
```

## Stripe Redirect Actions

```txt
startStripeConnectAction
startStripePaymentManagementAction
```

## Presence Confirmation Actions

Presence confirmation is persisted transactionally.

## Archive Actions

Archive actions preserve provider history.

---

# 25. Transaction Model

## Vouch Transactions

```txt
create draft Vouch
finalize Vouch creation
persist Checkout Session
persist PaymentIntent reference
archive Vouch
delete draft Vouch
```

## Confirmation Transactions

```txt
write participant confirmation
prevent duplicate confirmation
derive bilateral confirmation state
```

## System Transactions

```txt
webhook idempotency
provider reconciliation writes
capture/cancel/refund state persistence
audit writes
```

## Atomic Write Rules

Critical writes must be transactional.

---

# 26. Stripe Integration Model

## Checkout Integration

Creates Stripe Checkout Sessions for Vouch authorization.

## Connect Integration

Creates/retrieves Stripe Connect onboarding/account-management sessions.

## Customer Integration

Creates/retrieves Stripe Customer records.

## PaymentIntent Integration

Handles PaymentIntent retrieval/capture/cancel behavior.

## Status Mapping

Maps Stripe provider statuses into Vouch-safe statuses.

## Webhook Events

Normalizes Stripe webhook events.

---

# 27. Feature Tree

## Feature Layer Philosophy

Features are orchestration only.

Features coordinate:

- page composition
- fetchers
- action-result mapping
- redirects
- route-level orchestration
- DTO handoff to components

Features are not reusable UI.

```txt
features/
├── auth/
│   ├── sign-in-page.tsx
│   └── sign-up-page.tsx
│
├── dashboard/
│   ├── dashboard-page.tsx
│   └── dashboard-empty-state.tsx
│
└── vouch/
    ├── create-vouch-page.tsx
    ├── confirm-vouch-page.tsx
    └── vouch-detail-page.tsx
```

---

# 28. Components Tree

## Component Layer Philosophy

Components are pure UI.

Components own:

- cards
- columns
- buttons
- panels
- inputs
- display formatting
- status rendering
- share/copy controls

Components do not:

- call Prisma
- call Stripe SDK
- own authz logic
- perform protected fetching

## Public/Auth Components

```txt
components/auth/
├── auth-page-shell.tsx
├── user-menu.tsx
└── sign-out.tsx

components/brand/
├── logo-lockup.tsx
└── verification-mark.tsx

components/navigation/
├── public-header.tsx
├── public-footer.tsx
├── user-menu.tsx
├── app-nav.tsx
├── connect-nav-action.tsx
└── payment-nav-action.tsx

components/forms/
├── field-group.tsx
├── field-error.tsx
└── form-error.tsx

components/feedback/
├── empty-state.tsx
└── loading-state.tsx

components/data-display/
└── summary-list.tsx
```

## Shared Presentation Components

```txt
components/shared/
├── page-hero.tsx
├── section-intro.tsx
├── cta-panel.tsx
├── callout-panel.tsx
├── surface.tsx
├── summary-panel.tsx
├── content-section-list.tsx
├── action-row.tsx
├── process-panel.tsx
├── card-grid.tsx
└── metric-grid.tsx
```

## Dashboard and Vouch Components

```txt
components/dashboard/
├── dashboard-vouch-column.tsx
├── dashboard-vouch-card.tsx
└── dashboard-vouch-card-actions.tsx

components/vouch/
├── amount-input.tsx
├── appointment-date-input.tsx
├── confirmation-window-input.tsx
├── create-vouch-form.client.tsx
├── create-vouch-summary.tsx
├── disclaimer-checkbox.tsx
├── confirm-vouch-summary.tsx
├── vouch-detail-summary.tsx
├── stripe-checkout-panel.tsx
├── payment-status-panel.tsx
├── confirmation-status-panel.tsx
├── copy-checkout-link-button.tsx
├── share-checkout-link-button.tsx
├── confirm-presence-button.tsx
├── archive-vouch-button.tsx
├── delete-draft-vouch-button.tsx
├── vouch-status-badge.tsx
├── vouch-role-badge.tsx
└── vouch-next-action.tsx
```

---

# 29. Approved UI Primitives

The following UI primitives are approved as foundational reusable primitives for public/auth pages and the broader app.

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

## UI Primitive Rules

UI primitives:

- are low-level reusable interface building blocks
- do not contain domain logic
- do not perform protected reads
- do not perform domain mutations
- do not call Prisma
- do not call Stripe SDKs
- do not enforce authorization
- may be composed by public, auth, tenant, admin, and Vouch-specific components

---

# 30. UI and Design Rules

## Brutalist Design System

The UI follows the Vouch brutalist operational SaaS design system.

## Layout Rules

Layouts should remain dense and operational.

## Typography Rules

Use uppercase operational typography where appropriate.

## Card Rules

Cards should remain flat and functional.

## Status Display Rules

Status must be communicated through text, not color alone.

## Mobile Rules

Layouts are mobile-first.

---

# 31. Public/Auth Architecture Rules

## app/**

Public/auth route files remain thin route shells.

They may:

- compose feature/page components
- define metadata
- hand off route context

They must not:

- contain protected database reads
- perform Stripe operations
- contain domain mutation logic
- shape protected DTOs

## features/auth/**

Auth feature files orchestrate auth page composition.

They may:

- compose auth shell components
- compose Clerk auth UI
- handle route-level auth page structure

They must not:

- become generic UI libraries
- contain reusable low-level UI that belongs in components/**

## components/**

Public/auth components are pure UI or reusable presentation components.

They must not:

- call Prisma
- call Stripe
- perform domain mutation
- perform protected fetching

---

Based on the repo, the landing page uses `PublicShell`, shared presentation components, and `content/marketing.tsx` as its copy source. The public legal/FAQ/pricing pages use the same content-module pattern through `content/faq.tsx`, `content/pricing.tsx`, and `content/legal.tsx`.

````md
---

# Public, Auth, and Shared Component Map

## Public Site Structure

The public site uses one visual system.

The landing page, FAQ page, pricing page, terms page, privacy page, and auth pages all share the same brutalist interface language.

The public pages use route files for page assembly.

The content files provide the text, labels, sections, steps, metrics, cards, icons, and callout payloads.

The shared components render the layout.

## Landing Page

Route:

```txt
app/page.tsx
````

The landing page renders the public homepage.

It uses:

```txt
components/navigation/public-shell.tsx
components/shared/page-hero.tsx
components/shared/process-panel.tsx
components/shared/metric-grid.tsx
components/shared/section-intro.tsx
components/shared/card-grid.tsx
components/shared/callout-panel.tsx
components/ui/button.tsx
content/marketing.tsx
```

The landing page pulls content from:

```txt
landingHeroContent
landingHeroActionsContent
landingSectionIntroContent
landingProcessSteps
landingProcessPanelContent
landingMetrics
landingUseCases
landingTrustPanelContent
```

The landing page renders:

```txt
public shell
homepage hero
primary create-account action
secondary learn-more action
Vouch process panel
metric grid
use-case card grid
trust callout panel
```

## Public Layout

Route layout:

```txt
app/(public)/layout.tsx
```

The public layout wraps public route children with:

```txt
PublicShell
```

The public layout gives FAQ, pricing, terms, and privacy the same header, footer, mobile navigation, background, and public site frame.

## FAQ Page

Route:

```txt
app/(public)/faq/page.tsx
```

The FAQ page renders public product questions and answers.

It uses:

```txt
components/shared/page-hero.tsx
components/shared/content-section-list.tsx
components/shared/callout-panel.tsx
components/ui/button.tsx
content/faq.tsx
```

The FAQ page pulls content from:

```txt
faqSections
faqCalloutContent
```

The FAQ page renders:

```txt
FAQ hero
mapped FAQ sections
create-Vouch callout
```

## Pricing Page

Route:

```txt
app/(public)/pricing/page.tsx
```

The pricing page explains the Vouch fee model and payment flow.

It uses:

```txt
components/shared/page-hero.tsx
components/shared/process-panel.tsx
components/shared/metric-grid.tsx
components/shared/section-intro.tsx
components/shared/callout-panel.tsx
components/ui/button.tsx
content/pricing.tsx
```

The pricing page pulls content from:

```txt
PricingHeroContent
pricingFlowSteps
pricingStats
pricingNotes
pricingCalloutContent
```

The pricing page renders:

```txt
pricing hero
payment flow panel
pricing metric grid
pricing note sections
create-Vouch callout
```

## Terms Page

Route:

```txt
app/(public)/legal/terms/page.tsx
```

The terms page renders the public Terms of Service.

It uses:

```txt
components/shared/page-hero.tsx
components/shared/content-section-list.tsx
components/shared/callout-panel.tsx
components/ui/button.tsx
content/legal.tsx
```

The terms page pulls content from:

```txt
termsSections
termsCalloutContent
```

The terms page renders:

```txt
legal hero
mapped terms sections
create-Vouch callout
```

## Privacy Page

Route:

```txt
app/(public)/legal/privacy/page.tsx
```

The privacy page renders the public Privacy Policy.

It uses:

```txt
components/shared/page-hero.tsx
components/shared/content-section-list.tsx
components/shared/callout-panel.tsx
components/ui/button.tsx
content/legal.tsx
```

The privacy page pulls content from:

```txt
privacySections
privacyCalloutContent
```

The privacy page renders:

```txt
privacy hero
mapped privacy sections
create-Vouch callout
```

## Content Directory

Directory:

```txt
content/
```

The content directory stores public-facing page content as typed exports.

Current content files:

```txt
content/marketing.tsx
content/faq.tsx
content/pricing.tsx
content/legal.tsx
```

## Marketing Content

File:

```txt
content/marketing.tsx
```

This file powers the landing page.

It exports:

```txt
landingHeroContent
landingHeroActionsContent
landingSectionIntroContent
landingProcessSteps
landingProcessPanelContent
landingMetrics
landingUseCases
landingTrustPanelContent
```

The landing page maps these exports into the public homepage components.

## FAQ Content

File:

```txt
content/faq.tsx
```

This file powers the FAQ page.

It exports:

```txt
faqSections
faqCalloutContent
```

`faqSections` feeds `ContentSectionList`.

`faqCalloutContent` feeds `CalloutPanel`.

## Pricing Content

File:

```txt
content/pricing.tsx
```

This file powers the pricing page.

It exports:

```txt
PricingHeroContent
pricingFlowSteps
pricingStats
pricingNotes
pricingCalloutContent
```

`pricingFlowSteps` feeds `ProcessPanel`.

`pricingStats` feeds `MetricGrid`.

`pricingNotes` feeds repeated `SectionIntro` blocks.

`pricingCalloutContent` feeds `CalloutPanel`.

## Legal Content

File:

```txt
content/legal.tsx
```

This file powers the terms and privacy pages.

It exports:

```txt
termsSections
termsCalloutContent
privacySections
privacyCalloutContent
```

`termsSections` feeds the Terms of Service page.

`privacySections` feeds the Privacy Policy page.

The callout exports feed the shared legal-page callout panels.

## Public Navigation Shell

File:

```txt
components/navigation/public-shell.tsx
```

`PublicShell` creates the public page frame.

It renders:

```txt
PublicHeader
public main content
PublicFooter
PublicMobileBottomNav
```

It wraps the public site in the shared black Vouch interface.

## Public Header

File:

```txt
components/navigation/public-header.tsx
```

`PublicHeader` renders the desktop public navigation and mobile logo header.

It uses:

```txt
LogoLockup
Button
Link
defaultPublicNavItems
```

It renders:

```txt
Vouch logo
Pricing link
FAQ link
Terms link
Privacy link
Sign in action
Get started action
mobile centered logo
```

## Public Footer

File:

```txt
components/navigation/public-footer.tsx
```

`PublicFooter` renders the public site footer.

It uses:

```txt
Button
Link
defaultPublicFooterLinks
```

It renders:

```txt
copyright line
Pricing link
FAQ link
Terms link
Privacy link
```

## Brand Component

File:

```txt
components/brand/logo-lockup.tsx
```

`LogoLockup` renders the Vouch brand mark and wordmark.

The public header, auth shell, and future tenant shell use it as the shared brand anchor.

## Shared Surface Component

File:

```txt
components/shared/surface.tsx
```

`Surface` renders the base Vouch panel.

It provides the reusable bordered, square, black-panel treatment.

It includes:

```txt
Surface
SurfaceHeader
SurfaceBody
SurfaceFooter
surfaceVariants
```

The shared public components use `Surface` to keep panels visually consistent.

## Page Hero Component

File:

```txt
components/shared/page-hero.tsx
```

`PageHero` renders the top hero block for public pages.

It accepts:

```txt
eyebrow
title
body
actions
className
titleClassName
bodyClassName
```

It renders:

```txt
optional eyebrow row
large uppercase display title
body copy
action row
```

The landing page, FAQ page, pricing page, terms page, and privacy page use this component.

## Section Intro Component

File:

```txt
components/shared/section-intro.tsx
```

`SectionIntro` renders section-level introductions.

It accepts:

```txt
eyebrow
title
body
actions
className
titleClassName
bodyClassName
```

It renders:

```txt
optional eyebrow row
uppercase section heading
supporting body text
optional action row
```

The landing and pricing pages use this component for content sections.

## Callout Panel Component

File:

```txt
components/shared/callout-panel.tsx
```

`CalloutPanel` renders a high-emphasis CTA or explanatory panel.

It accepts:

```txt
title
body
icon
actions
className
```

It renders:

```txt
optional icon
uppercase callout title
supporting body text
optional action area
```

The landing, FAQ, pricing, terms, privacy, and auth surfaces use this component.

## Card Grid Component

File:

```txt
components/shared/card-grid.tsx
```

`CardGrid` renders repeated cards from an item array.

It accepts:

```txt
items
className
cardClassName
```

Each item supports:

```txt
title
body
icon
href
actionLabel
```

It renders static cards or linked cards depending on the item payload.

The landing page uses it for use-case cards.

## Metric Grid Component

File:

```txt
components/shared/metric-grid.tsx
```

`MetricGrid` renders repeated metric tiles from an item array.

It accepts:

```txt
items
className
tileClassName
```

Each item includes:

```txt
label
value
body
```

The landing and pricing pages use it for compact product facts.

## Process Panel Component

File:

```txt
components/shared/process-panel.tsx
```

`ProcessPanel` renders a numbered workflow panel.

It accepts:

```txt
title
steps
footer
className
```

Each step includes:

```txt
number
title
body
icon
```

The landing page uses it for the Vouch process.

The pricing page uses it for the payment flow.

## Content Section List Component

File:

```txt
components/shared/content-section-list.tsx
```

`ContentSectionList` renders long-form mapped sections.

It accepts:

```txt
sections
className
sectionClassName
headingClassName
bodyClassName
paragraphClassName
```

Each section includes:

```txt
heading
body
```

The FAQ, terms, and privacy pages use it for structured text sections.

## Action Row Component

File:

```txt
components/shared/action-row.tsx
```

`ActionRow` renders grouped buttons and links inside hero and section components.

`PageHero` and `SectionIntro` use it to keep action spacing consistent.

## Auth Routes

Routes:

```txt
app/(auth)/sign-in/[[...sign-in]]/page.tsx
app/(auth)/sign-up/[[...sign-up]]/page.tsx
```

The auth route files render the auth shell and place the correct auth form inside it.

The sign-in route renders:

```txt
AuthPageShell
LoginForm
```

The sign-up route renders:

```txt
AuthPageShell
SignupForm
```

## Auth Page Shell

File:

```txt
components/auth/auth-page-shell.tsx
```

`AuthPageShell` creates the auth page frame.

It accepts:

```txt
children
eyebrow
title
description
footnote
variant
```

It renders:

```txt
brand header
home link
form column
footer note
desktop side panel
auth principle callout cards
commit-confirm-covered sequence
```

It uses:

```txt
LogoLockup
CalloutPanel
Link
```

The auth shell blends the auth pages into the same public-site visual system.

## Sign-In Feature

File:

```txt
features/auth/sign-in-page.tsx
```

`LoginForm` renders the sign-in form.

It uses:

```txt
React Hook Form
Clerk sign-in
Zod login validation
Zod verification validation
FieldGroup
SubmitButton
Button
Input
Field
FieldLabel
FieldDescription
FieldError
```

It handles:

```txt
email input
password input
second-factor code input
verification code resend
sign-in reset
post-auth redirect
form-level errors
field-level errors
```

## Sign-Up Feature

File:

```txt
features/auth/sign-up-page.tsx
```

`SignupForm` renders the sign-up form.

It uses:

```txt
React Hook Form
Clerk sign-up
Zod signup validation
Zod verification validation
FieldGroup
SubmitButton
Button
Checkbox
Input
Field
FieldLabel
FieldDescription
FieldError
```

It handles:

```txt
first name input
last name input
email input
password input
user agreement acceptance
email verification code input
verification code resend
sign-up reset
post-auth redirect
form-level errors
field-level errors
```

## Form Components

Current auth forms use:

```txt
components/forms/field-group.tsx
components/forms/submit-button.tsx
components/ui/field.tsx
components/ui/input.tsx
components/ui/checkbox.tsx
components/ui/button.tsx
```

`FieldGroup` renders labeled input groups.

`SubmitButton` renders submit actions with pending labels.

`Field`, `FieldLabel`, `FieldDescription`, and `FieldError` render low-level form structure.

`Input` renders the brutalist text field.

`Checkbox` renders agreement acceptance controls.

`Button` renders public, auth, and action buttons.

## Tenant Shell

The tenant route group uses its own application shell.

Tenant shell files:

```txt
components/navigation/tenant-shell.tsx
components/navigation/tenant-header.tsx
components/navigation/tenant-footer.tsx
components/navigation/tenant-nav.tsx
```

The tenant shell renders:

```txt
tenant header
tenant navigation
tenant main content
tenant footer
```

The tenant header uses the same Vouch brand system as the public header.

The tenant navigation renders the signed-in app navigation:

```txt
Dashboard
Vouch
Connect
Payment
```

`Dashboard` links to:

```txt
/dashboard
```

`Vouch` links to:

```txt
/vouch
```

`Connect` starts the Stripe Connect redirect action.

`Payment` starts the Stripe-hosted payment management redirect action.

The tenant footer renders compact signed-in context and keeps the app frame visually connected to the public site.

## Website-Wide Component Set

The website uses this component foundation:

```txt
components/shared/page-hero.tsx
components/shared/section-intro.tsx
components/shared/callout-panel.tsx
components/shared/card-grid.tsx
components/shared/metric-grid.tsx
components/shared/process-panel.tsx
components/shared/content-section-list.tsx
components/shared/action-row.tsx
components/shared/surface.tsx

components/navigation/public-shell.tsx
components/navigation/public-header.tsx
components/navigation/public-footer.tsx
components/navigation/mobile-bottom-nav.tsx
components/navigation/tenant-shell.tsx
components/navigation/tenant-header.tsx
components/navigation/tenant-footer.tsx
components/navigation/tenant-nav.tsx

components/auth/auth-page-shell.tsx

components/forms/field-group.tsx
components/forms/submit-button.tsx

components/brand/logo-lockup.tsx

components/ui/button.tsx
components/ui/input.tsx
components/ui/checkbox.tsx
components/ui/field.tsx
```

## Component Content Flow

The public pages follow this flow:

```txt
content file
-> typed content export
-> route page imports content
-> route page passes content into shared component
-> shared component maps and renders the UI
```

The repeated sections follow this shape:

```txt
array of content objects
-> .map()
-> repeated cards, metrics, steps, links, or sections
```

The page components provide structure.

The content modules provide language.

The shared components provide presentation.

The route files assemble the finished page.

---

# 33. Validation and Testing Expectations

## Validation Commands

```bash
pnpm lint
pnpm typecheck
pnpm test
```

## Unit Test Coverage

Required unit coverage:

- fee math
- status mapping
- confirmation rules
- duplicate confirmation prevention
- settlement rules

## Integration Test Coverage

Required integration coverage:

- Checkout creation
- webhook reconciliation
- Stripe redirect flows

## E2E Coverage

Required E2E coverage:

- merchant onboarding
- customer authorization
- bilateral confirmation
- archive behavior

## Contract Enforcement

Architecture boundaries should be continuously enforced.

I verified the current repo inventory across `types`, `schemas`, `lib/db/selects`, and `lib/db/transactions`. The core Vouch contract files exist in those folders, and the repo also still contains broader admin/analytics/notification/settings/system inventory that needs explicit review before the final master plan locks the app surface.

````md
---

# Types, Schemas, Selects, and Transactions Map

## Data Contract Structure

Vouch uses four data-contract layers:

```txt
types/*
schemas/*
lib/db/selects/*
lib/db/transactions/*
````

`types/*` defines TypeScript contracts used by pages, features, components, actions, fetchers, integrations, and tests.

`schemas/*` validates and sanitizes external input, form input, search params, route params, provider returns, and server-action payloads.

`lib/db/selects/*` defines the database query shapes used to return Vouch-safe DTO data.

`lib/db/transactions/*` defines atomic database write operations used by server actions and system resolution flows.

---

# Type Files

## Common Types

File:

```txt
types/common.ts
```

This file defines shared primitive transport types.

It defines:

```txt
ID
PublicID
UserID
VouchID
InvitationToken
ISODateTime
CurrencyCode
MoneyCents
PercentageBasisPoints
Environment
SortDirection
AsyncStatus
PageMode
DeviceVariant
PaginationInput
PaginationState
DateRangeInput
SelectOption
FieldErrorState
ServerErrorState
```

It gives the app shared names for IDs, money, currency, dates, pagination, UI state, and safe server errors.

## Auth Types

File:

```txt
types/auth.ts
```

This file defines authentication, authorization, session, auth form, and Clerk webhook contracts.

It defines:

```txt
BASE_ROLE_VALUES
CONTEXTUAL_ROLE_VALUES
USER_STATUS_VALUES
SETUP_REQUIREMENT_VALUES
BaseRole
ContextualRole
UserStatus
SetupRequirement
AuthCapability
AdminCapability
VouchAccessInput
VouchReadinessInput
AcceptVouchAuthzInput
ConfirmPresenceAuthzInput
AuthzContext
SessionContext
SessionUser
Session
SetupStatus
AuthRedirectSearchParams
LoginPageProps
SignupPageProps
LoginFormValues
SignupFormValues
LoginFormProps
SignupFormProps
SUPPORTED_CLERK_WEBHOOK_EVENT_TYPES
SupportedClerkWebhookEventType
ClerkWebhookEventType
ClerkWebhookUserData
ClerkWebhookEvent
ClerkWebhookProcessingStatus
ClerkWebhookProcessingResult
```

It powers login, signup, session shaping, role-aware access, setup-readiness checks, and Clerk webhook processing.

## User Types

File:

```txt
types/user.ts
```

This file defines user account and profile contracts.

It defines:

```txt
UserStatus
UserSafeIdentity
PrivateAccountInfo
ProfileBasicsInput
UserStatusChangeInput
AccountPageVariant
```

It powers safe user display, private account display, profile editing, and account status changes.

## Setup Types

File:

```txt
types/setup.ts
```

This file defines setup readiness, verification readiness, payment readiness, payout readiness, setup blockers, and setup page state.

It defines:

```txt
USER_STATUSES
UserStatus
VERIFICATION_STATUSES
VerificationStatus
PAYMENT_READINESS_STATUSES
PaymentReadinessStatus
PAYOUT_READINESS_STATUSES
PayoutReadinessStatus
SetupRequirementKey
SetupRequirementStatus
SetupChecklistItem
SetupStatus
SetupGateName
SetupBlockerCode
SetupGateResult
SetupGateState
ConfirmationGateInput
SetupPageState
```

It powers create, accept, confirm, and settings readiness gates.

## Verification Types

File:

```txt
types/verification.ts
```

This file defines identity/adult verification contracts.

It defines:

```txt
VerificationStatus
VerificationKind
VerificationStartInput
VerificationProviderReturnInput
VerificationStatusUpdateInput
VerificationPageVariant
```

It powers identity verification, adult verification, provider return handling, and verification page state.

## Payment Types

File:

```txt
types/payment.ts
```

This file defines provider, payment readiness, payout readiness, payment state, refund state, and payment operation inputs.

It defines:

```txt
PaymentProvider
VerificationProvider
PaymentReadinessStatus
PayoutReadinessStatus
PaymentStatus
RefundStatus
RefundReason
StartPaymentMethodSetupInput
StartPayoutOnboardingInput
PaymentProviderReturnInput
PaymentOperationInput
PaymentFailureInput
PaymentFailureStage
```

It powers Stripe setup, payout setup, payment authorization, capture/release, refund/void, and failure handling.

## Vouch Types

File:

```txt
types/vouch.ts
```

This file defines the core Vouch lifecycle contracts.

It defines:

```txt
VouchStatus
InvitationStatus
ParticipantRole
ConfirmationStatus
AggregateConfirmationStatus
ConfirmationMethod
RecipientMethod
CreateVouchInput
FeePreviewInput
SendVouchInvitationInput
ResendVouchInvitationInput
InviteTokenInput
AcceptVouchInput
DeclineVouchInput
CancelPendingVouchInput
ConfirmPresenceInput
VouchListQuery
VouchListStatusFilter
VouchListSort
VouchDetailVariant
ConfirmPresenceVariant
```

It powers Vouch creation, invite acceptance, invite decline, presence confirmation, list filtering, detail-state rendering, and confirmation-page rendering.

## Dashboard Types

File:

```txt
types/dashboard.ts
```

This file defines dashboard section and dashboard search-param contracts.

It defines:

```txt
DashboardSectionID
DashboardVariant
DashboardSearchParams
DashboardSectionState
```

It powers dashboard state, section grouping, and dashboard query parsing.

## Audit Types

File:

```txt
types/audit.ts
```

This file defines audit actor, entity, event, write, and filter contracts.

It defines:

```txt
AuditActorType
AuditEntityType
AuditEventName
WriteAuditEventInput
AuditFilterInput
```

It powers audit writes, audit timelines, admin audit filters, provider reconciliation audit events, and Vouch lifecycle event tracking.

## Current Repo Type Inventory Pending Review

The repo also contains these type files:

```txt
types/admin.ts
types/analytics.ts
types/notification.ts
types/settings.ts
types/system.ts
```

These files exist in current repo inventory. They need section-by-section review before the master plan classifies them as retained app contracts or implementation drift.

---

# Zod Schema Files

## Common Schemas

File:

```txt
schemas/common.ts
```

This file defines shared validation, coercion, normalization, and sanitization helpers.

It defines:

```txt
emptyStringToUndefined
trimString
normalizeEmail
normalizeCurrency
sanitizeInternalPath
coercePositiveInt
coerceMoneyCents
idSchema
publicIdSchema
userIdSchema
vouchIdSchema
invitationTokenSchema
isoDateTimeSchema
currencyCodeSchema
moneyCentsSchema
positiveMoneyCentsSchema
percentageBasisPointsSchema
paginationInputSchema
dateRangeInputSchema
internalReturnToPathSchema
emailSchema
optionalEmailSchema
trimmedStringSchema
optionalTrimmedStringSchema
shortLabelSchema
privateNoteSchema
safeSearchParamSchema
safeMetadataSchema
```

It sanitizes strings, emails, currency, return paths, date ranges, money cents, IDs, metadata, pagination, and safe optional values.

## Auth Schemas

File:

```txt
schemas/auth.ts
```

This file validates auth forms, auth redirects, user sync payloads, roles, and Clerk webhook payloads.

It defines:

```txt
loginSchema
signupSchema
verificationSchema
baseRoleSchema
userSyncSchema
UserSyncInput
authRedirectSearchParamsSchema
AuthRedirectSearchParams
supportedClerkWebhookEventTypeSchema
clerkWebhookEventSchema
```

It trims and normalizes email addresses, validates passwords, validates verification codes, restricts auth redirects to internal paths, and parses Clerk webhook data.

## User Schemas

File:

```txt
schemas/user.ts
```

This file validates user profile and account-status payloads.

It defines:

```txt
userStatusSchema
displayNameSchema
optionalPhoneSchema
profileBasicsInputSchema
userStatusChangeInputSchema
authProviderUserInputSchema
userSafeIdentitySchema
privateAccountInfoSchema
accountPageVariantSchema
```

It trims display names, normalizes optional phone values, validates auth-provider user input, and validates private account DTO values.

## Setup Schemas

File:

```txt
schemas/setup.ts
```

This file validates terms acceptance and setup return-flow payloads.

It defines:

```txt
CURRENT_TERMS_VERSION
internalReturnToSchema
acceptTermsSchema
AcceptTermsInput
setupIntentSchema
setupPageStateInputSchema
SetupIntentInput
startSetupProviderFlowSchema
StartSetupProviderFlowInput
```

It validates current terms acceptance, setup intent, provider-flow return paths, and internal redirect targets.

## Verification Schemas

File:

```txt
schemas/verification.ts
```

This file validates identity/adult verification inputs and provider return data.

It defines:

```txt
verificationStatusSchema
verificationKindSchema
verificationProviderSchema
sanitizedVerificationProviderReferenceSchema
sanitizedVerificationFailureCodeSchema
verificationStartInputSchema
verificationProviderReturnInputSchema
verificationStatusUpdateInputSchema
verificationPageVariantSchema
```

It validates verification kind, Stripe Identity provider returns, provider references, failure codes, and verification page variants.

## Payment Schemas

File:

```txt
schemas/payment.ts
```

This file validates payment setup, payout setup, provider returns, payment operations, webhook headers, webhook envelopes, and payment failures.

It defines:

```txt
paymentProviderSchema
verificationProviderSchema
paymentReadinessStatusSchema
payoutReadinessStatusSchema
paymentStatusSchema
refundStatusSchema
refundReasonSchema
paymentFailureStageSchema
sanitizedProviderReferenceSchema
sanitizedPaymentFailureCodeSchema
sanitizedSafePaymentMessageSchema
idempotencyKeySchema
startPaymentMethodSetupInputSchema
startPayoutOnboardingInputSchema
paymentProviderReturnInputSchema
paymentOperationInputSchema
initializeVouchPaymentInputSchema
authorizeVouchPaymentInputSchema
captureOrReleaseVouchPaymentInputSchema
refundOrVoidVouchPaymentInputSchema
paymentFailureInputSchema
stripeWebhookHeadersSchema
paymentWebhookEnvelopeSchema
paymentWebhookProcessInputSchema
paymentReadinessInputSchema
```

It validates Stripe setup flows, Stripe return payloads, payment operation inputs, idempotency keys, failure data, and webhook processing payloads.

## Vouch Schemas

File:

```txt
schemas/vouch.ts
```

This file validates Vouch lifecycle inputs.

It defines:

```txt
vouchStatusSchema
invitationStatusSchema
participantRoleSchema
confirmationStatusSchema
aggregateConfirmationStatusSchema
confirmationMethodSchema
recipientMethodSchema
vouchListStatusFilterSchema
vouchListSortSchema
vouchDetailVariantSchema
confirmPresenceVariantSchema
vouchIdParamSchema
inviteTokenParamSchema
inviteTokenInputSchema
feePreviewInputSchema
createVouchDraftInputSchema
sendVouchInvitationInputSchema
resendVouchInvitationInputSchema
cancelPendingVouchInputSchema
vouchCurrencySchema
vouchLabelSchema
createVouchSchema
CreateVouchInput
acceptVouchSchema
AcceptVouchInput
declineVouchSchema
DeclineVouchInput
confirmPresenceSchema
ConfirmPresenceInput
vouchListSearchParamsSchema
VouchListSearchParams
vouchListQuerySchema
createVouchInputSchema
acceptVouchInputSchema
declineVouchInputSchema
confirmPresenceInputSchema
```

It validates amount cents, USD currency, meeting time, confirmation window, recipient email, labels, terms acceptance, disclaimer acceptance, invite tokens, decline inputs, presence confirmation inputs, and Vouch list search params.

## Current Repo Schema Inventory Pending Review

The repo also contains these schema files:

```txt
schemas/admin.ts
schemas/analytics.ts
schemas/audit.ts
schemas/dashboard.ts
schemas/marketing.ts
schemas/notification.ts
schemas/settings.ts
schemas/system.ts
```

These files exist in current repo inventory. They need section-by-section review before the master plan classifies them as retained app schemas or implementation drift.

---

# Database Select / DTO Files

## User Selects

File:

```txt
lib/db/selects/user.selects.ts
```

This file defines safe user query shapes.

It defines:

```txt
userIdSelect
userAuthLookupSelect
userSessionSelect
userSafeIdentitySelect
userPrivateAccountSelect
userAccountStatusSelect
userOperationalSnapshotSelect
userWithReadinessSelect
adminUserListItemSelect
adminUserDetailSelect
```

It returns session-safe user data, public participant identity data, private account data, readiness relations, and admin user views.

## Setup Selects

File:

```txt
lib/db/selects/setup.selects.ts
```

This file defines setup readiness query shapes.

It defines:

```txt
setupChecklistSelect
setupProgressSelect
createVouchSetupGateSelect
acceptVouchSetupGateSelect
confirmPresenceSetupGateSelect
accountReadinessSummarySelect
termsAcceptanceStatusSelect
```

It returns active-user status, verification readiness, payment readiness, payout readiness, connected-account readiness, and latest terms acceptance.

## Verification Selects

File:

```txt
lib/db/selects/verification.selects.ts
```

This file defines verification query shapes.

It defines:

```txt
verificationStatusSelect
identityVerificationStateSelect
adultVerificationStateSelect
verificationStatusCardSelect
adminVerificationSummarySelect
```

It returns identity status, adult status, payment readiness, payout readiness, provider reference, and admin verification summaries.

## Payment Selects

File:

```txt
lib/db/selects/payment.selects.ts
```

This file defines payment, payout, refund, and webhook query shapes.

It defines:

```txt
paymentCustomerReadinessSelect
connectedAccountReadinessSelect
paymentSettingsSelect
payoutSettingsSelect
paymentRecordParticipantSummarySelect
refundRecordParticipantSummarySelect
paymentStatusCardSelect
refundStatusCardSelect
adminPaymentListItemSelect
adminPaymentDetailSelect
paymentWebhookEventListItemSelect
paymentWebhookEventDetailSelect
```

It returns Stripe customer readiness, Stripe connected-account readiness, payment record summaries, refund summaries, admin payment details, and webhook event details.

## Invitation Selects

File:

```txt
lib/db/selects/invitation.selects.ts
```

This file defines invite-token and invitation-state query shapes.

It defines:

```txt
invitationTokenLookupSelect
invitationSummarySelect
invitationStatusSelect
invitedVouchSummarySelect
adminInvitationSelect
```

It returns invite token lookup data, invitation lifecycle status, recipient email, expiration, accepted/declined timestamps, and the invited Vouch summary.

## Confirmation Selects

File:

```txt
lib/db/selects/confirmation.selects.ts
```

This file defines presence-confirmation query shapes.

It defines:

```txt
confirmationParticipantSummarySelect
confirmationStatusSelect
aggregateConfirmationSelect
confirmPresenceEligibilitySelect
adminConfirmationSelect
```

It returns confirmation participant role, confirmation status, confirmation method, confirmation timestamp, duplicate-check inputs, and confirmation eligibility data.

## Vouch Selects

File:

```txt
lib/db/selects/vouch.selects.ts
```

This file defines Vouch list, detail, confirmation, payment, timeline, and admin query shapes.

It defines:

```txt
vouchIdSelect
vouchCardSelect
vouchListItemSelect
payerVouchListItemSelect
payeeVouchListItemSelect
vouchDetailBaseSelect
vouchDetailForParticipantSelect
vouchDetailPendingPayerSelect
vouchDetailPendingInviteSentSelect
vouchDetailActiveBeforeWindowSelect
vouchDetailActiveWindowOpenSelect
vouchDetailCompletedSelect
vouchDetailExpiredSelect
vouchDetailRefundedSelect
vouchDetailFailedSelect
vouchConfirmationStateSelect
vouchWindowSummarySelect
vouchPaymentSummarySelect
vouchTimelineSelect
whatHappensNextSelect
adminVouchListItemSelect
adminVouchDetailSelect
adminVouchFailureStateSelect
```

It returns Vouch card data, participant identity, invitation summary, confirmation summary, payment summary, refund summary, notification events, webhook events, timeline data, and admin Vouch detail data.

## Audit Selects

File:

```txt
lib/db/selects/audit.selects.ts
```

This file defines audit event query shapes.

It defines:

```txt
participantSafeAuditTimelineItemSelect
participantSafeAuditTimelineSelect
adminAuditListItemSelect
adminAuditEventDetailSelect
vouchAuditSummarySelect
paymentAuditSummarySelect
userAuditSummarySelect
```

It returns participant-safe audit timeline entries, admin audit list entries, audit event details, and audit summaries by entity type.

## Notification Selects

File:

```txt
lib/db/selects/notification.selects.ts
```

This file defines notification event query shapes.

It defines:

```txt
notificationEventListItemSelect
notificationEventDetailSelect
notificationDeliveryStateSelect
vouchNotificationEventsSelect
adminNotificationEventSelect
```

It returns notification event status, channel, recipient, provider message ID, error code, delivery timestamps, related Vouch summary, and admin notification detail data.

---

# Database Transaction Files

## Setup Transactions

File:

```txt
lib/db/transactions/setupTransactions.ts
```

This file writes setup and terms state.

It defines:

```txt
acceptTermsTx
ensureTermsAcceptanceTx
updateSetupGateSnapshotTx
markSetupBlockedTx
markSetupReturnedFromInviteTx
markSetupReturnedFromCreateTx
```

It accepts terms, reads terms acceptance, verifies setup user existence, marks blocked setup state, records return-from-invite state, and records return-from-create state.

## Verification Transactions

File:

```txt
lib/db/transactions/verificationTransactions.ts
```

This file writes verification profile state.

It defines:

```txt
createVerificationProfileTx
updateIdentityVerificationStatusTx
updateAdultVerificationStatusTx
updateVerificationProviderReferenceTx
markVerificationPendingTx
markVerificationVerifiedTx
markVerificationRejectedTx
markVerificationRequiresActionTx
markVerificationExpiredTx
updateVerificationProfileTx
```

It creates verification profiles, updates identity status, updates adult status, stores provider references, stores failure state, and updates payment/payout readiness on the verification profile.

## Vouch Transactions

File:

```txt
lib/db/transactions/vouchTransactions.ts
```

This file writes Vouch lifecycle state.

It defines:

```txt
createVouchTx
updateVouchStatusTx
bindPayeeToVouchTx
cancelPendingVouchTx
markVouchActiveTx
markVouchCompletedTx
markVouchExpiredTx
markVouchRefundedTx
markVouchCanceledTx
markVouchFailedTx
completeVouchWithPaymentReleaseTx
expireVouchWithRefundTx
markResolutionFailureTx
```

It creates Vouches, stores pricing snapshot values, binds payees, moves Vouches through pending, active, completed, expired, refunded, canceled, and failed states, and supports release/refund resolution transitions.

## Invitation Transactions

File:

```txt
lib/db/transactions/invitationTransactions.ts
```

This file writes invitation lifecycle state.

It defines:

```txt
createInvitationTx
markInvitationSentTx
markInvitationOpenedTx
markInvitationAcceptedTx
markInvitationDeclinedTx
markInvitationExpiredTx
invalidateInvitationTx
rotateInvitationTokenHashTx
```

It creates invitations, stores token hashes, marks sent/opened/accepted/declined/expired states, invalidates invitations, and rotates invite token hashes.

## Confirmation Transactions

File:

```txt
lib/db/transactions/confirmationTransactions.ts
```

This file writes and derives presence confirmation state.

It defines:

```txt
assertNoDuplicateConfirmationTx
createPresenceConfirmationTx
getAggregateConfirmationStatusTx
markConfirmationWindowOpenedTx
```

It prevents duplicate confirmation, validates the confirmation window, validates participant authorization, writes presence confirmation, derives aggregate confirmation status, and verifies the confirmation-window Vouch exists.

## System Transactions

File:

```txt
lib/db/transactions/systemTransactions.ts
```

This file writes system-level operational audit events.

It defines:

```txt
recordOperationalErrorTx
recordServerActionFailureTx
recordProviderUnavailableTx
recordMaintenanceBannerTx
```

It records reconciliation failures, server-action failures, provider unavailable state, and maintenance banner events through system audit writes.

## Payment Transaction Status

File checked:

```txt
lib/db/transactions/paymentTransactions.ts
```

Current repo status:

```txt
not present
```

Payment persistence currently uses payment selects and action/integration flows. A dedicated payment transaction file does not exist in the current repo snapshot I inspected.

---

# Consolidated Target Contract Set

## Retained Type Files

```txt
types/common.ts
types/auth.ts
types/user.ts
types/setup.ts
types/verification.ts
types/payment.ts
types/vouch.ts
types/dashboard.ts
types/audit.ts
```

## Retained Schema Files

```txt
schemas/common.ts
schemas/auth.ts
schemas/user.ts
schemas/setup.ts
schemas/verification.ts
schemas/payment.ts
schemas/vouch.ts
```

## Retained Select / DTO Files

```txt
lib/db/selects/user.selects.ts
lib/db/selects/setup.selects.ts
lib/db/selects/verification.selects.ts
lib/db/selects/payment.selects.ts
lib/db/selects/invitation.selects.ts
lib/db/selects/confirmation.selects.ts
lib/db/selects/vouch.selects.ts
lib/db/selects/audit.selects.ts
lib/db/selects/notification.selects.ts
```

## Retained Transaction Files

```txt
lib/db/transactions/setupTransactions.ts
lib/db/transactions/verificationTransactions.ts
lib/db/transactions/vouchTransactions.ts
lib/db/transactions/invitationTransactions.ts
lib/db/transactions/confirmationTransactions.ts
lib/db/transactions/systemTransactions.ts
```

## Missing Dedicated Transaction File

```txt
lib/db/transactions/paymentTransactions.ts
```

This file does not exist in the current repo snapshot.

The final payment persistence model either keeps payment writes inside existing action/system flows or creates a dedicated payment transaction file for:

```txt
create payment record
update payment authorization state
update capture/release state
update void state
create refund record
update refund state
record webhook processing state
record provider reconciliation state
```