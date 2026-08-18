---
title: 'The Hipster Stack™ Technology Stack\template\schemas\capabilitySchemas.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\schemas\capabilitySchemas.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.schemas.capabilityschemas.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\schemas\capabilitySchemas.ts'
source_file: 'capabilitySchemas.ts'
source_sha256: 'db537ba7d2b0e338b0f06fdb2de531a82c9ed7f8c0efd4fd4e7835a1639f4389'
generated: true
---

# `capabilitySchemas.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\schemas\capabilitySchemas.ts`
> SHA-256: `db537ba7d2b0e338b0f06fdb2de531a82c9ed7f8c0efd4fd4e7835a1639f4389`

```ts
import { z } from "zod"

export const mediaUploadSchema = z.object({
  file: z
    .instanceof(File)
    .refine((file) => file.size > 0 && file.size <= 10_000_000, "Choose a file up to 10 MB."),
})

export const inferenceSchema = z.object({
  prompt: z.string().trim().min(3).max(4000),
})

export const locationSearchSchema = z.object({
  query: z.string().trim().min(2).max(256),
})

export const saveLocationSchema = z.object({
  label: z.string().trim().min(2).max(200),
  mapboxId: z.string().trim().max(255).optional(),
  longitude: z.coerce.number().min(-180).max(180),
  latitude: z.coerce.number().min(-90).max(90),
})

export const cloudinaryNotificationSchema = z.object({
  notification_type: z.string().min(1),
  asset_id: z.string().min(1),
  public_id: z.string().min(1),
  resource_type: z.string().min(1),
  secure_url: z.string().url().optional(),
  format: z.string().optional(),
  bytes: z.number().int().nonnegative().optional(),
  width: z.number().int().positive().optional(),
  height: z.number().int().positive().optional(),
})

export type SaveLocationInput = z.infer<typeof saveLocationSchema>

```