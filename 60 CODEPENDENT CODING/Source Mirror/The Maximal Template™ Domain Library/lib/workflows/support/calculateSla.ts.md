---
title: 'The Maximal Template™ Domain Library\lib\workflows\support\calculateSla.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\support\calculateSla.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.support.calculatesla.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\support\calculateSla.ts'
source_file: 'calculateSla.ts'
source_sha256: '0e44d12eeb817936b40b7dae19eecdb8c530203a6723c923c386c25dde21e5c8'
generated: true
---

# `calculateSla.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\support\calculateSla.ts`
> SHA-256: `0e44d12eeb817936b40b7dae19eecdb8c530203a6723c923c386c25dde21e5c8`

```ts
const hoursByPriority = { LOW: 72, NORMAL: 24, HIGH: 8, URGENT: 2 } as const;

export function calculateSla(
  createdAt: Date,
  priority: keyof typeof hoursByPriority,
) {
  const responseHours = hoursByPriority[priority];
  return {
    firstResponseDueAt: new Date(
      createdAt.getTime() + responseHours * 3_600_000,
    ),
    resolutionDueAt: new Date(
      createdAt.getTime() + responseHours * 4 * 3_600_000,
    ),
  };
}

```