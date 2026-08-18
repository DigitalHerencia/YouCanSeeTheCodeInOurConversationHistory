---
title: 'The Maximal Template™ Domain Library\lib\authz\authorize.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\authz\authorize.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.authz.authorize.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\authz\authorize.ts'
source_file: 'authorize.ts'
source_sha256: 'fabb2566a2c96004a610501616978fb439f7fce05f23dc0a6e2aa3e70772becd'
generated: true
---

# `authorize.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\authz\authorize.ts`
> SHA-256: `fabb2566a2c96004a610501616978fb439f7fce05f23dc0a6e2aa3e70772becd`

```ts
import type { AccessContext, Permission } from "../../types/access";

import { assertPermission, AuthorizationError } from "./permissions";
import {
  canManageOwnedOrAssignedResource,
  canReadResource,
  isSameTenant,
} from "./policies";
import type { ResourceAccessDescriptor } from "./resources";

export class ResourceAuthorizationError extends Error {
  constructor(resource: ResourceAccessDescriptor) {
    super(`Access denied for ${resource.kind} in the active organization.`);
    this.name = "ResourceAuthorizationError";
  }
}

export function authorize(
  context: AccessContext,
  permission: Permission,
  resource?: ResourceAccessDescriptor,
): void {
  assertPermission(context, permission);

  if (resource && !isSameTenant(context, resource)) {
    throw new ResourceAuthorizationError(resource);
  }
}

export function authorizeResourceRead(
  context: AccessContext,
  permission: Permission,
  resource: ResourceAccessDescriptor,
): void {
  assertPermission(context, permission);

  if (!canReadResource(context, resource)) {
    throw new ResourceAuthorizationError(resource);
  }
}

export function authorizeOwnedOrAssignedWrite(
  context: AccessContext,
  permission: Permission,
  resource: ResourceAccessDescriptor,
): void {
  assertPermission(context, permission);

  if (!canManageOwnedOrAssignedResource(context, resource)) {
    throw new ResourceAuthorizationError(resource);
  }
}

export { AuthorizationError };

```