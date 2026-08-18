---
title: 'The Maximal Template™ Domain Library\types\access.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\types\access.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.types.access.ts'
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
source_path: 'The Maximal Template™ Domain Library\types\access.ts'
source_file: 'access.ts'
source_sha256: '230dc1fdffd7a7ad12b79a738872d4780b74f3515bca2b8f3494224d073fb42e'
generated: true
---

# `access.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\types\access.ts`
> SHA-256: `230dc1fdffd7a7ad12b79a738872d4780b74f3515bca2b8f3494224d073fb42e`

```ts
export type AppRole =
  | "OWNER"
  | "ADMIN"
  | "MANAGER"
  | "MEMBER"
  | "BILLING"
  | "SUPPORT"
  | "CLIENT"
  | "VIEWER";

export type Permission =
  | "organization:read"
  | "organization:write"
  | "crm:read"
  | "crm:write"
  | "projects:read"
  | "projects:write"
  | "support:read"
  | "support:write"
  | "marketing:read"
  | "marketing:write"
  | "invoicing:read"
  | "invoicing:write"
  | "social:read"
  | "social:write"
  | "ai:read"
  | "ai:write"
  | "portal:read"
  | "portal:write"
  | "portal:billing"
  | "admin:audit"
  | "admin:records"
  | "admin:users"
  | "admin:bulk";

/** Clerk establishes user identity only. Application tenancy is resolved locally. */
export interface AuthenticatedIdentity {
  clerkUserId: string;
}

export interface AccessContext extends AuthenticatedIdentity {
  userId: string;
  organizationId: string;
  membershipId: string;
  role: AppRole;
}

```