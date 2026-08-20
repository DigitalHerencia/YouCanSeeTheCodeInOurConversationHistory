---
title: 'The Hipster Stack™ Technology Stack\template\lib\db\dto\organization.mappers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\db\dto\organization.mappers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.db.dto.organization.mappers.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\db\dto\organization.mappers.ts'
source_file: 'organization.mappers.ts'
source_sha256: '23518878c31c417e7db0bdadfb5681748b0d5d2c3e81e50ad4b207bb93cb8472'
generated: true
---

# `organization.mappers.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\db\dto\organization.mappers.ts`
> SHA-256: `23518878c31c417e7db0bdadfb5681748b0d5d2c3e81e50ad4b207bb93cb8472`

```ts
import "server-only"

import type { Prisma } from "@/prisma/generated/prisma/client"
import { organizationSettingsSelect, teamMemberSelect } from "@/lib/db/selects/organization.selects"
import type { OrganizationSettingsDTO, TeamMemberDTO } from "@/types/organizationTypes"

type OrganizationRecord = Prisma.OrganizationGetPayload<{
  select: typeof organizationSettingsSelect
}>
type TeamMemberRecord = Prisma.MembershipGetPayload<{ select: typeof teamMemberSelect }>

export function mapOrganizationSettingsDTO(record: OrganizationRecord): OrganizationSettingsDTO {
  return record
}

export function mapTeamMemberDTO(record: TeamMemberRecord, currentUserId: string): TeamMemberDTO {
  return {
    id: record.id,
    displayName: record.user.displayName ?? record.user.email ?? "Unnamed user",
    email: record.user.email,
    role: record.role,
    joinedAt: record.createdAt.toISOString(),
    isCurrentUser: record.user.id === currentUserId,
  }
}

```