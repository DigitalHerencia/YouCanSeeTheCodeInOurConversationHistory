---
title: 'The Maximal Template™ Domain Library\lib\workflows\marketing\calculateCampaignMetrics.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\marketing\calculateCampaignMetrics.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.marketing.calculatecampaignmetrics.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\marketing\calculateCampaignMetrics.ts'
source_file: 'calculateCampaignMetrics.ts'
source_sha256: 'accfe303fb51dfe80841c2d243e4fb3e724450ff361a7d6134fc944c3e34b69a'
generated: true
---

# `calculateCampaignMetrics.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\marketing\calculateCampaignMetrics.ts`
> SHA-256: `accfe303fb51dfe80841c2d243e4fb3e724450ff361a7d6134fc944c3e34b69a`

```ts
const rate = (numerator: number, denominator: number) =>
  denominator === 0 ? 0 : numerator / denominator;
export function calculateCampaignMetrics(input: {
  sent: number;
  delivered: number;
  opened: number;
  clicked: number;
  converted: number;
}) {
  return {
    deliveryRate: rate(input.delivered, input.sent),
    openRate: rate(input.opened, input.delivered),
    clickRate: rate(input.clicked, input.delivered),
    conversionRate: rate(input.converted, input.delivered),
  };
}

```