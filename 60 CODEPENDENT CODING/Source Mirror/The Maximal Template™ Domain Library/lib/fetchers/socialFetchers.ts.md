---
title: 'The Maximal Template™ Domain Library\lib\fetchers\socialFetchers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\fetchers\socialFetchers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.fetchers.socialfetchers.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\fetchers\socialFetchers.ts'
source_file: 'socialFetchers.ts'
source_sha256: '100b0798db93f5df52d3026c721a1f7c1eff8058e4819b8b33fa8438c8bb3474'
generated: true
---

# `socialFetchers.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\fetchers\socialFetchers.ts`
> SHA-256: `100b0798db93f5df52d3026c721a1f7c1eff8058e4819b8b33fa8438c8bb3474`

```ts
import "server-only";

import { assertPermission } from "../authz/permissions";
import {
  toMediaAssetDTO,
  toSocialAccountDTO,
  toSocialPostDTO,
} from "../db/dto/social.dto";
import {
  mediaAssetSelect,
  socialAccountSelect,
  socialPostSelect,
} from "../db/selects/social.selects";
import { withTemplateReadTransaction } from "../db/tenant";

export async function getScheduledSocialPosts(limit = 100) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "social:read");

    const rows = await tx.socialPost.findMany({
      where: {
        organizationId: access.organizationId,
        status: "SCHEDULED",
      },
      orderBy: {
        scheduledAt: "asc",
      },
      take: Math.min(Math.max(limit, 1), 200),
      select: socialPostSelect,
    });

    return rows.map(toSocialPostDTO);
  });
}

export async function getSocialAccounts() {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "social:read");
    const rows = await tx.socialAccount.findMany({
      where: { organizationId: access.organizationId, active: true },
      orderBy: { displayName: "asc" },
      select: socialAccountSelect,
    });
    return rows.map(toSocialAccountDTO);
  });
}

export async function getMediaAssets(limit = 100) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "social:read");
    const rows = await tx.asset.findMany({
      where: { organizationId: access.organizationId },
      orderBy: { createdAt: "desc" },
      take: Math.min(Math.max(limit, 1), 200),
      select: mediaAssetSelect,
    });
    return rows.map(toMediaAssetDTO);
  });
}

```