---
title: 'The Hipster Stack™ Technology Stack\template\components\projects\project-card.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\projects\project-card.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.projects.project-card.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\projects\project-card.tsx'
source_file: 'project-card.tsx'
source_sha256: 'bbd7ad1ba662f7fe1906649ac77b1fbab10aef8a345f66514dc6ad7bfc1a80bb'
generated: true
---

# `project-card.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\projects\project-card.tsx`
> SHA-256: `bbd7ad1ba662f7fe1906649ac77b1fbab10aef8a345f66514dc6ad7bfc1a80bb`

```tsx
import { ArrowRight } from "lucide-react"

import { Badge } from "@/components/ui/badge"
import type { ProjectSummaryDTO } from "@/types/projectTypes"

type ProjectCardProps = {
  project: ProjectSummaryDTO
}

export function ProjectCard({ project }: ProjectCardProps) {
  return (
    <a
      href={`/projects/${project.id}`}
      className="block border bg-card p-5 no-underline hover:border-primary"
    >
      <div className="flex items-start justify-between gap-4">
        <div className="space-y-2">
          <Badge>{project.role}</Badge>
          <h3>{project.name}</h3>
          <p className="text-sm text-muted-foreground">
            {project.description ?? "No description has been set."}
          </p>
        </div>
        <ArrowRight className="mt-1 size-5 text-primary" />
      </div>
      <p className="mt-5 text-xs text-muted-foreground">Updated {project.updatedAt}</p>
    </a>
  )
}

```