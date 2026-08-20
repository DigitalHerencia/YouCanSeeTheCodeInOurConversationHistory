---
title: 'The Hipster Stack™ Technology Stack\template\lib\fetchers\billingFetchers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\fetchers\billingFetchers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.fetchers.billingfetchers.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\fetchers\billingFetchers.ts'
source_file: 'billingFetchers.ts'
source_sha256: '3fb322622e95e338137750f22e864e21ee60d4e4874de8eace0729e92a7a6c59'
generated: true
---

# `billingFetchers.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\fetchers\billingFetchers.ts`
> SHA-256: `3fb322622e95e338137750f22e864e21ee60d4e4874de8eace0729e92a7a6c59`

```ts
import "server-only"

import { unstable_noStore as noStore } from "next/cache"

import { requireTenantContext } from "@/lib/auth/session"
import { assertCapability } from "@/lib/authz/assertions"
import { withTenantContext } from "@/lib/db/withTenantContext"
import type { BillingSettingsDTO } from "@/types/billingTypes"

export async function hasCoreEntitlement(): Promise<boolean> {
  const context = await requireTenantContext()
  const entitlement = await withTenantContext(context.organization.id, (tx) =>
    tx.billingEntitlement.findUnique({
      where: { organizationId_key: { organizationId: context.organization.id, key: "core" } },
      select: { active: true },
    })
  )
  return entitlement?.active ?? false
}

export async function getBillingSettingsState(): Promise<BillingSettingsDTO> {
  noStore()
  const context = await requireTenantContext()
  assertCapability(context, "billing.manage")
  const state = await withTenantContext(context.organization.id, async (tx) => {
    const [customer, subscription, entitlement] = await Promise.all([
      tx.billingCustomer.findUnique({
        where: { organizationId: context.organization.id },
        select: { id: true },
      }),
      tx.billingSubscription.findUnique({
        where: { organizationId: context.organization.id },
        select: {
          status: true,
          stripePriceId: true,
          cancelAtPeriodEnd: true,
          currentPeriodEnd: true,
        },
      }),
      tx.billingEntitlement.findUnique({
        where: { organizationId_key: { organizationId: context.organization.id, key: "core" } },
        select: { active: true },
      }),
    ])
    return { customer, subscription, entitlement }
  })
  return {
    customerConfigured: Boolean(state.customer),
    entitlementActive: state.entitlement?.active ?? false,
    subscription: state.subscription
      ? {
          status: state.subscription.status,
          priceId: state.subscription.stripePriceId,
          cancelAtPeriodEnd: state.subscription.cancelAtPeriodEnd,
          currentPeriodEnd: state.subscription.currentPeriodEnd?.toISOString() ?? null,
        }
      : null,
  }
}

```