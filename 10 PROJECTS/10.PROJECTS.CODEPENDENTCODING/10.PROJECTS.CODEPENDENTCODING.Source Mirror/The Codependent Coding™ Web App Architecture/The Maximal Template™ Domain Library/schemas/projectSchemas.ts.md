---
title: 'The Hipster Stack™ Technology Stack\template\schemas\projectSchemas.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\schemas\projectSchemas.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.schemas.projectschemas.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\schemas\projectSchemas.ts'
source_file: 'projectSchemas.ts'
source_sha256: '5f10c09029cfd7a9bd3cff8962cb681c9219213d5953502bed5da1e25e6d58ea'
generated: true
---

# `projectSchemas.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\schemas\projectSchemas.ts`
> SHA-256: `5f10c09029cfd7a9bd3cff8962cb681c9219213d5953502bed5da1e25e6d58ea`

```ts
import { z } from "zod"

export const projectIdSchema = z.string().trim().min(1)

export const createProjectSchema = z
  .object({
    name: z.string().trim().min(2, "Name must be at least 2 characters.").max(120),
    description: z
      .string()
      .trim()
      .max(500, "Description must be 500 characters or fewer.")
      .optional()
      .or(z.literal("")),
  })
  .strict()

export const updateProjectSchema = createProjectSchema.extend({
  projectId: projectIdSchema,
})

export const transitionProjectStatusSchema = z
  .object({
    projectId: projectIdSchema,
    status: z.enum(["active", "archived"]),
  })
  .strict()

export type CreateProjectInput = z.infer<typeof createProjectSchema>
export type UpdateProjectInput = z.infer<typeof updateProjectSchema>
export type TransitionProjectStatusInput = z.infer<typeof transitionProjectStatusSchema>

```