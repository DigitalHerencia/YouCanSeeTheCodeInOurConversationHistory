---
title: 'The Maximal Template™ Domain Library\lib\db\provider.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\provider.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.provider.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\provider.ts'
source_file: 'provider.ts'
source_sha256: '736f16c6c818910897bae76dcce048b8882e9c00bc2b55d759d164905148dfd3'
generated: true
---

# `provider.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\provider.ts`
> SHA-256: `736f16c6c818910897bae76dcce048b8882e9c00bc2b55d759d164905148dfd3`

```ts
import "server-only";

import type { Prisma } from "../../generated/prisma/client";

import { prisma } from "./client";

export function withProviderTransaction<T>(
  work: (tx: Prisma.TransactionClient) => Promise<T>,
) {
  return prisma.$transaction(work, { maxWait: 5_000, timeout: 15_000 });
}

export function withProviderOrganizationTransaction<T>(
  organizationId: string,
  work: (tx: Prisma.TransactionClient) => Promise<T>,
) {
  return withProviderTransaction(async (tx) => {
    await tx.$executeRaw`SELECT set_config('app.organization_id', ${organizationId}, true)`;
    return work(tx);
  });
}

```