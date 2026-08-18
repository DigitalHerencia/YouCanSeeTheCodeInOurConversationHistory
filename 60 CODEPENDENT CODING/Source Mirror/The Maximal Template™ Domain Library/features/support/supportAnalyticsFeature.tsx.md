---
title: 'The Maximal Template™ Domain Library\features\support\supportAnalyticsFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\support\supportAnalyticsFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.support.supportanalyticsfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\support\supportAnalyticsFeature.tsx'
source_file: 'supportAnalyticsFeature.tsx'
source_sha256: '3546dc66100838abe69dd93695d9143b31de5342bd62e77bfa9f73f9b1d092dc'
generated: true
---

# `supportAnalyticsFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\support\supportAnalyticsFeature.tsx`
> SHA-256: `3546dc66100838abe69dd93695d9143b31de5342bd62e77bfa9f73f9b1d092dc`

```tsx
import {
  MetricGridBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getSupportInbox } from "@/lib/fetchers/supportFetchers";

export async function SupportAnalyticsFeature() {
  const tickets = await getSupportInbox(200);
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="Support"
        title="Inbox analytics"
        description="Counts derive from authorized active-tenant tickets."
      />
      <MetricGridBlock
        metrics={[
          { label: "Open workload", value: String(tickets.length) },
          {
            label: "Urgent",
            value: String(
              tickets.filter((ticket) => ticket.priority === "URGENT").length,
            ),
          },
          {
            label: "Waiting on customer",
            value: String(
              tickets.filter(
                (ticket) => ticket.status === "WAITING_ON_CUSTOMER",
              ).length,
            ),
          },
          {
            label: "Unassigned",
            value: String(tickets.filter((ticket) => !ticket.assignee).length),
          },
        ]}
      />
    </div>
  );
}

```