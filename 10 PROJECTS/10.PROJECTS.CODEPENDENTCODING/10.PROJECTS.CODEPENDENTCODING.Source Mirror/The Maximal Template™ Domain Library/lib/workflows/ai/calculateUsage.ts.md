---
title: 'The Maximal Template™ Domain Library\lib\workflows\ai\calculateUsage.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\ai\calculateUsage.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.ai.calculateusage.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\ai\calculateUsage.ts'
source_file: 'calculateUsage.ts'
source_sha256: 'aa57a7dc7bdb375b8674611a2be38c474ab2be50dcd8a408444c567f857fc82e'
generated: true
---

# `calculateUsage.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\ai\calculateUsage.ts`
> SHA-256: `aa57a7dc7bdb375b8674611a2be38c474ab2be50dcd8a408444c567f857fc82e`

```ts
export interface AiUsageItem {
  inputTokens: number;
  outputTokens: number;
  cost: string;
}

export function calculateUsage(items: AiUsageItem[]) {
  return items.reduce(
    (total, item) => ({
      inputTokens: total.inputTokens + item.inputTokens,
      outputTokens: total.outputTokens + item.outputTokens,
      cost: total.cost + Number(item.cost),
      generationCount: total.generationCount + 1,
    }),
    { inputTokens: 0, outputTokens: 0, cost: 0, generationCount: 0 },
  );
}

```