---
title: 'The Hipster Stack™ Technology Stack\template\features\billing\billing-settings-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\billing\billing-settings-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.billing.billing-settings-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\billing\billing-settings-feature.tsx'
source_file: 'billing-settings-feature.tsx'
source_sha256: 'b13eb6a93588dfd606c6faad7244071627a659b0eb8d9ee12f5b71fe70b30b2c'
generated: true
---

# `billing-settings-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\billing\billing-settings-feature.tsx`
> SHA-256: `b13eb6a93588dfd606c6faad7244071627a659b0eb8d9ee12f5b71fe70b30b2c`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { Button } from "@/components/ui/button"
import {
  createBillingPortalRedirectAction,
  createCheckoutRedirectAction,
} from "@/lib/actions/billingActions"
import { getBillingSettingsState } from "@/lib/fetchers/billingFetchers"

export async function BillingSettingsFeature() {
  const billing = await getBillingSettingsState()
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Settings"
        title="Billing"
        description="This surface renders synchronized application billing state and delegates changes to Stripe workflows."
      />
      <dl className="grid max-w-2xl gap-3 border bg-card p-6 text-sm">
        <div className="flex justify-between gap-4">
          <dt className="text-muted-foreground">Subscription</dt>
          <dd>{billing.subscription?.status ?? "Not started"}</dd>
        </div>
        <div className="flex justify-between gap-4">
          <dt className="text-muted-foreground">Core entitlement</dt>
          <dd>{billing.entitlementActive ? "Active" : "Inactive"}</dd>
        </div>
        {billing.subscription?.currentPeriodEnd ? (
          <div className="flex justify-between gap-4">
            <dt className="text-muted-foreground">Current period ends</dt>
            <dd>{new Date(billing.subscription.currentPeriodEnd).toLocaleDateString()}</dd>
          </div>
        ) : null}
      </dl>
      <div className="flex flex-wrap gap-3">
        {!billing.subscription ? (
          <form action={createCheckoutRedirectAction}>
            <Button>Start checkout</Button>
          </form>
        ) : null}
        {billing.customerConfigured ? (
          <form action={createBillingPortalRedirectAction}>
            <Button variant="outline">Open billing portal</Button>
          </form>
        ) : null}
      </div>
    </div>
  )
}

```