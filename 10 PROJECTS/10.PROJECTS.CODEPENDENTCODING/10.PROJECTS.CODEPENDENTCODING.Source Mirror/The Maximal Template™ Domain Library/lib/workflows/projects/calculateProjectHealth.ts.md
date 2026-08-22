---
title: 'The Maximal Template™ Domain Library\lib\workflows\projects\calculateProjectHealth.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\projects\calculateProjectHealth.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.projects.calculateprojecthealth.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\projects\calculateProjectHealth.ts'
source_file: 'calculateProjectHealth.ts'
source_sha256: '3fabfaa6818d8792847f3641dd1d381f23629c3eed6dfdcdc66f5c9d4c588caf'
generated: true
---

# `calculateProjectHealth.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\projects\calculateProjectHealth.ts`
> SHA-256: `3fabfaa6818d8792847f3641dd1d381f23629c3eed6dfdcdc66f5c9d4c588caf`

```ts
export function calculateProjectHealth({
  overdueTasks,
  blockedTasks,
  progress,
}: {
  overdueTasks: number;
  blockedTasks: number;
  progress: number;
}) {
  if (overdueTasks > 0 || blockedTasks > 2) return "AT_RISK" as const;
  if (blockedTasks > 0 || progress < 25) return "WATCH" as const;
  return "HEALTHY" as const;
}

```