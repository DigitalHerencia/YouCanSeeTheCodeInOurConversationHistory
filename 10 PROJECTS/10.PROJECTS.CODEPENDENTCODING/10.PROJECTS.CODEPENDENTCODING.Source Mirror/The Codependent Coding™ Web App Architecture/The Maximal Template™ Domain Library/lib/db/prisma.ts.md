---
title: 'The Hipster Stack™ Technology Stack\template\lib\db\prisma.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\db\prisma.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.db.prisma.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\db\prisma.ts'
source_file: 'prisma.ts'
source_sha256: '7cda8a9a0138ed83b71216b548b80a3e46b8a4fb735aae2576a87adb61781df3'
generated: true
---

# `prisma.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\db\prisma.ts`
> SHA-256: `7cda8a9a0138ed83b71216b548b80a3e46b8a4fb735aae2576a87adb61781df3`

```ts
import "server-only"

import { PrismaNeon } from "@prisma/adapter-neon"

import { PrismaClient } from "@/prisma/generated/prisma/client"

const globalForPrisma = globalThis as typeof globalThis & {
  prisma?: PrismaClient
}

let prismaSingleton = globalForPrisma.prisma

export function getPrisma(): PrismaClient {
  if (prismaSingleton) return prismaSingleton

  const connectionString = process.env.DATABASE_URL
  if (!connectionString) {
    throw new Error("DATABASE_URL is required")
  }

  const adapter = new PrismaNeon({ connectionString })
  prismaSingleton = new PrismaClient({ adapter })

  if (process.env.NODE_ENV !== "production") {
    globalForPrisma.prisma = prismaSingleton
  }

  return prismaSingleton
}

```