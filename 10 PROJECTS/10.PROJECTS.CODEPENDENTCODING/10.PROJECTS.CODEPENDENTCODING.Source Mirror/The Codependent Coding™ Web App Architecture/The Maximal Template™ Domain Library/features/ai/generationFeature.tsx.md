---
title: 'The Maximal Template™ Domain Library\features\ai\generationFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\ai\generationFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.ai.generationfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\ai\generationFeature.tsx'
source_file: 'generationFeature.tsx'
source_sha256: '4c0c429e6dec8108ddf3e78eb0c9f08d25343fac6217b6587a9d147b58b34073'
generated: true
---

# `generationFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\ai\generationFeature.tsx`
> SHA-256: `4c0c429e6dec8108ddf3e78eb0c9f08d25343fac6217b6587a9d147b58b34073`

```tsx
import {
  DataTableBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getMyAiGenerations } from "@/lib/fetchers/aiFetchers";

// Features orchestrate blocks and lib helpers; they never import raw UI primitives.
export async function GenerationFeature() {
  const generations = await getMyAiGenerations();
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="AI"
        title="Generations"
        description="Your tenant-scoped generation history."
        action={{ label: "Open playground", href: "/ai/playground" }}
      />
      <DataTableBlock
        columns={[
          { key: "model", label: "Model" },
          { key: "status", label: "Status" },
          { key: "tokens", label: "Tokens" },
          { key: "cost", label: "Cost" },
          { key: "created", label: "Created" },
        ]}
        rows={generations.map((generation) => ({
          id: generation.id,
          cells: {
            model: `${generation.provider} · ${generation.model}`,
            status: generation.status,
            tokens: `${generation.inputTokens + generation.outputTokens}`,
            cost: `$${generation.cost}`,
            created: new Date(generation.createdAt).toLocaleString(),
          },
        }))}
      />
    </div>
  );
}

```