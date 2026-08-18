---
title: 'The Hipster Stack™ Technology Stack\template\components\blocks\cta-sectionFeatureClient.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\blocks\cta-sectionFeatureClient.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.blocks.cta-sectionfeatureclient.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\blocks\cta-sectionFeatureClient.tsx'
source_file: 'cta-sectionFeatureClient.tsx'
source_sha256: 'd00ea86c625b4f97382171be1d356dcbb3086786342f317219181f9908a66a0b'
generated: true
---

# `cta-sectionFeatureClient.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\blocks\cta-sectionFeatureClient.tsx`
> SHA-256: `d00ea86c625b4f97382171be1d356dcbb3086786342f317219181f9908a66a0b`

```tsx
import {
  CTABanner,
  CTANewsletter,
  CTASimple,
  CTASplit,
  CTAWithBackground,
} from "@/components/blocks/cta-section"

export function CtaSectionFeatureClient() {
  return (
    <main className="p-8 md:p-12">
      <section className="grid gap-8 md:gap-16">
        <CTASimple
          title="Coordinate the Commitment"
          description="Create a Vouch, accept the terms, and confirm presence in time."
          primaryAction={{ label: "Create Vouch", href: "#" }}
          secondaryAction={{ label: "Learn More", href: "#" }}
        />
        <CTAWithBackground
          backgroundColor="primary"
          title="Both Confirm, Funds Release"
          description="Payment outcome follows authenticated state."
          primaryAction={{ label: "Get Started", href: "#" }}
        />
        <CTANewsletter title="Stay Updated" description="Get product updates as Vouch evolves." />
        <CTASplit
          title="Provider-Backed Settlement"
          description="Manual-capture payment coordination with clear release rules."
          imageSrc="/logo-light.png"
          imageAlt="Payment coordination"
          primaryAction={{ label: "Explore", href: "#" }}
          secondaryAction={{ label: "Docs", href: "#" }}
        />
        <CTABanner
          text="New payment coordination blocks are available."
          action={{ label: "View Blocks", href: "#" }}
          dismissible
        />
      </section>
    </main>
  )
}

```