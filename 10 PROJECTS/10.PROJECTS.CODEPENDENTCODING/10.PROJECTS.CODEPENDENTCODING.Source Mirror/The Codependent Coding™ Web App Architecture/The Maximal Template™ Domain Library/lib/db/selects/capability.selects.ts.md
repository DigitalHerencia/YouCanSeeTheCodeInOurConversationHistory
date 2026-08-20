---
title: 'The Hipster Stack™ Technology Stack\template\lib\db\selects\capability.selects.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\db\selects\capability.selects.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.db.selects.capability.selects.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\db\selects\capability.selects.ts'
source_file: 'capability.selects.ts'
source_sha256: 'fffe93942cab2e274e32589ba52086b8cea582759a564c0884fb75693b9ebbf3'
generated: true
---

# `capability.selects.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\db\selects\capability.selects.ts`
> SHA-256: `fffe93942cab2e274e32589ba52086b8cea582759a564c0884fb75693b9ebbf3`

```ts
import "server-only"

import type { Prisma } from "@/prisma/generated/prisma/client"

export const mediaAssetSelect = {
  id: true,
  publicId: true,
  resourceType: true,
  format: true,
  secureUrl: true,
  status: true,
  createdAt: true,
} satisfies Prisma.MediaAssetSelect

export const locationSelect = {
  id: true,
  label: true,
  longitude: true,
  latitude: true,
  createdAt: true,
} satisfies Prisma.LocationRecordSelect

```