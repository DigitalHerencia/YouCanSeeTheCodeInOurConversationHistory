---
title: Loaded Vibes Maximal White-Label Template Reference
type: reference
scope: project
project: Loaded Vibes
domain: template
artifact: maximal-white-label
kind: reference
namespace: loadedvibes.template.maximal-white-label.reference
status: active
authority: working-note
parent: "[[loadedvibes.project.map]]"
depends_on:
  - "[[loadedvibes.project.source-document]]"
  - "[[loadedvibes.generator.one-template.contract]]"
  - "[[hipsterstack.patterns.catalog.map]]"
  - "[[hipsterstack.patterns.layer-contract.reference]]"
  - "[[hipsterstack.patterns.route-feature-orchestration.reference]]"
  - "[[hipsterstack.patterns.system-lifecycle.reference]]"
supersedes: []
tags:
  - projects/loaded-vibes
  - architecture/template
  - hipster-stack
  - status/active
created: 2026-08-09
updated: 2026-08-09
---

# Loaded Vibes Maximal White-Label Template Reference

## Purpose

Define the intended superset application that Loaded Vibes uses as its one canonical template source.

This note is a synthesis and target reference. It does not claim every listed path exists in the current LoadedVibes repository today.

The template should first become the best possible maximal version of the application that is repeatedly built. Only then should Loaded Vibes encode deterministic capability removal.

## Mental Model

```text
ONE MAXIMAL WHITE-LABEL TEMPLATE
        │
        ├── all canonical Hipster Stack patterns
        ├── all supported route surfaces
        ├── all supported integrations
        ├── all provider boundaries
        ├── all reusable application infrastructure
        └── agent context at the places coding agents work
                    │
                    ▼
          Loaded Vibes generator
                    │
             removes / retains
                    │
                    ▼
        GENERATED WHITE-LABEL APP
```

Do not begin by splitting the application into source modules.

First make the superset repository coherent and complete.

## Legend

```text
[C] canonical / always present
[R] route surface generator may retain/remove
[I] integration-owned
[F] reusable feature capability
[A] agent-facing context
[P] presentation infrastructure
[+] proposed addition relative to the earlier Vibes golden template
```

## Target Application Skeleton

```text
template/
├── AGENTS.md                                      [A][C]
├── README.md                                      [C]
├── SECURITY.md                                    [C]
├── LICENSE                                        [C]
├── package.json                                   [C]
├── pnpm-lock.yaml                                 [C]
├── pnpm-workspace.yaml                            [C]
├── tsconfig.json                                  [C]
├── next.config.ts                                 [C]
├── postcss.config.mjs                             [C]
├── prettier.config.mjs                            [C]
├── eslint.config.mjs                              [C]
├── components.json                                [C]
├── prisma.config.ts                               [C]
├── vitest.config.ts                               [C]
├── playwright.config.ts                           [C]
├── vercel.json                                    [C]
├── .env.example                                   [C]
├── .editorconfig                                  [C]
├── .gitignore                                     [C]
├── .gitattributes                                 [C]
├── .node-version                                  [C]
├── app/
├── features/
├── components/
├── lib/
├── schemas/
├── types/
├── prisma/
├── content/
├── context/
├── .agents/
├── scripts/
├── public/
└── .github/
```

## Route Surface

```text
app/
├── AGENTS.md                                      [A][C]
├── layout.tsx                                     [C]
├── page.tsx                                       [R]
├── loading.tsx                                    [C]
├── error.tsx                                      [C]
├── global-error.tsx                               [C]
├── not-found.tsx                                  [C]
├── globals.css                                    [C]
├── (public)/                                      [R]
│   ├── AGENTS.md                                  [A]
│   ├── layout.tsx
│   ├── page.tsx
│   ├── pricing/                                   [R][F]
│   ├── faq/                                       [R]
│   ├── contact/                                   [R]
│   ├── privacy/                                   [R]
│   └── terms/                                     [R]
├── (auth)/                                        [C]
│   ├── AGENTS.md                                  [A]
│   ├── layout.tsx
│   ├── sign-in/[[...sign-in]]/page.tsx
│   └── sign-up/[[...sign-up]]/page.tsx
├── (onboarding)/                                  [R][F]
│   ├── AGENTS.md                                  [A]
│   ├── layout.tsx
│   ├── page.tsx
│   ├── organization/page.tsx
│   └── complete/page.tsx
├── (tenant)/                                      [C]
│   ├── AGENTS.md                                  [A]
│   ├── layout.tsx
│   ├── loading.tsx
│   ├── error.tsx
│   ├── dashboard/                                 [C]
│   ├── settings/                                  [C]
│   ├── projects/                                  [R][F]
│   ├── team/                                      [R][F]
│   ├── uploads/                                   [R][F][I:CLOUDINARY]
│   ├── maps/                                      [R][F][I:MAPBOX]
│   └── ai/                                        [R][F][I:HUGGINGFACE]
├── (admin)/                                       [R][F]
│   ├── AGENTS.md                                  [A]
│   ├── layout.tsx
│   ├── page.tsx
│   ├── users/
│   ├── organizations/
│   ├── billing/
│   └── webhooks/
├── (billing)/                                     [R][I:STRIPE]
│   ├── AGENTS.md                                  [A]
│   ├── checkout/
│   ├── success/
│   └── canceled/
└── api/
    ├── AGENTS.md                                  [A]
    ├── clerk/webhooks/                            [I:CLERK]
    ├── stripe/webhooks/                           [I:STRIPE]
    ├── stripe/connect/webhooks/                   [I:STRIPE-CONNECT]
    ├── cloudinary/webhooks/                       [I:CLOUDINARY]
    └── mapbox/webhooks/                           [I:MAPBOX]
```

Route files remain thin. Pages select and render features. Provider/Prisma mechanics do not move into route UI files.

## Features

```text
features/
├── AGENTS.md
├── dashboard/
│   ├── dashboard-feature.tsx
│   ├── dashboard-skeleton.tsx
│   ├── dashboard-empty-state.tsx
│   └── dashboard-view-model.ts
├── onboarding/                                    [R][F]
├── settings/
├── projects/                                      [R][F]
├── members/                                       [R][F]
├── billing/                                       [R][F][I:STRIPE]
├── uploads/                                       [R][F][I:CLOUDINARY]
├── maps/                                          [R][F][I:MAPBOX]
├── ai/                                            [R][F][I:HUGGINGFACE]
└── admin/                                         [R][F]
```

Features orchestrate use cases and presentation composition.

They may use fetchers, actions, authz, view-model mapping, and client islands as required while preserving the route and component boundaries.

## Presentation

```text
components/
├── AGENTS.md
├── ui/                                            [P][C]
├── blocks/                                        [P][C]
├── shells/
│   ├── public-shell.tsx
│   ├── auth-shell.tsx
│   ├── tenant-shell.tsx
│   └── admin-shell.tsx
├── navigation/
├── brand/
├── projects/                                      [F]
├── members/                                       [F]
├── billing/                                       [I:STRIPE]
├── uploads/                                       [I:CLOUDINARY]
├── maps/                                          [I:MAPBOX]
└── ai/                                            [I:HUGGINGFACE]
```

Presentation components render and compose UI. They do not own application orchestration or direct database/provider mechanics.

The generated application should look like a product, not a visualization of its architecture.

## Server Operations

```text
lib/
├── AGENTS.md
├── actions/
│   ├── AGENTS.md
│   ├── organizationActions.ts
│   ├── membershipActions.ts
│   ├── invitationActions.ts
│   ├── billingActions.ts
│   ├── projectActions.ts
│   ├── uploadActions.ts
│   ├── aiActions.ts
│   └── locationActions.ts
├── fetchers/
│   ├── AGENTS.md
│   ├── dashboardFetchers.ts
│   ├── organizationFetchers.ts
│   ├── membershipFetchers.ts
│   ├── billingFetchers.ts
│   ├── projectFetchers.ts
│   ├── mediaFetchers.ts
│   └── locationFetchers.ts
├── workflows/
│   ├── AGENTS.md
│   ├── organizationWorkflows.ts
│   ├── invitationWorkflows.ts
│   ├── onboardingWorkflows.ts
│   ├── billingWorkflows.ts
│   ├── uploadWorkflows.ts
│   ├── inferenceWorkflows.ts
│   └── locationWorkflows.ts
├── auth/
│   ├── AGENTS.md
│   ├── session.ts
│   ├── identity.ts
│   ├── actor.ts
│   └── redirect.ts
├── authz/
│   ├── AGENTS.md
│   ├── capabilities.ts
│   ├── policies.ts
│   ├── assertions.ts
│   └── tenant.ts
├── db/
│   ├── AGENTS.md
│   ├── prisma.ts
│   ├── withTenantContext.ts
│   ├── selects/
│   ├── dto/
│   └── transactions/
├── integrations/
│   ├── AGENTS.md
│   ├── clerk/
│   ├── neon/
│   ├── stripe/
│   │   └── connect/
│   ├── cloudinary/
│   ├── huggingface/
│   └── mapbox/
├── webhooks/
│   ├── AGENTS.md
│   ├── clerkWebhookWorkflow.ts
│   ├── stripeWebhookWorkflow.ts
│   ├── stripeConnectWebhookWorkflow.ts
│   └── cloudinaryWebhookWorkflow.ts
├── uploads/
├── cache/
├── errors/
├── utils/
└── env.ts
```

The canonical grammar remains:

```text
Fetchers read.
Server Actions receive mutations.
Workflows coordinate use cases.
Transactions preserve database invariants.
Auth identifies.
Authz authorizes.
Integration adapters own provider mechanics.
Webhook processors reconcile provider events.
Selects define database shapes.
DTO mappers transport safe application data.
```

## Schemas and Types

```text
schemas/
├── organizationSchemas.ts
├── membershipSchemas.ts
├── invitationSchemas.ts
├── projectSchemas.ts
├── billingSchemas.ts
├── uploadSchemas.ts
├── inferenceSchemas.ts
├── locationSchemas.ts
├── clerkWebhookSchemas.ts
├── stripeWebhookSchemas.ts
└── cloudinaryWebhookSchemas.ts

types/
├── actionResultTypes.ts
├── authTypes.ts
├── authzTypes.ts
├── auditTypes.ts
├── organizationTypes.ts
├── membershipTypes.ts
├── projectTypes.ts
├── billingTypes.ts
├── uploadTypes.ts
├── inferenceTypes.ts
├── locationTypes.ts
└── webhookTypes.ts
```

## Data

```text
prisma/
├── AGENTS.md
├── schema.prisma
├── migrations/
└── seed.ts
```

The maximal template may include schema and migrations for supported optional capability surfaces while phase one is establishing the complete superset.

Modular removal is a later generator concern.

## White-Label Content Surface

```text
content/
├── site.ts
├── auth.ts
├── navigation.ts
├── marketing.ts
└── application.ts
```

Product identity and generic copy should be centralized enough that generation can replace template identity without scattering arbitrary string substitutions across the codebase.

## Context Shipped with Generated Applications

```text
context/
├── README.md
├── docs/
│   ├── architecture.md
│   ├── auth.md
│   ├── data-model.md
│   ├── integrations.md
│   ├── routes.md
│   └── system-lifecycle.md
└── patterns/
    ├── layer-contract.md
    ├── route-feature-orchestration.md
    ├── fetcher.md
    ├── server-action.md
    ├── application-workflow.md
    ├── transaction-helper.md
    ├── auth-authz-boundary.md
    └── webhook-processor.md
```

This is application-local architecture context, not a copy of the entire DevNotes knowledge system.

## Machine Context

```text
.agents/
├── AGENTS.md
└── contracts/
    ├── architecture.yaml
    ├── integrations.yaml
    └── routes.yaml
```

The exact machine-contract set may evolve, but its role is base generated-application context rather than the complete Codependent Coding execution system.

## Directory-Scoped AGENTS.md Guidance

Local `AGENTS.md` files belong where coding agents need implementation rules.

Examples:

### `app/(tenant)/AGENTS.md`

```text
Scope
  authenticated tenant-scoped routes

Requirements
  resolve actor
  resolve active organization
  preserve tenant boundary
  keep route files thin
  features own orchestration
  fetchers own reads
  Server Actions receive mutations
  authorization is local
```

### `app/(tenant)/dashboard/AGENTS.md`

```text
Purpose
  tenant operational overview

Expected composition
  summary metrics
  recent activity
  primary product entities
  high-value actions
  empty/loading/error states

Implementation
  page.tsx selects DashboardFeature
  feature requests dashboard DTOs from fetchers
  do not perform Prisma reads from page or components
```

### Billing success guidance

```text
provider state is authoritative
query parameters are presentation hints
read synchronized local billing state before claiming payment success
```

### Provider webhook guidance

```text
verify
parse
claim idempotently
reconcile
acknowledge
```

This guidance explains how each part of the white-label application works without turning Loaded Vibes into Codependent Coding.

## Always-Present Platform Kernel

The maximal template always embodies:

```text
Next.js
React / RSC
TypeScript
Tailwind CSS
shadcn/ui
Clerk identity
User
Organization
Membership
RBAC
RLS where required
Prisma
Neon/PostgreSQL
Fetchers
Server Actions
Workflows
Transactions
Selects
DTO mappers
Schemas
Integration Adapters
Webhook processors
Public shell
Auth shell
Tenant shell
Dashboard
Settings
Vercel-ready deployment
GitHub CI
Agent context
```

This is the application repeatedly built and therefore the part Loaded Vibes should stop asking about.

## Capability Surfaces

The maximal template may contain removable capability surfaces such as:

```text
Marketing
Onboarding
Invitations
Sample Projects domain
Admin
Subscription billing
Stripe Connect
Uploads / media
AI inference
Mapping / geospatial
```

A capability becomes configurable only when its complete ownership and removal behavior are known.

## Integration Boundary

Initial maximal-template integration boundaries may include:

```text
Clerk
  identity
  sessions
  webhooks

Neon
  PostgreSQL
  runtime connection
  migration connection

Prisma
  schema
  migrations
  generated client
  data-access boundary

Stripe
  subscription billing
  checkout
  webhook reconciliation
  entitlements

Stripe Connect
  connected accounts
  payments
  refunds
  webhooks

Cloudinary
  uploads
  transformations
  media lifecycle
  webhook boundary

Hugging Face
  inference client
  model-selection boundary
  typed result handling

Mapbox
  map rendering
  geocoding
  directions/location boundary
```

Cloudinary, Hugging Face, and Mapbox are proposed supported additions relative to the earlier Vibes golden runtime and must not be represented as already implemented until they exist in the canonical template.

## Capability Ownership Before Removal

During maximal-template construction, cross-cutting optional capability code may remain present together.

For example, Stripe Connect or a sample domain may temporarily be represented in the base Prisma schema while the maximal app is being completed.

That is acceptable in phase one.

The next phase adds ownership metadata and removal behavior after the complete application is coherent.

## Finish Line

Phase one is complete when:

```text
MASTER TEMPLATE
  everything supported exists
  everything works together
  canonical boundaries are obvious
  generated UI looks like a real product
  agent context exists where implementation happens
```

Only after that should the generator become responsible for selective removal.
