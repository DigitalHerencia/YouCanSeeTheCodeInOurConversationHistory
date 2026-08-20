---
title: 'The Hipster Stack™ Technology Stack\template\prisma.config.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\prisma.config.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.prisma.config.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\prisma.config.ts'
source_file: 'prisma.config.ts'
source_sha256: '37dcdf61029096b7309399a1fb9a4b2e9a1554ac52ac97fca949012032b94e0f'
generated: true
---

# `prisma.config.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\prisma.config.ts`
> SHA-256: `37dcdf61029096b7309399a1fb9a4b2e9a1554ac52ac97fca949012032b94e0f`

```ts
import { config } from "dotenv"
import { defineConfig } from "prisma/config"

if (process.env.VIBES_SKIP_DOTENV !== "1") {
  config({ path: ".env" })
  config({ path: ".env.local", override: true })
}

const migrationDatabaseUrl =
  process.env.DIRECT_DATABASE_URL ?? process.env.DATABASE_URL_UNPOOLED ?? process.env.DATABASE_URL

export default defineConfig({
  schema: "prisma/schema.prisma",
  migrations: {
    path: "prisma/migrations",
    seed: "tsx prisma/seed.ts",
  },
  ...(migrationDatabaseUrl
    ? {
        datasource: {
          url: migrationDatabaseUrl,
          ...(process.env.SHADOW_DATABASE_URL
            ? { shadowDatabaseUrl: process.env.SHADOW_DATABASE_URL }
            : {}),
        },
      }
    : {}),
})

```