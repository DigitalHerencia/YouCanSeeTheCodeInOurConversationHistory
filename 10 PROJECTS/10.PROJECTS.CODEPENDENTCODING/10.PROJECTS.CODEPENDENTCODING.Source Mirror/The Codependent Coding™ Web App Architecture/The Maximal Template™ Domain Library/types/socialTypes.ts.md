---
title: 'The Maximal Template™ Domain Library\types\socialTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\types\socialTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.types.socialtypes.ts'
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
source_path: 'The Maximal Template™ Domain Library\types\socialTypes.ts'
source_file: 'socialTypes.ts'
source_sha256: '5df46a585454d127008e79ef5d085e9dc1b61d0cc21d0e6cc6e5c2536be21d37'
generated: true
---

# `socialTypes.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\types\socialTypes.ts`
> SHA-256: `5df46a585454d127008e79ef5d085e9dc1b61d0cc21d0e6cc6e5c2536be21d37`

```ts
export interface SocialPostDTO {
  id: string;
  title: string | null;
  content: string;
  status: string;
  scheduledAt: string | null;
  publishedAt: string | null;
  version: number;
  variants: Array<{
    id: string;
    provider: string;
    accountDisplayName: string;
    content: string;
    status: string;
    providerPostId: string | null;
  }>;
  createdAt: string;
  updatedAt: string;
}
export interface SocialAccountDTO {
  id: string;
  provider: string;
  displayName: string;
}
export interface MediaAssetDTO {
  id: string;
  filename: string;
  contentType: string;
  byteSize: string;
  createdAt: string;
}

```