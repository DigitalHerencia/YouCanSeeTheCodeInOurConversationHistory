---
title: 'The Maximal Template™ Domain Library\features\projects\projectFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\projects\projectFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.projects.projectfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\projects\projectFeature.tsx'
source_file: 'projectFeature.tsx'
source_sha256: 'f86aeff0686cff5106b800f73d542ab79fdd836ec4f9cc2c4ab4358dcc3f1921'
generated: true
---

# `projectFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\projects\projectFeature.tsx`
> SHA-256: `f86aeff0686cff5106b800f73d542ab79fdd836ec4f9cc2c4ab4358dcc3f1921`

```tsx
import {
  EmptyStateBlock,
  PageHeaderBlock,
  RecordDetailBlock,
} from "@/components/blocks/application-sections";
import { getProject } from "@/lib/fetchers/projectsFetchers";

export async function ProjectFeature({ projectId }: { projectId: string }) {
  const project = await getProject(projectId);
  if (!project)
    return (
      <EmptyStateBlock
        title="Project not found"
        description="No project is visible with this identifier."
      />
    );
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="Project"
        title={project.name}
        action={{ label: "Open tasks", href: `/projects/${project.id}/tasks` }}
      />
      <RecordDetailBlock
        title="Project health"
        status={project.status}
        items={[
          { label: "Open tasks", value: String(project.openTaskCount) },
          { label: "Total tasks", value: String(project.taskCount) },
          {
            label: "Starts",
            value: project.startsAt
              ? new Date(project.startsAt).toLocaleDateString()
              : "—",
          },
          {
            label: "Due",
            value: project.dueAt
              ? new Date(project.dueAt).toLocaleDateString()
              : "—",
          },
          { label: "Description", value: project.description ?? "—" },
        ]}
      />
    </div>
  );
}

```