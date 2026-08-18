---
title: 'The Maximal Template™ Domain Library\prisma.config.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\prisma.config.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.prisma.config.ts'
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
source_path: 'The Maximal Template™ Domain Library\prisma.config.ts'
source_file: 'prisma.config.ts'
source_sha256: 'e35eda34791601897eebdb9dd4f5bb9c371145596b0226e719fefc5b563c7007'
generated: true
---

# `prisma.config.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\prisma.config.ts`
> SHA-256: `e35eda34791601897eebdb9dd4f5bb9c371145596b0226e719fefc5b563c7007`

```ts
import { config } from "dotenv";

import { defineConfig, env } from "prisma/config";

config({ path: ".env.local", quiet: true });
config({ quiet: true });

export default defineConfig({
  schema: "prisma/schema.prisma",
  migrations: {
    path: "prisma/migrations",
    seed: "tsx prisma/seed.ts",
  },
  datasource: {
    // Neon recommends a direct/non-pooled connection for migrations.
    url: env("DATABASE_NO_POOLING"),
  },
});

```