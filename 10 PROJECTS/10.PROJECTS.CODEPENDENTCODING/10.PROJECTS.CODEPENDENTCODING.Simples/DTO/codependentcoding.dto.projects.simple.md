---
title: Maximal Template — lib/db/dto/projects.dto.ts
type: simple
scope: file
project: Codependent Coding
domain: projects
artifact: lib/db/dto/projects.dto.ts
kind: simple
namespace: codependentcoding.dto.projects.simple
status: review
authority: working-note
parent: "[[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Master.Source-Document]]"
depends_on: []
supersedes: []
tags:
  - codependent-coding/simples
  - simples/dto-mapper
  - data/transport
  - domain/projects
  - status/review
created: 2026-08-18
updated: 2026-08-19
simple_type: dto-mapper
layer: transport-mapping
source_path: lib/db/dto/projects.dto.ts
public_source_path: lib/db/dto/projects.dto.ts
hardened_source_path: lib/db/dto/projects.dto.ts
source_mirror: "[[projects.dto.ts|source mirror — projects.dto.ts]]"
canonicalization_status: review
owner_approval: pending
public_implementation_status: observed
hardened_implementation_status: proposed
generation_status: derived
providers: []
ontologies:
  - Project Management / Task Tracker
uses:
  - "[[codependentcoding.selects.projects.simple]]"
requires: []
permits: []
conditional: []
prohibits:
  - database queries
  - authorization decisions
  - persisted mutation
substitutes: []
variants: []
tests:
  - record to DTO mapping
validation:
  - transport-safe date serialization
  - TypeScript typecheck
---

# `lib/db/dto/projects.dto.ts`

## Codependent Coding Knowledge

### Canonical Definition

This file maps selected Prisma Project/Task persistence records into the transport-safe application DTO shapes consumed above the database boundary.

### Responsibility

- Convert persisted dates to string/null transport representation.
- Collapse persistence relations into application-facing DTO fields.
- Preserve IDs/version/state required by the feature/presentation boundary.

### Contract & Invariants

- A DTO mapper does not query the database.
- It accepts already-selected record shapes.
- It does not authorize access.
- It is a representation boundary, not a second domain/service layer.

### Boundaries / Anti-Patterns

- No Prisma client access.
- No network calls.
- No hidden side effects.
- No policy decisions.
- Do not wrap generated Prisma types without an actual transport/application reason.

## Simple Properties

### Relationships

- Consumes record types from [[codependentcoding.selects.projects.simple]].
- Used by [[codependentcoding.fetchers.projects.simple]].
- Outputs types currently defined in `types/projectsTypes.ts`.

### Generation Disposition

**Derived backend helper.** Retained with the Project data path that requires these transport shapes.

## Implementation

### Public Demo Golden Prototype

```ts
import type { ProjectSummaryDTO, TaskDTO } from "../../../types/projectsTypes";
import type {
  ProjectSummaryRecord,
  TaskRecord,
} from "../selects/projects.selects";

export function toProjectSummaryDTO(
  record: ProjectSummaryRecord,
): ProjectSummaryDTO {
  return {
    id: record.id,
    name: record.name,
    description: record.description,
    status: record.status,
    startsAt: record.startsAt?.toISOString() ?? null,
    dueAt: record.dueAt?.toISOString() ?? null,
    version: record.version,
    taskCount: record._count.tasks,
    openTaskCount: record.tasks.length,
  };
}

export function toTaskDTO(record: TaskRecord): TaskDTO {
  return {
    id: record.id,
    projectId: record.projectId,
    title: record.title,
    description: record.description,
    status: record.status,
    priority: record.priority,
    dueAt: record.dueAt?.toISOString() ?? null,
    completedAt: record.completedAt?.toISOString() ?? null,
    version: record.version,
    assignee: record.assignee
      ? {
          membershipId: record.assignee.id,
          displayName: record.assignee.user.displayName,
        }
      : null,
  };
}
```

### Hardened Golden Prototype

No source divergence is currently justified.

```ts
import type { ProjectSummaryDTO, TaskDTO } from "../../../types/projectsTypes";
import type {
  ProjectSummaryRecord,
  TaskRecord,
} from "../selects/projects.selects";

export function toProjectSummaryDTO(record: ProjectSummaryRecord): ProjectSummaryDTO {
  return {
    id: record.id,
    name: record.name,
    description: record.description,
    status: record.status,
    startsAt: record.startsAt?.toISOString() ?? null,
    dueAt: record.dueAt?.toISOString() ?? null,
    version: record.version,
    taskCount: record._count.tasks,
    openTaskCount: record.tasks.length,
  };
}

export function toTaskDTO(record: TaskRecord): TaskDTO {
  return {
    id: record.id,
    projectId: record.projectId,
    title: record.title,
    description: record.description,
    status: record.status,
    priority: record.priority,
    dueAt: record.dueAt?.toISOString() ?? null,
    completedAt: record.completedAt?.toISOString() ?? null,
    version: record.version,
    assignee: record.assignee
      ? {
          membershipId: record.assignee.id,
          displayName: record.assignee.user.displayName,
        }
      : null,
  };
}
```

### Hardening Delta

None identified. The same transport mapping should serve showroom and hardened editions unless the final public feature requires an intentionally reduced DTO.

## Validation & Evidence

- [x] Current source mirrored.
- [x] DTO mapper has no persistence/network side effects.
- [x] Select/DTO separation is explicit.
- [ ] Final Project DTO contracts reconciled with feature/presentation requirements.
- [ ] Owner approves canonical transport shape.

## Links

- [[codependentcoding.fetchers.projects.simple]]
- [[codependentcoding.selects.projects.simple]]
- [[projects.dto.ts|source mirror]]

## Backlinks

```dataview
TABLE simple_type AS "Type", layer AS "Layer"
FROM [[]]
SORT file.name ASC
```
