---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\authz\capabilities.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\authz\capabilities.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.authz.capabilities.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\authz\capabilities.test.ts'
source_file: 'capabilities.test.ts'
source_sha256: 'b6a611b5625ee5f48626da172b9e53a12efa67b6d9b7c0eea8f3e86b32834a8a'
generated: true
---

# `capabilities.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\authz\capabilities.test.ts`
> SHA-256: `b6a611b5625ee5f48626da172b9e53a12efa67b6d9b7c0eea8f3e86b32834a8a`

```ts
import { describe, expect, it } from "vitest"

import { capabilitiesForRole, hasCapability } from "@/lib/authz/capabilities"

describe("organization role capabilities", () => {
  it("gives owners tenant, membership, invitation, project, audit, and billing authority", () => {
    expect(capabilitiesForRole("owner")).toEqual(
      expect.arrayContaining([
        "organization.manage",
        "membership.manage",
        "invitation.manage",
        "project.archive",
        "audit.read",
        "billing.manage",
        "connect.manage",
      ])
    )
  })

  it("keeps billing and organization management out of delegated roles", () => {
    expect(hasCapability("admin", "billing.manage")).toBe(false)
    expect(hasCapability("admin", "connect.manage")).toBe(false)
    expect(hasCapability("admin", "organization.manage")).toBe(false)
    expect(hasCapability("member", "membership.manage")).toBe(false)
    expect(hasCapability("viewer", "project.update")).toBe(false)
  })
})

```