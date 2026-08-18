---
title: 'The Hipster Stack™ Technology Stack\template\features\projects\new-project-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\projects\new-project-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.projects.new-project-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\projects\new-project-feature.tsx'
source_file: 'new-project-feature.tsx'
source_sha256: '1500fe16d5e9d35b013f88d4b13d073aa40fe94be4d3e256259ced356ae73550'
generated: true
---

# `new-project-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\projects\new-project-feature.tsx`
> SHA-256: `1500fe16d5e9d35b013f88d4b13d073aa40fe94be4d3e256259ced356ae73550`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { ProjectForm } from "@/components/projects/project-form"
import { createProjectAction } from "@/lib/actions/projectActions"

export function NewProjectFeature() {
  return (
    <div className="grid max-w-3xl gap-8">
      <PageHero
        eyebrow="Create project"
        title="Start with ownership."
        description="The transaction creates a project inside your active organization and records an audit event."
      />
      <ProjectForm action={createProjectAction} submitLabel="Create project" />
    </div>
  )
}

```