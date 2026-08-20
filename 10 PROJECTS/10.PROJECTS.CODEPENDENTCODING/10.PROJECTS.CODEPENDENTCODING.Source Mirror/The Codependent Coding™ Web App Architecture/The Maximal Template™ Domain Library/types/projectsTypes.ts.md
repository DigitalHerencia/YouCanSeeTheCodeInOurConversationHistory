---
title: 'The Maximal Template™ Domain Library\types\projectsTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\types\projectsTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.types.projectstypes.ts'
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
source_path: 'The Maximal Template™ Domain Library\types\projectsTypes.ts'
source_file: 'projectsTypes.ts'
source_sha256: '65eb83c5a06965751110e896bb28801b2e6c97fbd7b52a3f779d7fc7f73e89db'
generated: true
---

# `projectsTypes.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\types\projectsTypes.ts`
> SHA-256: `65eb83c5a06965751110e896bb28801b2e6c97fbd7b52a3f779d7fc7f73e89db`

```ts
export interface ProjectSummaryDTO {
  id: string;
  name: string;
  description: string | null;
  status: string;
  startsAt: string | null;
  dueAt: string | null;
  version: number;
  taskCount: number;
  openTaskCount: number;
}
export interface TaskDTO {
  id: string;
  projectId: string;
  title: string;
  description: string | null;
  status: string;
  priority: string;
  dueAt: string | null;
  completedAt: string | null;
  version: number;
  assignee: { membershipId: string; displayName: string | null } | null;
}

```