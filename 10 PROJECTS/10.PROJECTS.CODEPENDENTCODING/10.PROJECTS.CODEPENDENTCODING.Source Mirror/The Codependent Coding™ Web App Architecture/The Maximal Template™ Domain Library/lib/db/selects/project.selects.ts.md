---
title: 'The Hipster Stack™ Technology Stack\template\lib\db\selects\project.selects.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\db\selects\project.selects.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.db.selects.project.selects.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\db\selects\project.selects.ts'
source_file: 'project.selects.ts'
source_sha256: 'b2101c0610673ca8a7dca292a6511f2c213b67dfee124db64237658d3e7aacdb'
generated: true
---

# `project.selects.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\db\selects\project.selects.ts`
> SHA-256: `b2101c0610673ca8a7dca292a6511f2c213b67dfee124db64237658d3e7aacdb`

```ts
import "server-only"

import type { Prisma } from "@/prisma/generated/prisma/client"

export const organizationMembershipSelect = {
  id: true,
  role: true,
  createdAt: true,
  user: {
    select: {
      id: true,
      email: true,
      displayName: true,
    },
  },
} satisfies Prisma.MembershipSelect

export const projectSummarySelect = {
  id: true,
  organizationId: true,
  name: true,
  slug: true,
  description: true,
  status: true,
  updatedAt: true,
  organization: {
    select: {
      memberships: {
        select: {
          userId: true,
          role: true,
        },
      },
    },
  },
} satisfies Prisma.ProjectSelect

export const projectDetailSelect = {
  id: true,
  organizationId: true,
  ownerId: true,
  name: true,
  slug: true,
  description: true,
  status: true,
  createdAt: true,
  updatedAt: true,
  organization: {
    select: {
      memberships: {
        orderBy: { createdAt: "asc" },
        select: organizationMembershipSelect,
      },
    },
  },
} satisfies Prisma.ProjectSelect

```