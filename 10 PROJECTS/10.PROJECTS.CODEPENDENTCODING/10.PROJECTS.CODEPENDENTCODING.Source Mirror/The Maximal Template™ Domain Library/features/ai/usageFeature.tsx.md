---
title: 'The Maximal Template™ Domain Library\features\ai\usageFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\ai\usageFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.ai.usagefeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\ai\usageFeature.tsx'
source_file: 'usageFeature.tsx'
source_sha256: '825b48a734fbf99843c7935ddf6c21843ae62030c13e3ce60d2f981013725765'
generated: true
---

# `usageFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\ai\usageFeature.tsx`
> SHA-256: `825b48a734fbf99843c7935ddf6c21843ae62030c13e3ce60d2f981013725765`

```tsx
import {
  MetricGridBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getMyAiUsage } from "@/lib/fetchers/aiFetchers";

// Features orchestrate blocks and lib helpers; they never import raw UI primitives.
export async function UsageFeature() {
  const usage = await getMyAiUsage();
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="AI"
        title="Usage"
        description="Provider-reported usage for your identity in the active organization."
      />
      <MetricGridBlock
        metrics={[
          { label: "Generations", value: usage.generationCount.toString() },
          { label: "Input tokens", value: usage.inputTokens.toLocaleString() },
          {
            label: "Output tokens",
            value: usage.outputTokens.toLocaleString(),
          },
          { label: "Provider cost", value: `$${usage.cost}` },
        ]}
      />
    </div>
  );
}

```