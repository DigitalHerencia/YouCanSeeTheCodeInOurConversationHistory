---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\schemas\projectSchemas.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\schemas\projectSchemas.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.schemas.projectschemas.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\schemas\projectSchemas.test.ts'
source_file: 'projectSchemas.test.ts'
source_sha256: '045baac410d2079aa33a001395271ef8ba8ab6908086aa420e3febaeb6098268'
generated: true
---

# `projectSchemas.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\schemas\projectSchemas.test.ts`
> SHA-256: `045baac410d2079aa33a001395271ef8ba8ab6908086aa420e3febaeb6098268`

```ts
import { describe, expect, it } from "vitest"

import { createProjectSchema, projectIdSchema, updateProjectSchema } from "@/schemas/projectSchemas"

describe("project schemas", () => {
  it("accepts valid create input", () => {
    const result = createProjectSchema.safeParse({
      name: "Operations Desk",
      description: "Internal workflow tracking.",
    })

    expect(result.success).toBe(true)
  })

  it("rejects short project names", () => {
    const result = createProjectSchema.safeParse({
      name: "A",
      description: "",
    })

    expect(result.success).toBe(false)
  })

  it("requires project id for updates", () => {
    expect(projectIdSchema.safeParse("").success).toBe(false)
    expect(
      updateProjectSchema.safeParse({
        projectId: "project_1",
        name: "Operations Desk",
        description: "",
      }).success
    ).toBe(true)
  })
})

```