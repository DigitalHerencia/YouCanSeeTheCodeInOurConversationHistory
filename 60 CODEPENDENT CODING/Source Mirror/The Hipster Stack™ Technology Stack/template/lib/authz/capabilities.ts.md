---
title: 'The Hipster Stack™ Technology Stack\template\lib\authz\capabilities.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\authz\capabilities.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.authz.capabilities.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\authz\capabilities.ts'
source_file: 'capabilities.ts'
source_sha256: 'ec474b7a5a9e95fe95fba37cc25ecd86bf90f3a3ff22a3584cbf58e08f7cc99e'
generated: true
---

# `capabilities.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\authz\capabilities.ts`
> SHA-256: `ec474b7a5a9e95fe95fba37cc25ecd86bf90f3a3ff22a3584cbf58e08f7cc99e`

```ts
import type { Capability, OrganizationRole } from "@/types/authzTypes"

const roleCapabilities = {
  owner: [
    "organization.read",
    "organization.manage",
    "membership.read",
    "membership.manage",
    "invitation.manage",
    "project.read",
    "project.create",
    "project.update",
    "project.archive",
    "audit.read",
    "billing.manage",
    "connect.manage",
    "media.read",
    "media.manage",
    "ai.use",
    "map.read",
    "map.manage",
  ],
  admin: [
    "organization.read",
    "membership.read",
    "membership.manage",
    "invitation.manage",
    "project.read",
    "project.create",
    "project.update",
    "project.archive",
    "audit.read",
    "media.read",
    "media.manage",
    "ai.use",
    "map.read",
    "map.manage",
  ],
  member: [
    "organization.read",
    "membership.read",
    "project.read",
    "project.create",
    "project.update",
    "media.read",
    "media.manage",
    "ai.use",
    "map.read",
  ],
  viewer: ["organization.read", "membership.read", "project.read", "media.read", "map.read"],
} as const satisfies Record<OrganizationRole, readonly Capability[]>

export function capabilitiesForRole(role: OrganizationRole): readonly Capability[] {
  return roleCapabilities[role]
}

export function hasCapability(role: OrganizationRole, capability: Capability): boolean {
  return capabilitiesForRole(role).some((candidate) => candidate === capability)
}

```