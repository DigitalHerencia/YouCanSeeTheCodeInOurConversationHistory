---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\authz\tenant-context.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\authz\tenant-context.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.authz.tenant-context.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\authz\tenant-context.test.ts'
source_file: 'tenant-context.test.ts'
source_sha256: 'ba28c30500fde8d4c58ae3ec949f5cb1f2c174595fc4e9040921d23ad8648500'
generated: true
---

# `tenant-context.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\authz\tenant-context.test.ts`
> SHA-256: `ba28c30500fde8d4c58ae3ec949f5cb1f2c174595fc4e9040921d23ad8648500`

```ts
import { describe, expect, it } from "vitest"

import { deriveTenantContext } from "@/lib/authz/tenant"
import type { AuthenticatedUserContext } from "@/types/authTypes"

const user: AuthenticatedUserContext = {
  userId: "clerk_user_1",
  localUser: {
    id: "user_1",
    clerkUserId: "clerk_user_1",
    email: "owner@example.com",
    displayName: "Owner",
    status: "active",
    isApplicationAdmin: false,
  },
}

describe("server-derived tenant context", () => {
  const memberships = [
    {
      id: "membership_b",
      userId: "user_1",
      role: "admin" as const,
      createdAt: new Date("2026-02-01T00:00:00.000Z"),
      organization: { id: "organization_b", status: "active" as const },
    },
    {
      id: "membership_a",
      userId: "user_1",
      role: "owner" as const,
      createdAt: new Date("2026-01-01T00:00:00.000Z"),
      organization: { id: "organization_a", status: "active" as const },
    },
  ]

  it("uses only a stored preference backed by an active local membership", () => {
    expect(deriveTenantContext(user, memberships, "organization_b")?.organization.id).toBe(
      "organization_b"
    )
    expect(deriveTenantContext(user, memberships, "organization_outside")?.organization.id).toBe(
      "organization_a"
    )
  })

  it("rejects memberships for another local user and suspended organizations", () => {
    const unavailable = memberships.map((membership, index) => ({
      ...membership,
      userId: index === 0 ? "user_other" : membership.userId,
      organization: {
        ...membership.organization,
        status: index === 1 ? ("suspended" as const) : membership.organization.status,
      },
    }))

    expect(deriveTenantContext(user, unavailable, null)).toBeNull()
  })
})

```