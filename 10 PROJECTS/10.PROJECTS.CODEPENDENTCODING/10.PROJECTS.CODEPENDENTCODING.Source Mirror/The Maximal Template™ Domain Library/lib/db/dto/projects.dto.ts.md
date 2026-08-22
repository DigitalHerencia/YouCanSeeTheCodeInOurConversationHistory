---
title: 'The Maximal Template™ Domain Library\lib\db\dto\projects.dto.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\dto\projects.dto.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.dto.projects.dto.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\dto\projects.dto.ts'
source_file: 'projects.dto.ts'
source_sha256: 'cb93cc3b82849a9f261040c143a2a460731a98d7faf631aec55e8358a27827a2'
generated: true
---

# `projects.dto.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\dto\projects.dto.ts`
> SHA-256: `cb93cc3b82849a9f261040c143a2a460731a98d7faf631aec55e8358a27827a2`

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