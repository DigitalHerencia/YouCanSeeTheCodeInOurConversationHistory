---
title: 'The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\billing.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\billing.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.integrations.stripe.billing.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\billing.ts'
source_file: 'billing.ts'
source_sha256: '710c48748395f7533d6e7f8eb987d619e410c57a16e267070c3b70e9c043bfbf'
generated: true
---

# `billing.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\billing.ts`
> SHA-256: `710c48748395f7533d6e7f8eb987d619e410c57a16e267070c3b70e9c043bfbf`

```ts
import "server-only"

import type Stripe from "stripe"

import { getStripe } from "@/lib/integrations/stripe/client"
import { mapStripeSubscriptionStatus } from "@/lib/integrations/stripe/subscriptionStatus"
import { stripeSubscriptionSnapshotSchema } from "@/schemas/stripeWebhookSchemas"
import type { StripeSubscriptionSnapshot } from "@/types/billingTypes"

export type StripeBillingProvider = {
  createCustomer(input: {
    organizationId: string
    email: string | null
    displayName: string
    idempotencyKey: string
  }): Promise<{ customerId: string }>
  createCheckoutSession(input: {
    organizationId: string
    customerId: string
    priceId: string
    successUrl: string
    cancelUrl: string
    idempotencyKey: string
  }): Promise<{ url: string }>
  createPortalSession(input: {
    customerId: string
    returnUrl: string
    idempotencyKey: string
  }): Promise<{ url: string }>
  retrieveSubscription(subscriptionId: string): Promise<StripeSubscriptionSnapshot>
  listSubscriptions(customerId: string): Promise<readonly StripeSubscriptionSnapshot[]>
}

function requiredUrl(value: string | null): string {
  if (!value) throw new Error("Stripe did not return a hosted session URL.")
  return value
}

export const stripeBillingProvider: StripeBillingProvider = {
  async createCustomer(input) {
    const customer = await getStripe().customers.create(
      {
        ...(input.email ? { email: input.email } : {}),
        name: input.displayName,
        metadata: { organization_id: input.organizationId },
      },
      { idempotencyKey: input.idempotencyKey }
    )
    return { customerId: customer.id }
  },

  async createCheckoutSession(input) {
    const session = await getStripe().checkout.sessions.create(
      {
        mode: "subscription",
        customer: input.customerId,
        client_reference_id: input.organizationId,
        line_items: [{ price: input.priceId, quantity: 1 }],
        success_url: input.successUrl,
        cancel_url: input.cancelUrl,
        subscription_data: { metadata: { organization_id: input.organizationId } },
      },
      { idempotencyKey: input.idempotencyKey }
    )
    return { url: requiredUrl(session.url) }
  },

  async createPortalSession(input) {
    const session = await getStripe().billingPortal.sessions.create(
      { customer: input.customerId, return_url: input.returnUrl },
      { idempotencyKey: input.idempotencyKey }
    )
    return { url: session.url }
  },

  async retrieveSubscription(subscriptionId) {
    const subscription = await getStripe().subscriptions.retrieve(subscriptionId)
    return mapStripeSubscriptionSnapshot(subscription)
  },

  async listSubscriptions(customerId) {
    const subscriptions = await getStripe().subscriptions.list({
      customer: customerId,
      status: "all",
      limit: 10,
    })
    return subscriptions.data.map(mapStripeSubscriptionSnapshot)
  },
}

export function mapStripeSubscriptionSnapshot(value: unknown): StripeSubscriptionSnapshot {
  const parsed = stripeSubscriptionSnapshotSchema.parse(value)
  const item = parsed.items.data[0]
  if (!item) throw new Error("A single recurring Stripe item is required.")

  return {
    subscriptionId: parsed.id,
    customerId: parsed.customer,
    status: mapStripeSubscriptionStatus(parsed.status),
    cancelAtPeriodEnd: parsed.cancel_at_period_end,
    providerCreatedAt: new Date(parsed.created * 1000),
    item: {
      subscriptionItemId: item.id,
      priceId: item.price.id,
      quantity: item.quantity ?? 1,
      currentPeriodEnd: new Date(item.current_period_end * 1000),
    },
  }
}

export function constructStripeWebhookEvent(
  payload: string,
  signature: string,
  secret: string
): Stripe.Event {
  return getStripe().webhooks.constructEvent(payload, signature, secret)
}

```