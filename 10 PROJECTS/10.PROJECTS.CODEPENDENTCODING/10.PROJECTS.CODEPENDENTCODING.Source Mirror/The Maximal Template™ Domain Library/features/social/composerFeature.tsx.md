---
title: 'The Maximal Template™ Domain Library\features\social\composerFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\social\composerFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.social.composerfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\social\composerFeature.tsx'
source_file: 'composerFeature.tsx'
source_sha256: '937b02bbc9e1c72afd022deec9b14374817f977055716f9f37957a8e3e9a111b'
generated: true
---

# `composerFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\social\composerFeature.tsx`
> SHA-256: `937b02bbc9e1c72afd022deec9b14374817f977055716f9f37957a8e3e9a111b`

```tsx
import { PageHeaderBlock } from "@/components/blocks/application-sections";
import { getSocialAccounts } from "@/lib/fetchers/socialFetchers";

import { ComposerFeatureClient } from "./composerFeature.client";

export async function ComposerFeature() {
  const accounts = await getSocialAccounts();
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="Social"
        title="Compose"
        description="Create platform-aware variants and schedule publication."
      />
      <ComposerFeatureClient accounts={accounts} />
    </div>
  );
}

```