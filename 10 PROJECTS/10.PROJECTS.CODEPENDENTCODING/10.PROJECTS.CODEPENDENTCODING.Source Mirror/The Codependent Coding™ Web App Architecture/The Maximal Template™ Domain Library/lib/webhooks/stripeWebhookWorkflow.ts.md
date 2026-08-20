---
title: 'The Hipster Stack™ Technology Stack\template\lib\webhooks\stripeWebhookWorkflow.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\webhooks\stripeWebhookWorkflow.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.webhooks.stripewebhookworkflow.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\webhooks\stripeWebhookWorkflow.ts'
source_file: 'stripeWebhookWorkflow.ts'
source_sha256: 'fbb634ebea8bcf8609b2bd1d8646a634994bb28311bad5a05ea2a1dec477fca8'
generated: true
---

# `stripeWebhookWorkflow.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\webhooks\stripeWebhookWorkflow.ts`
> SHA-256: `fbb634ebea8bcf8609b2bd1d8646a634994bb28311bad5a05ea2a1dec477fca8`

```ts
import "server-only"

import { statusGrantsCoreEntitlement } from "@/lib/billing/entitlements"
import { getPrisma } from "@/lib/db/prisma"
import { applyStripeSubscriptionSnapshotTx } from "@/lib/db/transactions/billingTransactions"
import {
  claimProviderWebhookEvent,
  finalizeIgnoredWebhookTx,
  markWebhookFailed,
} from "@/lib/db/transactions/webhookTransactions"
import { withTenantContext } from "@/lib/db/withTenantContext"
import {
  stripeBillingProvider,
  type StripeBillingProvider,
} from "@/lib/integrations/stripe/billing"
import type { PrismaClient } from "@/prisma/generated/prisma/client"
import type { StripeWebhookTrigger } from "@/types/billingTypes"
import type { WebhookProcessingResult } from "@/types/webhookTypes"

const STALE_AFTER_MS = 5 * 60 * 1000

type StripeWebhookOptions = {
  prisma?: PrismaClient
  provider?: StripeBillingProvider
  now?: Date
}

export async function reconcileStripeWebhook(
  event: StripeWebhookTrigger,
  options: StripeWebhookOptions = {}
): Promise<WebhookProcessingResult> {
  const prisma = options.prisma ?? getPrisma()
  const provider = options.provider ?? stripeBillingProvider
  const now = options.now ?? new Date()
  const claim = await claimProviderWebhookEvent(prisma, event, now, STALE_AFTER_MS)

  if (claim.kind === "terminal") return { ok: true, status: "duplicate" }
  if (claim.kind === "processing") return { ok: true, status: "processing" }

  try {
    if (event.disposition === "ignore") {
      await prisma.$transaction((tx) => finalizeIgnoredWebhookTx(tx, claim, now))
      return { ok: true, status: "ignored" }
    }

    const snapshot = await provider.retrieveSubscription(event.subscriptionId)
    const binding = await prisma.providerCustomerBinding.findUnique({
      where: {
        provider_providerCustomerId: {
          provider: "stripe",
          providerCustomerId: snapshot.customerId,
        },
      },
      select: { organizationId: true },
    })
    if (!binding) throw new Error("Stripe customer is not bound to an organization.")

    const status = await withTenantContext(
      binding.organizationId,
      async (tx) => {
        const customer = await tx.billingCustomer.findUniqueOrThrow({
          where: { organizationId: binding.organizationId },
          select: { id: true, stripeCustomerId: true },
        })
        if (customer.stripeCustomerId !== snapshot.customerId) {
          throw new Error("Stripe customer binding mismatch.")
        }
        return applyStripeSubscriptionSnapshotTx(tx, {
          organizationId: binding.organizationId,
          billingCustomerId: customer.id,
          snapshot,
          entitlementActive: statusGrantsCoreEntitlement(snapshot.status),
          claim,
          now,
        })
      },
      { isolationLevel: "Serializable" },
      prisma
    )
    return { ok: true, status }
  } catch {
    await markWebhookFailed(prisma, claim)
    return { ok: false, status: "failed" }
  }
}

```