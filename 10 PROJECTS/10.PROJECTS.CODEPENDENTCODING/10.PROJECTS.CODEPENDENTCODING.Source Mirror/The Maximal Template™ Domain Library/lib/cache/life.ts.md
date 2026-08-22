---
title: 'The Maximal Template™ Domain Library\lib\cache\life.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\cache\life.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.cache.life.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\cache\life.ts'
source_file: 'life.ts'
source_sha256: 'e959e363c909472d798f6190453038cd137f95b6dec0832cd929e555758bd89c'
generated: true
---

# `life.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\cache\life.ts`
> SHA-256: `e959e363c909472d798f6190453038cd137f95b6dec0832cd929e555758bd89c`

```ts
export const cacheLife = {
  realtime: 0,
  short: 30,
  standard: 300,
  long: 3_600,
  static: 86_400,
} as const;

export type CacheLifeName = keyof typeof cacheLife;

```