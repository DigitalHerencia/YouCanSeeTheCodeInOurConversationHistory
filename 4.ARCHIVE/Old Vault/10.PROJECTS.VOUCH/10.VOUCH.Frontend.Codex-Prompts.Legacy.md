# Vouch Codex Frontend Execution Prompts

## Purpose

These prompts convert the Vouch frontend taxonomy and implementation matrix into sequential execution passes optimized for Codex-style implementation workflows.

The prompts are intentionally ordered.

Do not skip ahead.

Each pass establishes constraints required by the next pass.

The execution strategy is:

```txt
canonize
-> inventory
-> normalize
-> orchestrate
-> standardize
-> optimize
-> harden
```

The goal is not to maximize feature count.

The goal is to produce a narrow, deterministic, production-grade frontend architecture aligned with the Vouch source of truth.

---

# Prompt 1 — Frontend Inventory and Classification Audit

## Goal

Inventory the current frontend architecture and classify every artifact according to the canonical Vouch page taxonomy and frontend implementation matrix.

## Prompt

You are auditing a Next.js App Router production SaaS frontend against a canonical interface taxonomy and implementation matrix.

Your task is to inventory and classify the current frontend architecture.

Use the following rules:

- Every frontend artifact must map to an approved page category, feature orchestration, domain component, shared component, interaction surface, or UI primitive.
- If an artifact does not clearly serve a canonical purpose, classify it for removal, merge, or review.
- The Vouch product surface is intentionally narrow.
- Do not invent marketplace, messaging, dispute, analytics, profile, review, or discovery surfaces.

Audit these directories:

```txt
app/**
features/**
components/**
content/**
lib/fetchers/**
lib/actions/**
schemas/**
types/**
```

For every file output:

```txt
path
classification
page category association
keep/rename/move/remove recommendation
boundary violations
architecture concerns
```

Create a final artifact:

```txt
.agents/json/frontend-inventory-audit.json
```

Do not modify code yet.

This pass is inventory and classification only.

---

# Prompt 2 — Route Group and Layout Normalization

## Goal

Normalize the App Router structure around canonical route groups, layouts, loading states, and error boundaries.

## Prompt

You are refactoring a Next.js App Router SaaS frontend.

Normalize the route architecture according to the canonical Vouch frontend implementation matrix.

Required route groups:

```txt
app/(public)
app/(auth)
app/(tenant)
```

Required layout ownership:

```txt
root layout -> global providers and globals only
(public) layout -> public shell/header/footer
(auth) layout -> auth shell
(tenant) layout -> authenticated tenant shell and nav
```

Ensure every route group contains:

```txt
layout.tsx
loading.tsx
error.tsx
```

Ensure route files remain thin:

- no Prisma
- no Stripe business logic
- no DTO shaping
- no React Hook Form orchestration
- no provider state truth

Move orchestration into features.

Output complete updated files.

Do not invent new pages.

---

# Prompt 3 — Feature Orchestration Extraction

## Goal

Extract route-level orchestration into canonical feature modules.

## Prompt

Refactor the frontend so that all page orchestration lives inside canonical feature modules.

Required feature inventory:

```txt
features/marketing/landing-page.tsx
features/marketing/pricing-page.tsx
features/legal/legal-page.tsx
features/dashboard/dashboard-page.tsx
features/vouches/create-vouch-page.tsx
features/vouches/create-vouch-page.client.tsx
features/vouches/vouch-detail-page.tsx
features/vouches/vouch-detail-page.client.tsx
features/payments/checkout-success-page.tsx
features/auth/sign-in-page.tsx
features/auth/sign-up-page.tsx
```

Rules:

- route pages are orchestration shells only
- server features own fetcher orchestration
- client features own interaction state only
- components render DTOs only
- shared components must not own business logic

Extract orchestration out of pages.

Output complete updated files.

---

# Prompt 4 — Shared Component Purpose Audit

## Goal

Audit and normalize shared components so that every component has a canonical architectural purpose.

## Prompt

Audit all shared frontend components.

Classify each component into one of these groups:

```txt
shared page component
domain component
form component
interaction surface
UI primitive
remove/merge candidate
```

Rules:

- Components must exist because they serve a reusable interface purpose.
- Components must not exist solely because they look visually interesting.
- Shared components must not own business logic.
- Shared components must not perform protected fetching.
- Shared components must not call Prisma, Stripe, or Clerk server APIs.

Normalize shared components around these canonical surfaces:

```txt
PageHero
LandingHero
SectionIntro
CalloutPanel
ProcessPanel
ContentSectionList
CardGrid
Surface
StatusStrip
```

Normalize Vouch domain components around:

```txt
VouchCard
VouchCardList
VouchDetailHeader
VouchTermsSummary
LifecycleStatusPanel
PaymentStatusPanel
ConfirmationPanel
VouchCodeExchangePanel
VouchTimelinePanel
VouchActionsPanel
ProtocolDrawer
```

Output complete updated files.

---

# Prompt 5 — UI Primitive Hardening

## Goal

Standardize and optimize UI primitives for Vouch’s brutalist operational SaaS design language.

## Prompt

Refactor and standardize all frontend UI primitives.

Required primitives:

```txt
Button
Input
Checkbox
Form
Drawer
Dialog
AlertDialog
Badge
Separator
Surface
Skeleton
Toast
Tooltip
```

Rules:

- Use Tailwind CSS v4 syntax.
- Use brutalist operational SaaS styling.
- Prefer square edges.
- Prefer high contrast.
- Use restrained blue accents.
- Status must not rely on color alone.
- Ensure mobile-first usability.
- Ensure keyboard accessibility.
- Ensure visible focus states.
- Ensure disabled/loading states.

Do not embed Vouch business logic into primitives.

Do not create decorative primitives without purpose.

Output complete updated files.

---

# Prompt 6 — Content Module Extraction

## Goal

Extract repeated copy into structured typed content modules.

## Prompt

Normalize repeated copy into typed content modules.

Create or normalize:

```txt
content/marketing.tsx
content/pricing.tsx
content/faq.tsx
content/legal.tsx
content/dashboard.tsx
content/vouches.tsx
content/auth.tsx
```

Rules:

- Components define shape.
- Content modules define words.
- Components map over typed content structures.
- Avoid embedding long-form copy directly inside reusable components.
- Ensure FAQ/legal rendering uses consistent structure.

Output complete updated files.

---

# Prompt 7 — Vouch Detail Page Hardening

## Goal

Treat the Vouch detail page as the operational cockpit and harden its architecture boundaries.

## Prompt

Refactor the Vouch detail page into a strict server/client orchestration split.

Target route:

```txt
app/(tenant)/vouches/[vouchId]/page.tsx
```

Canonical structure:

```txt
VouchDetailHeader
-> VouchTermsSummary
-> LifecycleStatusPanel
-> PaymentStatusPanel
-> ConfirmationPanel
-> VouchCodeExchangePanel
-> VouchTimelinePanel
-> VouchActionsPanel
-> BottomCallout
```

Rules:

- Route file remains thin.
- Server feature owns fetcher orchestration.
- Client feature owns interaction state only.
- Components render DTOs only.
- No Prisma in components.
- No Stripe in components.
- No settlement decisions in UI.
- Use protocol drawers for high-consequence actions.
- Keep the Vouch detail page as the canonical operational center.

Audit for boundary drift aggressively.

Output complete updated files.

---

# Prompt 8 — Dashboard Simplification Pass

## Goal

Prevent the dashboard from drifting into fake analytics or CRM behavior.

## Prompt

Refactor the dashboard into a narrow Vouch index surface.

Canonical structure:

```txt
DashboardHeader
-> OptionalStatusStrip
-> VouchCardList
-> BottomCallout
```

Rules:

- The dashboard is not a BI surface.
- The dashboard is not a CRM.
- The dashboard is not a messaging inbox.
- The dashboard exists to organize Vouch objects.
- Every Vouch card must clearly route to the Vouch detail page.
- Keep metrics minimal and orientation-focused.

Audit and remove any fake KPI theater.

Output complete updated files.

---

# Prompt 9 — Protocol Drawer Standardization

## Goal

Standardize all temporary high-consequence interaction surfaces.

## Prompt

Create a canonical protocol drawer system.

The drawer system must support:

```txt
confirm presence
submit Vouch code
accept disclaimer
warning states
payment redirect warnings
Connect redirect warnings
archive confirmation
```

Canonical structure:

```txt
DrawerHeader
-> ConsequenceStatement
-> RequiredContextSummary
-> PrimaryInteraction
-> SecondaryEscape
-> FinePrintOrRuleReminder
```

Rules:

- Prefer drawers over modals.
- Optimize for mobile-first bottom drawer UX.
- Preserve the parent page as the durable state surface.
- Reserve dialogs for destructive/emergency interruptions only.

Output complete updated files.

---

# Prompt 10 — Provider Surface Normalization

## Goal

Normalize Stripe and Clerk surfaces so external provider flows remain external.

## Prompt

Audit all Stripe and Clerk frontend integrations.

Rules:

- Stripe-hosted flows should remain external.
- Avoid unnecessary Stripe Elements embedding.
- Keep Connect onboarding provider-hosted.
- Keep saved payment method flows provider-hosted.
- Do not create internal fake payment pages.
- Centralize Clerk providers at root.
- Avoid provider soup.

Normalize provider ownership boundaries.

Output complete updated files.

---

# Prompt 11 — App Router Optimization Pass

## Goal

Optimize the App Router structure for clean server-first rendering and stable loading boundaries.

## Prompt

Perform a Next.js App Router optimization pass.

Audit:

```txt
Suspense boundaries
loading.tsx usage
error.tsx usage
not-found.tsx usage
layout.tsx composition
server/client boundaries
route-level provider usage
bundle duplication
client component overuse
```

Rules:

- Prefer server components.
- Minimize client boundaries.
- Use client features only for true interaction state.
- Keep route shells thin.
- Centralize layouts.
- Centralize providers.
- Ensure skeletons match final layout rhythm.

Output complete updated files.

---

# Prompt 12 — Final Frontend Conformance Audit

## Goal

Verify the frontend fully conforms to the Vouch source of truth, taxonomy, and implementation matrix.

## Prompt

Perform a final frontend conformance audit.

Validate:

```txt
page taxonomy alignment
feature orchestration alignment
component ownership rules
shared component purity
UI primitive standardization
route shell purity
provider normalization
App Router architecture
DTO rendering boundaries
forbidden page behaviors
```

Specifically verify that the frontend does not expose:

```txt
marketplace surfaces
messaging
chat
reviews
ratings
disputes
claims
appeals
evidence uploads
manual settlement
manual payout
force release
admin arbitration
```

Generate final report:

```txt
.agents/json/frontend-conformance-report.json
```

Include:

```txt
aligned surfaces
violations
warnings
recommended removals
recommended merges
architecture drift findings
```

Do not invent new product behavior.

Conform strictly to the canonical Vouch interface architecture.

