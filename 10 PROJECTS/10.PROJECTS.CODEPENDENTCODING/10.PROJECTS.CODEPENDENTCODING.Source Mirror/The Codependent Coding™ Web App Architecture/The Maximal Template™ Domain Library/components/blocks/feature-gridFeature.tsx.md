---
title: 'The Hipster Stack™ Technology Stack\template\components\blocks\feature-gridFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\blocks\feature-gridFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.blocks.feature-gridfeature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\blocks\feature-gridFeature.tsx'
source_file: 'feature-gridFeature.tsx'
source_sha256: '75a192a00425d6f5000d5240dfcacb09ad0b0ef89fb0f6eaac4eed54d94ffc4d'
generated: true
---

# `feature-gridFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\blocks\feature-gridFeature.tsx`
> SHA-256: `75a192a00425d6f5000d5240dfcacb09ad0b0ef89fb0f6eaac4eed54d94ffc4d`

```tsx
import { BadgeCheck, Clock, CreditCard, Shield } from "lucide-react"

import {
  FeatureBentoGrid,
  FeatureGridAlternating,
  FeatureGridWithIcons,
  FeatureGridWithImages,
} from "@/components/blocks/feature-grid"

const iconFeatures = [
  {
    icon: <BadgeCheck className="h-7 w-7" />,
    title: "Confirm",
    description: "Both parties confirm presence in time.",
  },
  {
    icon: <CreditCard className="h-7 w-7" />,
    title: "Capture",
    description: "Funds release only when payment state allows capture.",
  },
  {
    icon: <Clock className="h-7 w-7" />,
    title: "Window",
    description: "Deadlines are explicit and deterministic.",
  },
  {
    icon: <Shield className="h-7 w-7" />,
    title: "Boundary",
    description: "No disputes, evidence, appeals, or manual awards.",
  },
]

const imageFeatures = [
  { image: "/logo-dark.png", title: "Create", description: "Set amount and confirmation window." },
  {
    image: "/logo-dark.png",
    title: "Accept",
    description: "Payee accepts after payout readiness.",
  },
  { image: "/logo-dark.png", title: "Resolve", description: "Outcome follows system state." },
]

const alternatingFeatures = [
  {
    image: "/logo-dark.png",
    title: "Create",
    description: "Set amount and confirmation window.",
    icon: <BadgeCheck className="h-7 w-7" />,
  },
  {
    image: "/logo-dark.png",
    title: "Accept",
    description: "Payee accepts after payout readiness.",
    icon: <CreditCard className="h-7 w-7" />,
  },
  {
    image: "/logo-dark.png",
    title: "Resolve",
    description: "Outcome follows system state.",
    icon: <Clock className="h-7 w-7" />,
  },
]

const bentoFeatures = [
  ...iconFeatures,
  {
    icon: <Shield className="h-7 w-7" />,
    title: "No Arbitration",
    description: "No disputes, evidence, appeals, or manual fund awards.",
    span: "wide" as const,
  },
]

export function FeatureGridFeature() {
  return (
    <main className="p-8 md:p-12">
      <section className="grid gap-8 md:gap-16">
        <FeatureGridWithIcons
          title="Operational Features"
          subtitle="Vouch"
          description="Built around deterministic payment coordination."
          features={iconFeatures}
          columns={4}
        />
        <FeatureGridWithImages
          title="Agreement Flow"
          subtitle="How it works"
          features={imageFeatures}
        />
        <FeatureGridAlternating features={alternatingFeatures} />
        <FeatureBentoGrid
          title="Core Boundaries"
          subtitle="Narrow Product"
          features={bentoFeatures}
        />
      </section>
    </main>
  )
}

```