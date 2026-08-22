---
title: 'The Maximal Template™ Domain Library\features\ai\playgroundFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\ai\playgroundFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.ai.playgroundfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\ai\playgroundFeature.tsx'
source_file: 'playgroundFeature.tsx'
source_sha256: '53e920b5ef1d22a6306b8f0294a9179c94887719cfc4d1f034eb23f6394f4175'
generated: true
---

# `playgroundFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\ai\playgroundFeature.tsx`
> SHA-256: `53e920b5ef1d22a6306b8f0294a9179c94887719cfc4d1f034eb23f6394f4175`

```tsx
import { PageHeaderBlock } from "@/components/blocks/application-sections";
import { getConfiguredHuggingFaceModel } from "@/lib/integrations/hugging-face/inference";
import { isHuggingFaceConfigured } from "@/lib/integrations/hugging-face/client";

import { PlaygroundFeatureClient } from "./playgroundFeature.client";

// Features orchestrate blocks and lib helpers; they never import raw UI primitives.
export function PlaygroundFeature() {
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="AI"
        title="Hugging Face playground"
        description="Run an authorized, metered generation without sharing personalized output through cache."
      />
      <PlaygroundFeatureClient
        configured={isHuggingFaceConfigured()}
        model={getConfiguredHuggingFaceModel()}
      />
    </div>
  );
}

```