---
title: 'The Maximal Template™ Domain Library\lib\db\selects\ai.selects.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\selects\ai.selects.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.selects.ai.selects.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\selects\ai.selects.ts'
source_file: 'ai.selects.ts'
source_sha256: '4d75ee6167e863018eb2dd2c97f0ac4e547582370bdce6f5b926ec40fcafa96b'
generated: true
---

# `ai.selects.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\selects\ai.selects.ts`
> SHA-256: `4d75ee6167e863018eb2dd2c97f0ac4e547582370bdce6f5b926ec40fcafa96b`

```ts
import type { Prisma } from "../../../generated/prisma/client";

export const aiGenerationSelect = {
  id: true,
  provider: true,
  model: true,
  status: true,
  inputTokens: true,
  outputTokens: true,
  cost: true,
  errorCode: true,
  startedAt: true,
  completedAt: true,
  createdAt: true,
} satisfies Prisma.AiGenerationSelect;

export type AiGenerationRecord = Prisma.AiGenerationGetPayload<{
  select: typeof aiGenerationSelect;
}>;

```