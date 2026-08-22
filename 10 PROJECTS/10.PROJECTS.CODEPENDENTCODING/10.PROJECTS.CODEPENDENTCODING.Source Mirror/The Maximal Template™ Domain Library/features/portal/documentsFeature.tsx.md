---
title: 'The Maximal Template™ Domain Library\features\portal\documentsFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\portal\documentsFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.portal.documentsfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\portal\documentsFeature.tsx'
source_file: 'documentsFeature.tsx'
source_sha256: 'e03a152bfe08668978ca9faaee0865ba64a1ddd4976ea9b4b9435378457e0bad'
generated: true
---

# `documentsFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\portal\documentsFeature.tsx`
> SHA-256: `e03a152bfe08668978ca9faaee0865ba64a1ddd4976ea9b4b9435378457e0bad`

```tsx
import {
  FileVaultBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getPortalDocuments } from "@/lib/fetchers/portalFetchers";

// Features orchestrate blocks and lib helpers; they never import raw UI primitives.
export async function DocumentsFeature() {
  const documents = await getPortalDocuments();
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="Client portal"
        title="Documents"
        description="Versioned files allowed for this organization and membership."
      />
      <FileVaultBlock
        files={documents.map((document) => ({
          id: document.id,
          name: document.title,
          meta: document.latestVersion
            ? `${document.status} · v${document.latestVersion.versionNumber} · ${document.latestVersion.filename}`
            : `${document.status} · No uploaded version`,
        }))}
      />
    </div>
  );
}

```