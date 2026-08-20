---
title: 'The Maximal Template™ Domain Library\lib\integrations\hugging-face\inference.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\hugging-face\inference.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.hugging-face.inference.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\hugging-face\inference.ts'
source_file: 'inference.ts'
source_sha256: '639212547e3684974a369b5b5d904e180d05019a1be99dec39b56819d6efc88d'
generated: true
---

# `inference.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\hugging-face\inference.ts`
> SHA-256: `639212547e3684974a369b5b5d904e180d05019a1be99dec39b56819d6efc88d`

```ts
import "server-only";

import { getHuggingFaceClient } from "./client";

export function generateHuggingFaceText(input: {
  model: string;
  prompt: string;
  maxTokens?: number;
}) {
  return getHuggingFaceClient().textGeneration({
    model: input.model,
    inputs: input.prompt,
    parameters: {
      max_new_tokens: input.maxTokens ?? 512,
      return_full_text: false,
    },
  });
}

export function getConfiguredHuggingFaceModel() {
  return (
    process.env.HUGGINGFACE_TEXT_MODEL?.trim() || "HuggingFaceH4/zephyr-7b-beta"
  );
}

```