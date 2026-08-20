---
title: 'The Maximal Template™ Domain Library\features\settings\billingFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\settings\billingFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.settings.billingfeature.tsx'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\features\settings\billingFeature.tsx'
source_file: 'billingFeature.tsx'
source_sha256: '04bf6486918d45a6240b6589634362841b162ca690481ded2396cca4b4b22f2f'
generated: true
---

# `billingFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\settings\billingFeature.tsx`
> SHA-256: `04bf6486918d45a6240b6589634362841b162ca690481ded2396cca4b4b22f2f`

```tsx
import { PricingSection } from "@/components/blocks/pricing-sections";

export function BillingFeature() {
  return (
    <PricingSection
      title="Workspace billing"
      subtitle="Billing authorization is enforced by the invoicing and provider boundaries."
      tiers={[
        {
          name: "Current workspace",
          price: "Managed",
          description:
            "Review subscription state and invoices for the active organization.",
          features: [
            "Organization scoped",
            "Billing role aware",
            "Audited changes",
          ],
          cta: "View invoices",
          ctaHref: "/invoices",
          featured: true,
        },
      ]}
    />
  );
}

```