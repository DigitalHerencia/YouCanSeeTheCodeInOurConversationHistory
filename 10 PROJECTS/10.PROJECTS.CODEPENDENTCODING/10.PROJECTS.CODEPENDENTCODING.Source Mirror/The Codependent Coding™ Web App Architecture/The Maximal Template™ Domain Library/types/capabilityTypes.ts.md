---
title: 'The Hipster Stack™ Technology Stack\template\types\capabilityTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\types\capabilityTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.types.capabilitytypes.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\types\capabilityTypes.ts'
source_file: 'capabilityTypes.ts'
source_sha256: 'd9cbb786f2b54cd3860ae47146e81edd38d809c1e2da2d2205ad19660abd0ccd'
generated: true
---

# `capabilityTypes.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\types\capabilityTypes.ts`
> SHA-256: `d9cbb786f2b54cd3860ae47146e81edd38d809c1e2da2d2205ad19660abd0ccd`

```ts
export type MediaAssetDTO = {
  id: string
  publicId: string
  resourceType: string
  format: string | null
  secureUrl: string | null
  status: "pending" | "ready" | "deleted" | "failed"
  createdAt: string
}

export type InferenceResult = { model: string; text: string }

export type LocationResult = {
  id: string
  label: string
  longitude: number
  latitude: number
}

export type SavedLocationDTO = LocationResult & { createdAt: string }

export type DirectionsResult = {
  distanceMeters: number
  durationSeconds: number
  geometry: { type: "LineString"; coordinates: number[][] }
}

```