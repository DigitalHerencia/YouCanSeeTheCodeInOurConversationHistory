---
title: 'The Maximal Template™ Domain Library\prisma\migrations\20260815000000_application_owned_tenancy\migration.sql'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\prisma\migrations\20260815000000_application_owned_tenancy\migration.sql'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.prisma.migrations.20260815000000-application-owned-tenancy.migration.sql'
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
source_path: 'The Maximal Template™ Domain Library\prisma\migrations\20260815000000_application_owned_tenancy\migration.sql'
source_file: 'migration.sql'
source_sha256: '4c775f48102b4561b8075722884cd839d90da737485efd968ad964a96053a0d4'
generated: true
---

# `migration.sql`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\prisma\migrations\20260815000000_application_owned_tenancy\migration.sql`
> SHA-256: `4c775f48102b4561b8075722884cd839d90da737485efd968ad964a96053a0d4`

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