---
title: 'The Maximal Template™ Domain Library\lib\workflows\portal\determineApprovalState.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\portal\determineApprovalState.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.portal.determineapprovalstate.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\portal\determineApprovalState.ts'
source_file: 'determineApprovalState.ts'
source_sha256: '7c2b6a591ad68b715d34116286188ff8c1f506b076258793f4ba2e3230def3ea'
generated: true
---

# `determineApprovalState.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\portal\determineApprovalState.ts`
> SHA-256: `7c2b6a591ad68b715d34116286188ff8c1f506b076258793f4ba2e3230def3ea`

```ts
export function determineApprovalState(
  states: Array<"PENDING" | "APPROVED" | "REJECTED">,
) {
  if (states.some((state) => state === "REJECTED")) return "REJECTED" as const;
  if (states.length > 0 && states.every((state) => state === "APPROVED"))
    return "APPROVED" as const;
  return "PENDING" as const;
}

```