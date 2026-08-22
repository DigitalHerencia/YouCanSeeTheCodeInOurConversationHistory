---
title: 'The Maximal Template™ Domain Library\schemas\aiSchemas.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\schemas\aiSchemas.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.schemas.aischemas.ts'
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
source_path: 'The Maximal Template™ Domain Library\schemas\aiSchemas.ts'
source_file: 'aiSchemas.ts'
source_sha256: '2a63bc8281b2b5724b00f5ce4a400a76c52b10e62a000631721c71d8f35fb196'
generated: true
---

# `aiSchemas.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\schemas\aiSchemas.ts`
> SHA-256: `2a63bc8281b2b5724b00f5ce4a400a76c52b10e62a000631721c71d8f35fb196`

```ts
import { z } from "zod";

export const createAiGenerationSchema = z.object({
  provider: z.string().trim().min(1).max(100),
  model: z.string().trim().min(1).max(200),
  input: z.record(z.string(), z.json()),
  requestHash: z.string().max(255).nullable().optional(),
});

export const completeAiGenerationSchema = z.object({
  generationId: z.string().uuid(),
  output: z.record(z.string(), z.json()),
  inputTokens: z.number().int().nonnegative(),
  outputTokens: z.number().int().nonnegative(),
  cost: z.string().regex(/^\d+(\.\d{1,8})?$/),
});

```