---
title: 'The Maximal Template™ Domain Library\lib\db\dto\social.dto.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\dto\social.dto.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.dto.social.dto.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\dto\social.dto.ts'
source_file: 'social.dto.ts'
source_sha256: '0c687745668c419ff96c883ad55e461dd602226515f673e4949303ccb96164a6'
generated: true
---

# `social.dto.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\dto\social.dto.ts`
> SHA-256: `0c687745668c419ff96c883ad55e461dd602226515f673e4949303ccb96164a6`

```ts
import type {
  MediaAssetDTO,
  SocialAccountDTO,
  SocialPostDTO,
} from "../../../types/socialTypes";
import type {
  MediaAssetRecord,
  SocialAccountRecord,
  SocialPostRecord,
} from "../selects/social.selects";

export function toSocialAccountDTO(
  record: SocialAccountRecord,
): SocialAccountDTO {
  return {
    id: record.id,
    provider: record.provider,
    displayName: record.displayName,
  };
}
export function toMediaAssetDTO(record: MediaAssetRecord): MediaAssetDTO {
  return {
    id: record.id,
    filename: record.filename,
    contentType: record.contentType,
    byteSize: record.byteSize.toString(),
    createdAt: record.createdAt.toISOString(),
  };
}

export function toSocialPostDTO(record: SocialPostRecord): SocialPostDTO {
  return {
    id: record.id,
    title: record.title,
    content: record.content,
    status: record.status,
    scheduledAt: record.scheduledAt?.toISOString() ?? null,
    publishedAt: record.publishedAt?.toISOString() ?? null,
    version: record.version,
    variants: record.variants.map((variant) => ({
      id: variant.id,
      provider: variant.socialAccount.provider,
      accountDisplayName: variant.socialAccount.displayName,
      content: variant.content,
      status: variant.status,
      providerPostId: variant.providerPostId,
    })),
    createdAt: record.createdAt.toISOString(),
    updatedAt: record.updatedAt.toISOString(),
  };
}

```