---
title: 'The Maximal Template™ Domain Library\lib\db\tenant.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\tenant.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.tenant.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\tenant.ts'
source_file: 'tenant.ts'
source_sha256: '858ab4da9d90f45dd15dde5cc968cff27c548a894b39dd02b77868cea7429e05'
generated: true
---

# `tenant.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\tenant.ts`
> SHA-256: `858ab4da9d90f45dd15dde5cc968cff27c548a894b39dd02b77868cea7429e05`

```ts
import "server-only";

import type { Prisma } from "../../generated/prisma/client";
import type { AccessContext, AuthenticatedIdentity } from "../../types/access";

import { prisma } from "./client";
import { resolveAccessContextTx } from "./transactions/tenant-context.tx";

/** Seed identity used only by public, read-only template fetchers. */
const TEMPLATE_DEMO_IDENTITY: AuthenticatedIdentity = {
  clerkUserId: "user_seed_owner",
};

export async function withTenantTransaction<T>(
  identity: AuthenticatedIdentity,
  work: (tx: Prisma.TransactionClient, access: AccessContext) => Promise<T>,
): Promise<T> {
  return prisma.$transaction(
    async (tx) => {
      const access = await resolveAccessContextTx(tx, identity);
      return work(tx, access);
    },
    {
      maxWait: 5_000,
      timeout: 15_000,
    },
  );
}

/**
 * Public template reads run against the seeded demonstration workspace.
 * This does not authenticate the visitor and must never be used by mutations.
 */
export async function withTemplateReadTransaction<T>(
  work: (tx: Prisma.TransactionClient, access: AccessContext) => Promise<T>,
): Promise<T> {
  return withTenantTransaction(TEMPLATE_DEMO_IDENTITY, work);
}

```