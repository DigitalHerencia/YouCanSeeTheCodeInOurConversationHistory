---
title: 'The Maximal Template™ Domain Library\lib\workflows\portal\calculateProjectStatus.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\portal\calculateProjectStatus.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.portal.calculateprojectstatus.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\portal\calculateProjectStatus.ts'
source_file: 'calculateProjectStatus.ts'
source_sha256: 'fcf5d106fa11db110aa2450dcbabff3e0cf86efd35c23abf31446c8904a75326'
generated: true
---

# `calculateProjectStatus.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\portal\calculateProjectStatus.ts`
> SHA-256: `fcf5d106fa11db110aa2450dcbabff3e0cf86efd35c23abf31446c8904a75326`

```ts
export function calculateProjectStatus({
  completedTasks,
  totalTasks,
}: {
  completedTasks: number;
  totalTasks: number;
}) {
  if (completedTasks < 0 || totalTasks < 0 || completedTasks > totalTasks)
    throw new Error("Project task totals are invalid.");
  if (totalTasks === 0) return "NOT_STARTED" as const;
  if (completedTasks === totalTasks) return "COMPLETED" as const;
  if (completedTasks === 0) return "PLANNED" as const;
  return "IN_PROGRESS" as const;
}

```