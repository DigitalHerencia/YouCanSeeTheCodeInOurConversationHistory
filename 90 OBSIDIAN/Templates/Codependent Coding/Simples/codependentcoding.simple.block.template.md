---
title: "<% tp.file.title %>"
type: simple
scope: file
project: Codependent Coding
domain: presentation
artifact: "<% tp.file.title %>"
kind: simple
namespace: "codependentcoding.simples.block.<% tp.file.title.toLowerCase().replace(/[^a-z0-9]+/g, '.').replace(/^\.+|\.+$/g, '') %>"
status: draft
authority: working-note
parent: "[[codependentcoding.webapp-architecture.master.source-document]]"
depends_on:
  - "[[The Maximal Template™ Demo Doctrine]]"
supersedes: []
tags:
  - codependent-coding/simples
  - simples/block
  - presentation/block
  - status/draft
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
simple_type: block
layer: pure-ui-composition
source_path:
public_source_path:
hardened_source_path:
canonicalization_status: unreconciled
public_implementation_status: not-started
hardened_implementation_status: not-started
generation_status: not-ready
uses: []
requires: []
permits: []
conditional: []
prohibits: []
variants: []
ontologies: []
tests: []
validation: []
---

# <% tp.file.title %>

## Codependent Coding Knowledge

### Canonical Definition
A block is a reusable pure UI composition made from UI primitives. It owns presentation composition, not application logic.

### Responsibility
- Compose primitives into a reusable presentation unit.
- Expose narrow presentation props and supported visual variants.

### Contract & Invariants
- Pure presentation only.
- No persisted reads/writes.
- No auth/authz decisions.
- No provider SDKs or workflows.
- No React Hook Form state; form features own form state directly.

### Boundaries / Anti-Patterns
- No domain/server logic.
- No direct database or integration behavior.
- Do not create one-off route components when a reusable block category exists.

## Simple Properties

### Relationships
- **uses:** primitives.
- **used by:** derived through backlinks/Dataview.
- **variants:** supported block variations.
- **prohibits:** server/application ownership.

### Generation Disposition
Blocks and variants may be legitimate presentation-configurable Simples when the source implementation exists.

## Implementation

### Public Demo Golden Prototype
```tsx
// Public/demo block.
```

### Hardened Golden Prototype
```tsx
// Hardened block; presentation should usually remain identical unless security-safe rendering requires a boundary change outside the block.
```

### Hardening Delta
- Usually none inside a pure block; record any justified divergence.

## Validation & Evidence
- [ ] Imports primitives/presentation helpers only.
- [ ] No server responsibility leaked in.
- [ ] Variants are real source implementations.
- [ ] Accessibility/interaction behavior verified where applicable.

## Links
- [[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Master.Source-Document]]
- [[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Template-Demo]]

## Backlinks
```dataview
TABLE simple_type AS "Type", layer AS "Layer"
FROM [[]]
SORT file.name ASC
```

## Tags
Canonical tags live in frontmatter.