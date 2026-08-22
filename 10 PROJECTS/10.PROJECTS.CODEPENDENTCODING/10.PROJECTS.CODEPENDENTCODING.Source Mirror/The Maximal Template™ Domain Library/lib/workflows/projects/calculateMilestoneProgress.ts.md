---
title: 'The Maximal Template™ Domain Library\lib\workflows\projects\calculateMilestoneProgress.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\projects\calculateMilestoneProgress.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.projects.calculatemilestoneprogress.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\projects\calculateMilestoneProgress.ts'
source_file: 'calculateMilestoneProgress.ts'
source_sha256: '0fc2b9660c4c3e68b7d7cb58a4116a94e0d995706aae430f22731cba24a20843'
generated: true
---

# `calculateMilestoneProgress.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\projects\calculateMilestoneProgress.ts`
> SHA-256: `0fc2b9660c4c3e68b7d7cb58a4116a94e0d995706aae430f22731cba24a20843`

```ts
export function calculateMilestoneProgress(
  completedTasks: number,
  totalTasks: number,
) {
  if (completedTasks < 0 || totalTasks < 0 || completedTasks > totalTasks)
    throw new Error("Milestone task totals are invalid.");
  return totalTasks === 0 ? 0 : Math.round((completedTasks / totalTasks) * 100);
}

```