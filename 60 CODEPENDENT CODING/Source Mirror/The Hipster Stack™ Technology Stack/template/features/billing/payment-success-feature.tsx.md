---
title: 'The Hipster Stack™ Technology Stack\template\features\billing\payment-success-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\billing\payment-success-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.billing.payment-success-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\billing\payment-success-feature.tsx'
source_file: 'payment-success-feature.tsx'
source_sha256: '7693e62fb93ccd77e98020230d1697ce851ee4b3914a25b962af3c51aecfeb87'
generated: true
---

# `payment-success-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\billing\payment-success-feature.tsx`
> SHA-256: `7693e62fb93ccd77e98020230d1697ce851ee4b3914a25b962af3c51aecfeb87`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { Alert } from "@/components/ui/alert"
import { hasCoreEntitlement } from "@/lib/fetchers/billingFetchers"

export async function PaymentSuccessFeature() {
  const active = await hasCoreEntitlement()
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Billing"
        title={active ? "Subscription active" : "Payment is being reconciled"}
        description="The synchronized application billing state is authoritative; this page never treats a query parameter as payment proof."
      />
      <Alert>
        <p className="font-semibold text-foreground">
          {active ? "Entitlement available" : "Confirmation pending"}
        </p>
        <p>
          {active
            ? "Your organization has the core entitlement."
            : "Stripe webhooks will update this surface when provider truth is reconciled."}
        </p>
      </Alert>
    </div>
  )
}

```