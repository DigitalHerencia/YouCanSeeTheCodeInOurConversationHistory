---
title: 'The Hipster Stack™ Technology Stack\template\features\uploads\upload-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\uploads\upload-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.uploads.upload-feature.tsx'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\features\uploads\upload-feature.tsx'
source_file: 'upload-feature.tsx'
source_sha256: '9c2ce2cdef35d5fda0a99b94f2be4ce3387254e4c0d962150a610b8241f4829e'
generated: true
---

# `upload-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\uploads\upload-feature.tsx`
> SHA-256: `9c2ce2cdef35d5fda0a99b94f2be4ce3387254e4c0d962150a610b8241f4829e`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { UploadClient } from "@/features/uploads/upload-client"
import { getMediaLibraryState } from "@/lib/fetchers/capabilityFetchers"

export async function UploadFeature() {
  const assets = await getMediaLibraryState()
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Media"
        title="Upload and manage product assets."
        description="Cloudinary owns media mechanics; the application keeps tenant-scoped asset state."
      />
      <UploadClient />
      <div className="grid gap-4 md:grid-cols-3">
        {assets.map((asset) => (
          <Card key={asset.id}>
            <CardHeader>
              <CardTitle className="text-base">{asset.publicId}</CardTitle>
            </CardHeader>
            <CardContent className="text-sm text-muted-foreground">
              {asset.resourceType} · {asset.status}
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  )
}

```