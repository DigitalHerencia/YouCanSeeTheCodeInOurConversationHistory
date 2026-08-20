---
title: Maximal Template — prisma.config.ts
type: simple
scope: file
project: Codependent Coding
domain: configuration
artifact: prisma.config.ts
kind: simple
namespace: codependentcoding.config.prisma.simple
status: review
authority: working-note
parent: "[[codependentcoding.simples.database.map]]"
depends_on:
  - "[[The Maximal Template™ Backlog]]"
supersedes: []
tags:
  - codependent-coding/simples
  - simples/config
  - prisma/migrations
  - database/config
  - status/review
created: 2026-08-18
updated: 2026-08-19
simple_type: config
layer: prisma-lifecycle
source_path: prisma.config.ts
public_source_path: prisma.config.ts
hardened_source_path: prisma.config.ts
source_mirror: "[[10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Source Mirror/The Codependent Coding™ Web App Architecture/The Maximal Template™ Domain Library/prisma.config.ts|source mirror — prisma.config.ts]]"
canonicalization_status: review
owner_approval: pending
public_implementation_status: observed
hardened_implementation_status: proposed
generation_status: invariant
providers:
  - Prisma
  - Neon
ontologies: []
uses: []
requires:
  - DATABASE_NO_POOLING
permits:
  - privileged migration connection
conditional: []
prohibits:
  - client-side exposure of database credentials
substitutes: []
variants: []
tests:
  - prisma validate
validation:
  - migration path
  - seed command
  - datasource URL
---

# `prisma.config.ts`

## Codependent Coding Knowledge

### Canonical Definition

This root config owns Prisma's schema/migration/seed lifecycle configuration and deliberately uses the direct/non-pooled migration connection rather than the application runtime connection.

### Responsibility

- Point Prisma at `prisma/schema.prisma`.
- Point migration tooling at `prisma/migrations`.
- Define the seed command.
- Use the migration/direct database credential.

### Contract & Invariants

- Runtime application traffic uses `DATABASE_URL` through [[codependentcoding.database.client.simple]].
- Migration/admin lifecycle uses `DATABASE_NO_POOLING` in the observed source.
- In the hardened environment, the migration credential may be privileged while runtime credentials must not bypass RLS.

### Boundaries / Anti-Patterns

- Do not route ordinary application traffic through the migration/admin credential.
- Do not move Prisma schema/migrations/seed into `lib/db` just to make the tree look symmetrical.
- Never expose either credential to client-side code.

## Simple Properties

### Relationships

- Complements [[codependentcoding.database.client.simple]] by separating migration and runtime connection responsibilities.
- Governs migrations including [[codependentcoding.prisma.application-owned-tenancy.simple]].

### Generation Disposition

**Invariant root configuration.** Generated applications receive the supported Prisma lifecycle; users do not toggle database security architecture.

## Implementation

### Public Demo Golden Prototype

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

### Hardened Golden Prototype

The code shape can remain identical if the environment contract is correct.

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
    // Privileged/direct connection is migration lifecycle only.
    url: env("DATABASE_NO_POOLING"),
  },
});
```

### Hardening Delta

- `DATABASE_NO_POOLING`: owner/admin migration lifecycle credential.
- `DATABASE_URL`: separate restricted runtime application role.
- Validate both contracts in environment/schema documentation and deployment setup.

## Validation & Evidence

- [x] Current source mirrored.
- [x] Direct/non-pooled migration connection already separated from runtime `DATABASE_URL` in source shape.
- [ ] Deployment credentials verified to satisfy privileged-vs-restricted role separation.
- [ ] Prisma validation and migration lifecycle verified under final generated environment.
- [ ] Owner approves canonical contract.

## Links

- [[codependentcoding.simples.database.map]]
- [[codependentcoding.database.client.simple]]
- [[codependentcoding.prisma.application-owned-tenancy.simple]]
- [[10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/10.PROJECTS.CODEPENDENTCODING.Source Mirror/The Codependent Coding™ Web App Architecture/The Maximal Template™ Domain Library/prisma.config.ts|source mirror]]

## Backlinks

```dataview
TABLE simple_type AS "Type", layer AS "Layer"
FROM [[]]
SORT file.name ASC
```
