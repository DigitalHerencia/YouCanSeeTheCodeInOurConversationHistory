---
title: 'The Hipster Stack™ Technology Stack\template\lib\integrations\huggingface\inference.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\integrations\huggingface\inference.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.integrations.huggingface.inference.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\integrations\huggingface\inference.ts'
source_file: 'inference.ts'
source_sha256: '8dfdee957ee465334ee1d0dd1c0ea1f5da13a9472930da7125de2da10e0d1aa9'
generated: true
---

# `inference.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\integrations\huggingface\inference.ts`
> SHA-256: `8dfdee957ee465334ee1d0dd1c0ea1f5da13a9472930da7125de2da10e0d1aa9`

```ts
import "server-only"

import { getOptionalEnv, getRequiredEnv } from "@/lib/env"
import type { InferenceResult } from "@/types/capabilityTypes"

export async function runHuggingFaceInference(prompt: string): Promise<InferenceResult> {
  const model = getOptionalEnv("HUGGINGFACE_MODEL") ?? "openai/gpt-oss-120b"
  const response = await fetch("https://router.huggingface.co/v1/chat/completions", {
    method: "POST",
    headers: {
      authorization: `Bearer ${getRequiredEnv("HUGGINGFACE_TOKEN")}`,
      "content-type": "application/json",
    },
    body: JSON.stringify({ model, messages: [{ role: "user", content: prompt }] }),
    signal: AbortSignal.timeout(60_000),
  })
  const value: unknown = await response.json()
  const content = (value as { choices?: Array<{ message?: { content?: unknown } }> }).choices?.[0]
    ?.message?.content
  if (!response.ok || typeof content !== "string")
    throw new Error("Inference provider request failed.")
  return { model, text: content }
}

```