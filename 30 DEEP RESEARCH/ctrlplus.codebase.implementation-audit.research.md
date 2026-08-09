---
title: CtrlPlus Codebase Implementation Audit
type: research
scope: project
project: CtrlPlus
domain: codebase
artifact: implementation-audit
kind: research
namespace: ctrlplus.codebase.implementation-audit.research
status: active
authority: reference
parent: "[[devnotes.deep-research.map]]"
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
  - "[[obsidian.contracts.property-schema]]"
  - "[[obsidian.contracts.note-types]]"
supersedes: []
tags:
  - research
  - ctrlplus
  - codebase
created:
updated: 2026-08-08
---

## Related

- [[Building Viable AI Video Workflow Products Without Sora-Style Failure Modes]]

## Type

type:: research

- research

# CtrlPlus repo audit and codebase report

## What’s in this repo

The repository is a **Next.js App Router** product with a single dark-mode UI shell and a feature set centered on a **vehicle wrap catalog**, an **AI-assisted “visualizer” preview workflow**, **scheduling**, **billing**, and operational dashboards for admins/platform operators. fileciteturn5file0L1-L1 fileciteturn63file0L1-L1 fileciteturn72file0L1-L1

The canonical architecture guidelines in `/.github/copilot/**` describe a **server-first** structure where `app/` is route orchestration, `features/` is page composition/orchestration, `components/` is presentational UI, and `lib/` is “server authority” (fetchers/actions/auth/integrations). fileciteturn141file0L1-L1

Technically, the stack is modern and capable: **Next 16**, **React 19**, **Tailwind v4**, Prisma on Neon, Clerk auth, Stripe billing, and Cloudinary/Hugging Face integrations for image workflows. fileciteturn5file0L1-L1 fileciteturn129file0L1-L1 fileciteturn131file0L1-L1 fileciteturn132file0L1-L1 fileciteturn136file0L1-L1

## Domain features and functionality

### Catalog domain

Backend: The catalog domain is centered on `Wrap`, `WrapImage`, `WrapCategory`, and mappings, with asset roles like `hero`, `gallery`, and `visualizer_texture`. fileciteturn128file0L1-L1 fileciteturn121file0L1-L1
Frontend: A browse experience exists with URL-synced filters and pagination, plus a catalog manager UI for catalog-capable users. fileciteturn89file0L1-L1 fileciteturn90file0L1-L1 fileciteturn104file0L1-L1 fileciteturn109file0L1-L1

Notable: The catalog fetchers include an **“example/demo” wrap** mechanism, implying the catalog can operate with seeded/demo content when real records are sparse. This is useful for demos but should be clearly gated/configured for production. fileciteturn37file0L1-L1

### Visualizer domain

Backend: Visualizer previews are persisted in `VisualizerPreview` with status + expiration, and a deterministic fallback compositing pipeline exists (Sharp + segmentation mask + texture overlay) with SSRF protection via an allowlist of image hosts. fileciteturn128file0L1-L1 fileciteturn135file0L1-L1 fileciteturn136file0L1-L1
Frontend: The visualizer workspace includes wrap selection, file upload, status polling, preview display, and “regenerate” behavior. fileciteturn111file0L1-L1 fileciteturn113file0L1-L1 fileciteturn117file0L1-L1 fileciteturn115file0L1-L1

Important fit-to-spec note: The `/.github/copilot` visualizer guidance explicitly describes preview generation as **async and non-blocking**, with polling/updates rather than tying generation to the request lifecycle. fileciteturn143file0L1-L1

### Scheduling domain

Backend: Scheduling uses availability rules and bookings with reservation holds (BookingReservation), and fetchers provide views for dashboards/manager grids. fileciteturn128file0L1-L1 fileciteturn38file0L1-L1
Frontend: There is a scheduling dashboard feature that computes stats and renders manager rows. fileciteturn137file0L1-L1 fileciteturn138file0L1-L1

### Billing domain

Backend: Billing models include Invoice, InvoiceLineItem, Payment, plus Stripe webhook idempotency via StripeWebhookEvent. fileciteturn128file0L1-L1
Frontend: Billing includes an invoices dashboard and a management area that can void invoices and create new ones. fileciteturn123file0L1-L1 fileciteturn124file0L1-L1 fileciteturn127file0L1-L1
Operations: Stripe webhook handling validates the signature via Stripe’s webhook construction path before processing. fileciteturn139file0L1-L1 fileciteturn131file0L1-L1

### Settings, admin, and platform ops

Settings persist per-user website settings (WebsiteSettings) and store some tenant-like settings/history via audit logs. fileciteturn128file0L1-L1 fileciteturn51file0L1-L1 fileciteturn52file0L1-L1
Admin/platform tooling exists for operational health checks and maintenance tasks (webhook lock cleanup, replay failures, pruning previews), gated by role/capability checks. fileciteturn49file0L1-L1 fileciteturn50file0L1-L1 fileciteturn56file0L1-L1

## Frontend UI/UX and design system

The design language is consistent in intent: **dark industrial palette**, **blue primary accent**, high-contrast headings, and a workspace layout with a sidebar shell. Global theme tokens are declared in `globals.css` with `--primary` set to a blue and background/foreground defined for dark UI. fileciteturn64file0L1-L1 fileciteturn77file0L1-L1

The component library is largely shadcn-inspired (e.g., sidebar primitives and common card/table/button patterns), and the workspace header/metric/empty-state patterns provide a coherent “dashboard” feel. fileciteturn70file0L1-L1 fileciteturn92file0L1-L1 fileciteturn103file0L1-L1

Design consistency gaps show up in a few recurring places:

- The global radius tokens imply a sharp-corner look (`--radius: 0`), but multiple high-surface areas use strong rounding (`rounded-2xl`, `rounded-xl`, inline `borderRadius: '12px'`). This creates a subtle brand mismatch between “industrial sharp” and “rounded SaaS.” fileciteturn64file0L1-L1 fileciteturn117file0L1-L1 fileciteturn118file0L1-L1
- Image rendering frequently opts out of Next image optimization via `<img>` or `unoptimized`, which undercuts performance (LCP) and consistency (responsive sizing/quality). fileciteturn95file0L1-L1 fileciteturn101file0L1-L1 fileciteturn102file0L1-L1
- Tailwind scanning likely misses `features/**` because `tailwind.config.ts` does not include it in `content`. This can cause missing classes in production builds (especially for feature-heavy pages). fileciteturn65file0L1-L1 fileciteturn117file0L1-L1

## Architecture and code organization

### Alignment with the intended server-first model

A lot of the code matches the intended shape: thin route pages that delegate to feature components, and server work consolidated into `lib` fetchers/actions. fileciteturn141file0L1-L1 fileciteturn89file0L1-L1 fileciteturn37file0L1-L1 fileciteturn39file0L1-L1

Auth is implemented server-side using Clerk’s server APIs and a simple capability model (`ROLE_CAPABILITIES`), and redirect_url inputs are sanitized to prevent open redirects. fileciteturn53file0L1-L1 fileciteturn57file0L1-L1 fileciteturn82file0L1-L1

### Where the code deviates from repo “source of truth” criteria

The `/.github/copilot` criteria emphasize:

- **Tenancy scoping is mandatory** in reads/writes. fileciteturn141file0L1-L1
- **Suspense segmentation** is required, and feature shells should avoid feature-level Promise.all blocking. fileciteturn142file0L1-L1
- Visualizer preview generation should be **async, not blocking**. fileciteturn143file0L1-L1
- Auth guidance describes a middleware-centric approach in `proxy.ts` and also declares `/catalog` and `/visualizer` as public routes. fileciteturn144file0L1-L1

In practice:

- The database schema is **single-store** and lacks `tenantId` in primary domain models (Wrap, Booking, Invoice, etc.), which structurally prevents true tenancy scoping as described in the architecture instructions. fileciteturn128file0L1-L1 fileciteturn141file0L1-L1
- Tenant access is enforced via `app/(tenant)/layout.tsx` redirecting unauthenticated users, rather than via a `middleware.ts`-based proxy; and `/catalog` and `/visualizer` appear to live under the authenticated tenant layout. fileciteturn72file0L1-L1 fileciteturn78file0L1-L1 fileciteturn144file0L1-L1
- Multiple `*-page-feature.tsx` implementations use top-level `Promise.all` for independent UI regions, which violates the suspense segmentation contract and contributes to “whole-page waits.” fileciteturn142file0L1-L1 fileciteturn90file0L1-L1 fileciteturn112file0L1-L1 fileciteturn124file0L1-L1 fileciteturn138file0L1-L1
- The visualizer workflow currently triggers processing directly from the client shell (`processVisualizerPreview`) and then additionally polls via an API route, which is not the async-first model described in the visualizer domain instructions. fileciteturn143file0L1-L1 fileciteturn113file0L1-L1 fileciteturn115file0L1-L1

## Issues, bugs, misconfigurations, and risks

### Critical

Signup verification flow appears broken: the email verification code path is gated by a condition that checks `!fetchStatus` after an early return that requires `fetchStatus` to be truthy, making the verification send branch effectively unreachable for typical flows. fileciteturn83file0L1-L1

Catalog detail routing is mismatched: the dynamic segment folder is `[wrapId]`, but the page + types expect `params: { id: string }` and the page reads `const { id } = await params`, which will not match the param key Next supplies. This is a likely runtime failure for `/catalog/:id` detail pages. fileciteturn98file0L1-L1 fileciteturn99file0L1-L1

Visualizer host allowlist likely breaks Cloudinary-based workflows by default: image fetching enforces an allowlist derived from `VISUALIZER_ALLOWED_IMAGE_HOSTS`, `NEXT_PUBLIC_APP_URL`, and Vercel blob hints, but does not automatically include Cloudinary’s `res.cloudinary.com`. Meanwhile, storage can return Cloudinary `secure_url` values for photos/previews; those URLs will be rejected unless environment configuration explicitly includes Cloudinary hosts. fileciteturn136file0L1-L1 fileciteturn134file0L1-L1 fileciteturn135file0L1-L1

Preview polling API caching is unsafe: `/api/visualizer/previews/[previewId]` responds with `Cache-Control: public`, despite returning **user-owned preview data**. This risks caching authenticated/user-specific content in shared caches and should be `private` and/or `no-store`. fileciteturn116file0L1-L1

### High

Suspense segmentation contract is not met: the contract prohibits “feature-level blocking Promise.all” in page feature shells and requires region-specific suspense boundaries and skeleton fallbacks, but multiple priority targets currently block on `Promise.all` in feature shells (catalog browse, visualizer workspace, billing dashboard, scheduling dashboard). fileciteturn142file0L1-L1 fileciteturn90file0L1-L1 fileciteturn112file0L1-L1 fileciteturn124file0L1-L1 fileciteturn138file0L1-L1

Tailwind content scanning likely omits `features/**`, which is where a large portion of Tailwind class usage lives (e.g., visualizer pages). This can produce “works in dev, broken in prod” styling if classes are purged. fileciteturn65file0L1-L1 fileciteturn117file0L1-L1

### Medium

The tenant sidebar layout likely has width/margin math drift: it sets `--sidebar-width: 17rem` but uses fixed `ml-48`/`ml-16` offsets, and subtracts `--sidebar-width-icon` from max-width even when expanded. Expect subtle content overlap or horizontal clipping at certain breakpoints. fileciteturn77file0L1-L1

Image delivery is broadly suboptimal: catalog cards and detail views frequently use `unoptimized` or raw `<img>` tags, missing Next’s automatic sizing/format optimization and caching behaviors. This will cost LCP and bandwidth, especially on image-heavy catalog pages. fileciteturn95file0L1-L1 fileciteturn101file0L1-L1 fileciteturn102file0L1-L1

Visualizer PreviewCanvas includes unused state (`pan`) with no drag/pan handlers; it also mixes bespoke `<button>` styling with shadcn `Button` patterns and uses inline radius styling that conflicts with the global “sharp” token settings. fileciteturn118file0L1-L1 fileciteturn64file0L1-L1

Catalog asset upload relies on pushing **base64 data URLs** across the server-action boundary (`fileToDataUrl`), which can create large payloads, memory spikes, and potential platform limits on request size. The server-side pipeline does parse and enforce max upload size, but it still incurs base64 overhead and server-action transport cost. fileciteturn109file0L1-L1 fileciteturn135file0L1-L1

## Recommendations and suggested next steps

### Fix immediately

Repair signup verification: remove the unreachable `!fetchStatus` gating so verification code sending can execute when Clerk requires email verification. Add a simple Playwright test that creates a signup attempt and verifies the branch is reachable. fileciteturn83file0L1-L1 fileciteturn5file0L1-L1

Fix catalog detail route param naming either by renaming the route segment back to `[id]` or updating the types + code to use `{ wrapId }`. Do this before shipping catalog detail links, since the visualizer and catalog manager deep links depend on stable wrap IDs. fileciteturn98file0L1-L1 fileciteturn99file0L1-L1 fileciteturn117file0L1-L1

Lock down preview status route caching by changing the header to `Cache-Control: private, no-store` (or removing the header and relying on `fetch(..., { cache: 'no-store' })` semantics). This is a security hardening item. fileciteturn116file0L1-L1 fileciteturn115file0L1-L1

Ensure Cloudinary is included in the allowed host list when Cloudinary storage is used, either by (a) automatically adding `res.cloudinary.com` when Cloudinary credentials are present, or (b) documenting + enforcing `VISUALIZER_ALLOWED_IMAGE_HOSTS` includes Cloudinary. Without this, visualizer processing will intermittently fail in real deployments. fileciteturn136file0L1-L1 fileciteturn132file0L1-L1 fileciteturn134file0L1-L1

### Bring the codebase back into alignment with `/.github/copilot/**` criteria

Implement the suspense segmentation contract by extracting independent regions into segmented async server components and wrapping them in region-level `<Suspense>` boundaries with skeleton fallbacks (catalog grid, filters, stats, tables). The contract is explicit about avoiding top-level Promise.all in feature shells and about using region-specific skeletons. fileciteturn142file0L1-L1 fileciteturn141file0L1-L1

Decide tenancy strategy and reconcile it across docs + schema:

- If CtrlPlus is truly single-store, update the server-first/tenant requirements to reflect reality and stop implying tenantId scoping everywhere.
- If multi-tenant is the roadmap, add tenant models + tenantId columns and enforce scoping in Prisma queries/actions as required by the server-first instruction “tenancy is non-negotiable.” fileciteturn141file0L1-L1 fileciteturn128file0L1-L1

Align visualizer processing with the visualizer instruction: treat generation as async/background work. The current “call process action from the client and await completion” approach will be brittle under serverless timeouts and concurrency. Move generation to a job runner or a durable background task pattern, keep polling, and make the generate route enqueue work rather than do it inline. fileciteturn143file0L1-L1 fileciteturn113file0L1-L1

### Improve UI consistency and performance

Fix Tailwind scanning by adding `./features/**/*.{ts,tsx}` to `content` so feature pages don’t ship missing classes. fileciteturn65file0L1-L1

Standardize image delivery: remove `unoptimized` where feasible, adopt Cloudinary transformations for card/detail sizes, and use Next `<Image>` for predictable responsive sizing. This will noticeably improve catalog browsing performance. fileciteturn95file0L1-L1 fileciteturn61file0L1-L1 fileciteturn132file0L1-L1

Unify the “sharp industrial” look: either embrace rounding everywhere (and update global radius tokens), or remove the stray rounded surfaces and inline radius code (PreviewCanvas) so the product feels intentionally designed instead of mixed. fileciteturn64file0L1-L1 fileciteturn117file0L1-L1 fileciteturn118file0L1-L1
