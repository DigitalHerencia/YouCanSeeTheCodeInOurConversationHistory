---
title: 'The Hipster Stack™ Technology Stack\template\lib\db\selects\organization.selects.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\db\selects\organization.selects.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.db.selects.organization.selects.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\db\selects\organization.selects.ts'
source_file: 'organization.selects.ts'
source_sha256: '6d9e3c87276d143068a37aba53598650de63ac0b9de91dbec81decfa09a94ab1'
generated: true
---

# `organization.selects.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\db\selects\organization.selects.ts`
> SHA-256: `6d9e3c87276d143068a37aba53598650de63ac0b9de91dbec81decfa09a94ab1`

```ts
import "server-only"

import type { Prisma } from "@/prisma/generated/prisma/client"

export const organizationSettingsSelect = {
  id: true,
  name: true,
  slug: true,
  status: true,
} satisfies Prisma.OrganizationSelect

export const teamMemberSelect = {
  id: true,
  role: true,
  createdAt: true,
  user: { select: { id: true, displayName: true, email: true } },
} satisfies Prisma.MembershipSelect

```