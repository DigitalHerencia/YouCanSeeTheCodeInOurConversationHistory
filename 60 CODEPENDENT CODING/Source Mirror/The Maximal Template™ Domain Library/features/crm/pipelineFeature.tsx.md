---
title: 'The Maximal Template™ Domain Library\features\crm\pipelineFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\crm\pipelineFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.crm.pipelinefeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\crm\pipelineFeature.tsx'
source_file: 'pipelineFeature.tsx'
source_sha256: '0fd69fe7394d48e2904dd277c09c893d0993ba87da640f6a3997fcfb9a8cf016'
generated: true
---

# `pipelineFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\crm\pipelineFeature.tsx`
> SHA-256: `0fd69fe7394d48e2904dd277c09c893d0993ba87da640f6a3997fcfb9a8cf016`

```tsx
import {
  KanbanBoardBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getCrmDeals } from "@/lib/fetchers/crmFetchers";

const stages = [
  "LEAD",
  "QUALIFIED",
  "PROPOSAL",
  "NEGOTIATION",
  "WON",
  "LOST",
] as const;

export async function PipelineFeature() {
  const deals = await getCrmDeals(100);
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="CRM"
        title="Pipeline"
        description="Deals are scoped to the active organization before they reach this feature."
      />
      <KanbanBoardBlock
        columns={stages.map((stage) => ({
          id: stage,
          title: stage.replaceAll("_", " "),
          items: deals
            .filter((deal) => deal.stage === stage)
            .map((deal) => ({
              id: deal.id,
              title: deal.name,
              detail: `${deal.currency} ${deal.value} · ${deal.probability}%`,
              href: `/crm/accounts/${deal.account.id}`,
            })),
        }))}
      />
    </div>
  );
}

```