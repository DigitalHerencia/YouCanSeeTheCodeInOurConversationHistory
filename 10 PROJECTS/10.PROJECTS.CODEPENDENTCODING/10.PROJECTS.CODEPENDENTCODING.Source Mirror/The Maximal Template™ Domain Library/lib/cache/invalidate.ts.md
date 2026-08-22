---
title: 'The Maximal Template™ Domain Library\lib\cache\invalidate.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\cache\invalidate.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.cache.invalidate.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\cache\invalidate.ts'
source_file: 'invalidate.ts'
source_sha256: '3f03f40ef68f1dfac9ea29a381842d91248d553e6612aaf6005870bcb5ccfc2c'
generated: true
---

# `invalidate.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\cache\invalidate.ts`
> SHA-256: `3f03f40ef68f1dfac9ea29a381842d91248d553e6612aaf6005870bcb5ccfc2c`

```ts
import { revalidatePath, revalidateTag } from "next/cache";

export function invalidateTags(tags: readonly string[]) {
  for (const tag of new Set(tags)) revalidateTag(tag, "max");
}

export function invalidatePaths(paths: readonly string[]) {
  for (const path of new Set(paths)) revalidatePath(path);
}

```