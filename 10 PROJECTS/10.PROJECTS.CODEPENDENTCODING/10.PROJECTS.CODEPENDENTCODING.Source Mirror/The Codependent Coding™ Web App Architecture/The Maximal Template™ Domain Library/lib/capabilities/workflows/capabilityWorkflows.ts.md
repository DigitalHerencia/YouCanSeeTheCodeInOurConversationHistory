---
title: 'The Hipster Stack™ Technology Stack\template\lib\capabilities\workflows\capabilityWorkflows.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\capabilities\workflows\capabilityWorkflows.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.capabilities.workflows.capabilityworkflows.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\capabilities\workflows\capabilityWorkflows.ts'
source_file: 'capabilityWorkflows.ts'
source_sha256: 'c40961562ffd2d120dbb5e4c5f94aeae3a2cfdac8c23de5aa4c44ca4c33711b7'
generated: true
---

# `capabilityWorkflows.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\capabilities\workflows\capabilityWorkflows.ts`
> SHA-256: `c40961562ffd2d120dbb5e4c5f94aeae3a2cfdac8c23de5aa4c44ca4c33711b7`

```ts
import "server-only"

import { requireTenantContext } from "@/lib/auth/session"
import { assertCapability } from "@/lib/authz/assertions"
import { createLocationTx, recordMediaAssetTx } from "@/lib/db/transactions/capabilityTransactions"
import { withTenantContext } from "@/lib/db/withTenantContext"
import { runHuggingFaceInference } from "@/lib/integrations/huggingface/inference"
import { geocodeLocation } from "@/lib/integrations/mapbox/geocoding"
import { uploadToCloudinary } from "@/lib/integrations/cloudinary/uploads"
import {
  inferenceSchema,
  locationSearchSchema,
  mediaUploadSchema,
  saveLocationSchema,
} from "@/schemas/capabilitySchemas"

export async function uploadMediaWorkflow(input: unknown) {
  const parsed = mediaUploadSchema.parse(input)
  const context = await requireTenantContext()
  assertCapability(context, "media.manage")
  const uploaded = await uploadToCloudinary(parsed.file)
  return withTenantContext(context.organization.id, (tx) =>
    recordMediaAssetTx(tx, {
      ...uploaded,
      organizationId: context.organization.id,
      uploadedById: context.localUser.id,
    })
  )
}

export async function runInferenceWorkflow(input: unknown) {
  const parsed = inferenceSchema.parse(input)
  const context = await requireTenantContext()
  assertCapability(context, "ai.use")
  return runHuggingFaceInference(parsed.prompt)
}

export async function searchLocationsWorkflow(input: unknown) {
  const parsed = locationSearchSchema.parse(input)
  const context = await requireTenantContext()
  assertCapability(context, "map.read")
  return geocodeLocation(parsed.query)
}

export async function saveLocationWorkflow(input: unknown) {
  const parsed = saveLocationSchema.parse(input)
  const context = await requireTenantContext()
  assertCapability(context, "map.manage")
  return withTenantContext(context.organization.id, (tx) =>
    createLocationTx(tx, { ...parsed, organizationId: context.organization.id })
  )
}

```