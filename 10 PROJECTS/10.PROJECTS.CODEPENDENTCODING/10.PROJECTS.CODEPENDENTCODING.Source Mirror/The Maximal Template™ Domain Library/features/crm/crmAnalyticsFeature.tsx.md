---
title: 'The Maximal Template™ Domain Library\features\crm\crmAnalyticsFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\crm\crmAnalyticsFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.crm.crmanalyticsfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\crm\crmAnalyticsFeature.tsx'
source_file: 'crmAnalyticsFeature.tsx'
source_sha256: '2a4311fa624f44b655d24912863eae73636cfe68de675227d7b26e73ce5fc031'
generated: true
---

# `crmAnalyticsFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\crm\crmAnalyticsFeature.tsx`
> SHA-256: `2a4311fa624f44b655d24912863eae73636cfe68de675227d7b26e73ce5fc031`

```tsx
import {
  MetricGridBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getCrmDeals } from "@/lib/fetchers/crmFetchers";

export async function CrmAnalyticsFeature() {
  const deals = await getCrmDeals(100);
  const pipeline = deals.reduce((total, deal) => total + Number(deal.value), 0);
  const weighted = deals.reduce(
    (total, deal) => total + (Number(deal.value) * deal.probability) / 100,
    0,
  );
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="CRM"
        title="Pipeline analytics"
        description="Metrics derive only from authorized, tenant-scoped deal DTOs."
      />
      <MetricGridBlock
        metrics={[
          {
            label: "Open deals",
            value: String(
              deals.filter((deal) => !["WON", "LOST"].includes(deal.stage))
                .length,
            ),
          },
          {
            label: "Pipeline value",
            value: pipeline.toLocaleString(undefined, {
              maximumFractionDigits: 2,
            }),
          },
          {
            label: "Weighted value",
            value: weighted.toLocaleString(undefined, {
              maximumFractionDigits: 2,
            }),
          },
          {
            label: "Won",
            value: String(deals.filter((deal) => deal.stage === "WON").length),
          },
        ]}
      />
    </div>
  );
}

```