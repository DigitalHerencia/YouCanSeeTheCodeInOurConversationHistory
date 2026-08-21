---
title: Maximal Template — lib/db/selects/projects.selects.ts
type: simple
scope: file
project: Codependent Coding
domain: projects
artifact: lib/db/selects/projects.selects.ts
kind: simple
namespace: codependentcoding.selects.projects.simple
status: review
authority: working-note
parent: "[[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Master.Source-Document]]"
depends_on: []
supersedes: []
tags:
  - codependent-coding/simples
  - simples/select
  - database/prisma-select
  - domain/projects
  - status/review
created: 2026-08-18
updated: 2026-08-19
simple_type: select
layer: persistence-projection
source_path: lib/db/selects/projects.selects.ts
public_source_path: lib/db/selects/projects.selects.ts
hardened_source_path: lib/db/selects/projects.selects.ts
source_mirror: "[[10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Source Mirror/The Codependent Coding™ Web App Architecture/The Maximal Template™ Domain Library/lib/db/selects/projects.selects.ts|source mirror — projects.selects.ts]]"
canonicalization_status: review
owner_approval: pending
public_implementation_status: observed
hardened_implementation_status: proposed
generation_status: derived
providers:
  - Prisma
ontologies:
  - Project Management / Task Tracker
uses: []
requires: []
permits: []
conditional: []
prohibits:
  - authorization logic
  - persisted mutation
substitutes: []
variants: []
tests: []
validation:
  - Prisma satisfies projection contracts
  - TypeScript typecheck
---

# `lib/db/selects/projects.selects.ts`

## Codependent Coding Knowledge

### Canonical Definition

This file owns precise Prisma persisted projections for Project and Task reads. A select defines **which database fields/relations the operation retrieves**; it does not decide whether the actor may access them and it does not map them into transport representation.

### Responsibility

- Define `projectSummarySelect`.
- Define `taskSelect`.
- Derive corresponding Prisma record types from the exact projections.

### Contract & Invariants

- Projection only.
- Authorization/scoping lives in the fetcher/query predicate.
- Transport conversion lives in the DTO mapper.
- `satisfies Prisma.*Select` keeps the projection checked against Prisma's generated contract.

### Boundaries / Anti-Patterns

- No tenant/authz rules in the select object.
- No network/provider behavior.
- No DTO formatting such as ISO date conversion.
- No persisted writes.

## Simple Properties

### Relationships

- Used by [[codependentcoding.fetchers.projects.simple]].
- Record types feed [[codependentcoding.dto.projects.simple]].

### Generation Disposition

**Derived backend helper.** Retained when dependent Project fetchers/actions/DTOs require these projection shapes.

## Implementation

### Public Demo Golden Prototype

```ts
import type { Prisma } from "../../../generated/prisma/client";

export const projectSummarySelect = {
  id: true,
  name: true,
  description: true,
  status: true,
  startsAt: true,
  dueAt: true,
  version: true,
  _count: {
    select: {
      tasks: true,
    },
  },
  tasks: {
    where: {
      status: {
        notIn: ["DONE", "CANCELED"],
      },
    },
    select: {
      id: true,
    },
  },
} satisfies Prisma.ProjectSelect;

export const taskSelect = {
  id: true,
  projectId: true,
  title: true,
  description: true,
  status: true,
  priority: true,
  dueAt: true,
  completedAt: true,
  version: true,
  assignee: {
    select: {
      id: true,
      user: {
        select: {
          displayName: true,
        },
      },
    },
  },
} satisfies Prisma.TaskSelect;

export type ProjectSummaryRecord = Prisma.ProjectGetPayload<{
  select: typeof projectSummarySelect;
}>;

export type TaskRecord = Prisma.TaskGetPayload<{
  select: typeof taskSelect;
}>;
```

### Hardened Golden Prototype

No edition-specific source difference is supported by the current materials.

```ts
import type { Prisma } from "../../../generated/prisma/client";

export const projectSummarySelect = {
  id: true,
  name: true,
  description: true,
  status: true,
  startsAt: true,
  dueAt: true,
  version: true,
  _count: { select: { tasks: true } },
  tasks: {
    where: { status: { notIn: ["DONE", "CANCELED"] } },
    select: { id: true },
  },
} satisfies Prisma.ProjectSelect;

export const taskSelect = {
  id: true,
  projectId: true,
  title: true,
  description: true,
  status: true,
  priority: true,
  dueAt: true,
  completedAt: true,
  version: true,
  assignee: {
    select: {
      id: true,
      user: { select: { displayName: true } },
    },
  },
} satisfies Prisma.TaskSelect;

export type ProjectSummaryRecord = Prisma.ProjectGetPayload<{
  select: typeof projectSummarySelect;
}>;

export type TaskRecord = Prisma.TaskGetPayload<{
  select: typeof taskSelect;
}>;
```

### Hardening Delta

None identified. Security hardening occurs in the caller's auth/authz/query/RLS boundaries, not by stuffing policy into projection definitions.

## Validation & Evidence

- [x] Current source mirrored.
- [x] Projection/DTO separation is explicit.
- [ ] Reconcile against final Project feature/route data requirements.
- [ ] Owner approves canonical projection shape.

## Links

- [[codependentcoding.fetchers.projects.simple]]
- [[codependentcoding.dto.projects.simple]]
- [[10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Source Mirror/The Codependent Coding™ Web App Architecture/The Maximal Template™ Domain Library/lib/db/selects/projects.selects.ts|source mirror]]

## Backlinks

```dataview
TABLE simple_type AS "Type", layer AS "Layer"
FROM [[]]
SORT file.name ASC
```
