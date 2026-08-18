---
title: 'The Maximal Template™ Domain Library\features\marketing\campaignsFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\marketing\campaignsFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.marketing.campaignsfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\marketing\campaignsFeature.tsx'
source_file: 'campaignsFeature.tsx'
source_sha256: '83cad23fc5edfccf0c1db1c7d97172a8083a96395832fbc32dda6709441bc3b9'
generated: true
---

# `campaignsFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\marketing\campaignsFeature.tsx`
> SHA-256: `83cad23fc5edfccf0c1db1c7d97172a8083a96395832fbc32dda6709441bc3b9`

```tsx
import {
  DataTableBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getCampaigns } from "@/lib/fetchers/marketingFetchers";
export async function CampaignsFeature() {
  const campaigns = await getCampaigns();
  return (
    <div className="space-y-6">
      <PageHeaderBlock eyebrow="Marketing" title="Campaigns" />
      <DataTableBlock
        columns={[
          { key: "name", label: "Campaign" },
          { key: "audience", label: "Audience" },
          { key: "status", label: "Status" },
          { key: "schedule", label: "Schedule" },
        ]}
        rows={campaigns.map((campaign) => ({
          id: campaign.id,
          cells: {
            name: campaign.name,
            audience: campaign.audience?.name ?? null,
            status: campaign.status,
            schedule: campaign.scheduledAt
              ? new Date(campaign.scheduledAt).toLocaleString()
              : null,
          },
        }))}
      />
    </div>
  );
}

```