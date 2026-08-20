---
title: 'The Maximal Template™ Domain Library\app\api\ai\generate\route.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\api\ai\generate\route.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.api.ai.generate.route.ts'
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
source_path: 'The Maximal Template™ Domain Library\app\api\ai\generate\route.ts'
source_file: 'route.ts'
source_sha256: 'f92d252495b391d98b0854a074a43209b9019c485a0dd6f87902456bc836fa99'
generated: true
---

# `route.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\api\ai\generate\route.ts`
> SHA-256: `f92d252495b391d98b0854a074a43209b9019c485a0dd6f87902456bc836fa99`

```ts
import { createHash } from "node:crypto";

import { NextResponse } from "next/server";
import { z } from "zod";

import type { AuthenticatedIdentity } from "@/types/access";

import { requireIdentity } from "@/lib/auth/identity";
import { assertPermission } from "@/lib/authz/permissions";
import { completeAiGenerationTx } from "@/lib/db/transactions/complete-ai-generation.tx";
import { withTenantTransaction } from "@/lib/db/tenant";
import {
  generateHuggingFaceText,
  getConfiguredHuggingFaceModel,
} from "@/lib/integrations/hugging-face/inference";
import { enforceRateLimit } from "@/lib/workflows/ai/enforceRateLimit";

const requestSchema = z.object({
  prompt: z.string().trim().min(1).max(100_000),
});

export async function POST(request: Request) {
  let generationId: string | null = null;
  let identity: AuthenticatedIdentity | null = null;
  try {
    const { prompt } = requestSchema.parse(await request.json());
    identity = await requireIdentity();
    const model = getConfiguredHuggingFaceModel();
    generationId = await withTenantTransaction(identity, async (tx, access) => {
      assertPermission(access, "ai:write");
      const recentGenerationCount = await tx.aiGeneration.count({
        where: {
          organizationId: access.organizationId,
          userId: access.userId,
          createdAt: { gte: new Date(Date.now() - 60_000) },
        },
      });
      enforceRateLimit({ recentGenerationCount, limit: 5 });
      const record = await tx.aiGeneration.create({
        data: {
          organizationId: access.organizationId,
          userId: access.userId,
          provider: "hugging-face",
          model,
          status: "RUNNING",
          input: { prompt },
          requestHash: createHash("sha256")
            .update(`${model}\0${prompt}`)
            .digest("hex"),
          startedAt: new Date(),
        },
        select: { id: true },
      });
      return record.id;
    });

    const result = await generateHuggingFaceText({ prompt, model });
    await withTenantTransaction(identity, async (tx, access) => {
      assertPermission(access, "ai:write");
      await completeAiGenerationTx(tx, {
        organizationId: access.organizationId,
        generationId: generationId!,
        output: { text: result.generated_text },
        inputTokens: 0,
        outputTokens: 0,
        cost: "0",
      });
    });

    return NextResponse.json({
      generationId,
      text: result.generated_text,
      model,
    });
  } catch (cause) {
    const message =
      cause instanceof Error ? cause.message : "AI generation failed.";
    if (identity && generationId) {
      await withTenantTransaction(identity, async (tx, access) => {
        await tx.aiGeneration.updateMany({
          where: {
            id: generationId!,
            organizationId: access.organizationId,
            status: { in: ["PENDING", "RUNNING"] },
          },
          data: {
            status: "FAILED",
            errorCode: message.slice(0, 255),
            completedAt: new Date(),
          },
        });
      });
    }
    return NextResponse.json({ error: message, generationId }, { status: 400 });
  }
}

```