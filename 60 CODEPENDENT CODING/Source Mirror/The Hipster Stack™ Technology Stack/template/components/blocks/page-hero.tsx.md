---
title: 'The Hipster Stack™ Technology Stack\template\components\blocks\page-hero.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\blocks\page-hero.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.blocks.page-hero.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\blocks\page-hero.tsx'
source_file: 'page-hero.tsx'
source_sha256: '316ea92b3968ada5f48c6cd93961bd6529288f0fdc46f6930d4af342d64a2959'
generated: true
---

# `page-hero.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\blocks\page-hero.tsx`
> SHA-256: `316ea92b3968ada5f48c6cd93961bd6529288f0fdc46f6930d4af342d64a2959`

```tsx
import { cn } from "@/lib/utils"

export interface PageHeroProps {
  eyebrow: string
  title: string
  description: string
  className?: string
}

export function PageHero({ eyebrow, title, description, className }: PageHeroProps) {
  return (
    <header className={cn("space-y-4 py-8", className)}>
      <p className="text-xs font-semibold tracking-widest text-primary uppercase">{eyebrow}</p>
      <h1 className="max-w-4xl text-4xl font-bold tracking-tight md:text-6xl">{title}</h1>
      <p className="max-w-3xl text-base text-muted-foreground md:text-lg">{description}</p>
    </header>
  )
}

```