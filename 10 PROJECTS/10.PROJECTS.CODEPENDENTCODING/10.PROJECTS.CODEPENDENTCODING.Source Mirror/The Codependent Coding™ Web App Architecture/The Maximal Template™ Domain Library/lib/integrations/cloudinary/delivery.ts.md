---
title: 'The Hipster Stack™ Technology Stack\template\lib\integrations\cloudinary\delivery.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\integrations\cloudinary\delivery.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.integrations.cloudinary.delivery.ts'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\lib\integrations\cloudinary\delivery.ts'
source_file: 'delivery.ts'
source_sha256: '31e10285cc2d295f33916c92f84d2968fc60d2ee291d7f350982e672c8207873'
generated: true
---

# `delivery.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\integrations\cloudinary\delivery.ts`
> SHA-256: `31e10285cc2d295f33916c92f84d2968fc60d2ee291d7f350982e672c8207873`

```ts
import "server-only"

import { getRequiredEnv } from "@/lib/env"

export function cloudinaryDeliveryUrl(input: {
  publicId: string
  resourceType?: "image" | "video" | "raw"
  transformation?: { width?: number; height?: number; crop?: "fill" | "fit" | "limit" }
}): string {
  const transformation = input.transformation
    ? [
        input.transformation.width ? `w_${input.transformation.width}` : null,
        input.transformation.height ? `h_${input.transformation.height}` : null,
        input.transformation.crop ? `c_${input.transformation.crop}` : null,
        "f_auto",
        "q_auto",
      ]
        .filter(Boolean)
        .join(",")
    : "f_auto,q_auto"
  const publicId = input.publicId.split("/").map(encodeURIComponent).join("/")
  return `https://res.cloudinary.com/${encodeURIComponent(getRequiredEnv("CLOUDINARY_CLOUD_NAME"))}/${input.resourceType ?? "image"}/upload/${transformation}/${publicId}`
}

```