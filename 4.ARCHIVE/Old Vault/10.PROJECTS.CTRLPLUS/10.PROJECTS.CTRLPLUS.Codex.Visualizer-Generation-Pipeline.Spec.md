## Related

- [[HuggingFace.base]]
- [[AI-Pipelines.base]]

## Type

type:: feature

- feature

## Purpose

This document defines the technical implementation plan for the CtrlPlus visualizer feature.

The visualizer must:

1. take a selected wrap from the catalog

2. take a vehicle image uploaded by the customer

3. use a free Hugging Face model to generate a commercial-style wrap preview similar in intent to the previously demonstrated mock preview

4. store original uploads and generated previews in Cloudinary

5. persist preview metadata in the existing Prisma schema

6. fit the current CtrlPlus codebase architecture and work with the existing catalog migration spec

This document is optimized for Codex-driven implementation.

---

# 1. Product Intent

## Customer experience target

A customer should be able to:

1. open a wrap detail page from the storefront catalog

2. click `Preview on Vehicle`

3. land in `/visualizer` with that wrap preselected

4. upload a vehicle photo

5. generate a preview image that preserves the customer vehicle photo while applying a branded commercial wrap treatment based on the selected wrap

6. view and optionally regenerate that preview

## Important implementation clarification

The target output should resemble the previously generated mock preview:

- same vehicle photo base

- strong branded wrap treatment

- logo/colors from the selected wrap

- commercial wrap look

However, the production implementation must fit a deterministic storefront codebase.

Therefore the implementation should use a hybrid generation strategy:

- catalog-controlled wrap assets

- server-side generation orchestration

- Hugging Face image generation for commercial-style preview output

- Cloudinary as storage system of record for original and generated images

---

# 2. Relationship to the Catalog Spec

This document depends on the catalog spec.

## Required upstream assumptions from catalog

The selected wrap must provide:

- `id`

- `name`

- `description`

- resolved `heroImage`

- exactly one active `visualizerTexture`

- optional prompt metadata for generation

## Required handoff DTO

This visualizer spec assumes a catalog fetcher returns a DTO shaped like:

```ts
export interface VisualizerWrapSelectionDTO {
    id: string

    name: string

    description: string | null

    heroImage: {
        id: string

        url: string
    } | null

    visualizerTexture: {
        id: string

        url: string

        version: number

        contentHash: string
    }

    aiPromptTemplate: string | null

    aiNegativePrompt: string | null
}
```

## Contract rule

The visualizer may only use wraps that are catalog-approved and have a valid active visualizer texture.

---

# 3. Architectural Constraints for CtrlPlus

## Must match current codebase rules

1. `app/**` stays orchestration-only

2. reads live in `lib/fetchers/visualizer`

3. writes live in `lib/actions/visualizer`

4. authz is enforced server-side using current session/authz system

5. preview rows are persisted in `VisualizerPreview`

6. uploads and outputs are stored in Cloudinary, not inline in DB

7. visualizer status lifecycle must be explicit

## Existing system alignment

The codebase already contains:

- `/app/(tenant)/visualizer/page.tsx`

- `components/visualizer/VisualizerClient.tsx`

- `components/visualizer/UploadForm.tsx`

- `components/visualizer/WrapSelector.tsx`

- `components/visualizer/PreviewCanvas.tsx`

- `lib/visualizer/actions/*`

- `VisualizerPreview` schema model

- `@huggingface/inference`

- `cloudinary`

- `sharp`

This spec extends that structure rather than replacing it.

---

# 4. Required Visualizer Modes

## Why multiple modes are needed

A single free Hugging Face generation pipeline will not be perfectly reliable.

Therefore the visualizer should support two operational modes.

## Mode A — `generate`

Primary storefront mode for the desired commercial-style result.

Behavior:

- upload vehicle image

- build a catalog-driven prompt using selected wrap data

- call a free Hugging Face image-to-image model

- persist generated preview

Goal:

- produce a commercial wrap preview similar in intent to the previously generated example

## Mode B — `fallback_composite`

Fallback mode if Hugging Face generation fails or is rate-limited.

Behavior:

- use the selected visualizer texture

- optionally apply simple logo/gradient overlay with server-side compositing

- persist generated output

Goal:

- always give the customer a preview path even if free AI generation is unavailable

## Recommendation

For MVP, expose only one customer-facing button:

- `Generate Preview`

Internally, attempt `generate` first and automatically fall back to `fallback_composite` if needed.

---

# 5. Model Strategy (Free Hugging Face)

## Problem to solve

The previously demonstrated mock image was produced by a generative model that effectively:

- preserved the rough vehicle geometry

- repainted the exterior with a branded commercial design

- used the uploaded vehicle image as visual grounding

To approximate that behavior using free Hugging Face infrastructure, the correct category is image-to-image generation.

## Recommended model choice for MVP

### Primary model

Use a free image-to-image capable Stable Diffusion-class endpoint available through Hugging Face Inference.

Implementation should be model-configurable via env.

### Required env

```ts

HF_API_KEY=

HF_IMAGE_TO_IMAGE_MODEL=

```

### Default recommendation

Use a model configurable as:

```ts
process.env.HF_IMAGE_TO_IMAGE_MODEL ??
    "stabilityai/stable-diffusion-xl-base-1.0"
```

If the selected free endpoint does not support image-to-image through the hosted API in practice, the implementation must support swapping to another image generation model without changing the visualizer API contract.

## Critical implementation rule

Do not hardcode one model deeply into the business logic.

Wrap Hugging Face behind an adapter layer.

---

# 6. Generation Intent and Limitations

## What the Hugging Face step is responsible for

The Hugging Face generation step must:

1. use the customer vehicle image as the structural base

2. use the selected wrap texture and wrap metadata as conditioning inputs

3. output a commercial-style preview image where the selected wrap branding appears applied to the uploaded vehicle

## What it is not responsible for

It does not need to deliver:

- physically accurate 3D panel mapping

- exact manufacturing proofing

- production print-ready layout

This is a sales/selection preview feature for the storefront.

## Product language implication

In UI copy, present this as:

- `AI Preview`

- `Concept Preview`

- `Visual Approximation`

Avoid implying manufacturing exactness.

---

# 7. Preview Lifecycle

## Status values

Use the existing `VisualizerPreview.status` string field with explicit status semantics.

### Required statuses

```ts
export const PreviewStatus = {
    PENDING: "pending",

    PROCESSING: "processing",

    COMPLETE: "complete",

    FAILED: "failed",
} as const
```

## Lifecycle

1. preview row created as `pending`

2. upload validated and stored

3. status becomes `processing`

4. generation runs against selected wrap + uploaded vehicle image

5. generated image stored in Cloudinary

6. preview row updated to `complete`

7. if error occurs, row updated to `failed`

---

# 8. Prisma and Persistence Contract

## Existing schema alignment

The current `VisualizerPreview` model already supports the core fields needed:

- `wrapId`

- `ownerClerkUserId`

- `customerPhotoUrl`

- `processedImageUrl`

- `status`

- `cacheKey`

- `sourceWrapImageId`

- `sourceWrapImageVersion`

## Required persistence usage

### `customerPhotoUrl`

Cloudinary URL for original customer upload.

### `processedImageUrl`

Cloudinary URL for generated preview output.

### `sourceWrapImageId`

The active visualizer texture asset used to generate the preview.

### `sourceWrapImageVersion`

Version of the wrap asset at generation time.

### `cacheKey`

Deterministic hash derived from:

- customer identity

- wrap ID

- source wrap texture ID

- source wrap texture version

- uploaded vehicle image hash

- generation mode

- model name

- prompt version

## Why this matters

If the wrap asset changes later, the preview remains explainable and traceable.

---

# 9. Cloudinary Storage Strategy

## Cloudinary folders

Use explicit folder separation.

### Suggested structure

```text

ctrlplus/

  wraps/

    {wrapId}/

      hero/

      gallery/

      visualizer/

  visualizer/

    uploads/

      {clerkUserId}/

    previews/

      {clerkUserId}/

```

## Required upload types

### Catalog manager uploads

Handled upstream by catalog domain:

- hero

- gallery

- visualizer texture

### Visualizer uploads

Handled here:

- customer vehicle image

- generated preview image

## Required metadata to attach on upload

For preview uploads, attach enough metadata for audit/debug:

```ts

{

  wrapId,

  clerkUserId,

  sourceWrapImageId,

  sourceWrapImageVersion,

  mode,

  model,

}

```

---

# 10. Visualizer Route Contract

## URL format

```text

/visualizer?wrapId={wrapId}

```

## Required server behavior

On page load:

1. require authenticated session

2. validate `visualizer.use`

3. read `wrapId`

4. load visualizer-selectable wrap via fetcher

5. render client shell with selected wrap preloaded

## Required page responsibilities

`app/(tenant)/visualizer/page.tsx` must:

- remain thin

- not perform generation logic

- call fetchers only

- pass typed props into `VisualizerClient`

---

# 11. Required UI Components

## `VisualizerClient`

This is the feature shell.

### Responsibilities

- hold selected wrap state

- render preselected wrap details

- render upload form

- submit preview generation action

- render preview status

- render final preview image

- support retry/regenerate

## `WrapSelector`

### Responsibilities

- show current selected wrap

- optionally allow wrap switching

- display wrap hero image + title

- make it obvious which wrap will drive generation

## `UploadForm`

### Responsibilities

- accept vehicle image

- validate file client-side for quick UX

- submit to server action

- show progress / pending state

## `PreviewCanvas`

For MVP, this can simply render the resulting preview image and state.

It does not need a client-side compositing engine if generation is server-side.

---

# 12. Vehicle Image Upload Requirements

## Accepted file types

```ts
const ACCEPTED_VEHICLE_IMAGE_TYPES = ["image/jpeg", "image/png", "image/webp"]
```

## Size constraints

### Recommended limits

- max 10 MB original upload

- downscale before generation if too large

## Preprocessing requirements

Before sending to Hugging Face:

1. validate MIME

2. validate max size

3. normalize orientation

4. resize to a controlled maximum dimension

5. upload normalized source to Cloudinary

6. use that normalized image as generation input

## Recommended max dimension

```ts
maxWidth = 1536

maxHeight = 1536
```

Reason:

- cheaper inference

- less timeout risk

- good enough quality for storefront previews

---

# 13. Prompt Construction Strategy

## Why prompt construction matters

The selected wrap from the catalog must materially influence the generation result.

That means the prompt cannot be generic.

It must be built from:

- wrap name

- wrap description

- wrap texture asset

- storefront design intent

## Required prompt builder

Implement a dedicated prompt builder in:

```text

lib/visualizer/prompting/build-wrap-preview-prompt.ts

```

## Suggested API

```ts
export interface BuildWrapPreviewPromptInput {
    wrapName: string

    wrapDescription: string | null

    wrapTextureUrl: string

    aiPromptTemplate: string | null
}

export interface WrapPreviewPromptResult {
    prompt: string

    negativePrompt: string
}
```

## Default prompt template

The prompt should instruct the model to:

1. preserve the vehicle photo composition

2. keep the same vehicle

3. apply a professional branded commercial wrap

4. use the selected logo/colors/style from the wrap reference

5. avoid changing environment or vehicle geometry

### Example prompt shape

```text

Use the provided vehicle photo as the base image.

Create a professional commercial vehicle wrap preview on the same vehicle.

Apply branding and visual treatment inspired by the selected wrap reference.

Use the logo, color palette, gradients, and graphic style from the wrap reference image.

Keep the same vehicle, same camera angle, same wheels, same windows, same environment, and same overall photo composition.

The result should look like a realistic promotional wrap concept for a vehicle wrap shop storefront.

```

## Example negative prompt

```text

Do not change the vehicle model, body shape, wheels, windows, mirrors, or scene background.

Do not add people, extra vehicles, text artifacts, duplicated body panels, distorted wheels, melted surfaces, blurry output, or incorrect perspective.

```

## Catalog-driven extension

If `aiPromptTemplate` exists on the selected wrap, append it to the base template.

---

# 14. Using the Wrap Texture as Conditioning Input

## Requirement

The selected wrap must come from the catalog and materially influence the generated result.

## MVP implementation approach

For MVP, use the active `visualizerTexture` as a secondary reference input in the generation adapter.

### Practical strategy

1. generate a combined conditioning image server-side using Sharp

2. compose a side-by-side or inset reference board containing:

   - uploaded vehicle image

   - selected wrap texture reference

3. send that composed image plus text prompt to the model

## Why this is recommended

Free hosted image generation models are more likely to respect reference aesthetics if the reference is visibly included in the generation input rather than only mentioned in text.

## Recommended conditioning board layout

### Board contents

- main panel: customer vehicle image

- reference panel: selected visualizer texture image

- optional reference badge text omitted for MVP unless needed

### Implementation module

```text

lib/visualizer/preprocessing/build-generation-input-board.ts

```

### Output

A temporary normalized image buffer or Cloudinary URL passed into the Hugging Face adapter.

---

# 15. Hugging Face Adapter Layer

## Required abstraction

Implement a dedicated adapter layer so models can be swapped without changing domain actions.

## File structure

```text

lib/visualizer/huggingface/

  client.ts

  generate-wrap-preview.ts

  map-hf-error.ts

  types.ts

```

## Adapter interface

```ts
export interface GenerateWrapPreviewInput {
    model: string

    baseVehicleImageUrl: string

    wrapTextureUrl: string

    generationBoardUrl: string

    prompt: string

    negativePrompt: string
}

export interface GenerateWrapPreviewResult {
    imageBuffer: Buffer

    model: string
}
```

## Required behavior

The adapter must:

1. call Hugging Face using `@huggingface/inference`

2. support image-to-image style generation if available for the configured model

3. return a buffer suitable for Cloudinary upload

4. throw normalized domain errors

## Environment variables

```ts

HF_API_KEY=

HF_IMAGE_TO_IMAGE_MODEL=

HF_TIMEOUT_MS=

```

---

# 16. Fallback Composite Pipeline

## Why fallback is mandatory

Free Hugging Face inference can fail due to:

- cold starts

- quotas

- unsupported model task behavior

- long generation time

- transient provider errors

## Fallback goal

Always return something useful.

## Required fallback behavior

If generation fails:

1. build a simpler preview using the selected visualizer texture

2. preserve the uploaded vehicle photo

3. create a concept-style overlay image

4. store result in Cloudinary

5. mark preview as `complete` if fallback succeeds

## Suggested implementation modules

```text

lib/visualizer/fallback/

  build-simple-wrap-preview.ts

  place-logo-overlay.ts

  tint-vehicle-panels.ts

```

## Product rule

Customer should still receive a preview if possible.

Do not fail the whole feature just because free generation fails once.

---

# 17. Required Visualizer Actions

## `createVisualizerPreview`

Primary action to create preview rows and orchestrate generation.

### Signature

```ts
export async function createVisualizerPreview(input: {
    wrapId: string

    vehicleImageFile: File
}): Promise<{ previewId: string }>
```

### Required sequence

1. require authenticated session

2. require `visualizer.use`

3. validate `wrapId`

4. load selected wrap via catalog handoff fetcher

5. validate vehicle image file

6. normalize/upload vehicle image to Cloudinary

7. create `VisualizerPreview` row with `pending`

8. update to `processing`

9. build prompt

10. build generation board

11. call Hugging Face adapter

12. upload generated output to Cloudinary

13. update preview row to `complete`

14. if primary generation fails, attempt fallback

15. if fallback also fails, mark `failed`

16. write audit log if applicable

## `regenerateVisualizerPreview`

### Signature

```ts
export async function regenerateVisualizerPreview(input: {
    previewId: string
}): Promise<void>
```

### Required behavior

- verify preview ownership

- reuse original customer photo and wrap source metadata

- rerun generation

- update preview row in place or create a new version depending on chosen policy

For MVP, in-place update is acceptable.

---

# 18. Required Fetchers

## `getVisualizerWrapSelection`

Loads selected wrap from catalog handoff contract.

## `getVisualizerPreviewById`

Loads one preview by ID with ownership enforcement.

## `listVisualizerPreviewsForCustomer`

Optional for history/retry surfaces.

---

# 19. Cache Key Strategy

## Required helper

Implement in:

```text

lib/visualizer/cache-key.ts

```

## Cache key inputs

```ts

{

  ownerClerkUserId,

  wrapId,

  sourceWrapImageId,

  sourceWrapImageVersion,

  vehicleImageHash,

  generationMode,

  model,

  promptVersion,

}

```

## Why this matters

If the same customer uploads the same image against the same wrap/version/model, the system can reuse a prior preview instead of paying for another generation call.

## MVP rule

Before generating, look for an existing non-expired preview with the same cache key.

If found:

- return existing preview

- skip generation

---

# 20. Error Model

## Normalize these categories

```ts
export type VisualizerGenerationErrorCode =
    | "UNAUTHORIZED"
    | "INVALID_WRAP"
    | "INVALID_UPLOAD"
    | "MODEL_TIMEOUT"
    | "MODEL_UNAVAILABLE"
    | "GENERATION_FAILED"
    | "CLOUDINARY_UPLOAD_FAILED"
```

## UI behavior by category

### Invalid upload

Show actionable validation message.

### Model unavailable / timeout

Show retry message and, if fallback succeeded, show fallback result.

### Generation failed

Show generic error and retry button.

---

# 21. Proposed File Structure

```text

lib/visualizer/

  actions/

    create-visualizer-preview.ts

    regenerate-visualizer-preview.ts

  fetchers/

    get-visualizer-preview-by-id.ts

    get-visualizer-wrap-selection.ts

  cloudinary/

    upload-preview-image.ts

    upload-vehicle-image.ts

  preprocessing/

    normalize-vehicle-upload.ts

    build-generation-input-board.ts

  prompting/

    build-wrap-preview-prompt.ts

  huggingface/

    client.ts

    generate-wrap-preview.ts

    map-hf-error.ts

    types.ts

  fallback/

    build-simple-wrap-preview.ts

  cache-key.ts

  types.ts

```

---

# 22. Component Contract Changes

## `VisualizerClient`

### Props

```ts
interface VisualizerClientProps {
    selectedWrap: VisualizerWrapSelectionDTO | null

    initialPreview: VisualizerPreviewDTO | null
}
```

## `UploadForm`

Should submit:

```ts

{

  wrapId,

  vehicleImageFile,

}

```

## `PreviewCanvas`

For MVP, rename mentally as preview display surface.

It should render:

- loading state

- failed state

- preview image from `processedImageUrl`

---

# 23. Security Rules

## Required server-side enforcement

1. user must be authenticated

2. user must have `visualizer.use`

3. preview rows must only be readable by their owner unless elevated access is intentional

4. never trust client-provided Cloudinary URLs

5. never trust client-provided wrap asset IDs without server validation

## Preview ownership rule

All preview reads/writes must be scoped by `ownerClerkUserId`.

---

# 24. Testing Requirements

## Unit tests

Add/update tests for:

1. prompt builder output

2. cache key determinism

3. wrap selection fetcher

4. invalid upload rejection

5. preview ownership enforcement

6. Hugging Face adapter error normalization

7. fallback path activation

## Integration tests

1. vehicle upload normalization

2. Cloudinary upload success/failure

3. preview row status transitions

4. generated preview persistence

## E2E smoke path

1. sign in

2. open catalog

3. open wrap detail

4. click preview on vehicle

5. upload vehicle image

6. wait for preview state

7. see generated image

---

# 25. Implementation Order

## Phase 1 — catalog handoff alignment

1. ensure `VisualizerWrapSelectionDTO` exists

2. ensure wrap detail page routes to `/visualizer?wrapId=`

3. ensure selected wrap fetcher resolves active visualizer texture

## Phase 2 — vehicle upload and persistence

1. implement upload validation

2. normalize image with Sharp

3. upload normalized source to Cloudinary

4. create preview row

## Phase 3 — Hugging Face generation

1. implement prompt builder

2. implement generation board builder

3. implement Hugging Face adapter

4. upload generated output to Cloudinary

5. complete preview lifecycle

## Phase 4 — fallback pipeline

1. implement fallback composite

2. wire fallback into action error handling

3. improve UI recovery states

## Phase 5 — caching and polish

1. add cache key lookup

2. add regenerate action

3. add history/retry support if needed

---

# 26. Codex Task List

## Immediate tasks

1. create `get-visualizer-wrap-selection.ts`

2. create `normalize-vehicle-upload.ts`

3. create `upload-vehicle-image.ts`

4. create `build-wrap-preview-prompt.ts`

5. create `build-generation-input-board.ts`

6. create `huggingface/client.ts`

7. create `huggingface/generate-wrap-preview.ts`

8. create `create-visualizer-preview.ts`

9. update `/app/(tenant)/visualizer/page.tsx`

10. update `VisualizerClient` + `UploadForm` + `PreviewCanvas`

11. add fallback composite implementation

12. add tests for prompting, status transitions, and ownership

---

# 27. Final Implementation Guidance

## Do

- treat the catalog-selected visualizer texture as the authoritative design reference

- treat the uploaded vehicle image as the authoritative structural base

- isolate Hugging Face behind an adapter

- persist all originals and outputs in Cloudinary

- use explicit preview statuses

- build around retry/fallback behavior

## Do not

- persist base64 images in DB

- let the client choose arbitrary texture URLs

- bury model-specific assumptions in UI code

- couple visualizer generation logic directly to page components

- assume the free Hugging Face endpoint will always succeed

---

# 28. Success Criteria

The visualizer implementation is complete when:

1. customer can arrive from a wrap detail page with wrap preselected

2. customer can upload a vehicle photo

3. the selected wrap from the catalog materially influences the generated output

4. original upload and generated preview are both stored in Cloudinary

5. preview metadata is persisted in `VisualizerPreview`

6. failed Hugging Face calls do not break the feature outright if fallback succeeds

7. all code follows current CtrlPlus architectural boundaries

---

# 29. Storefront Positioning Guidance

This feature should be treated as a storefront sales aid for the vehicle wrap shop.

It is not a print-proofing engine.

The correct product framing is:

- visual preview

- AI concept render

- design approximation to help customers shop and decide

Implement accordingly.
