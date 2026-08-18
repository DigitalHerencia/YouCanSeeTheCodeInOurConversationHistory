---
title: 'The Maximal Template™ Domain Library\lib\integrations\vercel-blob\delete.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\vercel-blob\delete.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.vercel-blob.delete.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\vercel-blob\delete.ts'
source_file: 'delete.ts'
source_sha256: 'd5f3a9578ab6cb3e775b9ef0756be23cfff2c509f0770dcee095f2d9628a7433'
generated: true
---

# `delete.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\vercel-blob\delete.ts`
> SHA-256: `d5f3a9578ab6cb3e775b9ef0756be23cfff2c509f0770dcee095f2d9628a7433`

```ts
import "server-only";

import { del } from "@vercel/blob";

import { getBlobToken } from "./client";

export function deleteBlob(urlOrPathname: string | string[]) {
  return del(urlOrPathname, { token: getBlobToken() });
}

```