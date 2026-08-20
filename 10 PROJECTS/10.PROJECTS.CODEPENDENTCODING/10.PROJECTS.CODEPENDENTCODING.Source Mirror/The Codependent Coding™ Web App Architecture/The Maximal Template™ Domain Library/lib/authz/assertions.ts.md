---
title: 'The Hipster Stack™ Technology Stack\template\lib\authz\assertions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\authz\assertions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.authz.assertions.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\authz\assertions.ts'
source_file: 'assertions.ts'
source_sha256: 'e1e86d6d2771504a673572a1e4d9915552a854451a8ce95ff4c3797cd6a914d0'
generated: true
---

# `assertions.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\authz\assertions.ts`
> SHA-256: `e1e86d6d2771504a673572a1e4d9915552a854451a8ce95ff4c3797cd6a914d0`

```ts
import {
  canManageMembership,
  canReadProject,
  canTransitionProjectStatus,
  canUpdateProject,
} from "@/lib/authz/policies"
import type { Capability, OrganizationRole, TenantContext } from "@/types/authzTypes"
import { hasCapability } from "@/lib/authz/capabilities"

export function assertCapability(context: TenantContext, capability: Capability): void {
  if (!hasCapability(context.membership.role, capability)) {
    throw new Error("Capability denied.")
  }
}

type ProjectAccessRecord = {
  organizationId: string
  status: "active" | "archived"
}

export function assertCanReadProject(context: TenantContext, project: ProjectAccessRecord): void {
  if (!canReadProject(context, project)) throw new Error("Project access denied.")
}

export function assertCanUpdateProject(context: TenantContext, project: ProjectAccessRecord): void {
  if (!canUpdateProject(context, project)) throw new Error("Project update denied.")
}

export function assertCanTransitionProjectStatus(
  context: TenantContext,
  project: ProjectAccessRecord,
  nextStatus: ProjectAccessRecord["status"]
): void {
  if (!canTransitionProjectStatus(context, project, nextStatus)) {
    throw new Error("Project status transition denied.")
  }
}

export function assertCanManageMembership(
  context: TenantContext,
  target: { organizationId: string; role: OrganizationRole },
  ownerCount: number,
  nextRole: OrganizationRole | null
): void {
  if (!canManageMembership(context, target, ownerCount, nextRole)) {
    throw new Error("Membership change denied.")
  }
}

```