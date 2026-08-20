---
title: 'The Hipster Stack™ Technology Stack\template\tests\contract\tenancy-surface.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\contract\tenancy-surface.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.contract.tenancy-surface.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\contract\tenancy-surface.test.ts'
source_file: 'tenancy-surface.test.ts'
source_sha256: '3299da31b70988fdb93ac747fc2136e4a0d08d2de183bd99dc6ed5bfa606f8a8'
generated: true
---

# `tenancy-surface.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\contract\tenancy-surface.test.ts`
> SHA-256: `3299da31b70988fdb93ac747fc2136e4a0d08d2de183bd99dc6ed5bfa606f8a8`

```ts
import { readFileSync } from "node:fs"
import { join } from "node:path"
import { describe, expect, it } from "vitest"
import YAML from "yaml"

const root = process.cwd()
const read = (path: string) => readFileSync(join(root, path), "utf8")

describe("organization tenancy surface", () => {
  it("models Organization as the tenant and Project as a tenant-owned resource", () => {
    const schema = read("prisma/schema.prisma")

    expect(schema).toMatch(/model Organization \{/)
    expect(schema).toMatch(/model Membership \{/)
    expect(schema).toMatch(/model OrganizationInvitation \{/)
    expect(schema).toMatch(/model Project \{[\s\S]*?organizationId String/)
    expect(schema).toMatch(/@@unique\(\[organizationId, userId\]\)/)
    expect(schema).not.toMatch(/model ProjectMembership \{/)
  })

  it("publishes Organization authorization and the implemented RLS boundary", () => {
    const contract = YAML.parse(read(".agents/contracts/domain-model.yaml")) as {
      tenant: { selected_name: string; project_is_tenant: boolean; rls_implemented: boolean }
      authorization: { membership_model: string; capability_source: string }
    }

    expect(contract.tenant).toEqual(
      expect.objectContaining({
        selected_name: "Organization",
        project_is_tenant: false,
        rls_implemented: true,
      })
    )
    expect(contract.authorization).toEqual(
      expect.objectContaining({
        membership_model: "Membership",
        capability_source: "lib/authz/capabilities.ts",
      })
    )
  })
})

```