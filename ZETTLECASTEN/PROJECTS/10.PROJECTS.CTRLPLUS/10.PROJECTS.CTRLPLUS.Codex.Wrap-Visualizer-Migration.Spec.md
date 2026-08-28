## Related

- [[Codex Implementation Spec Visualizer Generation Pipeline Catalog-Driven Hugging Face Cloudinary]]

## Type

type:: feature

- feature

## Purpose

This document defines the target catalog system and catalog-management workflows required to support a wrap-driven vehicle visualizer in CtrlPlus.

The product should be treated as a storefront for a vehicle wrap shop, not a generic SaaS back office. The catalog and manager therefore need to support both customer-facing merchandising and owner-facing content management for wrap products.

The implementation target is not a generic image gallery. The catalog becomes the authoritative source for:

1. customer-facing wrap discovery

2. wrap detail presentation

3. visualizer-selectable wrap assets

4. owner/admin asset management

5. publish-readiness validation

6. deterministic wrap-to-visualizer handoff

This spec is written for code generation and implementation planning.

---

# 1. Product Intent

## User experience target

A customer should be able to:

1. browse a professional catalog of wraps

2. open a wrap detail page

3. review hero image, gallery images, description, pricing, and categories

4. select that wrap for preview

5. upload a photo of their own vehicle

6. generate a commercial-style visual preview where the selected wrap is applied to the uploaded vehicle photo

## Core product rule

The catalog does not merely display wraps.

The catalog defines the exact asset package used by the visualizer.

Therefore, every publishable wrap must carry both:

- customer-facing display assets

- visualizer-facing render assets

---

# 2. Migration Objective

## Existing direction

The current repo already has:

- `Wrap`

- `WrapImage`

- `WrapCategory`

- `VisualizerPreview`

- catalog pages

- catalog manager

- wrap image kinds including visualizer-related kinds

- server-side actions/fetchers for wrap image management

## Migration goal

Move from a basic image-backed catalog into a deterministic wrap product system where each wrap can power both:

- catalog merchandising

- visualizer rendering

## Non-goal

Do not attempt physically accurate 3D wrap simulation.

The target is a convincing commercial preview generator using:

- curated wrap asset packages

- original user vehicle photo

- server-side preview generation

- deterministic asset resolution

---

# 3. Architectural Principles

## Required architectural rules

1. `app/**` remains orchestration-only

2. all reads live in `lib/catalog/fetchers/**` or `lib/visualizer/fetchers/**`

3. all writes live in `lib/catalog/actions/**` or `lib/visualizer/actions/**`

4. authz is enforced server-side only

5. image-role resolution must be deterministic

6. upload validation must be server-side

7. catalog and visualizer remain separate domains with a strict handoff contract

## Domain boundary

### Catalog owns

- wrap CRUD

- category assignment

- asset uploads

- publish-readiness

- customer browsing

- wrap detail presentation

- selection payload for visualizer

### Visualizer owns

- upload flow for customer vehicle photo

- preview generation

- preview status lifecycle

- segmentation/compositing pipeline

- preview persistence

---

# 4. Catalog Domain Model

## Wrap product model

Each `Wrap` is a product-like entity representing a selectable wrap concept.

### Required wrap attributes

- `id`

- `name`

- `description`

- `price`

- `installationMinutes`

- `isHidden`

- `categories`

- `images`

- publish readiness status (derived, not stored unless needed later)

## Wrap image roles

The current `WrapImage.kind` string field should continue to be the role discriminator.

### Required roles

```ts
export const WrapImageKind = {
    HERO: "hero",

    GALLERY: "gallery",

    VISUALIZER_TEXTURE: "visualizer_texture",

    VISUALIZER_MASK_HINT: "visualizer_mask_hint",
} as const
```

## Role semantics

### `hero`

Primary customer-facing image used in:

- catalog card

- detail header

- featured views

Exactly one active hero image per wrap.

### `gallery`

Supplemental customer-facing images used in:

- detail gallery

- product walkthrough

- merchandising/supporting visuals

Zero or more gallery images.

### `visualizer_texture`

Primary render asset used to drive the preview generator.

This is not necessarily the same as a hero image.

It may be:

- a texture plate

- a brand composition

- a designed wrap master

- a wide banner-like wrap source intended for compositing

Exactly one active visualizer texture per wrap for MVP.

### `visualizer_mask_hint`

Optional helper asset for future rendering refinement.

Potential future uses:

- orientation hints

- logo-placement guidance

- texture cropping guidance

- category-specific rendering presets

Not required for MVP publishability unless explicitly enabled later.

---

# 5. Catalog Customer Experience

## 5.1 Catalog index page

### Goals

The catalog index must function like a modern product catalog.

### Required UI blocks

1. page intro / merchandising header

2. search

3. category filter

4. sort controls

5. pagination

6. results count

7. product grid

8. strong empty state

### Card requirements

Each wrap card must show:

- resolved hero image

- wrap name

- short description or excerpt

- price

- installation duration if available

- category summary if useful

- CTA to detail page

- optional CTA to preview

### Critical rule

Do not use `images[0]` implicitly.

All display surfaces must resolve hero assets intentionally.

## 5.2 Wrap detail page

### Goals

The detail page must present a wrap as a real product.

### Required sections

1. hero image

2. product title

3. price

4. installation duration

5. category badges

6. description

7. gallery carousel/grid

8. CTA: preview on vehicle

9. CTA: book installation

### Required data contract

The detail page must receive a DTO with resolved asset groupings, not a generic unordered image array.

### Example detail DTO

```ts
export interface WrapDetailViewDTO {
    id: string

    name: string

    description: string | null

    price: number

    installationMinutes: number | null

    isHidden: boolean

    categories: WrapCategoryDTO[]

    heroImage: WrapImageDTO | null

    galleryImages: WrapImageDTO[]

    visualizerTexture: WrapImageDTO | null

    visualizerMaskHint: WrapImageDTO | null

    createdAt: Date

    updatedAt: Date
}
```

## 5.3 Visualizer handoff from catalog

### Required behavior

When the customer clicks `Preview on Vehicle`, the app must route into `/visualizer` with the selected wrap preloaded.

### Recommended URL contract

```ts

/visualizer?wrapId={wrapId}

```

### Requirement

The visualizer must load the selected wrap using a server fetcher and validate that:

- the wrap exists

- the wrap is visible to the current user

- the wrap is publishable for visualizer use

---

# 6. Publish-Readiness Model

## Why this matters

A wrap should not become customer-visible if it cannot be previewed correctly.

The catalog is now tightly coupled to the visualizer funnel.

## MVP publish rules

A wrap is publishable only if:

1. wrap is not soft-deleted

2. wrap has a non-empty `name`

3. wrap has a valid `price`

4. wrap has at least one active `hero` image

5. wrap has at least one `gallery` or `hero` image for detail presentation

6. wrap has exactly one active `visualizer_texture`

7. all referenced assets are valid and not soft-deleted

## Optional stricter rules

For later:

- minimum description length

- category required

- minimum image dimensions

- minimum texture aspect ratio

- approved design status

## Derived readiness DTO

```ts
export interface WrapPublishReadinessDTO {
    isPublishable: boolean

    issues: string[]

    warnings: string[]

    assetSummary: {
        heroCount: number

        galleryCount: number

        visualizerTextureCount: number

        visualizerMaskHintCount: number
    }
}
```

---

# 7. Catalog Management Experience

## Goal

The owner/admin manager must support full lifecycle management of wraps as visualizer-backed products.

## Required manager capabilities

1. create wrap

2. update wrap metadata

3. hide/unhide wrap

4. soft-delete wrap

5. assign categories

6. upload and manage hero images

7. upload and manage gallery images

8. upload and manage visualizer texture asset

9. inspect publish readiness

10. launch preview test flow

## Management UI sections

### A. wrap metadata editor

Fields:

- name

- description

- price

- installation minutes

- hidden/published state

### B. category manager

Controls:

- attach category

- detach category

- save mappings

### C. display asset manager

Controls:

- upload hero image

- upload gallery image(s)

- activate/deactivate

- reorder gallery

- remove image

### D. visualizer asset manager

Controls:

- upload visualizer texture

- replace active texture

- preview texture asset

- optionally upload mask hint

- inspect file metadata

### E. readiness panel

Shows:

- publishability state

- missing asset warnings

- conflicting asset role warnings

- actions required before publish

## Required management rules

### Hero image rules

- max one active hero

- activating a hero deactivates all other heroes

### Visualizer texture rules

- max one active visualizer texture for MVP

- activating a visualizer texture deactivates all other textures

### Gallery rules

- multiple allowed

- reorderable

- inactive gallery images may remain but should not display publicly

---

# 8. Data Contracts for Code Generation

## 8.1 Public catalog list DTO

```ts
export interface WrapCatalogCardDTO {
    id: string

    name: string

    description: string | null

    price: number

    installationMinutes: number | null

    heroImage: WrapImageDTO | null

    categories: WrapCategoryDTO[]
}
```

## 8.2 Public detail DTO

```ts
export interface WrapDetailViewDTO {
    id: string

    name: string

    description: string | null

    price: number

    installationMinutes: number | null

    heroImage: WrapImageDTO | null

    galleryImages: WrapImageDTO[]

    categories: WrapCategoryDTO[]

    visualizerAvailable: boolean
}
```

## 8.3 Manager row DTO

```ts
export interface WrapManagerRowDTO {
    id: string

    name: string

    isHidden: boolean

    price: number

    installationMinutes: number | null

    categories: WrapCategoryDTO[]

    heroImage: WrapImageDTO | null

    galleryImages: WrapImageDTO[]

    visualizerTexture: WrapImageDTO | null

    readiness: WrapPublishReadinessDTO

    createdAt: Date

    updatedAt: Date
}
```

## 8.4 Visualizer selection DTO

```ts
export interface VisualizerWrapSelectionDTO {
    id: string

    name: string

    description: string | null

    heroImage: WrapImageDTO | null

    visualizerTexture: {
        id: string

        url: string

        version: number

        contentHash: string
    }
}
```

---

# 9. Required Catalog Fetchers

## 9.1 `searchWrapsForCatalog`

Purpose:

- list customer-visible wraps

- resolve hero image explicitly

- return lightweight card DTOs

### Signature

```ts
export async function searchWrapsForCatalog(
    filters: SearchWrapsInput,
): Promise<PaginatedResult<WrapCatalogCardDTO>>
```

## 9.2 `getWrapDetailView`

Purpose:

- load full wrap detail DTO

- resolve grouped asset roles

- expose `visualizerAvailable`

### Signature

```ts
export async function getWrapDetailView(
    wrapId: string,

    scope?: WrapVisibilityScope,
): Promise<WrapDetailViewDTO | null>
```

## 9.3 `getWrapManagerRows`

Purpose:

- load wrap rows for owner/admin management

- include readiness data

- include grouped assets

### Signature

```ts
export async function getWrapManagerRows(): Promise<WrapManagerRowDTO[]>
```

## 9.4 `getVisualizerSelectableWrapById`

Purpose:

- validate selected wrap for visualizer use

- resolve active visualizer texture

- return only visualizer-needed data

### Signature

```ts
export async function getVisualizerSelectableWrapById(
    wrapId: string,

    authz: AuthzContext,
): Promise<VisualizerWrapSelectionDTO | null>
```

---

# 10. Required Catalog Actions

## 10.1 Wrap CRUD

- `createWrap`

- `updateWrap`

- `hideWrap`

- `unhideWrap`

- `deleteWrap`

## 10.2 Category actions

- `createWrapCategory`

- `updateWrapCategory`

- `deleteWrapCategory`

- `setWrapCategoryMappings`

## 10.3 Asset actions

- `addWrapImage`

- `updateWrapImageMetadata`

- `removeWrapImage`

- `reorderWrapImages`

## 10.4 Publish control

- `validateWrapPublishReadiness`

- optional `publishWrap`

- optional `unpublishWrap`

### `publishWrap` behavior

For MVP, `publishWrap` can simply:

- validate readiness

- set `isHidden = false` if valid

- write audit log

### `unpublishWrap` behavior

- set `isHidden = true`

- retain assets

- write audit log

---

# 11. Asset Resolution Rules

## Problem to eliminate

Current implicit image ordering is not acceptable for the new system.

No public or visualizer surface should derive meaning from unordered `images[]`.

## Required resolver helpers

Implement pure domain helpers in `lib/catalog/asset-resolution.ts`.

### Required helpers

```ts
export function resolveActiveHeroImage(
    images: WrapImageDTO[],
): WrapImageDTO | null

export function resolveGalleryImages(images: WrapImageDTO[]): WrapImageDTO[]

export function resolveActiveVisualizerTexture(
    images: WrapImageDTO[],
): WrapImageDTO | null

export function resolveActiveVisualizerMaskHint(
    images: WrapImageDTO[],
): WrapImageDTO | null
```

## Resolution rules

### Hero

- filter `kind === 'hero'`

- `isActive === true`

- `deletedAt === null` upstream

- choose the active one

- if multiple active, return deterministic first and report readiness issue

### Gallery

- filter `kind === 'gallery'`

- `isActive === true`

- sort by `displayOrder asc`

### Visualizer texture

- filter `kind === 'visualizer_texture'`

- `isActive === true`

- choose exactly one

- if none, visualizer unavailable

- if multiple, readiness failure

---

# 12. File and Upload Requirements

## Customer-facing display assets

### Accepted formats

- `image/jpeg`

- `image/png`

- `image/webp`

### Recommended uses

- hero: jpg/webp preferred

- gallery: jpg/webp preferred

## Visualizer texture assets

### Accepted formats for MVP

- `image/png`

- `image/webp`

- optionally `image/jpeg` if needed for design intake

### Preferred format

- PNG or WEBP with high fidelity

### Why

The visualizer texture is not merely a thumbnail. It is a render source.

Therefore it should preserve:

- gradients

- logos

- text

- color edges

## Validation rules

For `visualizer_texture` uploads, validate more strictly than hero/gallery:

- max file size

- minimum width

- minimum height

- recommended aspect ratio range

- reject empty/invalid files

---

# 13. Proposed File Structure Changes

## Catalog domain

```text

lib/catalog/

  actions/

    create-wrap.ts

    update-wrap.ts

    delete-wrap.ts

    manage-categories.ts

    manage-wrap-images.ts

    publish-wrap.ts

  fetchers/

    get-wrap-categories.ts

    get-wrap-detail-view.ts

    get-wrap-manager-rows.ts

    get-wraps-for-catalog.ts

    get-visualizer-selectable-wrap.ts

  validators/

    publish-wrap.ts

  asset-resolution.ts

  image-storage.ts

  types.ts

```

## Visualizer domain handoff helpers

```text

lib/visualizer/

  actions/

    create-preview-job.ts

    regenerate-preview.ts

    upload-photo.ts

  fetchers/

    get-preview.ts

    get-selected-wrap.ts

  pipeline/

    segment-vehicle.ts

    refine-mask.ts

    build-wrap-layer.ts

    composite-preview.ts

  types.ts

```

---

# 14. Catalog Page Implementation Notes

## `app/(tenant)/catalog/page.tsx`

### Must do

- remain server component

- parse search params

- call `searchWrapsForCatalog`

- call `getWrapCategories`

- render shadcn-based catalog UI

### Must not do

- inline custom raw inputs outside form architecture where avoidable

- rely on implicit images array semantics

- duplicate filter UI blocks unnecessarily

## `app/(tenant)/catalog/[id]/page.tsx`

### Must do

- call `getWrapDetailView`

- pass grouped/resolved asset DTO to UI

- not compute role resolution in page layer

## `app/(tenant)/catalog/manage/page.tsx`

### Must do

- enforce `catalog.manage`

- call `getWrapManagerRows`

- call `getWrapCategories`

- render unified manager shell

---

# 15. UI Component Requirements

## Public catalog components

### `WrapCard`

Must accept resolved `heroImage`, not generic first image.

### `WrapGrid`

Must render only publishable/visible wraps from fetcher output.

### `WrapDetail`

Must render:

- hero image

- gallery

- CTA to visualizer

- CTA to booking

- product metadata

## Manager components

### `CatalogManager`

Must become a coherent admin feature component, not a loose composition of partially wired props.

### `WrapImageManager`

Must distinguish asset roles clearly:

- Hero

- Gallery

- Visualizer texture

- Visualizer mask hint

### Required manager UX improvements

- readiness badge

- missing asset warnings

- active role badge

- replace texture flow

- safer remove action

---

# 16. Visualizer Handoff Contract

## Required contract

The visualizer must consume only catalog-approved, deterministic wrap assets.

### Handoff payload

```ts
export interface VisualizerWrapInput {
    wrapId: string

    wrapName: string

    textureAsset: {
        id: string

        url: string

        version: number

        contentHash: string
    }
}
```

## Flow

1. customer enters visualizer with `wrapId`

2. server loads `VisualizerWrapSelectionDTO`

3. upload form accepts vehicle photo

4. preview job persists against selected wrap

5. preview row stores `sourceWrapImageId` and `sourceWrapImageVersion`

## Why `sourceWrapImageVersion` matters

If the owner changes the wrap texture later, old previews remain explainable and traceable.

---

# 17. Preview Rendering Intent

## Important product clarification

The system should aim to reproduce the same _kind_ of outcome as an image-generation demo:

- commercial-style branded wrap look

- believable placement of logo/colors

- strong preview value for shopping

## But implementation reality

The production app should not call a general image-generation endpoint that redraws the whole car without control.

The preview engine should instead:

1. preserve the user image

2. isolate vehicle surface as well as feasible

3. build a wrap layer from catalog-selected texture asset

4. composite into the original photo

5. store preview result

## Why

This is the only deterministic, scalable, app-compatible implementation path.

---

# 18. Required Tests

## Catalog domain tests

Add or update tests for:

1. hero resolution

2. gallery resolution

3. visualizer texture resolution

4. conflicting active role detection

5. publish-readiness validation

6. hidden wrap exclusion from public catalog

7. manager row DTO construction

8. detail DTO construction

## UI tests

Add/update tests for:

1. wrap card uses hero image, not `images[0]`

2. wrap detail renders gallery correctly

3. preview CTA includes selected wrap handoff

4. manager shows readiness issues

5. manager enforces asset-role distinction

## E2E coverage

Required smoke path:

1. sign in

2. browse catalog

3. open wrap detail

4. click preview on vehicle

5. confirm selected wrap is preloaded in visualizer

---

# 19. Implementation Order

## Phase 1 — Data and resolution cleanup

1. centralize `WrapImageKind`

2. add asset-resolution helpers

3. create readiness validator

4. create new DTO builders

## Phase 2 — Public catalog correctness

1. refactor catalog list fetcher

2. refactor detail fetcher

3. update `WrapCard`

4. update `WrapDetail`

5. clean search/filter UX

## Phase 3 — Manager correctness

1. refactor `CatalogManager`

2. improve `WrapImageManager`

3. add readiness panel

4. add publish/unpublish actions

## Phase 4 — Visualizer handoff

1. add visualizer-selectable wrap fetcher

2. add `/visualizer?wrapId=` preload flow

3. persist selected source texture metadata in previews

---

# 20. Codex Execution Guidance

## Preferred implementation style

- create pure domain helpers first

- then refactor fetchers to use them

- then refactor UI components to consume resolved DTOs

- then update tests

## Avoid

- page-level asset grouping logic

- generic `images[0]` usage

- mixing catalog and visualizer pipeline logic in one module

- client-authoritative selection logic

- inline image payload persistence in DB

## Success criteria

The catalog migration is complete when:

1. customer catalog looks like a real product surface

2. wrap detail page has correct hero/gallery behavior

3. manager distinguishes display assets from visualizer assets cleanly

4. publishability is validated deterministically

5. visualizer can preload a selected wrap from catalog with a guaranteed active texture asset

---

# 21. Immediate Code Tasks

## Task list

1. introduce `asset-resolution.ts`

2. add `WrapDetailViewDTO`, `WrapCatalogCardDTO`, `WrapManagerRowDTO`, `VisualizerWrapSelectionDTO`

3. implement `getWrapDetailView`

4. implement `getWrapsForCatalog`

5. implement `getWrapManagerRows`

6. update `WrapCard` to use resolved `heroImage`

7. update `WrapDetail` to use resolved asset groups

8. add publish-readiness validator and tests

9. add `/visualizer?wrapId=` handoff contract

10. refactor manager UI to expose visualizer texture explicitly

---

# 22. Final Instruction

When generating code from this spec, prefer deterministic asset-role resolution and DTO-based rendering over implicit array-order assumptions.

The catalog is now a wrap product system for a storefront whose primary downstream consumer is the visualizer.

Implement accordingly.
