---
title: 'The Maximal Template™ Domain Library\features\projects\projectsFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\projects\projectsFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.projects.projectsfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\projects\projectsFeature.tsx'
source_file: 'projectsFeature.tsx'
source_sha256: '02a6e6c8806826db1983561ef5f16ce485d6c4614a77a400057a4135069d4911'
generated: true
---

# `projectsFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\projects\projectsFeature.tsx`
> SHA-256: `02a6e6c8806826db1983561ef5f16ce485d6c4614a77a400057a4135069d4911`

```tsx
import {
  DataTableBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getProjects } from "@/lib/fetchers/projectsFetchers";

export async function ProjectsFeature() {
  const projects = await getProjects();
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="Projects"
        title="Project portfolio"
        action={{ label: "View my tasks", href: "/my-tasks" }}
      />
      <DataTableBlock
        columns={[
          { key: "name", label: "Project" },
          { key: "status", label: "Status" },
          { key: "open", label: "Open tasks" },
          { key: "due", label: "Due" },
        ]}
        rows={projects.map((project) => ({
          id: project.id,
          href: `/projects/${project.id}`,
          cells: {
            name: project.name,
            status: project.status,
            open: String(project.openTaskCount),
            due: project.dueAt
              ? new Date(project.dueAt).toLocaleDateString()
              : null,
          },
        }))}
      />
    </div>
  );
}

```