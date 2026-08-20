---
title: 'The Hipster Stack™ Technology Stack\template\lib\db\dto\capability.mappers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\db\dto\capability.mappers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.db.dto.capability.mappers.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\db\dto\capability.mappers.ts'
source_file: 'capability.mappers.ts'
source_sha256: '90580ffb5d19e7c57526cf8cca2d50c576ba4612af4f4cb50bdb3a040d3a8deb'
generated: true
---

# `capability.mappers.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\db\dto\capability.mappers.ts`
> SHA-256: `90580ffb5d19e7c57526cf8cca2d50c576ba4612af4f4cb50bdb3a040d3a8deb`

```ts
import "server-only"

import type { Prisma } from "@/prisma/generated/prisma/client"
import { locationSelect, mediaAssetSelect } from "@/lib/db/selects/capability.selects"
import type { MediaAssetDTO, SavedLocationDTO } from "@/types/capabilityTypes"

type MediaRecord = Prisma.MediaAssetGetPayload<{ select: typeof mediaAssetSelect }>
type LocationRecord = Prisma.LocationRecordGetPayload<{ select: typeof locationSelect }>

export function mapMediaAssetDTO(record: MediaRecord): MediaAssetDTO {
  return { ...record, createdAt: record.createdAt.toISOString() }
}

export function mapLocationDTO(record: LocationRecord): SavedLocationDTO {
  return {
    id: record.id,
    label: record.label,
    longitude: Number(record.longitude),
    latitude: Number(record.latitude),
    createdAt: record.createdAt.toISOString(),
  }
}

```