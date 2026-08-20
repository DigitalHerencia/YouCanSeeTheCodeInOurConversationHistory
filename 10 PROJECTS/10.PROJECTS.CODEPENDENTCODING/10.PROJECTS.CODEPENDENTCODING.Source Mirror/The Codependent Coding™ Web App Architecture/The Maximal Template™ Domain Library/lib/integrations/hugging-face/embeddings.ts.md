---
title: 'The Maximal Template™ Domain Library\lib\integrations\hugging-face\embeddings.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\hugging-face\embeddings.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.hugging-face.embeddings.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\hugging-face\embeddings.ts'
source_file: 'embeddings.ts'
source_sha256: 'ca63d974b61faef22c246fc51591fcbc005712d5f9ce308d799be29de4111445'
generated: true
---

# `embeddings.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\hugging-face\embeddings.ts`
> SHA-256: `ca63d974b61faef22c246fc51591fcbc005712d5f9ce308d799be29de4111445`

```ts
import "server-only";

import { getHuggingFaceClient } from "./client";

export function createHuggingFaceEmbedding(input: {
  model: string;
  text: string;
}) {
  return getHuggingFaceClient().featureExtraction({
    model: input.model,
    inputs: input.text,
  });
}

```