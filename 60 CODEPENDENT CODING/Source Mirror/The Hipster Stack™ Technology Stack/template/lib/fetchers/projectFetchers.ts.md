---
title: 'The Hipster Stack™ Technology Stack\template\lib\fetchers\projectFetchers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\fetchers\projectFetchers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.fetchers.projectfetchers.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\fetchers\projectFetchers.ts'
source_file: 'projectFetchers.ts'
source_sha256: 'abb2a8ae213c4e50b45be19c4496300e5c4a9eee05b2ef754684f44a9a7e099e'
generated: true
---

# `projectFetchers.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\fetchers\projectFetchers.ts`
> SHA-256: `abb2a8ae213c4e50b45be19c4496300e5c4a9eee05b2ef754684f44a9a7e099e`

```ts
import "server-only"

import { unstable_noStore as noStore } from "next/cache"

import { assertCanReadProject } from "@/lib/authz/assertions"
import { requireTenantContext } from "@/lib/auth/session"
import { mapProjectDetailDTO, mapProjectSummaryDTO } from "@/lib/db/dto/project.mappers"
import { withTenantContext } from "@/lib/db/withTenantContext"
import { projectDetailSelect, projectSummarySelect } from "@/lib/db/selects/project.selects"
import { projectIdSchema } from "@/schemas/projectSchemas"
import type { ProjectDetailDTO, ProjectListStateDTO } from "@/types/projectTypes"

export async function getProjectListState(): Promise<ProjectListStateDTO> {
  noStore()

  const context = await requireTenantContext()
  const projects = await withTenantContext(context.organization.id, (tx) =>
    tx.project.findMany({
      where: {
        status: "active",
        organizationId: context.organization.id,
      },
      orderBy: { updatedAt: "desc" },
      take: 24,
      select: projectSummarySelect,
    })
  )

  return {
    projects: projects.map((project) => mapProjectSummaryDTO(project, context.localUser.id)),
    empty: projects.length === 0,
  }
}

export async function getProjectDetailState(projectId: string): Promise<ProjectDetailDTO> {
  noStore()

  const context = await requireTenantContext()
  const parsedProjectId = projectIdSchema.parse(projectId)
  const project = await withTenantContext(context.organization.id, (tx) =>
    tx.project.findFirst({
      where: { id: parsedProjectId, organizationId: context.organization.id },
      select: projectDetailSelect,
    })
  )

  if (!project) {
    throw new Error("Project not found.")
  }

  assertCanReadProject(context, project)

  return mapProjectDetailDTO(project, context.localUser.id)
}

```