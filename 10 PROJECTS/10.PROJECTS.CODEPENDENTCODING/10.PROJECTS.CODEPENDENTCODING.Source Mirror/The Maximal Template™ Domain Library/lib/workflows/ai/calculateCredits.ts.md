---
title: 'The Maximal Template™ Domain Library\lib\workflows\ai\calculateCredits.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\ai\calculateCredits.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.ai.calculatecredits.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\ai\calculateCredits.ts'
source_file: 'calculateCredits.ts'
source_sha256: 'a708bcb180f25ee5bedece4e3f3e5be9e06b22ad4033c9d5849e7d8dbcfa3b32'
generated: true
---

# `calculateCredits.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\ai\calculateCredits.ts`
> SHA-256: `a708bcb180f25ee5bedece4e3f3e5be9e06b22ad4033c9d5849e7d8dbcfa3b32`

```ts
const TICKS_PER_US_DOLLAR = 10_000_000_000n;

export function costTicksToUsd(costTicks: number | bigint): string {
  const ticks = BigInt(costTicks);
  if (ticks < 0n) throw new Error("Provider cost cannot be negative.");
  const whole = ticks / TICKS_PER_US_DOLLAR;
  const fraction = (ticks % TICKS_PER_US_DOLLAR).toString().padStart(10, "0");
  return `${whole}.${fraction.slice(0, 8)}`;
}

```