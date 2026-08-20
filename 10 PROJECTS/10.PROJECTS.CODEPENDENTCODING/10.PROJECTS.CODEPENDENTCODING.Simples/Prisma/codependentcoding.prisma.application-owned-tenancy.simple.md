---
title: Maximal Template — application-owned tenancy migration
type: simple
scope: file
project: Codependent Coding
domain: database-security
artifact: prisma/migrations/20260815000000_application_owned_tenancy/migration.sql
kind: simple
namespace: codependentcoding.prisma.application-owned-tenancy.simple
status: review
authority: working-note
parent: "[[codependentcoding.simples.database.map]]"
depends_on:
  - "[[The Maximal Template™ Demo Doctrine]]"
  - "[[The Maximal Template™ Backlog]]"
supersedes: []
tags:
  - codependent-coding/simples
  - simples/prisma-lifecycle
  - security/rls
  - tenancy/application-owned
  - status/review
created: 2026-08-18
updated: 2026-08-19
simple_type: prisma-lifecycle
layer: database-security-migration
source_path: prisma/migrations/20260815000000_application_owned_tenancy/migration.sql
public_source_path: prisma/migrations/20260815000000_application_owned_tenancy/migration.sql
hardened_source_path: prisma/migrations/20260815000000_application_owned_tenancy/migration.sql
source_mirror: "[[10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Source Mirror/The Codependent Coding™ Web App Architecture/The Maximal Template™ Domain Library/prisma/migrations/20260815000000_application_owned_tenancy/migration.sql|source mirror — application-owned tenancy migration]]"
canonicalization_status: review
owner_approval: pending
public_implementation_status: observed
hardened_implementation_status: proposed
generation_status: blocked-by-hardening
providers:
  - PostgreSQL
  - Prisma
  - Clerk
ontologies: []
uses:
  - "[[codependentcoding.transactions.tenant-context.simple]]"
requires:
  - app.clerk_user_id transaction context
  - app.organization_id transaction context
permits:
  - authenticated-user membership bootstrap before organization selection
conditional: []
prohibits:
  - Clerk organization as canonical application tenancy
substitutes: []
variants: []
tests:
  - bootstrap membership visible to current user
  - foreign membership invisible
  - organization access follows active membership or selected tenant
  - cross-tenant data rejected
validation:
  - migration applies cleanly
  - restricted role cannot bypass RLS
---

# `prisma/migrations/20260815000000_application_owned_tenancy/migration.sql`

## Codependent Coding Knowledge

### Canonical Definition

This migration is the implementation correction that removes Clerk-owned organization/membership identifiers from the application tenant model and introduces RLS policies that allow local membership bootstrap from Clerk **user identity only** before the transaction's application organization is selected.

### Why This File Matters

An earlier RLS migration used Clerk organization identity for `Organization` and generic `app.organization_id` isolation for `Membership`. The later application-owned-tenancy migration explicitly corrects that model:

- drops the Clerk organization/membership policy/columns;
- lets the authenticated Clerk **user** see the local memberships needed to resolve application tenancy;
- restores `app.organization_id` as the normal tenant boundary after resolution.

That aligns the implementation with the doctrine that Clerk authenticates while the application owns organizations, memberships, roles, and tenant truth.

### Contract & Invariants

- Clerk user identity may bootstrap local membership lookup.
- Application organization identity is local DB state.
- `WITH CHECK` for membership/organization writes remains organization-context scoped.
- Hardened enforcement requires a runtime role that does not bypass RLS.

### Boundaries / Anti-Patterns

- No `clerkOrganizationId` or `clerkMembershipId` as canonical product tenancy.
- Do not confuse existence of RLS policies with proof they are enforced by a `BYPASSRLS` runtime role.
- Do not remove application authorization because RLS exists.

## Simple Properties

### Relationships

- Supports [[codependentcoding.transactions.tenant-context.simple]].
- Enforcement is exercised through [[codependentcoding.database.client.simple]].
- Migration lifecycle is configured by [[codependentcoding.config.prisma.simple]].

### Generation Disposition

**Invariant security migration.** It is derived/fixed backend architecture, not user-selectable configuration.

## Implementation

### Public Demo Golden Prototype

Observed current migration:

```sql
-- Clerk authenticates users only. Application organizations and memberships are local.

DROP POLICY IF EXISTS "organization_identity_isolation" ON "Organization";
DROP POLICY IF EXISTS "tenant_isolation" ON "Membership";

DROP INDEX IF EXISTS "Organization_clerkOrganizationId_key";
DROP INDEX IF EXISTS "Membership_clerkMembershipId_key";

ALTER TABLE "Organization"
DROP COLUMN IF EXISTS "clerkOrganizationId";

ALTER TABLE "Membership"
DROP COLUMN IF EXISTS "clerkMembershipId";

-- Bootstrap membership resolution from the authenticated Clerk user before an
-- application organization has been selected. Once resolved, app.organization_id
-- becomes the normal tenant boundary for the rest of the transaction.
CREATE POLICY "membership_application_access"
ON "Membership"
FOR ALL
USING (
  "organizationId"::text = NULLIF(
    current_setting('app.organization_id', true),
    ''
  )
  OR "userId" IN (
    SELECT "id"
    FROM "User"
    WHERE "clerkUserId" = NULLIF(
      current_setting('app.clerk_user_id', true),
      ''
    )
  )
)
WITH CHECK (
  "organizationId"::text = NULLIF(
    current_setting('app.organization_id', true),
    ''
  )
);

CREATE POLICY "organization_application_access"
ON "Organization"
FOR ALL
USING (
  "id"::text = NULLIF(
    current_setting('app.organization_id', true),
    ''
  )
  OR EXISTS (
    SELECT 1
    FROM "Membership"
    WHERE "Membership"."organizationId" = "Organization"."id"
      AND "Membership"."status" = 'ACTIVE'
  )
)
WITH CHECK (
  "id"::text = NULLIF(
    current_setting('app.organization_id', true),
    ''
  )
);
```

### Hardened Golden Prototype

No SQL rewrite is currently justified from the supplied sources. The same policy model becomes hardened when executed under the restricted application role and verified with real cross-tenant tests.

```sql
-- Clerk authenticates users only. Application organizations and memberships are local.

DROP POLICY IF EXISTS "organization_identity_isolation" ON "Organization";
DROP POLICY IF EXISTS "tenant_isolation" ON "Membership";

DROP INDEX IF EXISTS "Organization_clerkOrganizationId_key";
DROP INDEX IF EXISTS "Membership_clerkMembershipId_key";

ALTER TABLE "Organization"
DROP COLUMN IF EXISTS "clerkOrganizationId";

ALTER TABLE "Membership"
DROP COLUMN IF EXISTS "clerkMembershipId";

CREATE POLICY "membership_application_access"
ON "Membership"
FOR ALL
USING (
  "organizationId"::text = NULLIF(current_setting('app.organization_id', true), '')
  OR "userId" IN (
    SELECT "id"
    FROM "User"
    WHERE "clerkUserId" = NULLIF(current_setting('app.clerk_user_id', true), '')
  )
)
WITH CHECK (
  "organizationId"::text = NULLIF(current_setting('app.organization_id', true), '')
);

CREATE POLICY "organization_application_access"
ON "Organization"
FOR ALL
USING (
  "id"::text = NULLIF(current_setting('app.organization_id', true), '')
  OR EXISTS (
    SELECT 1
    FROM "Membership"
    WHERE "Membership"."organizationId" = "Organization"."id"
      AND "Membership"."status" = 'ACTIVE'
  )
)
WITH CHECK (
  "id"::text = NULLIF(current_setting('app.organization_id', true), '')
);
```

### Hardening Delta

- Execute application runtime traffic under a dedicated role with `BYPASSRLS = false`.
- Verify the membership bootstrap query and organization policy using the same runtime role used by Prisma.
- Preserve application authorization above RLS.

## Validation & Evidence

- [x] Later migration explicitly removes Clerk organization/membership ownership from the tenant model.
- [x] Bootstrap membership resolution is encoded in SQL.
- [x] Source aligns with current `tenant-context.tx.ts` behavior.
- [ ] Live/runtime role re-verified as restricted.
- [ ] Positive same-tenant and negative cross-tenant tests pass through Prisma runtime.
- [ ] Owner approves this as the canonical generated-template RLS contract.

## Links

- [[codependentcoding.simples.database.map]]
- [[codependentcoding.transactions.tenant-context.simple]]
- [[codependentcoding.database.client.simple]]
- [[codependentcoding.config.prisma.simple]]
- [[10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Source Mirror/The Codependent Coding™ Web App Architecture/The Maximal Template™ Domain Library/prisma/migrations/20260815000000_application_owned_tenancy/migration.sql|source mirror]]

## Backlinks

```dataview
TABLE simple_type AS "Type", layer AS "Layer"
FROM [[]]
SORT file.name ASC
```
