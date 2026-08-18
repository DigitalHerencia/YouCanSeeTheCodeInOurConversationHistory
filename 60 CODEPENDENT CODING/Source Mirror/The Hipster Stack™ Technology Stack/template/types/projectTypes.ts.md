---
title: 'The Hipster Stack™ Technology Stack\template\types\projectTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\types\projectTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.types.projecttypes.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\types\projectTypes.ts'
source_file: 'projectTypes.ts'
source_sha256: 'ed03645767fc416f087273f55a9453b575323116c70ea2378f873dfd416286df'
generated: true
---

# `projectTypes.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\types\projectTypes.ts`
> SHA-256: `ed03645767fc416f087273f55a9453b575323116c70ea2378f873dfd416286df`

```ts
import type { OrganizationRole } from "@/types/authzTypes"
import type { ActionResult } from "@/types/actionResultTypes"

export type ProjectActionState = ActionResult<{ id: string }> | null

export type OrganizationMembershipDTO = {
  id: string
  userId: string
  email: string | null
  displayName: string | null
  role: OrganizationRole
  createdAt: string
}

export type ProjectSummaryDTO = {
  id: string
  organizationId: string
  name: string
  slug: string
  description: string | null
  role: OrganizationRole
  status: "active" | "archived"
  updatedAt: string
}

export type ProjectDetailDTO = ProjectSummaryDTO & {
  ownerId: string
  createdAt: string
  memberships: OrganizationMembershipDTO[]
}

export type ProjectListStateDTO = {
  projects: ProjectSummaryDTO[]
  empty: boolean
}

export type DashboardStateDTO = {
  projectCount: number
  recentProjects: ProjectSummaryDTO[]
  empty: boolean
}

```