---
title: 'The Hipster Stack™ Technology Stack\template\types\presentationCatalogTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\types\presentationCatalogTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.types.presentationcatalogtypes.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\types\presentationCatalogTypes.ts'
source_file: 'presentationCatalogTypes.ts'
source_sha256: '9627525c23ca2e8a56d55296896317f051bb88ab9a1e56025ce41e2218fef434'
generated: true
---

# `presentationCatalogTypes.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\types\presentationCatalogTypes.ts`
> SHA-256: `9627525c23ca2e8a56d55296896317f051bb88ab9a1e56025ce41e2218fef434`

```ts
export type PresentationAssetKind =
  | "primitive"
  | "shared"
  | "domain"
  | "block"
  | "feature"
  | "route"
  | "fixture-reference"

export type PresentationAssetSource = "reusable" | "vouch-reference"

export interface PresentationAssetRecord {
  id: string
  label: string
  description: string
  kind: PresentationAssetKind
  modulePath: string
  source: PresentationAssetSource
  tags: readonly string[]
  dependencies: readonly string[]
  previewPath?: string
}

export interface PresentationPageRecipe {
  id: string
  label: string
  description: string
  route: string
  assetIds: readonly string[]
}

```