---
title: 'The Maximal Template™ Domain Library\lib\integrations\hugging-face\client.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\hugging-face\client.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.hugging-face.client.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\hugging-face\client.ts'
source_file: 'client.ts'
source_sha256: 'e8ce98761102c068aa759a494cdd9abf9c4a33c81f763f423d67cce8b12cc3ae'
generated: true
---

# `client.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\hugging-face\client.ts`
> SHA-256: `e8ce98761102c068aa759a494cdd9abf9c4a33c81f763f423d67cce8b12cc3ae`

```ts
import "server-only";

import { InferenceClient } from "@huggingface/inference";

let client: InferenceClient | undefined;

export function isHuggingFaceConfigured() {
  return Boolean(process.env.HUGGINGFACE_ACCESS_TOKEN?.trim());
}

export function getHuggingFaceClient() {
  const accessToken = process.env.HUGGINGFACE_ACCESS_TOKEN;
  if (!accessToken)
    throw new Error(
      "Hugging Face is not configured. Add HUGGINGFACE_ACCESS_TOKEN to .env.local.",
    );
  client ??= new InferenceClient(accessToken);
  return client;
}

```