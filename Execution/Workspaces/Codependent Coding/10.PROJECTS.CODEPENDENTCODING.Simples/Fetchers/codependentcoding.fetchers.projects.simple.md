---
title: Maximal Template — lib/fetchers/projectsFetchers.ts
type: simple
scope: file
project: Codependent Coding
domain: projects
artifact: lib/fetchers/projectsFetchers.ts
kind: simple
namespace: codependentcoding.fetchers.projects.simple
status: review
authority: working-note
parent: "[[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Master.Source-Document]]"
depends_on:
  - "[[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Template-Demo]]"
  - "[[10.PROJECTS.CODEPENDENTCODING.WebApp-Architecture.Template-Backlog]]"
supersedes: []
tags:
  - codependent-coding/simples
  - simples/fetcher
  - server/read
  - domain/projects
  - status/review
created: 2026-08-18
updated: 2026-08-19
simple_type: fetcher
layer: persisted-read
source_path: lib/fetchers/projectsFetchers.ts
public_source_path: lib/fetchers/projectsFetchers.ts
hardened_source_path: lib/fetchers/projectsFetchers.ts
source_mirror: "[[projectsFetchers.ts|source mirror — projectsFetchers.ts]]"
canonicalization_status: review
owner_approval: pending
public_implementation_status: observed
hardened_implementation_status: proposed
generation_status: derived
providers:
  - Prisma
  - PostgreSQL
ontologies:
  - Project Management / Task Tracker
uses:
  - "[[codependentcoding.database.tenant.simple]]"
  - "[[codependentcoding.selects.projects.simple]]"
  - "[[codependentcoding.dto.projects.simple]]"
requires:
  - projects:read permission
  - organization-scoped query predicates
permits:
  - public seeded read transaction in showroom edition
conditional:
  - public demo identity only in showroom edition
prohibits:
  - persisted writes
  - provider side effects
  - unscoped cross-tenant query
substitutes: []
variants:
  - public-showroom
  - hardened-template
tests:
  - authenticated fetcher uses authenticated tenant
  - cross-tenant read rejected
  - getMyTasks uses current membership
validation:
  - read-only persisted access
  - select/DTO shape
role: execution
system: codependent-coding
workspace: codependent-coding
---

# `lib/fetchers/projectsFetchers.ts`

## Codependent Coding Knowledge

### Canonical Definition

This file is a Project-domain fetcher Simple: a read-only persisted application data boundary. It demonstrates the canonical fetcher pipeline of **tenant context → permission → scoped Prisma query → select → DTO**.

### Responsibility

- Read Projects and Tasks only.
- Assert `projects:read` before the query.
- Include `organizationId` in the actual persisted predicate.
- Use the canonical Project/Task selects.
- Return transport-safe DTOs.

### Contract & Invariants

- No persisted writes.
- Tenant/resource scope belongs in the query, not as an after-the-fact filter.
- Public showroom reads may intentionally use the seeded demo tenant.
- Hardened reads use the authenticated user's resolved application tenant.
- `getMyTasks()` must mean the authenticated member's tasks in the hardened edition.

### Boundaries / Anti-Patterns

- No direct provider calls.
- No hidden mutation.
- No broad query followed by authorization filtering.
- No workflow wrapper merely to perform a read.

### Canonicalization Decisions

- **Observed showroom:** every function calls `withTemplateReadTransaction()`.
- **Recorded hardening requirement:** ordinary generated/private fetchers must resolve real Clerk identity and application membership.
- **Concrete source consequence:** the tenant adapter changes; the query/select/DTO logic does not need to be duplicated.
- **Owner approval:** pending.

## Simple Properties

### Relationships

- Uses [[codependentcoding.database.tenant.simple]].
- Uses [[codependentcoding.selects.projects.simple]].
- Uses [[codependentcoding.dto.projects.simple]].
- Uses the authorization permission helper currently mirrored at `lib/authz/permissions.ts`.

### Generation Disposition

**Derived backend Simple.** It is retained when Project routes/features/workflows require these reads; users do not toggle tenant-scoped reads independently.

## Implementation

### Public Demo Golden Prototype

```ts
import "server-only";

import { assertPermission } from "../authz/permissions";
import { toProjectSummaryDTO, toTaskDTO } from "../db/dto/projects.dto";
import {
  projectSummarySelect,
  taskSelect,
} from "../db/selects/projects.selects";
import { withTemplateReadTransaction } from "../db/tenant";

export async function getProjects(limit = 50) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "projects:read");

    const rows = await tx.project.findMany({
      where: {
        organizationId: access.organizationId,
        archivedAt: null,
      },
      orderBy: { updatedAt: "desc" },
      take: Math.min(Math.max(limit, 1), 100),
      select: projectSummarySelect,
    });

    return rows.map(toProjectSummaryDTO);
  });
}

export async function getProject(projectId: string) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "projects:read");
    const row = await tx.project.findFirst({
      where: {
        id: projectId,
        organizationId: access.organizationId,
        archivedAt: null,
      },
      select: projectSummarySelect,
    });
    return row ? toProjectSummaryDTO(row) : null;
  });
}

export async function getProjectTasks(projectId: string, limit = 100) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "projects:read");

    const rows = await tx.task.findMany({
      where: {
        organizationId: access.organizationId,
        projectId,
      },
      orderBy: [{ position: "asc" }, { createdAt: "asc" }],
      take: Math.min(Math.max(limit, 1), 200),
      select: taskSelect,
    });

    return rows.map(toTaskDTO);
  });
}

export async function getMyTasks(limit = 100) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "projects:read");

    const rows = await tx.task.findMany({
      where: {
        organizationId: access.organizationId,
        assigneeMembershipId: access.membershipId,
        status: { notIn: ["DONE", "CANCELED"] },
      },
      orderBy: [{ dueAt: "asc" }, { priority: "desc" }],
      take: Math.min(Math.max(limit, 1), 200),
      select: taskSelect,
    });

    return rows.map(toTaskDTO);
  });
}
```

### Hardened Golden Prototype

The proposed hardened source changes the transaction adapter and retains the read grammar.

```ts
import "server-only";

import { assertPermission } from "../authz/permissions";
import { toProjectSummaryDTO, toTaskDTO } from "../db/dto/projects.dto";
import {
  projectSummarySelect,
  taskSelect,
} from "../db/selects/projects.selects";
import { withAuthenticatedTenantTransaction } from "../db/tenant";

export async function getProjects(limit = 50) {
  return withAuthenticatedTenantTransaction(async (tx, access) => {
    assertPermission(access, "projects:read");
    const rows = await tx.project.findMany({
      where: { organizationId: access.organizationId, archivedAt: null },
      orderBy: { updatedAt: "desc" },
      take: Math.min(Math.max(limit, 1), 100),
      select: projectSummarySelect,
    });
    return rows.map(toProjectSummaryDTO);
  });
}

export async function getProject(projectId: string) {
  return withAuthenticatedTenantTransaction(async (tx, access) => {
    assertPermission(access, "projects:read");
    const row = await tx.project.findFirst({
      where: {
        id: projectId,
        organizationId: access.organizationId,
        archivedAt: null,
      },
      select: projectSummarySelect,
    });
    return row ? toProjectSummaryDTO(row) : null;
  });
}

export async function getProjectTasks(projectId: string, limit = 100) {
  return withAuthenticatedTenantTransaction(async (tx, access) => {
    assertPermission(access, "projects:read");
    const rows = await tx.task.findMany({
      where: { organizationId: access.organizationId, projectId },
      orderBy: [{ position: "asc" }, { createdAt: "asc" }],
      take: Math.min(Math.max(limit, 1), 200),
      select: taskSelect,
    });
    return rows.map(toTaskDTO);
  });
}

export async function getMyTasks(limit = 100) {
  return withAuthenticatedTenantTransaction(async (tx, access) => {
    assertPermission(access, "projects:read");
    const rows = await tx.task.findMany({
      where: {
        organizationId: access.organizationId,
        assigneeMembershipId: access.membershipId,
        status: { notIn: ["DONE", "CANCELED"] },
      },
      orderBy: [{ dueAt: "asc" }, { priority: "desc" }],
      take: Math.min(Math.max(limit, 1), 200),
      select: taskSelect,
    });
    return rows.map(toTaskDTO);
  });
}
```

### Hardening Delta

- `withTemplateReadTransaction` → `withAuthenticatedTenantTransaction`.
- `getMyTasks()` now resolves the actual request member instead of the seeded demo owner.
- Same organization predicates, selects, DTOs, and permission boundary remain.
- Verify under the restricted runtime DB role so RLS is defense in depth rather than decorative SQL.

## Validation & Evidence

- [x] Public source mirrored.
- [x] Hardening delta directly identified by the Maximal Template backlog.
- [x] Persisted queries are already organization-scoped in source.
- [ ] Hardened adapter exists in generated source.
- [ ] Cross-tenant read tests call these real fetchers.
- [ ] `getMyTasks()` authenticated-membership behavior verified.
- [ ] Owner approves canonical transform.

## Links

- [[codependentcoding.database.tenant.simple]]
- [[codependentcoding.auth.identity.simple]]
- [[codependentcoding.selects.projects.simple]]
- [[codependentcoding.dto.projects.simple]]
- [[codependentcoding.simples.database.map]]
- [[projectsFetchers.ts|source mirror]]

## Backlinks

```dataview
TABLE simple_type AS "Type", layer AS "Layer"
FROM [[]]
SORT file.name ASC
```
