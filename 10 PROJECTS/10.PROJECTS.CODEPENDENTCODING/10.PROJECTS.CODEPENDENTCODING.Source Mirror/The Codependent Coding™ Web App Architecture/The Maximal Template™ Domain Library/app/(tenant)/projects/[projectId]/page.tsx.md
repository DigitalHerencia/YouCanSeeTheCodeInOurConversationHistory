---
title: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\projects\[projectId]\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\projects\[projectId]\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-tenant-.projects.-projectid-.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\projects\[projectId]\page.tsx'
source_file: 'page.tsx'
source_sha256: 'c77152478d5f817e2551911b2f2b2ae4e0899adfd72aa292f5c8104095b5201c'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(tenant)\projects\[projectId]\page.tsx`
> SHA-256: `c77152478d5f817e2551911b2f2b2ae4e0899adfd72aa292f5c8104095b5201c`

```tsx
import { Suspense } from "react"

import { ProjectDetailFeature } from "@/features/projects/project-detail-feature"
import { ProjectsSkeleton } from "@/features/projects/projects-skeleton"

type ProjectDetailPageProps = {
  params: Promise<{
    projectId: string
  }>
}

export default async function ProjectDetailPage({ params }: ProjectDetailPageProps) {
  const { projectId } = await params

  return (
    <Suspense fallback={<ProjectsSkeleton />}>
      <ProjectDetailFeature projectId={projectId} />
    </Suspense>
  )
}

```