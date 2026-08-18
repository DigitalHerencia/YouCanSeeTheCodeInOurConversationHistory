---
title: 'The Hipster Stack™ Technology Stack\template\features\projects\projects-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\projects\projects-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.projects.projects-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\projects\projects-feature.tsx'
source_file: 'projects-feature.tsx'
source_sha256: 'd56f2105db958e9df9c5f0c97257b41f3500f79f5df5776407264006178e430a'
generated: true
---

# `projects-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\projects\projects-feature.tsx`
> SHA-256: `d56f2105db958e9df9c5f0c97257b41f3500f79f5df5776407264006178e430a`

```tsx
import Link from "next/link"

import { PageHero } from "@/components/blocks/page-hero"
import { ProjectCard } from "@/components/projects/project-card"
import { Button } from "@/components/ui/button"
import { getProjectListState } from "@/lib/fetchers/projectFetchers"

export async function ProjectsFeature() {
  const state = await getProjectListState()

  return (
    <div className="grid gap-8">
      <div className="flex flex-col justify-between gap-4 md:flex-row md:items-end">
        <PageHero
          eyebrow="Projects"
          title="Rows decide access."
          description="Every card is returned by a protected fetcher that filters through local membership rows."
          className="py-0"
        />
        <Button asChild>
          <Link href="/projects/new">New project</Link>
        </Button>
      </div>
      {state.empty ? (
        <div className="border bg-card p-6">
          <p className="text-muted-foreground">No projects are available to this user yet.</p>
        </div>
      ) : (
        <section className="grid gap-3 md:grid-cols-2">
          {state.projects.map((project) => (
            <ProjectCard key={project.id} project={project} />
          ))}
        </section>
      )}
    </div>
  )
}

```