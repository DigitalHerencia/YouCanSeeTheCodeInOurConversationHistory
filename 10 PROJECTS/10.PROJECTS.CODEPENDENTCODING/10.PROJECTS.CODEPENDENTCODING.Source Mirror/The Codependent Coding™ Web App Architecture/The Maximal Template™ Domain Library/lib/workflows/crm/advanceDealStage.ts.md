---
title: 'The Maximal Template™ Domain Library\lib\workflows\crm\advanceDealStage.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\crm\advanceDealStage.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.crm.advancedealstage.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\crm\advanceDealStage.ts'
source_file: 'advanceDealStage.ts'
source_sha256: '7768c8c37be86cfa9fcfb5153edc281d7c71660b19d95f0f1ee71edcec8f3aa2'
generated: true
---

# `advanceDealStage.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\crm\advanceDealStage.ts`
> SHA-256: `7768c8c37be86cfa9fcfb5153edc281d7c71660b19d95f0f1ee71edcec8f3aa2`

```ts
import type { CrmDealStage } from "../../../generated/prisma/client";

const transitions: Record<CrmDealStage, readonly CrmDealStage[]> = {
  LEAD: ["QUALIFIED", "LOST"],
  QUALIFIED: ["PROPOSAL", "LOST"],
  PROPOSAL: ["NEGOTIATION", "WON", "LOST"],
  NEGOTIATION: ["WON", "LOST"],
  WON: [],
  LOST: [],
};

export function advanceDealStage(current: CrmDealStage, next: CrmDealStage) {
  if (current !== next && !transitions[current].includes(next))
    throw new Error(`A deal cannot move from ${current} to ${next}.`);
  return { stage: next, terminal: next === "WON" || next === "LOST" };
}

```