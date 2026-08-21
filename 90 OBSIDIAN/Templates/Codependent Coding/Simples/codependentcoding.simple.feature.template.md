---
title: "<% tp.file.title %>"
type: simple
scope: file
project: Codependent Coding
domain:
artifact: "<% tp.file.title %>"
kind: simple
namespace: "codependentcoding.simples.feature.<% tp.file.title.toLowerCase().replace(/[^a-z0-9]+/g, '.').replace(/^\.+|\.+$/g, '') %>"
status: draft
authority: working-note
parent: "[[codependentcoding.webapp-architecture.master.source-document]]"
depends_on:
  - "[[The Maximal Template™ Demo Doctrine]]"
supersedes: []
tags:
  - codependent-coding/simples
  - simples/feature
  - status/draft
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
simple_type: feature
layer: application-orchestration
source_path:
public_source_path:
hardened_source_path:
canonicalization_status: unreconciled
public_implementation_status: not-started
hardened_implementation_status: not-started
generation_status: not-ready
client_boundary: false
form_feature: false
uses: []
requires: []
permits: []
conditional: []
prohibits: []
ontologies: []
variants: []
tests: []
validation: []
---

# <% tp.file.title %>

## Codependent Coding Knowledge

### Canonical Definition
A feature is the application-capability orchestration boundary. It combines the server operations/helpers and presentation required to make a capability available to the interface.

### Responsibility
- Orchestrate application behavior.
- Compose presentation blocks.
- Invoke workflows/fetchers/actions/auth/authz/cache/integration helpers as required.
- Segment browser-only behavior into a deliberate client companion.

### Contract & Invariants
- Server Component by default.
- Normal features consume blocks, not arbitrary primitives.
- React Hook Form features are the explicit feature → primitive exception.
- A feature does not absorb responsibilities owned by the helpers it coordinates.

### Boundaries / Anti-Patterns
- No direct raw Prisma access.
- No provider mechanics embedded in feature code.
- No policy definitions or generic service layer.
- No meaningless client boundary.

## Simple Properties

### Relationships
- **uses:** blocks, workflows, fetchers, actions, auth/authz, cache, integrations, schemas/types as needed.
- **requires:** dependencies necessary for the application capability.
- **prohibits:** architectural shortcuts across ownership boundaries.

### Generation Disposition
- Record route ownership, presentation composition, backend dependency closure, and whether the feature is derived/selectable.

## Implementation

### Public Demo Golden Prototype
```tsx
// Public showcase feature using safe demo data/behavior where applicable.
```

### Hardened Golden Prototype
```tsx
// Hardened feature using authenticated/authorized production boundaries.
```

### Hardening Delta
- 

## Validation & Evidence
- [ ] Server/client boundary justified.
- [ ] Presentation boundary correct.
- [ ] Server responsibilities delegated to their canonical owners.
- [ ] Public vs hardened behavior is explicit.

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