---
title: 'The Hipster Stack™ Technology Stack\template\lib\db\transactions\capabilityTransactions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\db\transactions\capabilityTransactions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.db.transactions.capabilitytransactions.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\db\transactions\capabilityTransactions.ts'
source_file: 'capabilityTransactions.ts'
source_sha256: '5d099da1028d72028485670f7bacb58491f376c6c94b8afb94c280b2850bc79f'
generated: true
---

# `capabilityTransactions.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\db\transactions\capabilityTransactions.ts`
> SHA-256: `5d099da1028d72028485670f7bacb58491f376c6c94b8afb94c280b2850bc79f`

```ts
import "server-only"

import type { Prisma } from "@/prisma/generated/prisma/client"
import type { SaveLocationInput } from "@/schemas/capabilitySchemas"

export async function recordMediaAssetTx(
  tx: Prisma.TransactionClient,
  input: {
    organizationId: string
    uploadedById: string
    assetId: string
    publicId: string
    resourceType: string
    format: string | null
    secureUrl: string
    bytes: number | null
    width: number | null
    height: number | null
  }
) {
  await tx.providerMediaAssetBinding.createMany({
    data: [{ providerAssetId: input.assetId, organizationId: input.organizationId }],
    skipDuplicates: true,
  })
  return tx.mediaAsset.upsert({
    where: { providerAssetId: input.assetId },
    create: {
      organizationId: input.organizationId,
      uploadedById: input.uploadedById,
      providerAssetId: input.assetId,
      publicId: input.publicId,
      resourceType: input.resourceType,
      format: input.format,
      secureUrl: input.secureUrl,
      bytes: input.bytes,
      width: input.width,
      height: input.height,
      status: "ready",
      providerUpdatedAt: new Date(),
    },
    update: {
      publicId: input.publicId,
      resourceType: input.resourceType,
      format: input.format,
      secureUrl: input.secureUrl,
      bytes: input.bytes,
      width: input.width,
      height: input.height,
      status: "ready",
      providerUpdatedAt: new Date(),
    },
  })
}

export async function reconcileMediaAssetTx(
  tx: Prisma.TransactionClient,
  input: {
    assetId: string
    publicId: string
    resourceType: string
    format?: string
    secureUrl?: string
    bytes?: number
    width?: number
    height?: number
  }
) {
  return tx.mediaAsset.update({
    where: { providerAssetId: input.assetId },
    data: {
      publicId: input.publicId,
      resourceType: input.resourceType,
      ...(input.format !== undefined ? { format: input.format } : {}),
      ...(input.secureUrl !== undefined ? { secureUrl: input.secureUrl } : {}),
      ...(input.bytes !== undefined ? { bytes: input.bytes } : {}),
      ...(input.width !== undefined ? { width: input.width } : {}),
      ...(input.height !== undefined ? { height: input.height } : {}),
      status: "ready",
      providerUpdatedAt: new Date(),
    },
  })
}

export async function createLocationTx(
  tx: Prisma.TransactionClient,
  input: SaveLocationInput & { organizationId: string }
) {
  return tx.locationRecord.create({
    data: {
      organizationId: input.organizationId,
      label: input.label,
      longitude: input.longitude,
      latitude: input.latitude,
      ...(input.mapboxId ? { mapboxId: input.mapboxId } : {}),
    },
  })
}

```