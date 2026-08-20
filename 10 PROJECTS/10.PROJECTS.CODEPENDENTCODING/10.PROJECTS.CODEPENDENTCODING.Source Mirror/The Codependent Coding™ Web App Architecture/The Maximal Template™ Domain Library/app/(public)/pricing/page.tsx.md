---
title: 'The Hipster Stack™ Technology Stack\template\app\(public)\pricing\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(public)\pricing\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-public-.pricing.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(public)\pricing\page.tsx'
source_file: 'page.tsx'
source_sha256: '3285eb21a4179f5d5807c0ea140251b0581be780181b92c1311661b789355f3f'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(public)\pricing\page.tsx`
> SHA-256: `3285eb21a4179f5d5807c0ea140251b0581be780181b92c1311661b789355f3f`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { ProcessPanel } from "@/components/blocks/process-panel"

export default function PricingPage() {
  return (
    <div className="grid gap-10">
      <PageHero
        eyebrow="Template economics"
        title="Bring your pricing model."
        description="The starter includes a tenant-owned Stripe subscription foundation for one server-configured recurring plan."
      />
      <ProcessPanel
        title="Billing boundaries"
        steps={[
          {
            title: "Hosted billing",
            description: "Checkout and subscription management stay on Stripe-hosted surfaces.",
          },
          {
            title: "Provider isolated",
            description:
              "Stripe SDK calls stay behind provider adapters, never in pages or components.",
          },
          {
            title: "State first",
            description:
              "Verified webhooks normalize local subscription and entitlement state; redirects grant nothing.",
          },
        ]}
      />
    </div>
  )
}

```