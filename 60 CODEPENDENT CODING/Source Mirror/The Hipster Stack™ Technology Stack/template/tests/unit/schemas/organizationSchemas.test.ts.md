---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\schemas\organizationSchemas.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\schemas\organizationSchemas.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.schemas.organizationschemas.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\schemas\organizationSchemas.test.ts'
source_file: 'organizationSchemas.test.ts'
source_sha256: '85562048067c444842df9182c3fcee5ad4fcc20a527cb6bbc0dfd06d61699705'
generated: true
---

# `organizationSchemas.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\schemas\organizationSchemas.test.ts`
> SHA-256: `85562048067c444842df9182c3fcee5ad4fcc20a527cb6bbc0dfd06d61699705`

```ts
import { describe, expect, it } from "vitest"

import {
  createOrganizationSchema,
  inviteOrganizationMemberSchema,
  updateMembershipSchema,
} from "@/schemas/organizationSchemas"

describe("organization schemas", () => {
  it("validates organization names without accepting authority fields", () => {
    expect(createOrganizationSchema.parse({ name: "  Northwind Ops  " })).toEqual({
      name: "Northwind Ops",
    })
    expect(createOrganizationSchema.safeParse({ name: "Northwind", role: "owner" }).success).toBe(
      false
    )
  })

  it("normalizes invitation email and rejects direct owner invitation", () => {
    expect(
      inviteOrganizationMemberSchema.parse({ email: "  ADMIN@Example.com ", role: "admin" })
    ).toEqual({ email: "admin@example.com", role: "admin" })
    expect(
      inviteOrganizationMemberSchema.safeParse({ email: "owner@example.com", role: "owner" })
        .success
    ).toBe(false)
  })

  it("allows a membership role change or removal without accepting tenant input", () => {
    expect(updateMembershipSchema.parse({ membershipId: "membership_1", role: "viewer" })).toEqual({
      membershipId: "membership_1",
      role: "viewer",
    })
    expect(updateMembershipSchema.parse({ membershipId: "membership_1", role: null })).toEqual({
      membershipId: "membership_1",
      role: null,
    })
    expect(
      updateMembershipSchema.safeParse({
        membershipId: "membership_1",
        role: "viewer",
        organizationId: "organization_other",
      }).success
    ).toBe(false)
  })
})

```