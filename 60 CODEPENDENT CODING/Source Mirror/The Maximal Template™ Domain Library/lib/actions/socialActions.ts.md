---
title: 'The Maximal Template™ Domain Library\lib\actions\socialActions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\actions\socialActions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.actions.socialactions.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\actions\socialActions.ts'
source_file: 'socialActions.ts'
source_sha256: '1be87f275ac831402ac4eb38ef3f0aca9cf34d3a4ee2af4b4017fe9bb90bf6bc'
generated: true
---

# `socialActions.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\actions\socialActions.ts`
> SHA-256: `1be87f275ac831402ac4eb38ef3f0aca9cf34d3a4ee2af4b4017fe9bb90bf6bc`

```ts
"use server";

import {
  createSocialPostSchema,
  scheduleSocialPostSchema,
} from "../../schemas/socialSchemas";

import { requireIdentity } from "../auth/identity";
import { assertPermission } from "../authz/permissions";
import { toSocialPostDTO } from "../db/dto/social.dto";
import { socialPostSelect } from "../db/selects/social.selects";
import { withTenantTransaction } from "../db/tenant";
import { ResourceNotFoundError } from "../db/transactions/errors";
import { scheduleSocialPostTx } from "../db/transactions/schedule-social-post.tx";
import { buildPlatformVariant } from "../workflows/social/buildPlatformVariant";
import { resolvePublishTime } from "../workflows/social/resolvePublishTime";

export async function createSocialPost(rawInput: unknown) {
  const input = createSocialPostSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "social:write");

    const accountIds = [
      ...new Set(input.variants.map((variant) => variant.socialAccountId)),
    ];

    const accounts = await tx.socialAccount.findMany({
      where: {
        organizationId: access.organizationId,
        id: {
          in: accountIds,
        },
        active: true,
      },
      select: { id: true, provider: true },
    });

    if (accounts.length !== accountIds.length) {
      throw new ResourceNotFoundError("Social account");
    }

    const providersByAccount = new Map(
      accounts.map((account) => [account.id, account.provider]),
    );

    const record = await tx.socialPost.create({
      data: {
        organizationId: access.organizationId,
        createdByMembershipId: access.membershipId,
        title: input.title ?? null,
        content: input.content,
        variants: {
          create: input.variants.map((variant) => {
            const provider = providersByAccount.get(variant.socialAccountId);
            if (!provider) {
              throw new ResourceNotFoundError("Social account");
            }
            return {
              organizationId: access.organizationId,
              socialAccountId: variant.socialAccountId,
              content: buildPlatformVariant(provider, variant.content),
            };
          }),
        },
      },
      select: socialPostSelect,
    });

    return toSocialPostDTO(record);
  });
}

export async function scheduleSocialPost(rawInput: unknown) {
  const input = scheduleSocialPostSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "social:write");

    const record = await scheduleSocialPostTx(tx, {
      organizationId: access.organizationId,
      postId: input.postId,
      scheduledAt: resolvePublishTime(input.scheduledAt),
      expectedVersion: input.expectedVersion,
    });

    return toSocialPostDTO(record);
  });
}

```