---
title: 'The Maximal Template™ Domain Library\features\marketing\audiencesFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\marketing\audiencesFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.marketing.audiencesfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\marketing\audiencesFeature.tsx'
source_file: 'audiencesFeature.tsx'
source_sha256: 'f662ffcf000b2c574e8dd19e383172bf1bb6bd57a4f38feac5da6cf4c6338436'
generated: true
---

# `audiencesFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\marketing\audiencesFeature.tsx`
> SHA-256: `f662ffcf000b2c574e8dd19e383172bf1bb6bd57a4f38feac5da6cf4c6338436`

```tsx
import {
  DataTableBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getAudiences } from "@/lib/fetchers/marketingFetchers";
export async function AudiencesFeature() {
  const audiences = await getAudiences();
  return (
    <div className="space-y-6">
      <PageHeaderBlock eyebrow="Marketing" title="Audiences" />
      <DataTableBlock
        columns={[
          { key: "name", label: "Audience" },
          { key: "status", label: "Status" },
          { key: "updated", label: "Updated" },
        ]}
        rows={audiences.map((audience) => ({
          id: audience.id,
          cells: {
            name: audience.name,
            status: audience.status,
            updated: new Date(audience.updatedAt).toLocaleDateString(),
          },
        }))}
      />
    </div>
  );
}

```