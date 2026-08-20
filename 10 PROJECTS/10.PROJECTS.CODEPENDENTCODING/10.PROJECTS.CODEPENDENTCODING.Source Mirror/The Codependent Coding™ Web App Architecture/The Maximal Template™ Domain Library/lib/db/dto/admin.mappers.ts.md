---
title: 'The Hipster Stack™ Technology Stack\template\lib\db\dto\admin.mappers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\db\dto\admin.mappers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.db.dto.admin.mappers.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\db\dto\admin.mappers.ts'
source_file: 'admin.mappers.ts'
source_sha256: 'aa39b320e29bc14bc521a81a743eb3ed94981de363ceda89e159473f83478646'
generated: true
---

# `admin.mappers.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\db\dto\admin.mappers.ts`
> SHA-256: `aa39b320e29bc14bc521a81a743eb3ed94981de363ceda89e159473f83478646`

```ts
import "server-only"

import type { Prisma } from "@/prisma/generated/prisma/client"
import {
  adminBillingSelect,
  adminOrganizationSelect,
  adminUserSelect,
  adminWebhookSelect,
} from "@/lib/db/selects/admin.selects"
import type {
  AdminBillingDTO,
  AdminOrganizationDTO,
  AdminUserDTO,
  AdminWebhookDTO,
} from "@/types/adminTypes"

type UserRecord = Prisma.UserGetPayload<{ select: typeof adminUserSelect }>
type OrganizationRecord = Prisma.OrganizationGetPayload<{
  select: typeof adminOrganizationSelect
}>
type BillingRecord = Prisma.BillingSubscriptionGetPayload<{
  select: typeof adminBillingSelect
}>
type WebhookRecord = Prisma.ProviderWebhookEventGetPayload<{
  select: typeof adminWebhookSelect
}>

export function mapAdminUserDTO(record: UserRecord): AdminUserDTO {
  return {
    id: record.id,
    displayName: record.displayName ?? record.email ?? "Unnamed user",
    email: record.email,
    status: record.status,
    isApplicationAdmin: record.isApplicationAdmin,
    createdAt: record.createdAt.toISOString(),
  }
}

export function mapAdminOrganizationDTO(record: OrganizationRecord): AdminOrganizationDTO {
  return {
    id: record.id,
    name: record.name,
    slug: record.slug,
    status: record.status,
    memberCount: record._count.memberships,
    projectCount: record._count.projects,
    createdAt: record.createdAt.toISOString(),
  }
}

export function mapAdminBillingDTO(record: BillingRecord): AdminBillingDTO {
  return {
    id: record.id,
    organizationName: record.organization.name,
    organizationSlug: record.organization.slug,
    status: record.status,
    priceId: record.stripePriceId,
    cancelAtPeriodEnd: record.cancelAtPeriodEnd,
    currentPeriodEnd: record.currentPeriodEnd?.toISOString() ?? null,
    updatedAt: record.updatedAt.toISOString(),
  }
}

export function mapAdminWebhookDTO(record: WebhookRecord): AdminWebhookDTO {
  return {
    id: record.id,
    provider: record.provider,
    eventType: record.eventType,
    status: record.status,
    attemptCount: record.attemptCount,
    receivedAt: record.receivedAt.toISOString(),
    processedAt: record.processedAt?.toISOString() ?? null,
    processingError: record.processingError,
  }
}

```