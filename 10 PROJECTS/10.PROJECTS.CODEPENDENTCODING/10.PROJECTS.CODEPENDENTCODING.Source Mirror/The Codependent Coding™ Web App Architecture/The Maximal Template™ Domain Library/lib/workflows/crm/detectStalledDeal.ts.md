---
title: 'The Maximal Template™ Domain Library\lib\workflows\crm\detectStalledDeal.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\crm\detectStalledDeal.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.crm.detectstalleddeal.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\crm\detectStalledDeal.ts'
source_file: 'detectStalledDeal.ts'
source_sha256: 'a6d5d39c2bb777bc442fde3b045babf3f800961c232585a285aabc796154de2a'
generated: true
---

# `detectStalledDeal.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\crm\detectStalledDeal.ts`
> SHA-256: `a6d5d39c2bb777bc442fde3b045babf3f800961c232585a285aabc796154de2a`

```ts
export function detectStalledDeal({
  updatedAt,
  stage,
  now = new Date(),
  staleAfterDays = 14,
}: {
  updatedAt: Date;
  stage: string;
  now?: Date;
  staleAfterDays?: number;
}) {
  if (stage === "WON" || stage === "LOST") return false;
  return now.getTime() - updatedAt.getTime() >= staleAfterDays * 86_400_000;
}

```