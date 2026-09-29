## Related

- [[CtrlPlus Server-First Architecture Blueprint]]
- [[Architecture Core Principles]]

## Type

type:: system

- system

# Why this version is better

Explaining the **revised target tree**

- proper `layout.tsx`, `loading.tsx`, `error.tsx`, `not-found.tsx`, and `global-error.tsx`

- route groups used **selectively**, not gratuitously

- **root-level** `types/` and `schemas/`

- realistic separation between:
    - `components/` = pure UI/presentational
    - `features/` = page-level orchestration + client interaction shells
    - `lib/` = server/auth/db/integration infrastructure

- a test layout that cleanly separates **Vitest** and **Playwright**

- a structure aligned to your actual product surfaces: catalog, visualizer, scheduling, billing, settings, owner/admin, and platform ops.

## 1. Route files are used the way Next.js expects

Next.js App Router supports `layout`, `loading`, `error`, `not-found`, and `global-error` as first-class file conventions, and `loading.tsx` automatically creates a Suspense boundary for that segment. Route groups are appropriate for organizing app sections without changing the URL, but multiple root layouts cause full page reloads when navigating across them, so they should be used intentionally rather than everywhere. ([Next.js][1])

### Practical implication for CtrlPlus

Use:

- one root `app/layout.tsx`
- one public group `(public)`
- one authenticated app group `(app)`

Do **not** split into multiple unrelated top-level root layouts for tenant vs platform unless you explicitly want full reload behavior between those sections. That is a real cost in UX and shell continuity. ([Next.js][1])

---

## 2. `components/` and `features/` are now organized like a real senior-maintained repo

Your prior version still leaned slightly too abstract. In practice, senior teams usually do this:

### `components/`

Pure reusable presentation, grouped by:

- `cards/`
- `tables/`
- `forms/`
- `filters/`
- `media/`
- `calendar/`
- `payments/`

That makes file discovery faster than dumping 20 peer files in one directory.

### `features/`

Page-view oriented slices:

- `list/`
- `detail/`
- `create/`
- `edit/`
- `shared/`

That is much closer to how page assembly actually evolves in production:

- list page has toolbar, pagination, query state
- detail page has actions and subpanels
- create/edit each need a block + form shell
- shared holds view models and common shells

This maps cleanly to your requirement that features own page blocks, business orchestration, and client operational logic.

---

## 3. Root-level `types/` and `schemas/` is viable here

I would not do this in every codebase, but for **your** project it is defensible because you explicitly want:

- one domain file per concern
- all interfaces/types exclusive to `types/`
- all Zod validators exclusive to `schemas/`

That gives you a strong rule:

- `types/*.types.ts` → contracts only
- `schemas/*.schemas.ts` → parse/validation/sanitization only
- `lib/actions` / `lib/fetchers` consume those contracts
- `features` never invent local shadow types unless they are local UI-only view models

That is rigid, but in your repo rigid is good.

---

## 4. The testing layout matches how Vitest and Playwright are actually best used with App Router

Next.js explicitly notes that **Vitest does not currently support async Server Components well**, and recommends using E2E tests for those flows. That means your split should be:

- **Vitest**
    - unit tests for pure UI, utilities, schema validation, authz helpers, sync components
    - integration tests for actions/fetchers/API handlers

- **Playwright**
    - async RSC flows
    - route-shell behavior
    - booking/payment/preview lifecycles
    - auth boundary and redirect behavior ([Next.js][2])

Playwright’s own docs support a central `testDir`, separate helpers/fixtures, projects, setup dependencies, and browser/environment configuration from `playwright.config.ts`. ([Playwright][3])

### That is why this tree uses:

- `tests/vitest/**`
- `tests/playwright/**`

instead of mixing `__tests__` all over the repo.

---

# Recommended architectural rules for this structure

## Dependency direction

```txt
app -> features -> components
app -> features -> lib
features -> components
features -> lib
components -> components/ui
lib -> types
lib -> schemas
features -> types
features -> schemas
```

### Forbidden

```txt
components -> features
components -> app
lib -> features
lib -> app
schemas -> lib
types -> lib
```

This prevents circular architectural drift.

---

## What belongs where

## `app/`

Only:

- route entrypoints
- route-specific metadata
- very light auth gating / redirects
- route-local layout/loading/error wrappers

A page file should look like orchestration, not implementation. That is already consistent with your repo’s stated direction to keep pages thin and server-authoritative.

## `features/`

Owns:

- server component page blocks
- form orchestration
- search/filter/pagination state
- optimistic/client interaction shells only where actually needed
- view-model shaping between fetchers and presentational UI

## `components/`

Owns:

- pure render logic
- no fetches
- no server actions
- no auth decisions
- no domain mutation logic

## `lib/fetchers`

Owns:

- read-only server helpers
- auth/authz enforcement
- Prisma select optimization
- cache strategy
- DTO shaping

## `lib/actions`

Owns:

- server actions and mutations only
- validation via `schemas/*`
- auth/authz checks
- DB transactions
- invalidation/revalidation
- audit logging

Your current repo already strongly implies these boundaries for scheduling, billing, and visualizer.

---

# Specific improvements over your previous concept

## A. `loading.tsx` should exist at multiple levels, but not blindly everywhere

Use them where there is real segment latency:

- `(app)/loading.tsx` for authenticated shell transitions
- domain-level `loading.tsx` for list/detail/create flows
- keep them lightweight and skeleton-based, because Next prefetches fallback UI and nests loading under layout automatically. ([Next.js][4])

## B. `error.tsx` should be segment-scoped

Use:

- domain `error.tsx` for catalog/scheduling/billing/platform
- `global-error.tsx` only for catastrophic app-wide failures

Do not put all fallback logic into `page.tsx` try/catch branches unless the error is intentionally domain-rendered rather than exceptional.

## C. `layout.tsx` should follow shell boundaries, not domain vanity

Good:

- root shell
- public shell
- authenticated workspace shell
- domain shell only where shared subnav/breadcrumb/action bars matter

Bad:

- adding `layout.tsx` to every segment just because the file convention exists

---

# Realistic file behavior by domain

## Catalog

- `app/(app)/catalog/page.tsx` renders `CatalogListBlock`
- `CatalogListBlock` is async RSC, calls `lib/catalog/fetchers/catalog.fetchers.ts`
- `CatalogListClient` handles search-param driven sorting/filter/pagination controls
- `wrap-table.tsx` and `wrap-card.tsx` remain pure
- form pages use RHF + Zod shell in feature layer, pure form fields in components layer

## Scheduling

This domain has server-authoritative availability and booking lifecycle requirements, so:

- availability logic stays in fetchers/domain server code
- client layer only controls picker interactions
- actions own reserve/confirm/cancel flows
- Playwright covers availability → reserve → confirm path, which matches your repo requirements.

## Billing

Because invoice/payment state is server-authoritative and Stripe-aligned:

- list/detail/create/edit live in features
- checkout trigger UI is presentational
- checkout creation and payment mutation remain in actions/api
- webhook tests belong in Vitest integration + Playwright end-to-end coverage.

## Visualizer

Because this domain mixes upload, async generation, ownership, and status transitions:

- page block is server-rendered
- submit/polling shell is feature client logic
- upload fields and canvas remain pure UI
- provider/storage/pipeline code stays entirely in `lib/`
- preview status happy/failure flows should be Playwright-tested, which matches your domain notes.

---

# Naming rules I would standardize

## Files

Use kebab-case everywhere for implementation files:

```txt
wrap-detail-block.tsx
booking-create-form.tsx
invoice-filter-bar.tsx
platform-overview-client.tsx
```

## Route params

Prefer explicit params:

```txt
[wrapId]
[bookingId]
[invoiceId]
[previewId]
```

Not generic `[id]`.

## Types and schemas

Use domain file consolidation:

```txt
types/billing.types.ts
schemas/billing.schemas.ts
```

Inside those files, export named entities:

```ts
export interface InvoiceListItem
export interface InvoiceDetail
export const createInvoiceSchema = ...
export const updateInvoiceSchema = ...
```

---

# What I would not do

## 1. No `hooks/` dumping ground

For your stack, most behavior should live in:

- `features/<domain>/...`
- or `lib/...`

A generic root `hooks/` folder usually becomes a junk drawer. Only create it if you truly have cross-domain client hooks that are UI-framework concerns rather than feature concerns.

## 2. No colocated domain logic under `components/`

Do not let `components/billing` start importing `billing.actions.ts` or session/auth logic. That is the usual rot point.

## 3. No giant monolithic feature file per domain

A single `features/catalog/index.tsx` becomes a trash can quickly. Split by page intent: list/detail/create/edit/shared.

---

# Recommended test config mapping

## `vitest.config.ts`

Target:

- `tests/vitest/**/*.test.ts?(x)`
- jsdom for UI tests
- node for server-only suites where needed
- setup file in `tests/vitest/setup/vitest.setup.ts`

## `playwright.config.ts`

Target:

- `tests/playwright`
- `testDir: 'tests/playwright'`
- `projects` for chromium/firefox/webkit if desired
- auth/setup dependency project if you want seeded roles or pre-auth states
- `outputDir` and traces centralized per Playwright docs. ([Playwright][3])

---

# Bottom line

This is the version I would actually implement for CtrlPlus.

It is:

- closer to true App Router conventions
- more realistic for senior-maintained Next.js code
- better aligned to your current domain boundaries
- stricter about UI vs orchestration vs server concerns
- better for agent navigation
- better for long-term refactors

## Final recommendation

Adopt this as the **target architecture**, then migrate in this order:

1. catalog
2. scheduling
3. billing
4. visualizer
5. settings
6. admin
7. platform

That order matches your most important user-fac
