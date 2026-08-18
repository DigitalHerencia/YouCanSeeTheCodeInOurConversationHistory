---
title: 'The Hipster Stack™ Technology Stack\template\lib\projects\workflows\projectWorkflows.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\projects\workflows\projectWorkflows.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.projects.workflows.projectworkflows.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\projects\workflows\projectWorkflows.ts'
source_file: 'projectWorkflows.ts'
source_sha256: '3bf7283dc771ef28b12c6e31cc2d42b3c25b7019bea4e4d7a5372dfc25029940'
generated: true
---

# `projectWorkflows.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\projects\workflows\projectWorkflows.ts`
> SHA-256: `3bf7283dc771ef28b12c6e31cc2d42b3c25b7019bea4e4d7a5372dfc25029940`

```ts
import "server-only"

import { requireTenantContext } from "@/lib/auth/session"
import { assertCanTransitionProjectStatus, assertCanUpdateProject } from "@/lib/authz/assertions"
import { canCreateProject } from "@/lib/authz/policies"
import { revalidateProjectSurfaces } from "@/lib/cache/revalidate"
import { withTenantContext } from "@/lib/db/withTenantContext"
import {
  createProjectTx,
  transitionProjectStatusTx,
  updateProjectTx,
} from "@/lib/db/transactions/projectTransactions"
import {
  transitionProjectStatusSchema,
  type CreateProjectInput,
  type UpdateProjectInput,
} from "@/schemas/projectSchemas"

export async function createProjectWorkflow(input: CreateProjectInput) {
  const context = await requireTenantContext()
  if (!canCreateProject(context)) throw new Error("Project creation denied.")

  const project = await withTenantContext(context.organization.id, (tx) =>
    createProjectTx(tx, {
      ...input,
      organizationId: context.organization.id,
      ownerId: context.localUser.id,
    })
  )

  revalidateProjectSurfaces({ userId: context.localUser.id, projectId: project.id })
  return project
}

export async function updateProjectWorkflow(input: UpdateProjectInput) {
  const context = await requireTenantContext()
  const updated = await withTenantContext(context.organization.id, (tx) =>
    updateProjectTx(
      tx,
      {
        ...input,
        organizationId: context.organization.id,
        actorUserId: context.localUser.id,
      },
      (project) => assertCanUpdateProject(context, project)
    )
  )

  revalidateProjectSurfaces({ userId: context.localUser.id, projectId: updated.id })
  return updated
}

export async function transitionProjectStatusWorkflow(input: unknown) {
  const parsed = transitionProjectStatusSchema.parse(input)
  const context = await requireTenantContext()
  const project = await withTenantContext(context.organization.id, (tx) =>
    transitionProjectStatusTx(
      tx,
      {
        ...parsed,
        organizationId: context.organization.id,
        actorUserId: context.localUser.id,
      },
      (current) => assertCanTransitionProjectStatus(context, current, parsed.status)
    )
  )

  revalidateProjectSurfaces({ userId: context.localUser.id, projectId: project.id })
  return project
}

```