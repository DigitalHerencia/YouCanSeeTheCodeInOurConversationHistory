---
title: "<% tp.file.title %>"
type: simple
scope: file
project: Codependent Coding
domain:
artifact: "<% tp.file.title %>"
kind: simple
namespace: "codependentcoding.simples.action.<% tp.file.title.toLowerCase().replace(/[^a-z0-9]+/g, '.').replace(/^\.+|\.+$/g, '') %>"
status: draft
authority: working-note
parent: "[[codependentcoding.webapp-architecture.master.source-document]]"
depends_on:
  - "[[The Maximal Template™ Demo Doctrine]]"
supersedes: []
tags:
  - codependent-coding/simples
  - simples/action
  - server/write
  - status/draft
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
simple_type: action
layer: crud-mutation-boundary
source_path:
public_source_path:
hardened_source_path:
canonicalization_status: unreconciled
public_implementation_status: not-started
hardened_implementation_status: not-started
generation_status: not-ready
mutation_kind: crud
uses: []
requires: []
permits: []
conditional: []
prohibits: []
ontologies: []
providers: []
tests: []
validation: []
---

# <% tp.file.title %>

## Codependent Coding Knowledge

### Canonical Definition
An action owns an ordinary persisted CRUD mutation boundary. It is not a generic business-service bucket.

### Responsibility
- Authenticate and authorize when required.
- Validate/normalize mutation input.
- Preserve tenant/resource scope.
- Perform the CRUD write directly when genuinely simple.
- Use a workflow for meaningful behavioral orchestration.
- Use a transaction helper for atomic multi-write persistence.
- Invalidate affected cache as required.

### Contract & Invariants
- Mutation responsibility is ordinary CRUD.
- Provider mechanics stay provider-owned.
- Domain orchestration stays workflow-owned.
- Atomic multi-write invariants stay transaction-owned.

### Boundaries / Anti-Patterns
- No generic service-layer behavior.
- No provider SDK mechanics merely because UI triggered the operation.
- No hidden persisted reads that belong in fetchers except persistence steps internal to an atomic transaction boundary.

## Simple Properties

### Relationships
- **uses:** auth/authz, schemas, workflow/transaction when required, cache.
- **requires:** mutation-specific security and integrity rules.
- **prohibits:** provider ownership and miscellaneous business logic.

### Generation Disposition
Normally derived from feature/workflow requirements; backend action architecture is not an end-user checkbox.

## Implementation

### Public Demo Golden Prototype
```ts
// Demo mutation behavior; keep signed-out public surfaces safe/read-only unless a deliberately safe demo interaction exists.
```

### Hardened Golden Prototype
```ts
// Authenticated, authorized, validated, tenant-scoped CRUD mutation boundary.
```

### Hardening Delta
- 

## Validation & Evidence
- [ ] CRUD responsibility is clear.
- [ ] Auth/authz/validation/scoping are present where required.
- [ ] Workflow/transaction use is justified rather than ceremonial.
- [ ] Cache invalidation is correct.
- [ ] Mutation/security tests identified.

## Links
- [[codependentcoding.webapp-architecture.master.source-document]]
- [[The Maximal Template™ Demo Doctrine]]

## Backlinks
```dataview
TABLE simple_type AS "Type", layer AS "Layer"
FROM [[]]
SORT file.name ASC
```

## Tags
Canonical tags live in frontmatter.