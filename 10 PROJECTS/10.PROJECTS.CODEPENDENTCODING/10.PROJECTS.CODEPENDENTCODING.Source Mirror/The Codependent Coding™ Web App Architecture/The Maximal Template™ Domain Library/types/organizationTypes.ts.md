---
title: 'The Hipster Stack™ Technology Stack\template\types\organizationTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\types\organizationTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.types.organizationtypes.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\types\organizationTypes.ts'
source_file: 'organizationTypes.ts'
source_sha256: '89ff3ff7982989f0ec62ea2850146f9733b19b03fb6ec85dcf777f1422283510'
generated: true
---

# `organizationTypes.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\types\organizationTypes.ts`
> SHA-256: `89ff3ff7982989f0ec62ea2850146f9733b19b03fb6ec85dcf777f1422283510`

```ts
import type { OrganizationRole } from "@/types/authzTypes"

export type OrganizationSettingsDTO = {
  id: string
  name: string
  slug: string
  status: "active" | "suspended"
}

export type TeamMemberDTO = {
  id: string
  displayName: string
  email: string | null
  role: OrganizationRole
  joinedAt: string
  isCurrentUser: boolean
}

export type IntegrationReadinessDTO = {
  id: "clerk" | "stripe" | "stripe-connect" | "cloudinary" | "hugging-face" | "mapbox"
  label: string
  configured: boolean
  purpose: string
}

```