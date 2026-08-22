---
title: 'The Maximal Template™ Domain Library\lib\workflows\ai\enforceRateLimit.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\ai\enforceRateLimit.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.ai.enforceratelimit.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\ai\enforceRateLimit.ts'
source_file: 'enforceRateLimit.ts'
source_sha256: 'd58e4470b21d8ef86c0a96624502ce992accd7fcc068066d6a293be19d91c997'
generated: true
---

# `enforceRateLimit.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\ai\enforceRateLimit.ts`
> SHA-256: `d58e4470b21d8ef86c0a96624502ce992accd7fcc068066d6a293be19d91c997`

```ts
export class AiRateLimitError extends Error {
  constructor() {
    super("The AI generation rate limit has been reached. Try again later.");
    this.name = "AiRateLimitError";
  }
}

export function enforceRateLimit({
  recentGenerationCount,
  limit,
}: {
  recentGenerationCount: number;
  limit: number;
}) {
  if (!Number.isInteger(limit) || limit < 1) {
    throw new Error("The AI rate limit must be a positive integer.");
  }
  if (recentGenerationCount >= limit) throw new AiRateLimitError();
}

```