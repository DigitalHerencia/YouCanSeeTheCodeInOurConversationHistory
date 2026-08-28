## Related

- [[CtrlPlus Server-First Architecture Blueprint]]

## Type

type:: system

- system

Below is a formalized **canonical architecture ruleset** for the CtrlPlus refactor, grounded in the uploaded codebase export and its existing server-first architectural direction. The current repo already separates `lib/actions`, `lib/fetchers`, `lib/auth`, `lib/authz`, `lib/db/selects`, `lib/db/transactions`, `lib/uploads`, `lib/integrations`, `schemas`, and `types`, so the rules below are a formal tightening and normalization of patterns that are already present rather than a conceptual reset.

## 1. Purpose

This ruleset defines the canonical placement, classification, and migration constraints for top-level exported modules in CtrlPlus. It standardizes:

- file classification

- canonical file paths

- server/client contract boundaries

- DTO and schema conventions

- constants consolidation

- database selection and transaction boundaries

- provider adapter boundaries

- upload/storage boundaries

The objective is to eliminate ambiguous placement, reduce boundary leakage, and make Copilot/Codex refactors deterministic.

---

## 2. Core architectural stance

CtrlPlus is a **server-first App Router codebase** with these primary boundaries:

- `app/` = route shell and segment orchestration

- `features/` = page and interaction orchestration

- `components/` = presentational UI

- `lib/actions/*` = server mutations

- `lib/fetchers/*` = server reads

- `lib/auth/*` = authentication helpers

- `lib/authz/*` = authorization policies and guards

- `lib/db/selects/*` = reusable static Prisma select objects

- `lib/db/transactions/*` = reusable transactional DB operations

- `schemas/*` = runtime validation contracts

- `types/*` = DTOs and shared TypeScript contracts

This direction is already visible in the current export, including the existing `lib/actions`, `lib/fetchers`, `lib/auth`, `lib/authz`, `lib/cache`, `lib/constants`, `lib/db/selects`, `lib/db/transactions`, `lib/integrations`, `lib/uploads`, `schemas`, and `types` structure.

---

## 3. Classification model

Every top-level export must be mapped to exactly one of the following canonical classifications.

### 3.1 Classification categories

#### `types`

Use for:

- shared DTOs

- API-facing contracts

- server-safe TypeScript shapes

- shared primitives such as `Timestamp`

Do not place:

- Zod schemas

- Prisma selects

- DOM/File/FormData types

- runtime validation helpers

#### `client-types`

Use for:

- `File`

- `Blob`

- `FormData`

- browser-only event types

- DOM-specific or React client-only type contracts

These must live in `*.client.types.ts`.

#### `schemas`

Use for:

- Zod schemas

- server input parsing

- normalization/validation of incoming payloads

- `z.infer` type exports derived from runtime schemas

Do not place:

- DB model types

- client-only field state shapes

- query selectors

- mutation orchestration

#### `fetchers`

Use for:

- server reads

- domain read models / DTO shaping

- DB read composition

- cache policy for reads

- permission-aware read access

Fetchers must not:

- perform writes

- contain UI formatting logic

- own provider env reads

- act as general utilities

#### `actions`

Use for:

- server mutations

- auth/authz enforcement

- schema parsing

- transaction orchestration

- cache invalidation

- typed action result return shapes or redirects

Actions must not:

- trust client validation

- expose raw Prisma models casually

- own provider adapter setup

- contain general-purpose constants or helpers unrelated to mutation flow

#### `selects`

Use for:

- static Prisma select objects only

- reusable query shape definitions

Selects must not:

- execute queries

- call Prisma

- contain authorization logic

- transform DTOs

#### `transactions`

Use for:

- reusable database mutation units

- multi-step write logic within a DB boundary

- Prisma transactional composition

Transactions must not:

- parse request input

- read provider env

- perform routing or redirects

- contain UI-facing formatting

#### `integrations`

Use for:

- provider adapters

- provider SDK initialization

- provider env reads

- provider request/response translation

Integrations must not:

- own application business rules

- mix with upload pipeline orchestration

- become generic utility dumping grounds

#### `uploads`

Use for:

- file validation helpers

- image processing

- upload orchestration

- storage delegation to provider adapters

Uploads must not:

- own provider env reads directly

- mix application authz decisions with file handling

- contain unrelated domain business logic

#### `utils`

Use for:

- stateless generic helpers

- pure formatting/parsing/assertion utilities

- app-wide low-level helpers with no domain ownership

Do not place:

- DTO shapers that belong to a fetcher

- upload orchestration

- auth/authz logic

- schema parsing

- provider adapters

#### `constants`

Use for:

- application-wide immutable values

- permission constants

- status constants

- route constants consolidated into `app.ts`

Do not place:

- dynamic configuration

- logic

- derived runtime data

- provider secrets

---

## 4. Canonical tree

The canonical tree below is the enforced target.

```txt
lib/
  actions/
    auth.actions.ts
    scheduling.actions.ts
    billing.actions.ts
    settings.actions.ts
    admin.actions.ts
    catalog.actions.ts
    visualizer.actions.ts
    platform.actions.ts

  fetchers/
    auth.fetchers.ts
    scheduling.fetchers.ts
    billing.fetchers.ts
    settings.fetchers.ts
    admin.fetchers.ts
    catalog.fetchers.ts
    visualizer.fetchers.ts
    platform.fetchers.ts

  auth/
    session.ts
    identity.ts
    redirect.ts
    clerk.ts

  authz/
    guards.ts
    policy.ts
    capabilities.ts

  db/
    prisma.ts
    selects/
      catalog.selects.ts
      visualizer.selects.ts
      admin.selects.ts
      auth.selects.ts
      settings.selects.ts
      scheduling.selects.ts
      billing.selects.ts
      platform.selects.ts
    transactions/
      auth.transactions.ts
      scheduling.transactions.ts
      billing.transactions.ts
      settings.transactions.ts
      admin.transactions.ts
      catalog.transactions.ts
      visualizer.transactions.ts
      platform.transactions.ts

  cache/
    cache-keys.ts
    revalidate-tags.ts
    unstable-cache.ts

  integrations/
    clerk.ts
    stripe.ts
    blob.ts
    huggingface.ts

  uploads/
    file-validation.ts
    image-processing.ts
    storage.ts

  utils/
    cn.ts
    dates.ts
    currency.ts
    pagination.ts
    search-params.ts
    assertions.ts

  constants/
    app.ts
    permissions.ts
    statuses.ts

types/
  common.types.ts
  auth.types.ts
  catalog.types.ts
  visualizer.types.ts
  visualizer.client.types.ts
  scheduling.types.ts
  scheduling.client.types.ts
  billing.types.ts
  billing.client.types.ts
  settings.types.ts
  admin.types.ts
  platform.types.ts
  api.types.ts

schemas/
  auth.schemas.ts
  catalog.schemas.ts
  visualizer.schemas.ts
  scheduling.schemas.ts
  billing.schemas.ts
  settings.schemas.ts
  admin.schemas.ts
  platform.schemas.ts
  common.schemas.ts
  api.schemas.ts
```

This tree is consistent with the existing repository’s current top-level layering, while formalizing missing domains such as `admin.selects.ts`, `auth.selects.ts`, `settings.selects.ts`, and the missing transaction files for several domains. The current export already shows only partial coverage in `lib/db/selects` and `lib/db/transactions`, so those missing domain files are a deliberate completion of the pattern rather than an arbitrary invention.

---

## 5. Placement rules

## 5.1 General placement rule

Each file must have one primary responsibility. If a file mixes concerns, split it by classification, not by convenience.

Examples:

- a file that both validates inputs and mutates DB data must be split into `schemas/*` and `lib/actions/*`

- a file that both reads provider env and validates uploaded files must be split into `lib/integrations/*` and `lib/uploads/*`

- a file that defines DTOs and browser `File` types must be split into `types/*.types.ts` and `types/*.client.types.ts`

---

## 5.2 Types rules

### 5.2.1 DTO timestamps

All DTO timestamps must use:

```ts
export type Timestamp = string
```

This must live in `types/common.types.ts`.

DTOs exposed outside the DB layer must use `Timestamp`, not `Date`.

### 5.2.2 Date vs DTO naming

Do not hide client/server or DB/DTO boundaries with vague aliases.

Prefer:

- `InvoiceModel` for DB-adjacent shapes with `Date`

- `InvoiceDto` or `Invoice` DTO shape with `Timestamp`

Do not use:

- `type A = B`

- aliases that erase runtime/storage boundary meaning

### 5.2.3 Client-only type separation

Any type that references browser primitives must move to:

- `billing.client.types.ts`

- `visualizer.client.types.ts`

- `scheduling.client.types.ts`

The current repo already has some client split files such as `scheduling.client.types.ts` and `visualizer.client.types.ts`; this rule formalizes that pattern and extends it consistently.

---

## 5.3 Schema rules

Every server input contract must have a Zod schema in `schemas/*`.

Actions must call `.parse()` or `.safeParse()` on the schema before mutation.

Schemas may export inferred types:

```ts
export const updateBookingSchema = z.object({...})
export type UpdateBookingInput = z.infer<typeof updateBookingSchema>
```

But inferred types do not replace DTO files when the shape is an application contract used broadly across boundaries.

The current export already shows domain schemas in `schemas/*.schemas.ts`; the rule here is to eliminate stray schema fragments from noncanonical locations like `@/schema/catalog/...` or `@/schema/visualizer/...`, which appear in current imports and indicate schema fragmentation.

---

## 5.4 Fetcher rules

Fetchers are server-only read paths.

### Requirements

- `auth.fetchers.ts` must import `server-only`

- all fetchers must return DTO-safe shapes

- fetchers own read caching policy

- fetchers may depend on `lib/db/selects/*`, auth/authz, constants, and types

- fetchers must not perform writes

The current export already shows a dedicated `lib/fetchers/*` layer and some feature server components consuming these fetchers directly, which supports formalizing this as the canonical read boundary.

---

## 5.5 Action rules

Actions are the mutation backbone.

Every action must follow this sequence:

1. authenticate

2. authorize

3. parse input via Zod schema

4. call transaction(s) or perform tightly scoped write logic

5. invalidate cache tags/paths as needed

6. return typed result or redirect

Actions may call:

- auth helpers

- authz guards/policy

- transactions

- cache helpers

- integrations

- uploads

Actions must not:

- expose provider env access inline

- contain static Prisma select objects

- accept unparsed arbitrary payloads

The current codebase already places business mutations in `lib/actions/*`, including billing, scheduling, visualizer, catalog, and platform actions, so this is a normalization rule, not a new architecture.

---

## 5.6 DB select rules

`lib/db/selects/*` contains static select objects only.

Allowed:

```ts
export const bookingDetailSelect = {
  id: true,
  createdAt: true,
  ...
} satisfies Prisma.BookingSelect
```

Not allowed:

- `prisma.booking.findMany(...)`

- DTO mapping

- authz checks

- input parsing

The export already shows `billing.selects.ts`, `catalog.selects.ts`, `platform.selects.ts`, `scheduling.selects.ts`, and `visualizer.selects.ts`, which confirms this layer exists but is incomplete by domain.

---

## 5.7 DB transaction rules

`lib/db/transactions/*` contains reusable transactional operations.

Transactions should encapsulate DB mutation mechanics, not request semantics.

Allowed:

- multi-table writes

- Prisma transaction callbacks

- DB consistency logic

Not allowed:

- route redirects

- provider adapter setup

- browser types

- schema definitions

The current export shows transactions for billing, platform, and scheduling only. Auth, settings, admin, catalog, and visualizer transaction files are missing and should be introduced when a domain has reusable write semantics that should not stay embedded inside actions.

---

## 5.8 Integration rules

Only files under `lib/integrations/*` may read provider env for third-party services.

Canonical integrations:

- `clerk.ts`

- `stripe.ts`

- `blob.ts`

- `huggingface.ts`

### Migration rule

`cloudinary.ts` must be replaced or re-homed conceptually as `blob.ts` if Cloudinary remains the backing provider.

Reason:

- the app-level abstraction should be storage/blob oriented

- provider-specific naming should not leak into the rest of the codebase

So:

- `lib/uploads/storage.ts` delegates to `lib/integrations/blob.ts`

- `blob.ts` may internally use Cloudinary today

- future provider replacement should not change upload-layer call sites

The current export shows `cloudinary.ts`, `clerk.ts`, `stripe.ts`, and `huggingface.ts`, so this rule is specifically a provider-abstraction cleanup.

---

## 5.9 Upload rules

Uploads belong under `lib/uploads/*`.

### File responsibilities

- `file-validation.ts` = validation and safe helpers

- `image-processing.ts` = transformations, masks, segmentation preprocessing/postprocessing

- `storage.ts` = storage orchestration via `lib/integrations/blob.ts`

Uploads may depend on integrations, but integrations must not depend on uploads.

The current export already shows `storage.ts`, `file-validation.ts`, and `image-processing.ts`, with `storage.ts` using Cloudinary and `image-processing.ts` using Hugging Face. This confirms the separation is mostly there and only needs normalization via the `blob.ts` abstraction.

---

## 5.10 Utils rules

Utilities must remain generic and stateless.

Keep:

- `cn.ts`

- `dates.ts`

- `currency.ts`

- `pagination.ts`

- `search-params.ts`

- `assertions.ts`

Remove from `utils/` anything that is actually:

- DTO shaping for a domain fetcher

- settings-specific domain logic

- provider orchestration

- form orchestration beyond very thin generic helpers

The current export contains borderline files like `visualizer-dto.ts`, `settings.ts`, `catalog-asset.ts`, and `forms.ts`, which suggests utility creep. Those should be evaluated and either moved to canonical domain locations or reduced to truly generic helpers.

---

## 5.11 Constants rules

Constants are narrowed to:

- `app.ts`

- `permissions.ts`

- `statuses.ts`

### Consolidation rule

`routes.ts` must be removed, and route constants must be folded into `app.ts`.

This is directly relevant because the current export still contains both `lib/constants/app.ts` and `lib/constants/routes.ts`, and `lib/utils/search-params.ts` imports both. That is exactly the ambiguity this rule removes.

---

## 6. No barrel files

No `index.ts` barrel files are allowed anywhere in this tree.

Reason:

- they obscure boundaries

- they increase accidental coupling

- they make large refactors and import tracing less deterministic

- they blur server/client intent

All imports must remain explicit.

---

## 7. Server/client boundary rules

### 7.1 DTO boundary

`types/*.types.ts` must remain server-safe and transport-safe.

### 7.2 Browser boundary

Any contract involving:

- `File`

- `FormData`

- `Blob`

- drag/drop payloads

- input change events

must live in `*.client.types.ts`.

### 7.3 Action input boundary

Server actions must parse server-safe inputs from `schemas/*`.
They must not depend on browser-native object types unless explicitly converted in client code before submission.

### 7.4 Search params boundary

`lib/utils/search-params.ts` is the canonical parser for `searchParams`, converting App Router input into a plain normalized record suitable for fetchers and feature orchestration.

This formalizes a pattern already visible in the current repo, where search params are used by catalog and visualizer paths and helper logic already exists.

---

## 8. Migration directives from current repo

Based on the current export, the following migration directives are implied.

## 8.1 Keep as canonical with minimal change

These existing areas already match the intended direction:

- `lib/actions/*`

- `lib/fetchers/*`

- `lib/auth/*`

- `lib/authz/*`

- `lib/cache/*`

- `schemas/*.schemas.ts`

- `types/*.types.ts`

- `lib/uploads/*`

## 8.2 Normalize and complete

These existing areas need completion or cleanup:

- `lib/db/selects/*` missing some domains

- `lib/db/transactions/*` missing some domains

- `lib/constants/routes.ts` must merge into `app.ts`

- `lib/integrations/cloudinary.ts` should become `lib/integrations/blob.ts`

- schema imports using `@/schema/...` should be consolidated into `@/schemas/...`

- ambiguous utility/domain files should be reviewed and re-homed

## 8.3 Review and likely relocate

These files look suspect under the new rules:

- `lib/utils/visualizer-dto.ts`

- `lib/utils/settings.ts`

- `lib/utils/catalog-asset.ts`

- `lib/utils/forms.ts`

These may belong partly in:

- fetchers

- domain-specific mappers

- feature-level form helpers

- constants/types/schemas depending on actual content

---

## 9. Enforced naming conventions

### Files

- all canonical files must be explicit and domain-qualified

- use `*.actions.ts`, `*.fetchers.ts`, `*.selects.ts`, `*.transactions.ts`, `*.schemas.ts`, `*.types.ts`, `*.client.types.ts`

### Types

- `Timestamp = string`

- prefer explicit `Model`, `Dto`, `Input`, `Result`, `View` naming

- avoid alias chains that hide storage/transport boundaries

### Schemas

- `{verb}{Entity}Schema` or `{entity}{Purpose}Schema`

- infer types locally where useful, but do not let inferred types replace canonical DTO modules

---

## 10. Refactor acceptance criteria

A refactor is compliant only if all of the following are true:

- every top-level exported file maps to a canonical classification

- no file mixes classification responsibilities

- `routes.ts` is removed and route constants live in `app.ts`

- all DTO timestamps use `Timestamp`

- all browser-only types are isolated in `*.client.types.ts`

- all server action inputs are parsed via Zod in `schemas/*`

- all static Prisma selects live in `lib/db/selects/*`

- all reusable DB writes live in `lib/db/transactions/*`

- all provider env reads live only in `lib/integrations/*`

- uploads delegate storage to `lib/integrations/blob.ts`

- no barrel files exist

- imports are explicit

- search param parsing is centralized

- client/server boundaries are visible in naming and placement

---

## 11. Copilot/Codex-ready condensed rule block

You can paste this directly into a refactor prompt:

```md
Refactor CtrlPlus to the canonical server-first tree.

Rules:

1. Classify every top-level export into exactly one category:
    - types
    - client-types
    - schemas
    - fetchers
    - actions
    - selects
    - transactions
    - integrations
    - uploads
    - utils
    - constants

2. Move files to canonical paths only:
    - lib/actions/\*.actions.ts
    - lib/fetchers/\*.fetchers.ts
    - lib/auth/\*
    - lib/authz/\*
    - lib/db/selects/\*.selects.ts
    - lib/db/transactions/\*.transactions.ts
    - lib/cache/\*
    - lib/integrations/\*
    - lib/uploads/\*
    - lib/utils/\*
    - lib/constants/\*
    - types/\*.types.ts
    - types/\*.client.types.ts
    - schemas/\*.schemas.ts

3. Remove barrels/index files everywhere.

4. Consolidate routes constants into lib/constants/app.ts and remove lib/constants/routes.ts.

5. Use `export type Timestamp = string` in types/common.types.ts.
   All DTO timestamps must use `Timestamp`, not `Date`.

6. Split browser-only types into `*.client.types.ts`.
   DOM/File/FormData/browser event types must never live in server DTO files.

7. All server inputs must have Zod schemas in schemas/\*.
   All actions must parse inputs with `schema.parse()` or `safeParse()`.

8. lib/db/selects/\* may contain static Prisma select objects only.
   No query execution, no DTO mapping, no auth logic.

9. lib/db/transactions/\* may contain reusable DB write logic only.
   No schema parsing, no redirects, no provider env reads.

10. Provider env reads may exist only in lib/integrations/\*.
    Rename Cloudinary abstraction to blob.ts.
    uploads/storage.ts must delegate to lib/integrations/blob.ts.

11. Keep utils generic and stateless only.
    Move domain-specific mappers/helpers out of utils if they leak domain concerns.

12. Preserve explicit client/server boundaries in names and imports.
```

---

## 12. Bottom line

Your proposed tree is sound. The important tightening is not the tree itself; it is the **classification discipline**:

- one file, one responsibility class

- one canonical location per class

- explicit server/client contract names

- Zod as authoritative server input contract

- DTOs as transport-safe shapes

- provider adapters isolated

- DB selects and transactions isolated

- route constants merged into `app.ts`

That gives you a refactor target that is deterministic enough for Copilot to execute without inventing its own structure.

If you want, the next step is the **actual file-by-file mapping table** from current CtrlPlus files to target canonical destinations.
