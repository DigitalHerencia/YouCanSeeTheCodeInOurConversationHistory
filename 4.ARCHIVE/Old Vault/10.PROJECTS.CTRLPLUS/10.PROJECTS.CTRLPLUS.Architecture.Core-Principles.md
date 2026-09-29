## Related

- [[CtrlPlus Server-First Architecture Blueprint]]
- [[CtrlPlus Refactor]]

## Type

- system
  Your target architecture is fundamentally **server-first**:

- `app/` = route shell and segment boundaries
- `features/` = page/view orchestration
- `components/` = pure UI
- `lib/<domain>/fetchers` = server reads
- `lib/<domain>/actions` = server mutations
- `types/` + `schema/` = contracts and validation

Everything below should reinforce that, not cut across it.

---

# 1. Next.js caching: where it belongs and how to use it

## What matters

In App Router, caching is not one thing. The relevant layers are:

- **Data Cache** for cached data work
- **Full Route Cache** for rendered route output on the server
- **Router Cache** on the client for route segment payloads during navigation ([Next.js](https://nextjs.org/docs/app/deep-dive/caching?utm_source=chatgpt.com "Guides: Caching | Next.js"))

Also, current Next.js guidance is important here:

- `fetch` is **not automatically cached by default**
- you opt into caching with `cache: 'force-cache'`
- or you time-bound it with `next: { revalidate: ... }`
- and you can invalidate tagged work with `revalidateTag` or by path with `revalidatePath` ([Next.js](https://nextjs.org/docs/app/getting-started/caching-and-revalidating?utm_source=chatgpt.com "Getting Started: Caching and Revalidating | Next.js"))

## Where caching lives in your architecture

### `lib/<domain>/fetchers/*`

This is where caching decisions should live.

Reason:

- fetchers define read semantics
- cache lifetime is a property of a read path
- page blocks should consume read models, not invent caching policy ad hoc

Example responsibilities:

- `catalog/fetchers/wraps.ts`
    - list wraps
    - get wrap by id
    - get featured wraps
    - attach cache tags like `catalog`, `wrap:${wrapId}`

- `billing.fetchers.ts`
    - invoices are often more freshness-sensitive
    - probably dynamic or short-lived revalidation
    - tag by `billing`, `invoice:${invoiceId}`

- `platform.fetchers.ts`
    - usually dynamic, often uncached or very short TTL

## Practical rule set for CtrlPlus

### Cache aggressively

Use caching for:

- catalog browse data
- public marketing content
- reference/config data
- settings that change infrequently
- read-heavy dashboards where slight staleness is acceptable

### Avoid or minimize caching

Use dynamic reads for:

- auth-dependent per-user pages
- payment status
- booking availability near-real-time
- platform diagnostics
- anything where stale data creates operational mistakes

### Invalidation belongs in `lib/<domain>/actions/*`

When a mutation succeeds:

- revalidate by **tag** for domain data
- revalidate by **path** for route-specific rebuilds when needed

Next.js explicitly supports `revalidateTag` in server environments, and recommends `profile="max"` for stale-while-revalidate behavior. ([Next.js](https://nextjs.org/docs/app/api-reference/functions/revalidateTag?utm_source=chatgpt.com "Functions: revalidateTag | Next.js"))

## Recommended pattern

### Read path

- fetcher performs Prisma/query work
- fetcher tags/cache-controls the result
- feature block consumes fetcher output

### Write path

- action validates input
- action enforces authz
- action mutates
- action calls `revalidateTag(...)` and/or `revalidatePath(...)`
- action redirects or returns structured result

## What to avoid

Do **not**:

- put cache policy in presentational components
- scatter `revalidatePath` calls through feature UI
- default everything to dynamic
- default everything to cached

That produces either stale bugs or unnecessary server cost.

---

# 2. React Hook Form: where it fits

## RHF’s role in this stack

React Hook Form is a **client-side form state and UX layer**. It is not your validation authority and not your mutation system.

In your architecture:

- `schema/*` = source of truth for runtime validation
- `lib/<domain>/actions/*` = source of truth for mutation and security
- RHF = ergonomics for input registration, dirty state, errors, and controlled UX

The resolver package supports Zod-based validation and can infer types from the schema. ([GitHub](https://github.com/react-hook-form/resolvers?utm_source=chatgpt.com "GitHub - react-hook-form/resolvers: 📋 Validation resolvers: Yup, Zod, Superstruct, Joi, Vest, Class Validator, io-ts, Nope, computed-types, typanion, Ajv, TypeBox, ArkType, Valibot, effect-ts, VineJS and Standard Schema"))

## Where RHF belongs

### `features/<domain>/create/*`

### `features/<domain>/edit/*`

That is where the **form container** lives:

- `useForm`
- `zodResolver(...)`
- submit wiring
- server action result mapping
- pending state
- post-submit reset/redirect behavior

### `components/<domain>/forms/*`

Pure field groups only:

- `invoice-form-fields.tsx`
- `booking-form-fields.tsx`
- `wrap-form-fields.tsx`

These should receive:

- `form`
- field names
- option data
- display props

They should not own mutation logic.

## Correct mental model

### RHF handles

- field registration
- client-side validation feedback
- touched/dirty/isSubmitting
- complex field arrays
- conditional field rendering
- reusable form shells

### Server action handles

- authoritative validation
- auth/authz
- DB writes
- side effects
- cache invalidation
- redirect semantics

## Best-practice pattern for this repo

Use:

- RHF + Zod resolver in client form shells
- the **same domain schema family** again on the server
- server actions for submission

Next.js forms with Server Actions are first-class, and React/Next support pending states and optimistic patterns around these flows. ([Next.js](https://nextjs.org/docs/app/guides/forms?utm_source=chatgpt.com "Guides: Forms | Next.js"))

## Important nuance

Do **not** let RHF become a second business-logic layer.

Bad pattern:

- form component transforms domain data
- form component decides permissions
- form component calculates final write payload semantics

Good pattern:

- form prepares user input
- server action interprets and enforces business rules

---

# 3. Suspense and skeletons: where they fit

## What Suspense is doing here

In App Router, `loading.tsx` creates route-segment loading UI and works with streaming. Manual `<Suspense>` boundaries let you stream subsections of a page independently. Shared layouts stay interactive while lower segments load. ([Next.js](https://nextjs.org/docs/app/api-reference/file-conventions/loading?utm_source=chatgpt.com "File-system conventions: loading.js | Next.js"))

## Where route-level loading belongs

### `app/**/loading.tsx`

Use for:

- route shell skeletons
- immediate navigation feedback
- preserving shell continuity while data blocks stream in

Examples:

- `app/(app)/catalog/loading.tsx`
- `app/(app)/billing/loading.tsx`

These should render **shell-level** placeholders:

- page intro skeleton
- filter bar skeleton
- table shell skeleton
- detail page header skeleton

## Where manual Suspense belongs

Inside `features/*/blocks/*`

Use it to split expensive regions:

- dashboard metrics vs activity feed
- booking table vs availability sidebar
- invoice detail vs payment history
- visualizer result vs generation status

This gives you selective streaming, not one giant page-level wait. Next.js recommends Suspense for streaming subsections as well as `loading.tsx` for route segments. ([Next.js](https://nextjs.org/docs/app/api-reference/file-conventions/loading?utm_source=chatgpt.com "File-system conventions: loading.js | Next.js"))

## Skeleton guidance

Use skeletons that match the eventual layout:

- table rows for list pages
- cards for detail pages
- sidebar slot placeholders for dashboards
- image/canvas boxes for visualizer

Do not use generic spinners for everything. Spinners are weak information architecture.

## Practical standard

### Route loading

- handled by `loading.tsx`

### Subsection loading

- handled by `<Suspense fallback={<DomainSkeleton />}>`

### Component loading

- usually avoided unless the component is async or gated by lazy subcontent

---

# 4. Optimistic UI: when it fits and when it does not

## What it is

React’s `useOptimistic` lets you show a projected UI state before the server confirms the mutation. `useTransition` lets you run non-blocking updates and show pending UI cleanly. ([React](https://react.dev/reference/react/useTransition?utm_source=chatgpt.com "useTransition – React"))

## Where optimistic belongs in your architecture

### `features/<domain>/*-client.tsx`

Only there.

Optimistic logic is interaction orchestration, so it belongs in feature-level client components, not in pure UI and not in `lib`.

## Good optimistic use cases for CtrlPlus

Use optimistic UI for:

- row status toggles
- archive/unarchive
- lightweight label/status edits
- local list insertion/removal where rollback is easy
- filter/search UI that updates URL/client state

## Bad optimistic use cases for CtrlPlus

Avoid optimistic UI for:

- invoice payment success
- booking slot reservation where contention exists
- anything with inventory/availability collisions
- permission-sensitive destructive actions
- multi-step writes with external services

In those cases, prefer:

- pending state
- disabled controls
- explicit success/failure reconciliation
- server-confirmed refresh

## Rule of thumb

Use optimistic only when:

- the success probability is high
- rollback is trivial
- the consequence of being briefly wrong is low

Otherwise use `useTransition` + pending visuals, not optimistic projection.

---

# 5. Server Actions: the actual mutation backbone

This is one of the important things you did not explicitly call out strongly enough.

## In this architecture, Server Actions are central

Next.js Server Actions:

- run on the server
- integrate with forms
- can update data and return updated UI/data in one roundtrip
- integrate directly with cache revalidation ([Next.js](https://nextjs.org/docs/app/building-your-application/data-fetching/server-actions-and-mutations?utm_source=chatgpt.com "Getting Started: Updating Data | Next.js"))

## Where they belong

### `lib/<domain>/actions/*`

That is the correct place for:

- `createBooking`
- `updateBooking`
- `cancelBooking`
- `createInvoice`
- `updateInvoice`
- `markWrapPublished`
- `submitVisualizerJob`

## What a server action should do

Every action should consistently do this:

1. authenticate user
2. authorize against tenant/entity
3. parse input with domain schema
4. perform transaction or mutation
5. trigger cache invalidation
6. return typed action result or redirect

## What a server action should not do

Do not:

- return raw Prisma objects casually
- accept unvalidated arbitrary payloads
- trust RHF/client-side validation
- embed display-only formatting logic
- mix unrelated domain mutations into one giant action file function

---

# 6. `useTransition` vs `useOptimistic` vs route loading

These are different tools.

## `loading.tsx`

Use for:

- route segment loading during navigation

## `<Suspense>`

Use for:

- streaming independent subsections of async UI

## `useTransition`

Use for:

- non-blocking state changes
- pending UI around filters, search param changes, tab switches, form submission orchestration

## `useOptimistic`

Use for:

- speculative local UI updates before confirmation

A common mistake is using optimistic UI when the correct tool is just `useTransition`.

For your project, `useTransition` will be more broadly useful than `useOptimistic`.

---

# 7. URL state and search params: a major convention you should standardize

This is one of the big things people overlook.

## Recommendation

For list/index pages:

- filters
- search
- sorting
- pagination
- tabs

should be **URL-driven** whenever possible.

## Why

That gives you:

- shareable views
- reload-safe state
- better server rendering
- cleaner fetcher contracts
- less client-only state drift

## Where it belongs

### `features/<domain>/shared/*-query-state.ts`

Parse and normalize search params there.

### `lib/<domain>/fetchers/*`

Accept normalized query input.

### `app/<domain>/page.tsx`

Pass `searchParams` into the feature block.

This is especially important for:

- catalog list
- billing list
- scheduling list
- platform event tables

---

# 8. View models / DTO shaping: another thing you should explicitly standardize

Do not pass raw DB objects deep into components.

## Pattern

### fetcher returns domain DTO / read model

Example:

- `InvoiceListItem`
- `BookingDetailView`
- `WrapDetailView`

### feature maps to screen-specific view model if needed

Example:

- table row model
- chart series model
- filter options model

### component receives exactly what it needs

No Prisma baggage. No nullable swamp.

## Why this matters

It:

- stabilizes component contracts
- prevents accidental data leaks
- reduces churn when DB schema changes
- keeps pure UI actually pure

---

# 9. Auth and authorization at the server boundary

You mentioned ownership and permissions checks. This needs to be a hard rule.

## Place auth in:

- `lib/auth/*`
- `lib/authz/*`
- every fetcher/action that touches tenant data

## Do not rely on:

- client route hiding
- disabled buttons
- feature UI assumptions

UI can reflect permissions. It cannot enforce them.

This is especially critical in:

- billing
- scheduling
- admin/owner dashboards
- platform ops
- visualizer assets and previews

---

# 10. Cache tags by domain: standardize this now

This is the cleanest way to make caching workable at scale.

## Example tag scheme

```txt
catalog
catalog:list
wrap:{wrapId}

scheduling
scheduling:list
booking:{bookingId}
availability:{date}:{serviceId}

billing
billing:list
invoice:{invoiceId}
payment:{invoiceId}

visualizer
visualizer:list
preview:{previewId}
```

Then mutations know exactly what to invalidate.

Next.js supports tagging cached work and invalidating by tag. ([Next.js](https://nextjs.org/docs/app/getting-started/caching-and-revalidating?utm_source=chatgpt.com "Getting Started: Caching and Revalidating | Next.js"))

---

# 11. Error handling conventions

Another overlooked area.

## Route errors

Use:

- `error.tsx` for recoverable segment failures
- `global-error.tsx` for catastrophic failures
- `not-found.tsx` for entity-missing cases

## Action errors

Standardize typed action results:

- `{ ok: true, data }`
- `{ ok: false, formError, fieldErrors }`

or redirect when appropriate.

## UI errors

Map action errors back into RHF cleanly in feature-level form containers.

Do not improvise error shapes per domain.

---

# 12. Modern conventions you should explicitly include

## A. Progressive enhancement for forms

Next.js forms with Server Actions support progressive enhancement, especially when invoked from forms. That is a strong fit for business CRUD flows. ([Next.js](https://nextjs.org/docs/13/app/building-your-application/data-fetching/server-actions-and-mutations?utm_source=chatgpt.com "Data Fetching: Server Actions and Mutations | Next.js"))

### Architectural implication

Prefer actual `<form action={serverAction}>` semantics where feasible, even if RHF is layered in for UX.

---

## B. Reusable domain form shells

For create/edit in each domain, standardize:

- feature-level `*-form.tsx` container
- shared `*-form-shell.tsx`
- pure field groups in `components/<domain>/forms/*`

That avoids duplicated create/edit logic while keeping feature orchestration separate from presentation.

---

## C. `defaultValues` and reset discipline in RHF

When editing existing entities:

- derive stable defaults from fetched DTOs
- reset when source entity changes
- do not construct form defaults ad hoc in many nested children

This avoids stale form state and uncontrolled drift.

---

## D. Avoid client-side fetching by default

This is a major one for your stack.

Use client-side fetching only when the interaction truly requires:

- polling
- incremental live updates
- client-only browser APIs
- temporary local-only experiences

For the rest, use:

- server components
- fetchers
- actions
- router refresh/revalidation when needed

---

## E. Keep Prisma selection logic centralized

Use `lib/db/selects/*.selects.ts` for reusable query shapes.

That gives:

- consistent DTO construction
- lower overfetch risk
- less duplication in fetchers

This matters a lot once billing/catalog/scheduling get broader.

---

## F. Use transitions for URL updates

For filter/sort/pagination interactions:

- update search params inside a transition
- keep toolbar interactive
- avoid blocking the input thread

This usually feels better than forcing full hard-loading indicators everywhere.

---

## G. Test by layer, not by file proximity

For your test layout:

### Vitest

Use for:

- schemas
- utilities
- authz helpers
- pure UI
- actions/fetchers integration where practical

### Playwright

Use for:

- async Server Component flows
- form submission lifecycles
- cache-invalidated navigations
- role-based UI
- payment/scheduling/visualizer end-to-end

Next.js explicitly notes limitations around async Server Component testing in Vitest, which is why E2E remains important. ([Next.js](https://nextjs.org/docs/app/guides/forms?utm_source=chatgpt.com "Guides: Forms | Next.js"))

---

# How all of this maps to one concrete flow

## Example: `app/(app)/billing/[invoiceId]/edit/page.tsx`

### `app/.../page.tsx`

- reads route params
- renders `InvoiceEditBlock`

### `features/billing/edit/invoice-edit-block.tsx`

- async server component
- calls `getInvoiceForEdit(invoiceId)`
- calls supporting fetchers for customers/options
- renders `InvoiceEditForm`

### `features/billing/edit/invoice-edit-form.tsx`

- client component
- RHF + Zod resolver
- uses `useTransition` for submit pending state
- may use optimistic local row editing for line items only if safe
- maps server result errors back to fields

### `components/billing/forms/invoice-form-fields.tsx`

- pure fields
- receives RHF form API and options
- no mutation logic

### `lib/actions/billing.actions.ts`

- `updateInvoice`
- auth + authz
- parse input with `updateInvoiceSchema`
- transaction
- `revalidateTag('invoice:123', 'max')` or related tags
- redirect or return typed result

### `app/(app)/billing/[invoiceId]/loading.tsx`

- shell skeleton during navigation

### `features/billing/detail/*`

- detail page re-renders with fresh server data after revalidation

That is the pattern you want everywhere.

---

# Bottom line

The architecture works when each concern stays in its lane:

## Server truth

- fetchers
- actions
- schemas
- authz
- caching

## Feature orchestration

- RHF containers
- transitions
- optimistic UI where safe
- search param state
- page assembly

## Pure UI

- presentational components
- skeletons
- cards, tables, field groups

## Route conventions

- `layout.tsx`
- `loading.tsx`
- `error.tsx`
- `not-found.tsx`
- thin `page.tsx`

The biggest things you were at risk of under-specifying were:

- cache policy ownership
- server action centrality
- URL/search-param state conventions
- DTO/view-model shaping
- when **not** to use optimistic UI
- progressive enhancement with Server Actions
- strict server-boundary authz

If you want, the next useful deliverable is a **domain-by-domain implementation matrix** showing exactly how catalog, scheduling, billing, visualizer, settings
