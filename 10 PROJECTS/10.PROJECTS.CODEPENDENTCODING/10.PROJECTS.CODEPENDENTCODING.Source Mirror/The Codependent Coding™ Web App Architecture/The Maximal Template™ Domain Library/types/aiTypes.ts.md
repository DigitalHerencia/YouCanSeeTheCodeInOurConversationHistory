---
title: 'The Maximal Template™ Domain Library\types\aiTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\types\aiTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.types.aitypes.ts'
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
source_path: 'The Maximal Template™ Domain Library\types\aiTypes.ts'
source_file: 'aiTypes.ts'
source_sha256: '4c0d0ffa5c38a2a8021ae7ed7d1dc2e0eafc99931edee79c42a024879fe9c606'
generated: true
---

# `aiTypes.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\types\aiTypes.ts`
> SHA-256: `4c0d0ffa5c38a2a8021ae7ed7d1dc2e0eafc99931edee79c42a024879fe9c606`

```ts
export interface AiGenerationDTO {
  id: string;
  provider: string;
  model: string;
  status: string;
  inputTokens: number;
  outputTokens: number;
  cost: string;
  errorCode: string | null;
  startedAt: string | null;
  completedAt: string | null;
  createdAt: string;
}
export interface AiUsageSummaryDTO {
  inputTokens: number;
  outputTokens: number;
  cost: string;
  generationCount: number;
}

```