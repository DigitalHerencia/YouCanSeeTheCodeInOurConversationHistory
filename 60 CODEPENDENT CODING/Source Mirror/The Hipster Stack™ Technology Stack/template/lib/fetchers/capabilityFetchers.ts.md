---
title: 'The Hipster Stack™ Technology Stack\template\lib\fetchers\capabilityFetchers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\fetchers\capabilityFetchers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.fetchers.capabilityfetchers.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\fetchers\capabilityFetchers.ts'
source_file: 'capabilityFetchers.ts'
source_sha256: 'f23e9036fd64f99aa21506bb89a8a51857b8c5adf2fee652d601370c2733737b'
generated: true
---

# `capabilityFetchers.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\fetchers\capabilityFetchers.ts`
> SHA-256: `f23e9036fd64f99aa21506bb89a8a51857b8c5adf2fee652d601370c2733737b`

```ts
import "server-only"

import { unstable_noStore as noStore } from "next/cache"

import { requireTenantContext } from "@/lib/auth/session"
import { assertCapability } from "@/lib/authz/assertions"
import { mapLocationDTO, mapMediaAssetDTO } from "@/lib/db/dto/capability.mappers"
import { locationSelect, mediaAssetSelect } from "@/lib/db/selects/capability.selects"
import { withTenantContext } from "@/lib/db/withTenantContext"

export async function getMediaLibraryState() {
  noStore()
  const context = await requireTenantContext()
  assertCapability(context, "media.read")
  const assets = await withTenantContext(context.organization.id, (tx) =>
    tx.mediaAsset.findMany({
      where: { organizationId: context.organization.id, status: { not: "deleted" } },
      orderBy: { createdAt: "desc" },
      take: 24,
      select: mediaAssetSelect,
    })
  )
  return assets.map(mapMediaAssetDTO)
}

export async function getSavedLocations() {
  noStore()
  const context = await requireTenantContext()
  assertCapability(context, "map.read")
  const locations = await withTenantContext(context.organization.id, (tx) =>
    tx.locationRecord.findMany({
      where: { organizationId: context.organization.id },
      orderBy: { createdAt: "desc" },
      take: 24,
      select: locationSelect,
    })
  )
  return locations.map(mapLocationDTO)
}

```