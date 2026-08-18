---
title: 'The Hipster Stack™ Technology Stack\template\components\blocks\hero-sectionFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\blocks\hero-sectionFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.blocks.hero-sectionfeature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\blocks\hero-sectionFeature.tsx'
source_file: 'hero-sectionFeature.tsx'
source_sha256: 'f8ec45536792e0b8831cd093e376a7190e5d3edfb5d008573e36bb0321f9c7b9'
generated: true
---

# `hero-sectionFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\blocks\hero-sectionFeature.tsx`
> SHA-256: `f8ec45536792e0b8831cd093e376a7190e5d3edfb5d008573e36bb0321f9c7b9`

```tsx
import {
  HeroCentered,
  HeroMinimal,
  HeroSplit,
  HeroWithStats,
  HeroWithVideo,
} from "@/components/blocks/hero-section"

export function HeroSectionFeature() {
  return (
    <main className="p-8 md:p-12">
      <section className="grid gap-8 md:gap-16">
        <HeroCentered
          title="Welcome to Our Site"
          titleHighlight="Experience"
          description="Discover the best products and services tailored just for you."
          primaryAction={{ label: "Get Started", href: "#" }}
          secondaryAction={{ label: "Learn More", href: "#" }}
        />
        <HeroSplit
          title="Innovative Solutions"
          description="Our cutting-edge technology is designed to meet your needs and exceed your expectations."
          imageSrc="/logo-dark.png"
          imageAlt="Innovative Solutions"
          primaryAction={{ label: "Explore Now", href: "#" }}
        />
        <HeroWithStats
          title="Trusted by Thousands"
          description="Join our community of satisfied customers who have benefited from our services."
          stats={[
            { label: "Users", value: "10K+" },
            { label: "Projects", value: "500+" },
            { label: "Awards", value: "50+" },
            { label: "Stat", value: "100+" },
          ]}
        />
        <HeroMinimal
          title="Simplicity at Its Best"
          description="Experience the power of simplicity with our user-friendly interface and seamless design."
          primaryAction={{ label: "Try It Now", href: "#" }}
        />
        <HeroWithVideo
          title="See It in Action"
          description="Watch our video to see how our product can transform your workflow and boost productivity."
          videoThumbnail="/logo-dark.png"
          primaryAction={{ label: "Watch Video", href: "#" }}
        />
      </section>
    </main>
  )
}

```