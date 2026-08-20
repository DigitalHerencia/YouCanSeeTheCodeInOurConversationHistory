---
title: 'The Maximal Template™ Domain Library\lib\integrations\cloudinary\upload.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\cloudinary\upload.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.cloudinary.upload.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\cloudinary\upload.ts'
source_file: 'upload.ts'
source_sha256: '0864ae4cac5a6289994b41fa40ae04e574bb108d225fef44abb8cd9abcd10a99'
generated: true
---

# `upload.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\cloudinary\upload.ts`
> SHA-256: `0864ae4cac5a6289994b41fa40ae04e574bb108d225fef44abb8cd9abcd10a99`

```ts
import "server-only";

import type { UploadApiOptions } from "cloudinary";

import { getCloudinaryClient } from "./client";

export function uploadCloudinaryAsset(
  source: string,
  options: UploadApiOptions = {},
) {
  return getCloudinaryClient().uploader.upload(source, {
    resource_type: "auto",
    ...options,
  });
}

```