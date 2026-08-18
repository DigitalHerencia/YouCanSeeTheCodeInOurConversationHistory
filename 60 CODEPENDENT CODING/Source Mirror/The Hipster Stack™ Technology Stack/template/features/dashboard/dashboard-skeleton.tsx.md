---
title: 'The Hipster Stack™ Technology Stack\template\features\dashboard\dashboard-skeleton.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\dashboard\dashboard-skeleton.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.dashboard.dashboard-skeleton.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\dashboard\dashboard-skeleton.tsx'
source_file: 'dashboard-skeleton.tsx'
source_sha256: 'b02465be5b6e23d4ca9b7ec97b578b4beed356e505694160408c87f5260d4a46'
generated: true
---

# `dashboard-skeleton.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\dashboard\dashboard-skeleton.tsx`
> SHA-256: `b02465be5b6e23d4ca9b7ec97b578b4beed356e505694160408c87f5260d4a46`

```tsx
import { Skeleton } from "@/components/ui/skeleton"

export function DashboardSkeleton() {
  return (
    <div className="grid gap-6">
      <Skeleton className="h-40" />
      <div className="grid gap-3 md:grid-cols-3">
        <Skeleton className="h-28" />
        <Skeleton className="h-28" />
        <Skeleton className="h-28" />
      </div>
      <Skeleton className="h-64" />
    </div>
  )
}

```