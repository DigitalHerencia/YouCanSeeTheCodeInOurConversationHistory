---
title: 'The Maximal Template™ Domain Library\types\marketingTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\types\marketingTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.types.marketingtypes.ts'
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
source_path: 'The Maximal Template™ Domain Library\types\marketingTypes.ts'
source_file: 'marketingTypes.ts'
source_sha256: '0c59fdb461b1ece9df96ab59fb02462bb7667220afa84a0e287875bec10fa431'
generated: true
---

# `marketingTypes.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\types\marketingTypes.ts`
> SHA-256: `0c59fdb461b1ece9df96ab59fb02462bb7667220afa84a0e287875bec10fa431`

```ts
export interface CampaignDTO {
  id: string;
  name: string;
  description: string | null;
  status: string;
  scheduledAt: string | null;
  startedAt: string | null;
  completedAt: string | null;
  version: number;
  audience: { id: string; name: string } | null;
  stepCount: number;
  createdAt: string;
  updatedAt: string;
}
export interface AudienceDTO {
  id: string;
  name: string;
  status: string;
  createdAt: string;
  updatedAt: string;
}

```