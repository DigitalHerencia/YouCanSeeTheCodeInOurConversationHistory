---
title: 'The Maximal Template™ Domain Library\features\marketing\marketingAnalyticsFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\marketing\marketingAnalyticsFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.marketing.marketinganalyticsfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\marketing\marketingAnalyticsFeature.tsx'
source_file: 'marketingAnalyticsFeature.tsx'
source_sha256: 'b58ea0ee5932987d2fc8cac8a8d1350be4c77063a533e093fa16dafc19b903b0'
generated: true
---

# `marketingAnalyticsFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\marketing\marketingAnalyticsFeature.tsx`
> SHA-256: `b58ea0ee5932987d2fc8cac8a8d1350be4c77063a533e093fa16dafc19b903b0`

```tsx
import {
  MetricGridBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getCampaigns } from "@/lib/fetchers/marketingFetchers";
export async function MarketingAnalyticsFeature() {
  const campaigns = await getCampaigns(100);
  return (
    <div className="space-y-6">
      <PageHeaderBlock eyebrow="Marketing" title="Campaign analytics" />
      <MetricGridBlock
        metrics={[
          { label: "Campaigns", value: String(campaigns.length) },
          {
            label: "Active",
            value: String(
              campaigns.filter((campaign) => campaign.status === "ACTIVE")
                .length,
            ),
          },
          {
            label: "Scheduled",
            value: String(
              campaigns.filter((campaign) => campaign.status === "SCHEDULED")
                .length,
            ),
          },
          {
            label: "Completed",
            value: String(
              campaigns.filter((campaign) => campaign.status === "COMPLETED")
                .length,
            ),
          },
        ]}
      />
    </div>
  );
}

```