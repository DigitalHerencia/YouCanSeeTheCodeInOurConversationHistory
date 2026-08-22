---
title: 'The Maximal Template™ Domain Library\schemas\socialSchemas.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\schemas\socialSchemas.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.schemas.socialschemas.ts'
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
source_path: 'The Maximal Template™ Domain Library\schemas\socialSchemas.ts'
source_file: 'socialSchemas.ts'
source_sha256: 'ca5802e664b23b1fba119bbfea55451d3550447d6e96393204d20a50e774197a'
generated: true
---

# `socialSchemas.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\schemas\socialSchemas.ts`
> SHA-256: `ca5802e664b23b1fba119bbfea55451d3550447d6e96393204d20a50e774197a`

```ts
import { z } from "zod";

export const createSocialPostSchema = z.object({
  title: z.string().trim().max(200).nullable().optional(),
  content: z.string().min(1).max(100_000),
  variants: z
    .array(
      z.object({
        socialAccountId: z.string().uuid(),
        content: z.string().min(1).max(100_000),
      }),
    )
    .min(1)
    .max(20),
});

export const scheduleSocialPostSchema = z.object({
  postId: z.string().uuid(),
  scheduledAt: z.coerce.date(),
  expectedVersion: z.number().int().positive(),
});

```