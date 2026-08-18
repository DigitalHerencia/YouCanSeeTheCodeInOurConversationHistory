---
title: 'The Maximal Template™ Domain Library\app\(public)\pricing\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(public)\pricing\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-public-.pricing.page.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\(public)\pricing\page.tsx'
source_file: 'page.tsx'
source_sha256: '0ab1358081632e7a32e28b8de40cc472cfd3bc5f1cbc4ee025b88868b08b8f49'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(public)\pricing\page.tsx`
> SHA-256: `0ab1358081632e7a32e28b8de40cc472cfd3bc5f1cbc4ee025b88868b08b8f49`

```tsx
import { FAQTwoColumns } from "@/components/blocks/faq-sections";
import { PricingSection } from "@/components/blocks/pricing-sections";

const tiers = [
  {
    name: "Foundation",
    price: "$0",
    period: "project",
    description: "Evaluate the canonical architecture locally.",
    features: ["Shared application core", "One recipe", "Local development"],
    cta: "Explore dashboard",
    ctaHref: "/dashboard",
  },
  {
    name: "Product",
    price: "$49",
    period: "month",
    description: "Configure a focused SaaS application from the superset.",
    features: ["All recipes", "Tenant boundaries", "Provider selections"],
    cta: "Inspect CRM",
    ctaHref: "/crm/contacts",
    featured: true,
  },
  {
    name: "Team",
    price: "$149",
    period: "month",
    description: "Shared delivery for multiple products and collaborators.",
    features: ["Team workspaces", "Reusable definitions", "Priority support"],
    cta: "Contact us",
    ctaHref: "/contact",
  },
];

export default function Page() {
  return (
    <>
      <PricingSection
        title="Pricing without architecture tax"
        subtitle="Choose an operating tier; the application contracts stay intact."
        tiers={tiers}
      />
      <FAQTwoColumns
        title="Pricing questions"
        items={[
          {
            question: "Does each recipe become a separate application?",
            answer:
              "No. Recipes select coherent slices from one maximal implementation.",
          },
          {
            question: "Are provider charges included?",
            answer:
              "Provider usage is billed by each selected provider and remains explicit.",
          },
        ]}
      />
    </>
  );
}

```