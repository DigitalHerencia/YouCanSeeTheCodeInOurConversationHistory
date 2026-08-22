---
title: 'The Maximal Template™ Domain Library\features\projects\timelineFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\projects\timelineFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.projects.timelinefeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\projects\timelineFeature.tsx'
source_file: 'timelineFeature.tsx'
source_sha256: '4d531bb920b540ab175c8e0c680db88e861c0fd311bd54fc0a4d32f0ab4dc05b'
generated: true
---

# `timelineFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\projects\timelineFeature.tsx`
> SHA-256: `4d531bb920b540ab175c8e0c680db88e861c0fd311bd54fc0a4d32f0ab4dc05b`

```tsx
import {
  PageHeaderBlock,
  TimelineBlock,
} from "@/components/blocks/application-sections";
import { getProjectTasks } from "@/lib/fetchers/projectsFetchers";

export async function TimelineFeature({ projectId }: { projectId: string }) {
  const tasks = await getProjectTasks(projectId);
  const ordered = [...tasks].sort((a, b) =>
    (a.dueAt ?? "9999").localeCompare(b.dueAt ?? "9999"),
  );
  return (
    <div className="space-y-6">
      <PageHeaderBlock eyebrow="Projects" title="Delivery timeline" />
      <TimelineBlock
        items={ordered.map((task) => ({
          id: task.id,
          title: task.title,
          detail: `${task.status} · ${task.priority}`,
          timestamp: task.dueAt
            ? new Date(task.dueAt).toLocaleDateString()
            : "No due date",
        }))}
      />
    </div>
  );
}

```