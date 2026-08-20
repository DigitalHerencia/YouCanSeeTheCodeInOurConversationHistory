---
title: 'The Hipster Stack™ Technology Stack\template\lib\actions\projectActions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\actions\projectActions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.actions.projectactions.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\actions\projectActions.ts'
source_file: 'projectActions.ts'
source_sha256: '72bcd28803035c5c1e83a0f4684f24b7f02e9661813a2a6972e0ffbe5867d5a0'
generated: true
---

# `projectActions.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\actions\projectActions.ts`
> SHA-256: `72bcd28803035c5c1e83a0f4684f24b7f02e9661813a2a6972e0ffbe5867d5a0`

```ts
"use server"

import { redirect } from "next/navigation"

import {
  createProjectWorkflow,
  updateProjectWorkflow,
} from "@/lib/projects/workflows/projectWorkflows"
import { createProjectSchema, updateProjectSchema } from "@/schemas/projectSchemas"
import { actionFailure, actionSuccess, type ActionResult } from "@/types/actionResultTypes"
import type { ProjectActionState } from "@/types/projectTypes"

function formString(formData: FormData, key: string): string {
  const value = formData.get(key)
  return typeof value === "string" ? value : ""
}

export async function createProjectAction(
  _previousState: ProjectActionState,
  formData: FormData
): Promise<ActionResult<{ id: string }>> {
  const parsed = createProjectSchema.safeParse({
    name: formString(formData, "name"),
    description: formString(formData, "description"),
  })

  if (!parsed.success) {
    return actionFailure(
      "INVALID_INPUT",
      "Check the project details.",
      parsed.error.flatten().fieldErrors
    )
  }

  const project = await createProjectWorkflow(parsed.data)
  redirect(`/projects/${project.id}`)
}

export async function updateProjectAction(
  projectId: string,
  _previousState: ProjectActionState,
  formData: FormData
): Promise<ActionResult<{ id: string }>> {
  const parsed = updateProjectSchema.safeParse({
    projectId,
    name: formString(formData, "name"),
    description: formString(formData, "description"),
  })

  if (!parsed.success) {
    return actionFailure(
      "INVALID_INPUT",
      "Check the project details.",
      parsed.error.flatten().fieldErrors
    )
  }

  const updated = await updateProjectWorkflow(parsed.data)
  return actionSuccess({ id: updated.id })
}

```