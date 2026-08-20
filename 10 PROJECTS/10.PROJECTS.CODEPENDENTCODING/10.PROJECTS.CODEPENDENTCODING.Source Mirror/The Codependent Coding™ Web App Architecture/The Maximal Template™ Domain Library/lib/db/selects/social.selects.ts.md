---
title: 'The Maximal Template™ Domain Library\lib\db\selects\social.selects.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\selects\social.selects.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.selects.social.selects.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\selects\social.selects.ts'
source_file: 'social.selects.ts'
source_sha256: '5bb4cedf3de73faacad1d35f83a1de062382e7b957bd35e14422ae0adf09159a'
generated: true
---

# `social.selects.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\selects\social.selects.ts`
> SHA-256: `5bb4cedf3de73faacad1d35f83a1de062382e7b957bd35e14422ae0adf09159a`

```ts
import type { Prisma } from "../../../generated/prisma/client";

export const socialPostSelect = {
  id: true,
  title: true,
  content: true,
  status: true,
  scheduledAt: true,
  publishedAt: true,
  version: true,
  variants: {
    select: {
      id: true,
      content: true,
      status: true,
      providerPostId: true,
      socialAccount: {
        select: {
          provider: true,
          displayName: true,
        },
      },
    },
  },
  createdAt: true,
  updatedAt: true,
} satisfies Prisma.SocialPostSelect;

export type SocialPostRecord = Prisma.SocialPostGetPayload<{
  select: typeof socialPostSelect;
}>;

export const socialAccountSelect = {
  id: true,
  provider: true,
  displayName: true,
} satisfies Prisma.SocialAccountSelect;
export const mediaAssetSelect = {
  id: true,
  filename: true,
  contentType: true,
  byteSize: true,
  createdAt: true,
} satisfies Prisma.AssetSelect;
export type SocialAccountRecord = Prisma.SocialAccountGetPayload<{
  select: typeof socialAccountSelect;
}>;
export type MediaAssetRecord = Prisma.AssetGetPayload<{
  select: typeof mediaAssetSelect;
}>;

```