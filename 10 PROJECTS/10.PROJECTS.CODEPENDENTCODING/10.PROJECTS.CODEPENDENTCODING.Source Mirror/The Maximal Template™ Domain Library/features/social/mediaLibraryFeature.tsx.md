---
title: 'The Maximal Template™ Domain Library\features\social\mediaLibraryFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\social\mediaLibraryFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.social.medialibraryfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\social\mediaLibraryFeature.tsx'
source_file: 'mediaLibraryFeature.tsx'
source_sha256: '0e68e2a611b0230e4031d89e7aca27239b08362d16f97c93ba4178e1fc10b0c1'
generated: true
---

# `mediaLibraryFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\social\mediaLibraryFeature.tsx`
> SHA-256: `0e68e2a611b0230e4031d89e7aca27239b08362d16f97c93ba4178e1fc10b0c1`

```tsx
import {
  MediaLibraryBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getMediaAssets } from "@/lib/fetchers/socialFetchers";

export async function MediaLibraryFeature() {
  const assets = await getMediaAssets();
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="Social"
        title="Media library"
        description="Tenant-scoped assets available for social posts."
      />
      <MediaLibraryBlock
        items={assets.map((asset) => ({
          id: asset.id,
          title: asset.filename,
          description: `${asset.contentType} · ${asset.byteSize} bytes`,
        }))}
      />
    </div>
  );
}

```