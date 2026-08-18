---
title: 'The Maximal Template™ Domain Library\features\admin\recordsFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\admin\recordsFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.admin.recordsfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\admin\recordsFeature.tsx'
source_file: 'recordsFeature.tsx'
source_sha256: 'f4bc6241e45a796373aed0d3ef3765bc20a68239b17a63604585806af5f1e8b5'
generated: true
---

# `recordsFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\admin\recordsFeature.tsx`
> SHA-256: `f4bc6241e45a796373aed0d3ef3765bc20a68239b17a63604585806af5f1e8b5`

```tsx
import {
  DataTableBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getAdminRecordSummary } from "@/lib/fetchers/adminFetchers";

// Features orchestrate blocks and lib helpers; they never import raw UI primitives.
export async function RecordsFeature() {
  const records = await getAdminRecordSummary();
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="Administration"
        title="Record inventory"
        description="Read-only tenant-scoped counts; this is not an unrestricted generic data editor."
      />
      <DataTableBlock
        columns={[
          { key: "resource", label: "Resource" },
          { key: "count", label: "Records" },
        ]}
        rows={records.map((record) => ({
          id: record.resource,
          cells: {
            resource: record.resource,
            count: record.count.toLocaleString(),
          },
        }))}
      />
    </div>
  );
}

```