---
title: 'The Hipster Stack™ Technology Stack\template\features\projects\project-detail-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\projects\project-detail-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.projects.project-detail-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\projects\project-detail-feature.tsx'
source_file: 'project-detail-feature.tsx'
source_sha256: 'a6162eb12dda4a28d96a5512bbeb94cb50e74bed8e7c734e4a96e6d96e7d62fd'
generated: true
---

# `project-detail-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\projects\project-detail-feature.tsx`
> SHA-256: `a6162eb12dda4a28d96a5512bbeb94cb50e74bed8e7c734e4a96e6d96e7d62fd`

```tsx
import { Badge } from "@/components/ui/badge"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { PageHero } from "@/components/blocks/page-hero"
import { ProjectForm } from "@/components/projects/project-form"
import { updateProjectAction } from "@/lib/actions/projectActions"
import { getProjectDetailState } from "@/lib/fetchers/projectFetchers"

type ProjectDetailFeatureProps = {
  projectId: string
}

export async function ProjectDetailFeature({ projectId }: ProjectDetailFeatureProps) {
  const project = await getProjectDetailState(projectId)
  const updateAction = updateProjectAction.bind(null, project.id)

  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow={project.role}
        title={project.name}
        description={project.description ?? "This project has no description."}
      />
      <section className="grid gap-4 lg:grid-cols-[1.1fr_0.9fr]">
        <ProjectForm
          action={updateAction}
          submitLabel="Save project"
          defaultValues={{ name: project.name, description: project.description }}
        />
        <Card>
          <CardHeader>
            <CardTitle>Members</CardTitle>
          </CardHeader>
          <CardContent className="grid gap-3">
            {project.memberships.map((membership) => (
              <div key={membership.id} className="flex items-center justify-between border p-3">
                <div>
                  <p>{membership.displayName ?? membership.email ?? membership.userId}</p>
                  <p className="text-xs text-muted-foreground">{membership.userId}</p>
                </div>
                <Badge>{membership.role}</Badge>
              </div>
            ))}
          </CardContent>
        </Card>
      </section>
    </div>
  )
}

```