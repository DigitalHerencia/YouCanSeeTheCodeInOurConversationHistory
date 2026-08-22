---
title: 'The Maximal Template™ Domain Library\lib\authz\policies.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\authz\policies.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.authz.policies.ts'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\lib\authz\policies.ts'
source_file: 'policies.ts'
source_sha256: '21ca520529e7dd803451efea960f67007a4efff66b78dac91862449dfbcf4c90'
generated: true
---

# `policies.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\authz\policies.ts`
> SHA-256: `21ca520529e7dd803451efea960f67007a4efff66b78dac91862449dfbcf4c90`

```ts
import type { AccessContext } from "../../types/access";

import type { ResourceAccessDescriptor } from "./resources";
import { isPrivilegedRole } from "./roles";

export function isSameTenant(
  context: AccessContext,
  resource: ResourceAccessDescriptor,
): boolean {
  return context.organizationId === resource.organizationId;
}

export function ownsResource(
  context: AccessContext,
  resource: ResourceAccessDescriptor,
): boolean {
  return resource.ownerMembershipId === context.membershipId;
}

export function isAssignedResource(
  context: AccessContext,
  resource: ResourceAccessDescriptor,
): boolean {
  return resource.assigneeMembershipId === context.membershipId;
}

export function canReadResource(
  context: AccessContext,
  resource: ResourceAccessDescriptor,
): boolean {
  if (!isSameTenant(context, resource)) {
    return false;
  }

  if (context.role !== "CLIENT") {
    return true;
  }

  return (
    resource.clientVisible === true ||
    ownsResource(context, resource) ||
    isAssignedResource(context, resource)
  );
}

export function canManageOwnedOrAssignedResource(
  context: AccessContext,
  resource: ResourceAccessDescriptor,
): boolean {
  if (!isSameTenant(context, resource)) {
    return false;
  }

  return (
    isPrivilegedRole(context.role) ||
    context.role === "MANAGER" ||
    ownsResource(context, resource) ||
    isAssignedResource(context, resource)
  );
}

```