---
title: 'The Maximal Template™ Domain Library\app\(tenant)\projects\[projectId]\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(tenant)\projects\[projectId]\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-tenant-.projects.-projectid-.page.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\(tenant)\projects\[projectId]\page.tsx'
source_file: 'page.tsx'
source_sha256: '14fc177d0900bf0bdbef86a3e64bae648c493405331491dec4d0cc4084b6e590'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(tenant)\projects\[projectId]\page.tsx`
> SHA-256: `14fc177d0900bf0bdbef86a3e64bae648c493405331491dec4d0cc4084b6e590`

```tsx
import { ProjectFeature } from "@/features/projects/projectFeature";

// URL ownership stops here; orchestration is delegated to the feature.
export default async function Page({
  params,
}: {
  params: Promise<{ projectId: string }>;
}) {
  const { projectId } = await params;
  return <ProjectFeature projectId={projectId} />;
}

```