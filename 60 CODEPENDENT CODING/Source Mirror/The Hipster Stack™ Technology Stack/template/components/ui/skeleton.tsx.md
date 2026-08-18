---
title: 'The Hipster Stack™ Technology Stack\template\components\ui\skeleton.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\ui\skeleton.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.ui.skeleton.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\ui\skeleton.tsx'
source_file: 'skeleton.tsx'
source_sha256: '3ead446ae4bed9e98480a865fcc35632572bef57f33bbb98ac6f36d00c428009'
generated: true
---

# `skeleton.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\ui\skeleton.tsx`
> SHA-256: `3ead446ae4bed9e98480a865fcc35632572bef57f33bbb98ac6f36d00c428009`

```tsx
import { cn } from "@/lib/utils"

export function Skeleton({ className, ...props }: React.HTMLAttributes<HTMLDivElement>) {
  return <div className={cn("animate-pulse bg-muted", className)} {...props} />
}

```