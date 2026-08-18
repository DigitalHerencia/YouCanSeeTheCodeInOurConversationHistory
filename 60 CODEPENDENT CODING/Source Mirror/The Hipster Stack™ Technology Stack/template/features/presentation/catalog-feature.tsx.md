---
title: 'The Hipster Stack™ Technology Stack\template\features\presentation\catalog-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\presentation\catalog-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.presentation.catalog-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\presentation\catalog-feature.tsx'
source_file: 'catalog-feature.tsx'
source_sha256: '2546523b50160982e6537abe4f47ab9cc9cbfdc656c9a584351b8ab4b5c553bd'
generated: true
---

# `catalog-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\presentation\catalog-feature.tsx`
> SHA-256: `2546523b50160982e6537abe4f47ab9cc9cbfdc656c9a584351b8ab4b5c553bd`

```tsx
import { CatalogBrowser } from "@/components/(presentation)/catalog-browser"
import {
  presentationAssetKinds,
  presentationAssets,
  presentationPageRecipes,
} from "@/content/presentation/registry"

export function CatalogFeature() {
  return (
    <main className="p-6 md:p-12">
      <div className="mx-auto grid max-w-7xl gap-12">
        <header className="max-w-3xl">
          <p className="text-xs font-black tracking-widest text-blue-500 uppercase">
            Presentation system
          </p>
          <h1 className="mt-3 text-4xl leading-none font-black tracking-wide uppercase md:text-6xl">
            Typed asset catalog
          </h1>
          <p className="mt-4 text-sm leading-6 font-semibold text-neutral-400 md:text-base">
            Discover reusable layers, explicit Vouch references, and page recipes without copying
            prototype implementations.
          </p>
        </header>
        <CatalogBrowser
          assets={presentationAssets}
          kinds={presentationAssetKinds}
          recipes={presentationPageRecipes}
        />
      </div>
    </main>
  )
}

```