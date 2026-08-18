---
title: 'The Hipster Stack™ Technology Stack\template\tests\contract\stripe-billing-surface.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\contract\stripe-billing-surface.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.contract.stripe-billing-surface.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\contract\stripe-billing-surface.test.ts'
source_file: 'stripe-billing-surface.test.ts'
source_sha256: 'da85a7904f8d3904699165e80b8ad8e4191c7b9e21f661ff42a5f543282e9c8d'
generated: true
---

# `stripe-billing-surface.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\contract\stripe-billing-surface.test.ts`
> SHA-256: `da85a7904f8d3904699165e80b8ad8e4191c7b9e21f661ff42a5f543282e9c8d`

```ts
import { readFileSync } from "node:fs"
import { join } from "node:path"
import { describe, expect, it } from "vitest"

const read = (path: string) => readFileSync(join(process.cwd(), path), "utf8")

describe("Stripe subscription billing boundaries", () => {
  it("keeps billing tenant-owned and entitlement local", () => {
    const schema = read("prisma/schema.prisma")
    expect(schema).toMatch(/model BillingCustomer[\s\S]*organizationId\s+String\s+@unique/)
    expect(schema).toMatch(/model BillingSubscription[\s\S]*organizationId\s+String\s+@unique/)
    expect(schema).toContain("model BillingEntitlement")
    const userModel = schema.match(/model User \{[\s\S]*?\n\}/)?.[0]
    expect(userModel).toBeDefined()
    expect(userModel).not.toContain("stripeCustomerId")
  })

  it("keeps customer, price, and return URLs out of action input", () => {
    const actions = read("lib/actions/billingActions.ts")
    const workflows = read("lib/billing/workflows/billingWorkflows.ts")
    expect(actions).toContain("createCheckoutSessionAction()")
    expect(actions).toContain("createBillingPortalSessionAction()")
    expect(actions).not.toMatch(/customerId|priceId|returnUrl/)
    expect(workflows).toContain('assertCapability(context, "billing.manage")')
    expect(workflows).toContain('getRequiredEnv("STRIPE_RECURRING_PRICE_ID")')
  })

  it("uses a verified raw-body webhook trigger and never redirect authority", () => {
    const route = read("app/api/stripe/webhooks/route.ts")
    const workflow = read("lib/webhooks/stripeWebhookWorkflow.ts")
    expect(route).toContain("await request.text()")
    expect(route).toContain("stripe-signature")
    expect(workflow).toContain("retrieveSubscription")
    expect(workflow).not.toMatch(/success_url|checkout.*complete/i)
  })
})

```