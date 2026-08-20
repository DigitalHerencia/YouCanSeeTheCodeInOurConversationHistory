---
title: 'The Hipster Stack™ Technology Stack\template\components\brand\wordmark.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\brand\wordmark.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.brand.wordmark.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\brand\wordmark.tsx'
source_file: 'wordmark.tsx'
source_sha256: 'c8fc59eda5d9c31216e6c78d6649f4f906f093cb1877263aa1dc5da40b325da3'
generated: true
---

# `wordmark.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\brand\wordmark.tsx`
> SHA-256: `c8fc59eda5d9c31216e6c78d6649f4f906f093cb1877263aa1dc5da40b325da3`

```tsx
import Link from "next/link"

import { site } from "@/content/site"

export function Wordmark() {
  const mark = site.name.trim().charAt(0).toUpperCase()

  return (
    <Link href="/" className="flex items-center gap-3 no-underline">
      <span className="grid size-8 place-items-center border border-primary bg-primary text-sm font-black text-primary-foreground">
        {mark}
      </span>
      <span className="font-display text-2xl leading-none uppercase">{site.name}</span>
    </Link>
  )
}

```