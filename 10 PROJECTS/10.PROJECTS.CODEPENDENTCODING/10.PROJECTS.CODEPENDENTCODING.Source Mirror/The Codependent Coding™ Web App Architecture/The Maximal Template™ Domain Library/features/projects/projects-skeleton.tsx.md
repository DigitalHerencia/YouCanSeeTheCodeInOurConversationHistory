---
title: 'The Hipster Stack™ Technology Stack\template\features\projects\projects-skeleton.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\projects\projects-skeleton.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.projects.projects-skeleton.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\projects\projects-skeleton.tsx'
source_file: 'projects-skeleton.tsx'
source_sha256: '91942549d89baff3bc87b73d1c32434b17b8cd2668fdb442de3978140a15510c'
generated: true
---

# `projects-skeleton.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\projects\projects-skeleton.tsx`
> SHA-256: `91942549d89baff3bc87b73d1c32434b17b8cd2668fdb442de3978140a15510c`

```tsx
import { Skeleton } from "@/components/ui/skeleton"

export function ProjectsSkeleton() {
  return (
    <div className="grid gap-6">
      <Skeleton className="h-36" />
      <div className="grid gap-3 md:grid-cols-2">
        <Skeleton className="h-44" />
        <Skeleton className="h-44" />
      </div>
    </div>
  )
}

```