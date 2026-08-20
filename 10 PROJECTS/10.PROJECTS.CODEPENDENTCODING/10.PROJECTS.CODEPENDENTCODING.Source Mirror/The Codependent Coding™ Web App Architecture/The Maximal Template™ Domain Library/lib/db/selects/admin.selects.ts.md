---
title: 'The Hipster Stack™ Technology Stack\template\lib\db\selects\admin.selects.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\db\selects\admin.selects.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.db.selects.admin.selects.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\db\selects\admin.selects.ts'
source_file: 'admin.selects.ts'
source_sha256: 'c53fd3c713eb372685c2913dcba2e1d32139c20e0ee5a09f6312ddbdc6b419b0'
generated: true
---

# `admin.selects.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\db\selects\admin.selects.ts`
> SHA-256: `c53fd3c713eb372685c2913dcba2e1d32139c20e0ee5a09f6312ddbdc6b419b0`

```ts
import "server-only"

import type { Prisma } from "@/prisma/generated/prisma/client"

export const adminUserSelect = {
  id: true,
  displayName: true,
  email: true,
  status: true,
  isApplicationAdmin: true,
  createdAt: true,
} satisfies Prisma.UserSelect

export const adminOrganizationSelect = {
  id: true,
  name: true,
  slug: true,
  status: true,
  createdAt: true,
  _count: { select: { memberships: true, projects: true } },
} satisfies Prisma.OrganizationSelect

export const adminBillingSelect = {
  id: true,
  status: true,
  stripePriceId: true,
  cancelAtPeriodEnd: true,
  currentPeriodEnd: true,
  updatedAt: true,
  organization: { select: { name: true, slug: true } },
} satisfies Prisma.BillingSubscriptionSelect

export const adminWebhookSelect = {
  id: true,
  provider: true,
  eventType: true,
  status: true,
  attemptCount: true,
  receivedAt: true,
  processedAt: true,
  processingError: true,
} satisfies Prisma.ProviderWebhookEventSelect

```