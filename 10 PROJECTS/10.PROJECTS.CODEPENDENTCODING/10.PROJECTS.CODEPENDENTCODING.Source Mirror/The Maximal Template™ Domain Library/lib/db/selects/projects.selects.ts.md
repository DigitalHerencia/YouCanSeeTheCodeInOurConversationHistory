---
title: 'The Maximal Template™ Domain Library\lib\db\selects\projects.selects.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\selects\projects.selects.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.selects.projects.selects.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\selects\projects.selects.ts'
source_file: 'projects.selects.ts'
source_sha256: '168251773185e886fa5b3a233c526fb4a2613c0195eeec7734c7e8a105b5f695'
generated: true
---

# `projects.selects.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\selects\projects.selects.ts`
> SHA-256: `168251773185e886fa5b3a233c526fb4a2613c0195eeec7734c7e8a105b5f695`

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