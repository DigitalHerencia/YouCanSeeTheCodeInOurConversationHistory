---
title: 'The Maximal Template™ Domain Library\lib\db\client.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\client.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.client.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\client.ts'
source_file: 'client.ts'
source_sha256: 'e5dcf78db4b3ce8dfe866dc3077de1555cecca0637222b9d6856320bcbf9b40a'
generated: true
---

# `client.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\client.ts`
> SHA-256: `e5dcf78db4b3ce8dfe866dc3077de1555cecca0637222b9d6856320bcbf9b40a`

```ts
import "server-only";

import { PrismaNeon } from "@prisma/adapter-neon";

import { PrismaClient } from "../../generated/prisma/client";

const connectionString = process.env.DATABASE_URL;

if (!connectionString) {
  throw new Error("DATABASE_URL is required.");
}

const adapter = new PrismaNeon({
  connectionString,
});

const globalForPrisma = globalThis as unknown as {
  prisma?: PrismaClient;
};

export const prisma =
  globalForPrisma.prisma ??
  new PrismaClient({
    adapter,
  });

if (process.env.NODE_ENV !== "production") {
  globalForPrisma.prisma = prisma;
}

```