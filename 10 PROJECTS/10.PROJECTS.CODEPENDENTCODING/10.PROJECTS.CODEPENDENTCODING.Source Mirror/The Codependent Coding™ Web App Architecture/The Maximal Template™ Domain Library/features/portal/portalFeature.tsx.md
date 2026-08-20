---
title: 'The Maximal Template™ Domain Library\features\portal\portalFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\portal\portalFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.portal.portalfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\portal\portalFeature.tsx'
source_file: 'portalFeature.tsx'
source_sha256: '47563f896e3b29ef04c69fe8086f1761f1b2740a2218063dc9f92451a1f132eb'
generated: true
---

# `portalFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\portal\portalFeature.tsx`
> SHA-256: `47563f896e3b29ef04c69fe8086f1761f1b2740a2218063dc9f92451a1f132eb`

```tsx
import {
  MetricGridBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getPortalDocuments } from "@/lib/fetchers/portalFetchers";

// Features orchestrate blocks and lib helpers; they never import raw UI primitives.
export async function PortalFeature() {
  const documents = await getPortalDocuments();
  const visible = documents.filter((document) => document.clientVisible).length;
  const approved = documents.filter(
    (document) => document.status === "APPROVED",
  ).length;
  const awaitingReview = documents.filter(
    (document) => document.status === "IN_REVIEW",
  ).length;
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="Client portal"
        title="Workspace overview"
        description="Authorized documents and project handoff state for the active organization."
        action={{ label: "Open documents", href: "/portal/documents" }}
      />
      <MetricGridBlock
        metrics={[
          { label: "Documents", value: documents.length.toString() },
          { label: "Client visible", value: visible.toString() },
          { label: "Approved", value: approved.toString() },
          { label: "In review", value: awaitingReview.toString() },
        ]}
      />
    </div>
  );
}

```