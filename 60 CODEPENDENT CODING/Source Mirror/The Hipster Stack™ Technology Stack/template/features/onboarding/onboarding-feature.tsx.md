---
title: 'The Hipster Stack™ Technology Stack\template\features\onboarding\onboarding-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\onboarding\onboarding-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.onboarding.onboarding-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\onboarding\onboarding-feature.tsx'
source_file: 'onboarding-feature.tsx'
source_sha256: 'c58969954b3f3a57a89323f94887d4e465b942cbf8ab7ae00b50cfb30f57f9d8'
generated: true
---

# `onboarding-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\onboarding\onboarding-feature.tsx`
> SHA-256: `c58969954b3f3a57a89323f94887d4e465b942cbf8ab7ae00b50cfb30f57f9d8`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { OnboardingForm } from "@/features/onboarding/onboarding-form"

export function OnboardingFeature() {
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Onboarding"
        title="Create your workspace."
        description="Your first organization establishes the local tenant and authorization boundary."
      />
      <OnboardingForm />
    </div>
  )
}

```