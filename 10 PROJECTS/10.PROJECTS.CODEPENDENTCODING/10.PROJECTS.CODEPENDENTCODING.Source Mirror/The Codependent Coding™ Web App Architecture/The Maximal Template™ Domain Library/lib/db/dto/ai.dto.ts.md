---
title: 'The Maximal Template™ Domain Library\lib\db\dto\ai.dto.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\dto\ai.dto.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.dto.ai.dto.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\dto\ai.dto.ts'
source_file: 'ai.dto.ts'
source_sha256: '64951893260033b14fdaf852c36dd7662560e167890a352adcf4899da7f15ba4'
generated: true
---

# `ai.dto.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\dto\ai.dto.ts`
> SHA-256: `64951893260033b14fdaf852c36dd7662560e167890a352adcf4899da7f15ba4`

```ts
import type {
  AiGenerationDTO,
  AiUsageSummaryDTO,
} from "../../../types/aiTypes";
import type { AiGenerationRecord } from "../selects/ai.selects";

export function toAiGenerationDTO(record: AiGenerationRecord): AiGenerationDTO {
  return {
    id: record.id,
    provider: record.provider,
    model: record.model,
    status: record.status,
    inputTokens: record.inputTokens,
    outputTokens: record.outputTokens,
    cost: record.cost.toString(),
    errorCode: record.errorCode,
    startedAt: record.startedAt?.toISOString() ?? null,
    completedAt: record.completedAt?.toISOString() ?? null,
    createdAt: record.createdAt.toISOString(),
  };
}

export function toAiUsageSummaryDTO(input: {
  inputTokens: number;
  outputTokens: number;
  cost: string;
  generationCount: number;
}): AiUsageSummaryDTO {
  return {
    inputTokens: input.inputTokens,
    outputTokens: input.outputTokens,
    cost: input.cost,
    generationCount: input.generationCount,
  };
}

```