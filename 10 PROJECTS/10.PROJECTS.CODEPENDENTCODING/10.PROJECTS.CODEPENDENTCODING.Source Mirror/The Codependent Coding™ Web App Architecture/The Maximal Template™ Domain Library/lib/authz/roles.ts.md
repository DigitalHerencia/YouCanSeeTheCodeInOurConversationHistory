---
title: 'The Maximal Template™ Domain Library\lib\authz\roles.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\authz\roles.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.authz.roles.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\authz\roles.ts'
source_file: 'roles.ts'
source_sha256: 'eb6a72f3f5c37cb9419cc6ee531419cd121b87f41df2c9e6f83c8e8d02c679ef'
generated: true
---

# `roles.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\authz\roles.ts`
> SHA-256: `eb6a72f3f5c37cb9419cc6ee531419cd121b87f41df2c9e6f83c8e8d02c679ef`

```ts
import type { AppRole } from "../../types/access";

export const appRoles = [
  "OWNER",
  "ADMIN",
  "MANAGER",
  "MEMBER",
  "BILLING",
  "SUPPORT",
  "CLIENT",
  "VIEWER",
] as const satisfies readonly AppRole[];

const privilegedRoles = new Set<AppRole>(["OWNER", "ADMIN"]);

export function isAppRole(value: string): value is AppRole {
  return appRoles.some((role) => role === value);
}

export function isPrivilegedRole(role: AppRole): boolean {
  return privilegedRoles.has(role);
}

```