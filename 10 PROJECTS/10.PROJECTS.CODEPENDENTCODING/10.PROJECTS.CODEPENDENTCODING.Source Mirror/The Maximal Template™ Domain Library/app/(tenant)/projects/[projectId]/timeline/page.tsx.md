---
title: 'The Maximal Template™ Domain Library\app\(tenant)\projects\[projectId]\timeline\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(tenant)\projects\[projectId]\timeline\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-tenant-.projects.-projectid-.timeline.page.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\(tenant)\projects\[projectId]\timeline\page.tsx'
source_file: 'page.tsx'
source_sha256: 'a325f54e665d68ccdd758c040bbd86eafcf0184dfd09ccfa9ba5c7d99e09f261'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(tenant)\projects\[projectId]\timeline\page.tsx`
> SHA-256: `a325f54e665d68ccdd758c040bbd86eafcf0184dfd09ccfa9ba5c7d99e09f261`

```tsx
import { TimelineFeature } from "@/features/projects/timelineFeature";

// URL ownership stops here; orchestration is delegated to the feature.
export default async function Page({
  params,
}: {
  params: Promise<{ projectId: string }>;
}) {
  const { projectId } = await params;
  return <TimelineFeature projectId={projectId} />;
}

```