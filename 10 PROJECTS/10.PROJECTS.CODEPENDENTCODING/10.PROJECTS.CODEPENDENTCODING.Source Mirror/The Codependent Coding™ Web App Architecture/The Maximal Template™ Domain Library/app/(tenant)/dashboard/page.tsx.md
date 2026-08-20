---
title: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\dashboard\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\dashboard\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-tenant-.dashboard.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\dashboard\page.tsx'
source_file: 'page.tsx'
source_sha256: '5c5f00d627ed2f492a22d87b3bda0ccdbd5b53521b9940abe284a7f0456d8371'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(tenant)\dashboard\page.tsx`
> SHA-256: `5c5f00d627ed2f492a22d87b3bda0ccdbd5b53521b9940abe284a7f0456d8371`

```tsx
import { Suspense } from "react"

import { DashboardFeature } from "@/features/dashboard/dashboard-feature"
import { DashboardSkeleton } from "@/features/dashboard/dashboard-skeleton"

export default function DashboardPage() {
  return (
    <Suspense fallback={<DashboardSkeleton />}>
      <DashboardFeature />
    </Suspense>
  )
}

```