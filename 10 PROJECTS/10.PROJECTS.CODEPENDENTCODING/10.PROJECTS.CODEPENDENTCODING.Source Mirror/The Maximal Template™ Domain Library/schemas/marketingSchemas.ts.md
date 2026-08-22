---
title: 'The Maximal Template™ Domain Library\schemas\marketingSchemas.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\schemas\marketingSchemas.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.schemas.marketingschemas.ts'
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
source_path: 'The Maximal Template™ Domain Library\schemas\marketingSchemas.ts'
source_file: 'marketingSchemas.ts'
source_sha256: 'c03be70355e9c394de135892d5e064a1c1b533e682e7d98cebe3824c77078672'
generated: true
---

# `marketingSchemas.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\schemas\marketingSchemas.ts`
> SHA-256: `c03be70355e9c394de135892d5e064a1c1b533e682e7d98cebe3824c77078672`

```ts
import { z } from "zod";

export const createCampaignSchema = z.object({
  audienceId: z.string().uuid().nullable().optional(),
  name: z.string().trim().min(1).max(200),
  description: z.string().max(10_000).nullable().optional(),
  scheduledAt: z.coerce.date().nullable().optional(),
});

export const updateCampaignStatusSchema = z.object({
  campaignId: z.string().uuid(),
  status: z.enum([
    "DRAFT",
    "SCHEDULED",
    "ACTIVE",
    "PAUSED",
    "COMPLETED",
    "CANCELED",
  ]),
  expectedVersion: z.number().int().positive(),
});

```