---
title: 'The Maximal Template™ Domain Library\lib\db\transactions\complete-ai-generation.tx.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\transactions\complete-ai-generation.tx.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.transactions.complete-ai-generation.tx.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\transactions\complete-ai-generation.tx.ts'
source_file: 'complete-ai-generation.tx.ts'
source_sha256: '0b3533ab656e4eb8f542441dccba8daf8042bb6d6195cda104ff59c1c2c1f182'
generated: true
---

# `complete-ai-generation.tx.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\transactions\complete-ai-generation.tx.ts`
> SHA-256: `0b3533ab656e4eb8f542441dccba8daf8042bb6d6195cda104ff59c1c2c1f182`

```ts
import { Prisma } from "../../../generated/prisma/client";

import { aiGenerationSelect } from "../selects/ai.selects";
import { ConcurrencyConflictError, ResourceNotFoundError } from "./errors";

export async function completeAiGenerationTx(
  tx: Prisma.TransactionClient,
  input: {
    organizationId: string;
    generationId: string;
    output: Prisma.InputJsonValue;
    inputTokens: number;
    outputTokens: number;
    cost: string;
  },
) {
  const generation = await tx.aiGeneration.findFirst({
    where: {
      id: input.generationId,
      organizationId: input.organizationId,
    },
    select: {
      id: true,
      userId: true,
      provider: true,
      model: true,
      status: true,
    },
  });

  if (!generation) {
    throw new ResourceNotFoundError("AI generation");
  }

  if (
    generation.status === "SUCCEEDED" ||
    generation.status === "FAILED" ||
    generation.status === "CANCELED"
  ) {
    throw new ConcurrencyConflictError("AI generation");
  }

  const cost = new Prisma.Decimal(input.cost);

  const updated = await tx.aiGeneration.update({
    where: {
      id: generation.id,
    },
    data: {
      status: "SUCCEEDED",
      output: input.output,
      inputTokens: input.inputTokens,
      outputTokens: input.outputTokens,
      cost,
      completedAt: new Date(),
    },
    select: aiGenerationSelect,
  });

  await tx.aiUsageLedger.create({
    data: {
      organizationId: input.organizationId,
      userId: generation.userId,
      generationId: generation.id,
      provider: generation.provider,
      model: generation.model,
      inputTokens: input.inputTokens,
      outputTokens: input.outputTokens,
      cost,
    },
  });

  return updated;
}

```