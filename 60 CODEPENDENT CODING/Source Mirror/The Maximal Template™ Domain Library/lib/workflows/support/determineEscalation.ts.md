---
title: 'The Maximal Template™ Domain Library\lib\workflows\support\determineEscalation.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\support\determineEscalation.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.support.determineescalation.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\support\determineEscalation.ts'
source_file: 'determineEscalation.ts'
source_sha256: '016627a6c10a7816c32d649f66153e02c151bb4e7f80d2f0f9d94688dfb4e6b6'
generated: true
---

# `determineEscalation.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\support\determineEscalation.ts`
> SHA-256: `016627a6c10a7816c32d649f66153e02c151bb4e7f80d2f0f9d94688dfb4e6b6`

```ts
export function determineEscalation({
  priority,
  firstResponseDueAt,
  resolutionDueAt,
  now = new Date(),
}: {
  priority: string;
  firstResponseDueAt: Date | null;
  resolutionDueAt: Date | null;
  now?: Date;
}) {
  if (resolutionDueAt && resolutionDueAt <= now)
    return "RESOLUTION_BREACH" as const;
  if (firstResponseDueAt && firstResponseDueAt <= now)
    return "RESPONSE_BREACH" as const;
  if (priority === "URGENT") return "URGENT" as const;
  return null;
}

```