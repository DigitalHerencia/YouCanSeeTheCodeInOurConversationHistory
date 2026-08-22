---
title: 'The Maximal Template™ Domain Library\lib\integrations\cloudinary\transformations.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\cloudinary\transformations.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.cloudinary.transformations.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\cloudinary\transformations.ts'
source_file: 'transformations.ts'
source_sha256: 'a4c98511dc118dda0ec5c30f6eac3b13934342c951d3f03ebc544070d1c31fa9'
generated: true
---

# `transformations.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\cloudinary\transformations.ts`
> SHA-256: `a4c98511dc118dda0ec5c30f6eac3b13934342c951d3f03ebc544070d1c31fa9`

```ts
import "server-only";

import type { TransformationOptions } from "cloudinary";

import { getCloudinaryClient } from "./client";

export function buildCloudinaryUrl(
  publicId: string,
  transformation: TransformationOptions = {},
) {
  return getCloudinaryClient().url(publicId, { secure: true, transformation });
}

```