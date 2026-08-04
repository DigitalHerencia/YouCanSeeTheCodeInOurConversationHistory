\# How I Build Opinionated SaaS Applications



\## Architecture Overview



I build SaaS applications as \*\*domain systems with explicit trust boundaries\*\*, not as collections of pages connected directly to a database.



My preferred stack—the “hipster stack”—is:



\* TypeScript

\* Next.js App Router

\* React Server Components

\* React

\* PostgreSQL on Neon

\* Prisma ORM

\* Clerk

\* Custom application RBAC

\* PostgreSQL row-level security where tenant isolation requires defense in depth

\* Stripe and Stripe Connect

\* Zod

\* React Hook Form

\* Tailwind CSS

\* shadcn/Base UI primitives

\* Vitest

\* Playwright

\* pnpm

\* GitHub Actions

\* Vercel



The Vouch implementation uses current versions of this stack with strict TypeScript, Prisma-generated types, server-only modules, automated testing, contract validation, and pinned package management.



The central architectural rule is:



> \*\*Routes adapt. Features orchestrate. Components render. Fetchers read. Actions write. Schemas validate. Authorization decides. Transactions preserve invariants. Webhooks reconcile external truth.\*\*



```text

Browser

&#x20; ↓

Next.js route

&#x20; ↓

Feature orchestrator

&#x20; ├── Fetcher → authorization → select → Prisma → DTO mapper

&#x20; ├── Server Action → authorization → schema → workflow

&#x20; │                                      ├── transaction

&#x20; │                                      ├── provider adapter

&#x20; │                                      ├── audit event

&#x20; │                                      └── cache invalidation

&#x20; └── Presentational components

```



The repository’s documented boundaries deliberately keep Prisma, Stripe, Clerk server helpers, and business rules out of the presentation layer.



\---



\## Core Engineering Principles



\### Separation of concerns is structural



Responsibilities are divided by layer and enforced by directory placement.



| Layer                       | Responsibility                                                   |

| --------------------------- | ---------------------------------------------------------------- |

| `app/`                      | Routing, metadata, layouts, redirects, Suspense, HTTP adaptation |

| `features/`                 | Use-case and page orchestration                                  |

| `components/ui/`            | Design-system primitives                                         |

| `components/shared/`        | Reusable product-agnostic presentation                           |

| `components/<domain>/`      | Domain-specific presentation                                     |

| `lib/fetchers/`             | Authenticated and authorized reads                               |

| `lib/actions/`              | Public Server Action entrypoints                                 |

| `lib/<domain>/workflows.ts` | Application workflows and use cases                              |

| `lib/auth/`                 | Identity and session adapters                                    |

| `lib/authz/`                | Roles, permissions, capabilities, and resource policies          |

| `lib/db/selects/`           | Reusable Prisma projection contracts                             |

| `lib/db/dto/`               | Persistence-to-transport mapping                                 |

| `lib/db/transactions/`      | Atomic database mutation mechanics                               |

| `lib/integrations/`         | External provider adapters                                       |

| `lib/webhooks/`             | Verified, idempotent provider event processing                   |

| `schemas/`                  | Runtime input contracts                                          |

| `types/`                    | Transport types and shared compile-time contracts                |

| `prisma/`                   | Database model, migrations, and generated client                 |

| `context/` and `.agents/`   | Human and machine-readable governance                            |



Imports communicate intent. A component importing Prisma is not merely untidy; it is crossing an architectural boundary.



\### Server ownership



Business truth is server-owned.



The client may collect input, display state, optimistically improve interaction, and submit commands. It does not decide:



\* Whether a user is authorized

\* Whether a workflow transition is legal

\* Which price or fee applies

\* Whether a payment may be captured

\* Whether a record belongs to the current tenant

\* Whether an external provider operation succeeded

\* Whether a deadline has actually passed



UI timers and client state are advisory. Server timestamps, canonical database state, and verified provider state are authoritative.



\### Narrow interfaces



Every layer receives the least information it needs and returns the smallest useful result.



Database rows do not become UI props. Provider objects do not become domain models. Form values do not become mutation inputs until they pass runtime validation.



\---



\# Request and Page Orchestration



\## Routes



Next.js route files are intentionally thin.



A route may:



\* Resolve route parameters

\* Declare metadata

\* Redirect

\* Establish a layout

\* Create a Suspense boundary

\* Select a feature entrypoint

\* Convert an HTTP request into a domain call

\* Convert a domain result into an HTTP response



A route should not contain Prisma queries, Stripe calls, pricing logic, permission rules, or workflow state transitions.



For example, a dynamic Vouch route resolves `vouchId`, establishes a loading boundary, and delegates the actual page assembly to `VouchDetailPage`.



```text

app/(tenant)/vouches/\[vouchId]/page.tsx

&#x20; └── <Suspense>

&#x20;       └── VouchDetailPage

```



Route groups express application surfaces without changing URLs:



```text

app/

├── (public)/

│   ├── page.tsx

│   ├── pricing/

│   ├── faq/

│   └── legal/

├── (auth)/

│   ├── sign-in/

│   └── sign-up/

├── (tenant)/

│   ├── dashboard/

│   ├── onboarding/

│   ├── settings/

│   └── vouches/

└── api/

&#x20;   ├── clerk/webhooks/

&#x20;   ├── stripe/webhooks/

&#x20;   └── cron/

```



Each surface receives its own layout, navigation shell, access boundary, error handling, and loading behavior.



\## Feature orchestration



Feature modules sit between routes and components.



A feature may:



\* Call one or more fetchers

\* Resolve role-aware or state-aware presentation

\* Map domain DTOs into display models

\* Bind Server Actions to client forms

\* Compose domain components

\* Handle `notFound`, redirect, loading, empty, and blocked states

\* Decide which actions should be visible



A feature does \*\*not\*\* become an alternate data layer. It orchestrates established interfaces.



The Vouch detail feature demonstrates this pattern: it retrieves authorized page state, maps that state into a display DTO, selects the appropriate actions, and composes reusable presentation components.



This produces a deliberate hierarchy:



```text

Route

&#x20; → Feature

&#x20;     → Fetcher

&#x20;     → Display mapper

&#x20;     → Domain components

&#x20;         → Shared components

&#x20;             → UI primitives

```



\---



\# Authentication



\## Clerk owns identity



Clerk owns:



\* Sign-up and sign-in

\* Sessions

\* Identity verification

\* Authentication cookies and tokens

\* User-facing authentication flows



The application accesses Clerk through a small server-only adapter instead of spreading provider calls throughout the codebase.



The route proxy protects authenticated surfaces but does not attempt to implement domain authorization. Public marketing, legal, authentication, checkout, webhook, and controlled cron routes are explicitly classified; everything else requires authentication.



\## Prisma owns application identity



Clerk identity and application identity are related but distinct.



The local `User` record owns application state such as:



\* Internal application ID

\* Clerk user ID

\* Account status

\* Display-safe profile data

\* Tenant memberships

\* Application roles

\* Readiness state

\* Payment-provider relationships

\* Audit relationships



Clerk metadata is not the canonical location for product roles, tenant access, payment state, workflow state, or authorization state.



Verified Clerk webhooks synchronize local users. Authenticated reads do not opportunistically create database users. This makes user provisioning observable, retryable, auditable, and independent of whichever route the user happens to visit.



\---



\# Authorization and Custom RBAC



\## Authentication answers “who?”



Authorization answers:



\* What may this user do?

\* Within which tenant?

\* To which resource?

\* In which role?

\* While the resource is in which state?

\* Under which business conditions?



Middleware is not the authorization system. Hiding a button is not authorization. A client-side role check is not authorization.



Authorization is repeated at every protected server boundary.



\## Layered authorization



My preferred authorization model has four layers.



\### 1. Account authorization



The user must have a valid local account in an allowed state.



```text

Clerk session

&#x20; → local User lookup

&#x20; → active/suspended/disabled check

```



The authenticated-user fetcher converts a Clerk session into the local application user and enforces active-account requirements.



\### 2. Tenant authorization



For multi-tenant applications, every protected resource belongs to a tenant or organization.



```text

User

&#x20; → Membership

&#x20;     → Organization

&#x20;     → Role

&#x20;     → Permissions

```



A canonical model is:



```text

Organization

Membership

Role

Permission

RolePermission

MembershipRole

```



A membership answers whether the user belongs to the tenant. Roles and permissions answer what the membership permits.



\### 3. Resource authorization



Authorization is scoped to the actual record.



For Vouch, the domain roles are `merchant` and `customer`. The authorization helper derives the participant role by comparing the authenticated application user to the resource’s participant IDs.



For a general SaaS application, the equivalent policy might be:



```ts

authorize({

&#x20; actor,

&#x20; tenant,

&#x20; action: "invoice.update",

&#x20; resource: invoice,

})

```



Permissions are expressed as stable capabilities:



```text

project.read

project.create

project.update

project.delete

member.invite

billing.manage

audit.read

```



Roles are configurable collections of those permissions:



```text

owner

admin

manager

member

viewer

```



Business code asks whether an actor has a capability. It does not scatter checks such as `role === "admin"` throughout the application.



\### 4. Workflow authorization



A permission alone may not make an operation legal.



An actor may have `payment.capture`, but capture may still require:



\* A capturable provider state

\* The correct participant relationship

\* Both confirmations

\* A valid confirmation window

\* A non-terminal domain state

\* A valid connected-account scope



This is why authorization and workflow invariants belong together at the server use-case boundary.



\## PostgreSQL RLS



For multi-tenant applications, PostgreSQL row-level security provides a second containment boundary.



The application sets trusted transaction context such as:



```text

app.current\_user\_id

app.current\_tenant\_id

```



RLS policies then ensure that tenant-scoped rows can only be selected or mutated through a valid membership.



Application authorization remains responsible for capabilities, workflow semantics, and useful error messages. RLS is the final database guardrail against a missing tenant filter or an accidentally broad query.



\---



\# Fetchers



Fetchers are the only public read interface for protected application data.



A fetcher follows this sequence:



```text

authenticate

&#x20; → resolve local user

&#x20; → authorize tenant/resource

&#x20; → apply cache policy

&#x20; → execute minimal select

&#x20; → map database record to DTO

&#x20; → return transport-safe state

```



A fetcher:



\* Runs server-only

\* Accepts a small typed input

\* Applies tenant and participant filters in the query

\* Uses predefined selects

\* Does not return Prisma models

\* Does not expose secrets or unnecessary provider IDs

\* Explicitly chooses cached or uncached behavior

\* Returns the state required by a route or feature



The Vouch detail fetcher constrains the query to records where the authenticated user is the merchant or customer, uses reusable selects, and maps the result before returning it.



A fetcher is not a generic repository with unrestricted methods such as `findAll`. Its name should describe the use case:



```text

getDashboardPageState

getProjectDetailForCurrentMember

getBillingReadiness

getCurrentUser

getInvoiceParticipantActionState

```



\---



\# Server Actions and Workflows



\## Server Actions are adapters



Files in `lib/actions/` expose `"use server"` entrypoints to React.



They remain deliberately thin:



```text

Server Action

&#x20; → domain workflow

```



The Vouch actions export stable UI-facing functions while delegating implementation to the domain workflow module.



This keeps framework-specific Server Action concerns separate from reusable application behavior.



\## Workflows are application use cases



A workflow coordinates the full mutation:



```text

authenticate

&#x20; → authorize

&#x20; → validate

&#x20; → verify workflow preconditions

&#x20; → database transaction and/or provider operation

&#x20; → audit

&#x20; → revalidate or redirect

&#x20; → return typed result

```



A workflow can coordinate:



\* Fetchers

\* Authorization policies

\* Pricing rules

\* Transaction helpers

\* Provider adapters

\* Audit events

\* Idempotency keys

\* Recovery snapshots

\* Retry records

\* Cache invalidation



The workflow is where a business sentence becomes executable software.



```text

“Create a Vouch”

“Invite a tenant member”

“Change a subscription”

“Approve an expense”

“Capture an authorized payment”

```



The Vouch workflow layer composes authentication, readiness gates, Zod schemas, transactional helpers, Stripe adapters, audit records, recovery state, and cache invalidation.



\## Action results



Expected failures return a discriminated result rather than throwing arbitrary errors into the UI.



```ts

type ActionResult<T> =

&#x20; | { ok: true; data: T }

&#x20; | {

&#x20;     ok: false

&#x20;     code?: string

&#x20;     formError?: string

&#x20;     fieldErrors?: Record<string, string\[]>

&#x20;   }

```



This gives forms a stable protocol for success, field errors, form errors, and machine-readable failure codes.



Unexpected infrastructure and programming failures still throw and are handled by application error boundaries and observability.



\---



\# Schemas



Zod schemas are runtime contracts at trust boundaries.



They validate:



\* Form inputs

\* Server Action inputs

\* Route parameters

\* Query strings

\* Webhook-derived metadata before use

\* Configuration and environment variables

\* Provider values that enter domain logic



Schemas perform coercion and semantic refinement rather than merely checking primitive types.



For example, the Vouch creation schema:



\* Converts currency input into integer cents

\* Restricts currency to an allowed value

\* Coerces the appointment into a date

\* Requires a future appointment

\* Enforces the permitted creation window

\* Requires explicit disclaimer acceptance

\* Validates confirmation codes separately



TypeScript types describe what trusted code expects. Zod schemas establish whether untrusted runtime data deserves to become that type.



\---



\# Selects



Selects define explicit database projection contracts.



```text

lib/db/selects/

├── auth.selects.ts

├── user.selects.ts

├── audit.selects.ts

├── payment.selects.ts

├── confirmation.selects.ts

└── vouch.selects.ts

```



A select:



\* Requests only required columns

\* Defines safe nested relations

\* Avoids accidental exposure of sensitive data

\* Gives Prisma a precise payload type

\* Can be reused by fetchers and transactions

\* Makes data-shape changes reviewable



The Vouch selects distinguish card, detail, confirmation, and window-summary projections instead of retrieving a complete model for every use case. They use `satisfies Prisma.VouchSelect` so the projection remains checked against Prisma.



This is both a performance convention and a security convention.



\---



\# DTO Mappers



Prisma models never cross into routes, features, or components.



DTO mappers convert persistence records into stable transport objects.



A mapper may:



\* Convert `Date` objects to ISO strings

\* Convert integer cents into money DTOs

\* Remove private fields

\* Normalize nullable values

\* Collapse provider records into application status

\* Derive display-safe workflow state

\* Rename persistence terminology

\* Create stable objects for Server Components and clients



The Vouch mapper turns selected database records into card, detail, confirmation, money, participant, and refund DTOs. It also derives aggregate confirmation and window state without exposing Prisma records to the UI.



DTOs create an anti-corruption layer between persistence and presentation. The database can evolve without forcing every component to understand its schema.



A separate display mapper may then convert domain DTOs into presentation-specific copy and component-ready structures:



```text

Prisma record

&#x20; → domain DTO

&#x20;     → display DTO

&#x20;         → component props

```



\---



\# Transactions



Transaction helpers contain atomic persistence mechanics.



They should:



\* Accept a Prisma transaction client

\* Receive already validated typed inputs

\* Enforce write-level invariants

\* Perform the smallest atomic mutation

\* Return a constrained selected result

\* Avoid redirects, revalidation, and UI concerns

\* Avoid owning an entire workflow



A transaction helper might:



```text

createTenantTx

inviteMembershipTx

acceptInvitationTx

changeSubscriptionTx

createVouchTx

bindCustomerToVouchTx

recordWebhookReceiptTx

claimWebhookProcessingTx

```



The Vouch transaction layer generates public IDs, calculates persistence timestamps, creates records, prevents conflicting participant assignment, and returns constrained projections.



Serializable transactions are used where concurrent requests could violate a lifecycle invariant. Known serialization conflicts can be retried within a bounded policy.



External network calls are not casually placed inside long-running database transactions. Provider operations and database commits are coordinated with:



\* Idempotency keys

\* Durable provider identifiers

\* Webhook reconciliation

\* Audit events

\* Retry records

\* Recovery snapshots



\---



\# Integrations



External providers are isolated behind integration modules.



```text

lib/integrations/

├── stripe/

│   ├── client.ts

│   ├── config.ts

│   ├── connect.ts

│   ├── checkout-sessions.ts

│   ├── payment-intents.ts

│   ├── webhook-events.ts

│   ├── connected-account-sync.ts

│   └── status-map.ts

├── email/

├── storage/

└── analytics/

```



Provider modules own:



\* SDK initialization

\* API-version configuration

\* Provider-specific request construction

\* Connected-account scoping

\* Signature verification

\* Idempotency keys

\* Provider response normalization

\* Status translation



The rest of the application calls domain-oriented functions such as:



```text

createMerchantOnboardingLink

createCustomerAuthorizationCheckout

captureAuthorizedPayment

cancelAuthorization

syncConnectedAccountReadiness

```



It does not construct raw Stripe requests inside routes or components.



This makes provider boundaries replaceable, testable, and inspectable.



\---



\# Webhooks



Webhook routes are public at the middleware level and protected through cryptographic signature verification.



The HTTP route performs only ingress work:



```text

read raw body

&#x20; → read signature headers

&#x20; → verify provider event

&#x20; → call webhook processor

&#x20; → return provider-compatible response

```



The Stripe route follows this exact pattern and delegates verified events to the webhook processing layer.



\## Durable webhook ledger



Every provider event is recorded using a unique provider/event key.



```text

received

&#x20; → processing

&#x20;     → processed

&#x20;     → ignored

&#x20;     → failed

```



Processing first attempts to claim the event. If another delivery has already claimed or completed it, the duplicate succeeds without repeating side effects.



Webhook processing is therefore:



\* Signature-verified

\* Idempotent

\* Auditable

\* Retryable

\* Safe under duplicate delivery

\* Explicit about unsupported events



The Stripe and Clerk processors both use the shared provider-webhook ledger and transaction helpers.



Webhooks synchronize provider truth. They do not silently invent application eligibility or bypass workflow requirements.



\---



\# Data Modeling



I model domain state separately from provider state.



\## Domain records



These represent product truth:



```text

User

Organization

Membership

Role

Permission

Project

Invoice

Vouch

PresenceConfirmation

```



\## Provider mirror records



These preserve the external identifiers and states required for reconciliation:



```text

PaymentCustomer

ConnectedAccount

PaymentIntentRecord

ChargeRecord

RefundRecord

PayoutRecord

ProviderWebhookEvent

StripeWebhookEvent

```



\## Operational records



These make the application supportable:



```text

AuditEvent

OperationalRetry

RecoverySnapshot

IdempotencyRecord

OutboxEvent

```



Vouch’s schema models users, participant relationships, lifecycle states, payment records, webhook ledgers, audit events, retries, and recovery snapshots as separate but related concerns.



\## Modeling conventions



\* Internal primary keys use non-sequential application IDs.

\* Public-facing identifiers are separate from internal IDs.

\* Monetary values are stored as integer minor units.

\* Currency is stored explicitly.

\* Status fields use constrained enums.

\* Important transitions receive dedicated timestamps.

\* Provider IDs receive unique constraints.

\* Webhook event IDs receive unique constraints.

\* Tenant and participant filters receive supporting indexes.

\* Financial and audit relationships prefer restrictive deletion behavior.

\* Provider payloads are not treated as the application model.

\* Sensitive provider payloads are not stored without a defined operational need.

\* Derived presentation state is not persisted unless it is independently meaningful domain state.



\---



\# Components



\## Primitive components



`components/ui/` contains shadcn/Base UI primitives:



\* Button

\* Input

\* Dialog

\* Select

\* Badge

\* Card

\* Table

\* Tabs

\* Alert

\* Skeleton

\* Field



These components know nothing about tenants, payments, permissions, or product workflows.



\## Shared components



`components/shared/` contains reusable presentation:



\* Empty states

\* Error pages

\* Status badges

\* Requirement notices

\* Metric cards

\* Checkout success views

\* Page headers

\* Loading structures



\## Domain components



Domain components present one product area:



```text

components/vouches/

components/dashboard/

components/billing/

components/members/

components/nav/

components/public/

```



They may understand domain DTOs and display semantics. They do not perform protected fetching or provider operations.



\## Feature components



Feature components assemble the use case.



They may be Server Components or focused client components for:



\* Form state

\* Optimistic interaction

\* Dialog state

\* Timers

\* Browser APIs

\* Submission feedback



Client boundaries are introduced intentionally. The default is a Server Component until browser interactivity requires otherwise.



\---



\# Types



The `types/` directory defines contracts shared across architectural boundaries:



```text

types/

├── action-resultTypes.ts

├── authTypes.ts

├── commonTypes.ts

├── dashboardTypes.ts

├── paymentTypes.ts

├── securityTypes.ts

└── vouchTypes.ts

```



Type categories remain distinct:



\* Domain concepts

\* Transport DTOs

\* Action results

\* Provider-normalized results

\* Security context

\* Shared utility types

\* Presentation models



Generated Prisma types remain inside the data layer. Public application types should not be aliases for unrestricted generated models.



\---



\# Configuration



Root-level configuration is treated as part of the architecture.



\## TypeScript



TypeScript runs in strict mode with additional correctness options such as:



\* `noUncheckedIndexedAccess`

\* `exactOptionalPropertyTypes`

\* `noImplicitOverride`

\* `noFallthroughCasesInSwitch`

\* `isolatedModules`

\* `verbatimModuleSyntax`



Aliases reflect architectural layers:



```text

@/app/\*

@/features/\*

@/components/\*

@/lib/\*

@/schemas/\*

@/types/\*

```



These conventions are encoded in the repository TypeScript configuration.



\## Next.js



Next configuration owns framework-level security and behavior:



\* Typed routes

\* Build-time TypeScript enforcement

\* Disabled framework branding headers

\* Compression

\* Explicit image sources

\* Security headers

\* Controlled development origins



Vouch applies headers including frame denial, content-type protection, strict referrer policy, permissions policy, and cross-origin opener policy.



\## Environment configuration



`.env.example` documents every integration surface without containing secrets:



\* Neon and PostgreSQL

\* Clerk

\* Stripe

\* Vercel

\* Application URL

\* Confirmation secrets

\* Cron authentication

\* Email

\* Local testing



The ideal runtime uses a centralized Zod-backed environment module that:



\* Separates server and public variables

\* Fails immediately for missing required values

\* Rejects malformed URLs and provider keys

\* Prevents server secrets from entering client bundles

\* Distinguishes development, test, preview, and production requirements



\## Package management



The package manager and version are pinned. Dependencies are installed with a frozen lockfile in CI. Scripts provide one canonical vocabulary for development, database work, formatting, typechecking, testing, and validation.



\---



\# Styling and Design System



The design system is governed rather than improvised.



\## Component hierarchy



```text

tokens

&#x20; → primitives

&#x20;     → shared components

&#x20;         → domain components

&#x20;             → feature composition

&#x20;                 → routes

```



\## Token strategy



Global CSS contains:



\* Semantic design tokens

\* Base typography

\* Accessibility defaults

\* Focus styles

\* Selection styles

\* Document backgrounds

\* Global motion utilities



It does not become a dumping ground for page-specific CSS.



Vouch uses `--vouch-\*` tokens for surfaces, borders, spacing, typography, shadows, and layout dimensions. Its concrete visual implementation is black-first, high-contrast, operational, hard-edged, and restrained around a primary blue.



The same architecture supports another brand by replacing tokens and governed variants rather than rewriting every component.



\## UI conventions



\* Token-backed Tailwind utilities

\* Minimal arbitrary values

\* No one-off color systems

\* No inline styles except unavoidable computed runtime values

\* Semantic component variants

\* Consistent card anatomy

\* Visible focus states

\* Keyboard accessibility

\* Reduced-motion support

\* Textual status indicators rather than color alone

\* Loading states that preserve layout

\* Explicit empty, error, success, warning, and locked states

\* One primary action per region

\* Review steps for consequential or payment-bearing mutations



Reusable components are inventoried in the design-system documentation so agents and developers can discover and extend existing patterns before creating new ones.



\---



\# Validation and Testing



Validation is layered.



\## Runtime validation



Zod validates untrusted input at server boundaries.



\## Static validation



\* TypeScript

\* ESLint

\* Prettier

\* Prisma schema validation

\* Next.js route type generation

\* Governance-contract validation



\## Unit tests



Vitest covers:



\* Domain rules

\* Pricing

\* Authorization policies

\* DTO mapping

\* Fetchers

\* Transaction helpers

\* Provider adapters

\* Webhook idempotency

\* State transitions

\* Components



The Vitest configuration separates unit and contract tests from browser tests and produces V8 coverage reports.



\## Contract tests



Contract tests protect architectural and product invariants such as:



\* Prisma models do not leak to UI layers

\* Provider SDKs remain inside integration modules

\* Protected reads require authorization

\* Webhook handlers remain idempotent

\* Direct-charge operations retain connected-account scope

\* Forbidden routes and product surfaces remain absent

\* Agent contracts remain parseable and internally consistent



\## End-to-end tests



Playwright validates critical browser workflows in desktop and mobile Chromium, retaining traces, screenshots, and video when failures occur.



\## Canonical validation pipeline



```text

format check

&#x20; → route type generation

&#x20; → TypeScript

&#x20; → ESLint

&#x20; → Prisma validation

&#x20; → governance contracts

&#x20; → unit and contract tests

&#x20; → production build

&#x20; → targeted end-to-end tests

```



The default development rule is to run the narrowest relevant validation first. Full validation is a release or integration gate, not a substitute for focused feedback.



\---



\# CI/CD



GitHub Actions reproduces the local quality gates on pull requests and the production branch.



The Vouch CI workflow:



\* Checks out the repository

\* Installs the pinned pnpm toolchain

\* Uses the designated Node version

\* Installs from the frozen lockfile

\* Generates the Prisma client

\* Checks formatting

\* Runs TypeScript

\* Runs ESLint

\* Runs unit tests

\* Cancels superseded workflow runs



The ideal delivery sequence is:



```text

feature branch

&#x20; → narrow local validation

&#x20; → pull request

&#x20; → CI quality gates

&#x20; → review

&#x20; → merge to main

&#x20; → Vercel production deployment

&#x20; → post-deployment smoke verification

```



Database migrations are explicit deployment artifacts. They are reviewed separately from application behavior and applied with environment awareness.



Provider mutations, production migrations, and deployments are never treated as harmless validation commands.



\---



\# Agent Governance



AI agents work inside the same architecture as human contributors.



The repository uses two complementary governance forms.



\## Human-readable context



```text

context/docs/

├── architecture.md

├── prd.md

└── design-system.md



context/instructions/

└── codex.instructions.md

```



These explain intent, tradeoffs, implementation conventions, and operational boundaries.



\## Machine-readable constraints



```text

.agents/contracts/

├── product.yaml

├── design.yaml

└── validation.yaml



.agents/execution/

├── decisions.json

├── handoff.json

└── progress.json

```



Contracts encode deterministic requirements. Execution files record current work without overriding durable architecture.



The source-of-truth order is explicit:



1\. Current user instruction

2\. Context documentation

3\. Deterministic contracts

4\. Agent implementation instructions

5\. Existing code

6\. Implementation judgment



Agents must stop and report an exact conflict rather than silently selecting whichever source is easiest to implement.



\## Agent operating rules



\* Read governance before changing behavior.

\* Make the smallest correct change.

\* Preserve established layer boundaries.

\* Do not invent routes, business rules, database fields, payment flows, or design primitives.

\* Do not run servers, migrations, deployments, broad test suites, or provider mutations without authorization.

\* Run the narrowest permitted validation.

\* Distinguish static inspection from executed validation.

\* Record durable decisions.

\* Update progress and handoff state.

\* Stop before weakening authentication, authorization, tenant isolation, payment, or lifecycle boundaries.



These rules are encoded in both the Codex instructions and the validation contract.



\---



\# Security and Operational Reliability



Security is expressed through architecture rather than added at the end.



\## Security boundaries



\* Clerk owns authentication.

\* Prisma owns application state.

\* Custom RBAC owns capabilities.

\* Resource policies own record-level access.

\* RLS provides tenant containment.

\* Zod owns runtime input validation.

\* Selects limit database exposure.

\* DTOs prevent persistence leakage.

\* Provider adapters isolate credentials and API semantics.

\* Signed webhooks synchronize external truth.

\* Transactions protect atomic invariants.

\* Idempotency protects repeated external operations.

\* Audit events preserve accountability.

\* Retry records preserve recoverability.

\* Security headers protect browser surfaces.

\* CI prevents unvalidated integration.



\## Financial workflows



Payment-bearing workflows additionally require:



\* Integer money values

\* Explicit currency

\* Provider object IDs

\* Connected-account scope

\* Provider idempotency keys

\* Manual-capture state where appropriate

\* Webhook reconciliation

\* Durable charge, refund, and payout mirrors

\* Recovery snapshots before irreversible operations

\* No client-owned fee or settlement calculation



\## Observability



Operational events should be structured around:



\* Request or correlation ID

\* Actor ID

\* Tenant ID

\* Entity type and ID

\* Operation name

\* Provider event ID

\* Idempotency key

\* Result

\* Duration

\* Retry count



Sensitive payloads, secrets, payment details, and raw identity data are excluded from routine logs.



\---



\# The Result



The result is an opinionated SaaS architecture optimized for:



\* Strong separation of concerns

\* Custom authorization

\* Tenant isolation

\* Server-owned business logic

\* Safe provider integrations

\* Deterministic payment workflows

\* Reusable page and component taxonomies

\* Explicit data contracts

\* Testable application boundaries

\* Reliable CI/CD

\* AI-assisted development without surrendering architectural control

\* Fast reuse across multiple B2B SaaS products



The repository is not organized around whichever framework API is most convenient in the moment. It is organized around \*\*domain workflows, trust boundaries, and durable engineering conventions\*\*.



That is the underlying method:



> \*\*Keep identity, authorization, domain state, persistence, providers, orchestration, and presentation separate—then connect them through small, typed, validated interfaces.\*\*



