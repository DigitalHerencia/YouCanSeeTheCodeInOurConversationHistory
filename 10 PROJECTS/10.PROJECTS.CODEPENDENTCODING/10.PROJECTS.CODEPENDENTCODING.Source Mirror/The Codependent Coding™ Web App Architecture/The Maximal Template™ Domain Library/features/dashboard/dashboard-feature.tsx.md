---
title: 'The Hipster Stack™ Technology Stack\template\features\dashboard\dashboard-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\dashboard\dashboard-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.dashboard.dashboard-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\dashboard\dashboard-feature.tsx'
source_file: 'dashboard-feature.tsx'
source_sha256: 'c74680b1a216c8aa9d4e20042a1c147a6193c4df1397cd5b438ea785aed503c9'
generated: true
---

# `dashboard-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\dashboard\dashboard-feature.tsx`
> SHA-256: `c74680b1a216c8aa9d4e20042a1c147a6193c4df1397cd5b438ea785aed503c9`

```tsx
import Link from "next/link"

import { PageHero } from "@/components/blocks/page-hero"
import { StatGrid } from "@/components/blocks/stat-grid"
import { ProjectCard } from "@/components/projects/project-card"
import { Button } from "@/components/ui/button"
import { getDashboardState } from "@/lib/fetchers/dashboardFetchers"

export async function DashboardFeature() {
  const state = await getDashboardState()

  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Tenant dashboard"
        title="Operational center."
        description="A protected RSC surface composed from fetchers and DTOs. No Prisma or authz logic lives in this feature."
      />
      <StatGrid
        stats={[
          { label: "Accessible projects", value: String(state.projectCount) },
          { label: "Auth model", value: "Clerk" },
          { label: "Authz model", value: "Rows" },
        ]}
      />
      <section className="grid gap-4">
        <div className="flex items-center justify-between gap-4">
          <h2 className="text-4xl">Recent projects</h2>
          <Button asChild size="sm">
            <Link href="/projects/new">New project</Link>
          </Button>
        </div>
        {state.empty ? (
          <div className="border bg-card p-6">
            <p className="text-muted-foreground">
              Create a project to exercise row-level ownership checks.
            </p>
          </div>
        ) : (
          <div className="grid gap-3 md:grid-cols-2">
            {state.recentProjects.map((project) => (
              <ProjectCard key={project.id} project={project} />
            ))}
          </div>
        )}
      </section>
    </div>
  )
}

```