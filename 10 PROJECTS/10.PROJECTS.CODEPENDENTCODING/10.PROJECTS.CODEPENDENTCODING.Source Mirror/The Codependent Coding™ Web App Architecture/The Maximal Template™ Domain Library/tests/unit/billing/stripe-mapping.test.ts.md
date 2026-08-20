---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\billing\stripe-mapping.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\billing\stripe-mapping.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.billing.stripe-mapping.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\billing\stripe-mapping.test.ts'
source_file: 'stripe-mapping.test.ts'
source_sha256: 'cac401ba2f09084a590b9ffa3efc18972b3c9c9b063db64ab9faa392970a2c1d'
generated: true
---

# `stripe-mapping.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\billing\stripe-mapping.test.ts`
> SHA-256: `cac401ba2f09084a590b9ffa3efc18972b3c9c9b063db64ab9faa392970a2c1d`

```ts
import { describe, expect, it } from "vitest"

import { mapStripeSubscriptionSnapshot } from "@/lib/integrations/stripe/billing"
import { mapVerifiedStripeWebhook } from "@/lib/integrations/stripe/webhooks"

describe("Stripe runtime mapping", () => {
  it("maps one recurring subscription item and every bounded field", () => {
    expect(
      mapStripeSubscriptionSnapshot({
        id: "sub_1",
        customer: "cus_1",
        status: "active",
        created: 1_754_262_000,
        cancel_at_period_end: false,
        metadata: { organization_id: "not-authority" },
        items: {
          data: [
            {
              id: "si_1",
              quantity: 1,
              current_period_end: 1_756_940_400,
              price: { id: "price_core" },
            },
          ],
        },
      })
    ).toEqual({
      subscriptionId: "sub_1",
      customerId: "cus_1",
      status: "active",
      cancelAtPeriodEnd: false,
      providerCreatedAt: new Date("2025-08-03T23:00:00.000Z"),
      item: {
        subscriptionItemId: "si_1",
        priceId: "price_core",
        quantity: 1,
        currentPeriodEnd: new Date("2025-09-03T23:00:00.000Z"),
      },
    })
  })

  it("uses the verified event only as a bounded subscription trigger", () => {
    expect(
      mapVerifiedStripeWebhook({
        id: "evt_1",
        type: "customer.subscription.updated",
        data: { object: { id: "sub_1", metadata: { organization_id: "attacker" } } },
      })
    ).toEqual({
      ok: true,
      event: {
        provider: "stripe",
        providerEventId: "evt_1",
        eventType: "customer.subscription.updated",
        disposition: "process",
        subscriptionId: "sub_1",
        safeMetadata: {
          resource_type: "subscription",
          stripe_subscription_id: "sub_1",
        },
      },
    })
  })

  it("rejects a malformed supported subscription event", () => {
    expect(
      mapVerifiedStripeWebhook({
        id: "evt_bad",
        type: "customer.subscription.updated",
        data: { object: { id: "" } },
      })
    ).toEqual({ ok: false, reason: "malformed_payload" })
  })
})

```