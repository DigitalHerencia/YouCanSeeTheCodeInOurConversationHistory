---
title: 'The Maximal Template™ Domain Library\schemas\supportSchemas.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\schemas\supportSchemas.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.schemas.supportschemas.ts'
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
source_path: 'The Maximal Template™ Domain Library\schemas\supportSchemas.ts'
source_file: 'supportSchemas.ts'
source_sha256: '6480b3933be3816eda7ceb5f1ba3c1cc6cb8e3fca7393f7420e1c950449ea4e7'
generated: true
---

# `supportSchemas.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\schemas\supportSchemas.ts`
> SHA-256: `6480b3933be3816eda7ceb5f1ba3c1cc6cb8e3fca7393f7420e1c950449ea4e7`

```ts
import { z } from "zod";

export const createSupportTicketSchema = z.object({
  subject: z.string().trim().min(1).max(300),
  description: z.string().max(30_000).nullable().optional(),
  priority: z.enum(["LOW", "NORMAL", "HIGH", "URGENT"]).default("NORMAL"),
});

export const updateSupportTicketStatusSchema = z.object({
  ticketId: z.string().uuid(),
  status: z.enum([
    "OPEN",
    "IN_PROGRESS",
    "WAITING_ON_CUSTOMER",
    "WAITING_ON_INTERNAL",
    "RESOLVED",
    "CLOSED",
  ]),
  expectedVersion: z.number().int().positive(),
});

```