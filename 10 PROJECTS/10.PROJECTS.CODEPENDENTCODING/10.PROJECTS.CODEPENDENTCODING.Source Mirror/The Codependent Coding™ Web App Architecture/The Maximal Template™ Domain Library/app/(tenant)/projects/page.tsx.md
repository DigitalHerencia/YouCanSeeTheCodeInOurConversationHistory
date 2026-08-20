---
title: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\projects\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\projects\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-tenant-.projects.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\projects\page.tsx'
source_file: 'page.tsx'
source_sha256: '2e2869462542bb982bdebb85be3cc6514f9eb983a5b32b27d9fb42ec17eefcb2'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(tenant)\projects\page.tsx`
> SHA-256: `2e2869462542bb982bdebb85be3cc6514f9eb983a5b32b27d9fb42ec17eefcb2`

```tsx
import { Suspense } from "react"

import { ProjectsFeature } from "@/features/projects/projects-feature"
import { ProjectsSkeleton } from "@/features/projects/projects-skeleton"

export default function ProjectsPage() {
  return (
    <Suspense fallback={<ProjectsSkeleton />}>
      <ProjectsFeature />
    </Suspense>
  )
}

```