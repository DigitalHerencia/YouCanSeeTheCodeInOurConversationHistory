---
title: 'The Maximal Template™ Domain Library\lib\fetchers\projectsFetchers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\fetchers\projectsFetchers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.fetchers.projectsfetchers.ts'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\lib\fetchers\projectsFetchers.ts'
source_file: 'projectsFetchers.ts'
source_sha256: '3c1dff1279585c0c4499593f5a73c02c0780adbf4a773abac45e86a777d7dac2'
generated: true
---

# `projectsFetchers.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\fetchers\projectsFetchers.ts`
> SHA-256: `3c1dff1279585c0c4499593f5a73c02c0780adbf4a773abac45e86a777d7dac2`

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
      orderBy: {
        updatedAt: "desc",
      },
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
      orderBy: [
        {
          position: "asc",
        },
        {
          createdAt: "asc",
        },
      ],
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
        status: {
          notIn: ["DONE", "CANCELED"],
        },
      },
      orderBy: [
        {
          dueAt: "asc",
        },
        {
          priority: "desc",
        },
      ],
      take: Math.min(Math.max(limit, 1), 200),
      select: taskSelect,
    });

    return rows.map(toTaskDTO);
  });
}

```