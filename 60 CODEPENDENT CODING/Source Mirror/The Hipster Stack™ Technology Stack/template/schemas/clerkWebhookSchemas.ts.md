---
title: 'The Hipster Stack™ Technology Stack\template\schemas\clerkWebhookSchemas.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\schemas\clerkWebhookSchemas.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.schemas.clerkwebhookschemas.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\schemas\clerkWebhookSchemas.ts'
source_file: 'clerkWebhookSchemas.ts'
source_sha256: '18d6b48aa72eca51390f1ddfc483395a2bd822d39f645e8eef186e479a941292'
generated: true
---

# `clerkWebhookSchemas.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\schemas\clerkWebhookSchemas.ts`
> SHA-256: `18d6b48aa72eca51390f1ddfc483395a2bd822d39f645e8eef186e479a941292`

```ts
import { z } from "zod"

const clerkEmailSchema = z.object({
  id: z.string().min(1).max(255).optional(),
  email_address: z.string().email().max(320).optional(),
})

export const clerkWebhookEnvelopeSchema = z.object({
  type: z.string().min(1).max(120),
  data: z.record(z.string(), z.unknown()),
})

const clerkUserDataSchema = z.object({
  id: z.string().min(1).max(255),
  email_addresses: z.array(clerkEmailSchema).optional(),
  primary_email_address_id: z.string().max(255).nullable().optional(),
  first_name: z.string().max(120).nullable().optional(),
  last_name: z.string().max(120).nullable().optional(),
  username: z.string().max(120).nullable().optional(),
  updated_at: z.number().int().nonnegative().max(8_640_000_000_000_000),
})

export const clerkUserWebhookSchema = z.discriminatedUnion("type", [
  z.object({ type: z.enum(["user.created", "user.updated"]), data: clerkUserDataSchema }),
  z.object({
    type: z.literal("user.deleted"),
    data: z.object({ id: z.string().min(1).max(255) }),
  }),
])

```