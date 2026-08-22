---
title: 'The Maximal Template™ Domain Library\app\(tenant)\projects\[projectId]\tasks\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(tenant)\projects\[projectId]\tasks\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-tenant-.projects.-projectid-.tasks.page.tsx'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\app\(tenant)\projects\[projectId]\tasks\page.tsx'
source_file: 'page.tsx'
source_sha256: 'ef0a95a653c106aa3bd57f8d6d723fc8705361d11faf6b098748559aa05a1003'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(tenant)\projects\[projectId]\tasks\page.tsx`
> SHA-256: `ef0a95a653c106aa3bd57f8d6d723fc8705361d11faf6b098748559aa05a1003`

```tsx
import { TasksFeature } from "@/features/projects/tasksFeature";

// URL ownership stops here; orchestration is delegated to the feature.
export default async function Page({
  params,
}: {
  params: Promise<{ projectId: string }>;
}) {
  const { projectId } = await params;
  return <TasksFeature projectId={projectId} />;
}

```