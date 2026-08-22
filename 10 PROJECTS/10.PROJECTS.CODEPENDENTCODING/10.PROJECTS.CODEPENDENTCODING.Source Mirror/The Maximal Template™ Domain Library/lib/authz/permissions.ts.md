---
title: 'The Maximal Template™ Domain Library\lib\authz\permissions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\authz\permissions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.authz.permissions.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\authz\permissions.ts'
source_file: 'permissions.ts'
source_sha256: 'f78de5934cecd38aae5c3594ebb403f55b9deb00a5f6dd53445b787b800fad88'
generated: true
---

# `permissions.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\authz\permissions.ts`
> SHA-256: `f78de5934cecd38aae5c3594ebb403f55b9deb00a5f6dd53445b787b800fad88`

```ts
import type { AccessContext, AppRole, Permission } from "../../types/access";

const allPermissions: readonly Permission[] = [
  "organization:read",
  "organization:write",
  "crm:read",
  "crm:write",
  "projects:read",
  "projects:write",
  "support:read",
  "support:write",
  "marketing:read",
  "marketing:write",
  "invoicing:read",
  "invoicing:write",
  "social:read",
  "social:write",
  "ai:read",
  "ai:write",
  "portal:read",
  "portal:write",
  "portal:billing",
  "admin:audit",
  "admin:records",
  "admin:users",
  "admin:bulk",
];

const grants: Record<AppRole, ReadonlySet<Permission>> = {
  OWNER: new Set(allPermissions),
  ADMIN: new Set(allPermissions),

  MANAGER: new Set([
    "organization:read",
    "crm:read",
    "crm:write",
    "projects:read",
    "projects:write",
    "support:read",
    "support:write",
    "marketing:read",
    "marketing:write",
    "invoicing:read",
    "social:read",
    "social:write",
    "ai:read",
    "ai:write",
    "portal:read",
    "portal:write",
  ]),

  MEMBER: new Set([
    "organization:read",
    "crm:read",
    "crm:write",
    "projects:read",
    "projects:write",
    "support:read",
    "support:write",
    "marketing:read",
    "social:read",
    "social:write",
    "ai:read",
    "ai:write",
    "portal:read",
  ]),

  BILLING: new Set([
    "organization:read",
    "invoicing:read",
    "invoicing:write",
    "portal:read",
    "portal:billing",
  ]),

  SUPPORT: new Set([
    "organization:read",
    "support:read",
    "support:write",
    "crm:read",
    "portal:read",
  ]),

  CLIENT: new Set([
    "organization:read",
    "support:read",
    "support:write",
    "portal:read",
  ]),

  VIEWER: new Set([
    "organization:read",
    "crm:read",
    "projects:read",
    "support:read",
    "marketing:read",
    "invoicing:read",
    "social:read",
    "ai:read",
    "portal:read",
  ]),
};

export class AuthorizationError extends Error {
  constructor(permission: Permission) {
    super(`Missing required permission: ${permission}`);
    this.name = "AuthorizationError";
  }
}

export function hasPermission(
  context: AccessContext,
  permission: Permission,
): boolean {
  return grants[context.role].has(permission);
}

export function assertPermission(
  context: AccessContext,
  permission: Permission,
): void {
  if (!hasPermission(context, permission)) {
    throw new AuthorizationError(permission);
  }
}

```