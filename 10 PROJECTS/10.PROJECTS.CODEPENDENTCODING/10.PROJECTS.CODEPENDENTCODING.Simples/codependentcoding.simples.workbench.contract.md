---
title: Codependent Coding Simple Workbench Contract
type: contract
scope: feature
project: Codependent Coding
domain: simples
artifact: public-workbench
kind: contract
namespace: codependentcoding.simples.workbench.contract
status: review
authority: working-note
parent: "[[codependentcoding.webapp-architecture.master.source-document]]"
depends_on:
  - "[[codependentcoding.simples.canonicalization.workflow]]"
  - "[[codependentcoding.simples.database.map]]"
supersedes: []
tags:
  - codependent-coding/simples
  - website/workbench
  - architecture/source-viewer
  - status/review
created: 2026-08-18
updated: 2026-08-18
---

# Simple Workbench Contract

> [!abstract]
> Repurpose the current Hipster Stack library detail experience into one public workbench over the same Simple model used for architecture knowledge, implementation relationships, and source. The first proof is the **Database** library.

## 1. What Exists Today

### Current Hipster Stack library page

The deployed source currently has:

- hard-coded library metadata in `apps/web/lib/libraries.ts`;
- a `LibraryDetail` feature that renders title/summary/actions;
- a large `configuration-panel` that becomes `Included / Fixed foundation` for fixed libraries;
- static highlight cards;
- static `Related Simples` and `Works With` sidebar lists.

Keep the useful page shell/visual language. Replace the static content model.

### Current docs route

The catch-all Docs route is already thin: it maps route slug → documentation source → renderer. Preserve the idea that the route is an adapter, not the knowledge owner.

### Current Constituter

The existing Constituter already proves a useful workspace pattern: controls on one side, resolved/normalized output on the other. Reuse the interaction grammar where it helps; do not make the per-Simple workbench a second full application configurator.

### Codebase Context Utility reuse boundary

The current Codebase Context Utility has useful implementation material:

- `components/file-tree.tsx` — recursive file/directory tree, selected-file state, keyboard activation, expand/collapse;
- `components/file-system-provider.tsx` — file-system state/read operations;
- `components/code-preview.tsx` — selected-file loading and language-by-extension handling.

Its current `CodePreview` renders a normal `<pre><code>` surface. **It does not currently use Monaco.** Monaco is therefore an intentional new Codependent Coding integration, not a capability we pretend already exists.

## 2. Target Information Architecture

A library index groups file-level Simples by actual repository responsibility.

```text
Simples
├── Routes
├── Features
├── Page Templates
├── Blocks
├── UI Primitives
├── Fetchers
├── Actions
├── Workflows
├── Auth
├── Authz
├── Integrations
├── Webhooks
├── Selects
├── DTO Mappers
├── Transactions
├── Schemas
├── Types
├── Cache
├── Constants
├── Utils
├── Root Config
└── Prisma Lifecycle
```

A higher-level library page such as **Database** may aggregate several file-level Simples for explanation/navigation, but every selectable source node still resolves to one real file record.

## 3. One Model, Three Views

The individual Simple experience exposes three conceptual views without maintaining three copies of the truth.

### Architecture

Projection of:

- canonical definition;
- responsibility;
- contract;
- invariants;
- boundaries/separations;
- lifecycle/state/transitions;
- side effects;
- anti-patterns;
- relationships and constraints.

### Implementation

Projection of:

- Simple properties;
- direct uses/requires/permits/conditional/prohibits relationships;
- backlinks / inverse dependencies;
- Ontology membership;
- variants/substitutes;
- public/hardened status;
- generation disposition;
- real supported implementation choices.

### Source

Projection of:

- public demo golden prototype;
- hardened golden prototype;
- source path;
- hardening delta;
- copy action for the currently selected implementation.

## 4. Primary Workbench Layout

TanStack Router examples are the visual/interaction-density inspiration, not a page to clone literally.

```text
┌──────────────────────────────────────────────────────────────────────────┐
│ DATABASE / lib/fetchers/projectsFetchers.ts                  [Copy Code] │
├──────────────────────┬───────────────────────────────────────────────────┤
│ SIMPLE EXPLORER      │ [Architecture] [Implementation] [Source]         │
│                      │                                                   │
│ ▾ Database           │  [Public Showroom] [Hardened Template]           │
│   client.ts          │                                                   │
│   tenant.ts          │  Monaco / code surface                           │
│   provider.ts        │                                                   │
│ ▾ Transactions       │                                                   │
│   tenant-context...  │                                                   │
│ ▾ Fetchers           │                                                   │
│   projectsFetchers   │                                                   │
│ ▾ Selects            │                                                   │
│   projects.selects   │                                                   │
│ ▾ DTO                │                                                   │
│   projects.dto       │                                                   │
├──────────────────────┴───────────────────────────────────────────────────┤
│ RELATIONSHIPS / CONSTRAINTS / CONSEQUENCES                              │
│ [requires tenant] [uses select] [uses DTO] [prohibits writes] [...]     │
└──────────────────────────────────────────────────────────────────────────┘
```

On large screens, file tree + code are the dominant surface. On small screens, the explorer collapses into a sheet/drawer or compact selector while source remains readable.

## 5. File Explorer Contract

Adapt the useful mechanics of Codebase Context Utility's recursive tree, but the data source is the normalized Simple/library model rather than a user-picked arbitrary filesystem for this public page.

Each selectable node needs:

```ts
interface SimpleExplorerNode {
  id: string;
  title: string;
  sourcePath: string;
  simpleType: string;
  children?: SimpleExplorerNode[];
}
```

The exact runtime model can change during implementation. The contract is that selection resolves to one Simple record and one real source file.

## 6. Monaco Contract

Monaco is a **new integration** for the consolidated Codependent Coding app.

Requirements:

- read-only by default for public Simple source;
- TypeScript/TSX/SQL/CSS/JSON/Markdown language modes as required by the catalog;
- dark theme consistent with the Vibes visual system;
- line numbers and normal source navigation;
- source changes only when a real selected view/variant has a different implementation;
- no fake editable state that implies changes will be persisted;
- copy selected source;
- lazy/client-load the editor so it does not contaminate server-first route architecture unnecessarily.

Do not recreate VS Code. The goal is **excellent source inspection**, not an IDE product.

## 7. The First Real Consequence Control

The Database slice already contains a legitimate public/hardened difference.

For `lib/fetchers/projectsFetchers.ts`:

```text
Public Showroom
    withTemplateReadTransaction(...)

Hardened Template
    withAuthenticatedTenantTransaction(...)
```

The rest of the fetcher grammar remains the same:

```text
permission
    ↓
organization-scoped Prisma predicate
    ↓
precise Select
    ↓
DTO Mapper
```

Therefore the `[Public Showroom | Hardened Template]` control is a real **source-view consequence**. It is not a Constituter backend-security toggle.

### Hard rule

The user never gets:

```text
[ ] Tenant Isolation
[ ] Authentication
[ ] RLS
[ ] Authorization
```

Those are invariant/derived architecture. The workbench may explain and demonstrate them, but the whole-app generator does not ask whether the user wants security today.

## 8. Relationship Controls

Replace `Related Simples` / `Works With` with semantic relationships derived from the Simple record.

Recommended compact groups:

### Uses

Clickable source dependencies/import relationships.

### Requires

Mandatory dependency closure. Clicking explains why the Simple cannot exist validly without it.

### Permitted / Conditional

Optional or conditionally valid relationships. Conditional items expose the condition.

### Prohibited

Visible architectural negative space. These are explanatory/validation controls, not disabled mystery buttons.

### Used By

Derived from inverse relationships/backlinks rather than manually maintained.

### Ontologies

Shows where the Simple participates in default application recipes.

## 9. Database First Slice

Initial explorer set:

- `lib/db/client.ts`
- `lib/db/tenant.ts`
- `lib/db/provider.ts`
- `lib/db/transactions/tenant-context.tx.ts`
- `prisma/migrations/20260815000000_application_owned_tenancy/migration.sql`
- `prisma.config.ts`
- `types/access.ts`
- `lib/auth/identity.ts`
- `lib/fetchers/projectsFetchers.ts`
- `lib/db/selects/projects.selects.ts`
- `lib/db/dto/projects.dto.ts`

This is enough to demonstrate an actual end-to-end read path rather than a decorative Database card.

## 10. Data/Authoring Boundary

> [!warning] Proposed — owner approval required
> DevNotes is the authoring/canonicalization workspace. The public Codependent Coding application should not require live GitHub/Obsidian access to render core docs or Simples.

Recommended boundary:

```text
DevNotes Simple records + canonical source files
            ↓
normalization/export step
            ↓
checked/generated Simple catalog in Codependent Coding repo
            ↓
Docs / Simples / Workbench projections
```

The export artifact contains structured knowledge/relationships and source pointers. It does **not** stuff the TypeScript implementation itself into giant JSON/YAML blobs. Real source files remain implementation authority.

This boundary keeps the public site deterministic and deployable while preserving one authoring model.

## 11. Component Responsibilities

Names below are suggested roles, not permission to create unnecessary directories.

- **Simple detail feature** — orchestrates selected Simple/view/edition and composes workbench blocks.
- **Simple explorer block** — pure presentation for normalized explorer nodes.
- **Source viewer block** — pure source-view presentation around a client-only Monaco primitive/adapter.
- **Relationship block** — pure presentation over normalized relationship records.
- **Architecture content block** — renders normalized architecture sections.
- **Route** — resolves slug and renders the feature; stays thin.

A Monaco wrapper is a UI/infrastructure primitive. It does not own Simple domain semantics.

## 12. Acceptance Criteria — Database Slice

- [ ] Database is backed by a library map containing real file-level Simple records.
- [ ] Current `Included / Fixed foundation` card is no longer the primary body.
- [ ] The explorer selects real files.
- [ ] The source surface renders real public/hardened source.
- [ ] Projects Fetcher visibly demonstrates the real edition consequence.
- [ ] Relationships come from structured Simple semantics, not manually duplicated `related`/`worksWith` arrays.
- [ ] Architecture/Implementation/Source are projections of one normalized record.
- [ ] Monaco is introduced deliberately and isolated to the client boundary that needs it.
- [ ] RLS/security labels distinguish architectural target from currently verified runtime enforcement.
- [ ] No whole-app backend-security toggle is introduced.
- [ ] Mobile remains usable.

## 13. Non-Goals

- Do not build the whole Constituter now.
- Do not generate application ZIPs now.
- Do not convert the entire Simple catalog before the Database slice proves the model.
- Do not rebuild Codebase Context Utility feature-for-feature.
- Do not make the workbench a full editor/IDE.
- Do not invent a package boundary solely for this feature.

## Source Evidence

### DevNotes mirrors

- [[libraries.ts|current library registry]]
- [[library-detail.tsx|current library detail]]
- [[60 CODEPENDENT CODING/Source Mirror/The Hipster Stack™ Technology Stack/apps/web/app/docs/[[...slug]]/page.tsx|current Docs route]]
- [[constituter.tsx|current Constituter]]
- [[codependentcoding.simples.database.map]]
- [[codependentcoding.fetchers.projects.simple]]

### External code inspected

`DigitalHerencia/CodebaseContextUtility`:

- `components/file-tree.tsx` — reusable explorer mechanics.
- `components/file-system-provider.tsx` — reusable file state/read concepts.
- `components/code-preview.tsx` — useful file loading/language detection, currently `<pre><code>`, **not Monaco**.
