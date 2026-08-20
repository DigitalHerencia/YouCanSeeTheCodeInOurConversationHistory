---
title: 'The Maximal Template™ Domain Library\lib\integrations\vercel-blob\upload.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\vercel-blob\upload.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.vercel-blob.upload.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\vercel-blob\upload.ts'
source_file: 'upload.ts'
source_sha256: '8a92e456268db33efbf4e24de59a0a353301e37228100b862c8a9e17e8e7473e'
generated: true
---

# `upload.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\vercel-blob\upload.ts`
> SHA-256: `8a92e456268db33efbf4e24de59a0a353301e37228100b862c8a9e17e8e7473e`

```ts
import "server-only";

import { put } from "@vercel/blob";

import { getBlobToken } from "./client";

export function uploadBlob(
  pathname: string,
  body: Parameters<typeof put>[1],
  contentType?: string,
) {
  return put(pathname, body, {
    access: "private",
    addRandomSuffix: true,
    contentType,
    token: getBlobToken(),
  });
}

```