---
title: 'The Hipster Stack™ Technology Stack\template\lib\db\withTenantContext.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\db\withTenantContext.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.db.withtenantcontext.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\db\withTenantContext.ts'
source_file: 'withTenantContext.ts'
source_sha256: 'f16ae292521ab1a6c08f249e8fd7f951b157f8229d2689e3a92d54bd6193f95c'
generated: true
---

# `withTenantContext.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\db\withTenantContext.ts`
> SHA-256: `f16ae292521ab1a6c08f249e8fd7f951b157f8229d2689e3a92d54bd6193f95c`

```ts
import "server-only"

import type { Prisma, PrismaClient } from "@/prisma/generated/prisma/client"

import { getPrisma } from "@/lib/db/prisma"

type TransactionHost = Pick<PrismaClient, "$transaction">
type TransactionOptions = {
  isolationLevel?: Prisma.TransactionIsolationLevel
  maxWait?: number
  timeout?: number
}

export async function withTenantContext<T>(
  organizationId: string,
  operation: (tx: Prisma.TransactionClient) => Promise<T>,
  options?: TransactionOptions,
  host: TransactionHost = getPrisma()
): Promise<T> {
  if (!organizationId.trim()) throw new Error("Organization context is required.")

  return host.$transaction(async (tx) => {
    await tx.$executeRaw`SELECT set_config('app.current_organization_id', ${organizationId}, true)`
    return operation(tx)
  }, options)
}

```