---
title: 'The Hipster Stack™ Technology Stack\template\features\billing\checkout-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\billing\checkout-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.billing.checkout-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\billing\checkout-feature.tsx'
source_file: 'checkout-feature.tsx'
source_sha256: '87f77ced4da47da3dd7fa5c9ec2a09875e4c378ff86fe684ffed0f49b27b62b8'
generated: true
---

# `checkout-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\billing\checkout-feature.tsx`
> SHA-256: `87f77ced4da47da3dd7fa5c9ec2a09875e4c378ff86fe684ffed0f49b27b62b8`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { Button } from "@/components/ui/button"
import { createCheckoutRedirectAction } from "@/lib/actions/billingActions"

export function CheckoutFeature() {
  return (
    <div className="grid gap-6">
      <PageHero
        eyebrow="Billing"
        title="Choose the plan configured for this product."
        description="Checkout creation is authorized and delegated to Stripe through a server workflow."
      />
      <form action={createCheckoutRedirectAction}>
        <Button>Continue to checkout</Button>
      </form>
    </div>
  )
}

```