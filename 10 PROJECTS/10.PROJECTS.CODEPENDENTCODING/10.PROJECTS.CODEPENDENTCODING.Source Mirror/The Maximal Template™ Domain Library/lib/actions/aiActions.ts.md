---
title: 'The Maximal Template™ Domain Library\lib\actions\aiActions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\actions\aiActions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.actions.aiactions.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\actions\aiActions.ts'
source_file: 'aiActions.ts'
source_sha256: '2c312d4b80be33d0b7adf2b7bda20231b560c5eb5b3e8d5e902c84c48a2609e8'
generated: true
---

# `aiActions.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\actions\aiActions.ts`
> SHA-256: `2c312d4b80be33d0b7adf2b7bda20231b560c5eb5b3e8d5e902c84c48a2609e8`

```ts
"use server";

import {
  completeAiGenerationSchema,
  createAiGenerationSchema,
} from "../../schemas/aiSchemas";

import { requireIdentity } from "../auth/identity";
import { assertPermission } from "../authz/permissions";
import { toAiGenerationDTO } from "../db/dto/ai.dto";
import { aiGenerationSelect } from "../db/selects/ai.selects";
import { withTenantTransaction } from "../db/tenant";
import { completeAiGenerationTx } from "../db/transactions/complete-ai-generation.tx";

export async function createAiGenerationRecord(rawInput: unknown) {
  const input = createAiGenerationSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "ai:write");

    const record = await tx.aiGeneration.create({
      data: {
        organizationId: access.organizationId,
        userId: access.userId,
        provider: input.provider,
        model: input.model,
        status: "PENDING",
        input: input.input,
        requestHash: input.requestHash ?? null,
      },
      select: aiGenerationSelect,
    });

    return toAiGenerationDTO(record);
  });
}

/**
 * Call this only after the external model/provider request has completed.
 * Provider network I/O must not occur inside this database transaction.
 */
export async function completeAiGenerationRecord(rawInput: unknown) {
  const input = completeAiGenerationSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "ai:write");

    const record = await completeAiGenerationTx(tx, {
      organizationId: access.organizationId,
      generationId: input.generationId,
      output: input.output,
      inputTokens: input.inputTokens,
      outputTokens: input.outputTokens,
      cost: input.cost,
    });

    return toAiGenerationDTO(record);
  });
}

```