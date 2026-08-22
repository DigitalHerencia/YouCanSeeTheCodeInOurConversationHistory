---
title: 'The Maximal Template™ Domain Library\lib\actions\marketingActions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\actions\marketingActions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.actions.marketingactions.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\actions\marketingActions.ts'
source_file: 'marketingActions.ts'
source_sha256: 'a82704aef4eebe422af7018f122fa2f0b379d58802f6889c9156b7812ae40b2a'
generated: true
---

# `marketingActions.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\actions\marketingActions.ts`
> SHA-256: `a82704aef4eebe422af7018f122fa2f0b379d58802f6889c9156b7812ae40b2a`

```ts
"use server";

import {
  createCampaignSchema,
  updateCampaignStatusSchema,
} from "../../schemas/marketingSchemas";

import { requireIdentity } from "../auth/identity";
import { assertPermission } from "../authz/permissions";
import { toCampaignDTO } from "../db/dto/marketing.dto";
import { campaignSelect } from "../db/selects/marketing.selects";
import { withTenantTransaction } from "../db/tenant";
import { ConcurrencyConflictError } from "../db/transactions/errors";

export async function createCampaign(rawInput: unknown) {
  const input = createCampaignSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "marketing:write");

    const record = await tx.campaign.create({
      data: {
        organizationId: access.organizationId,
        ownerMembershipId: access.membershipId,
        audienceId: input.audienceId ?? null,
        name: input.name,
        description: input.description ?? null,
        scheduledAt: input.scheduledAt ?? null,
        status: input.scheduledAt ? "SCHEDULED" : "DRAFT",
      },
      select: campaignSelect,
    });

    return toCampaignDTO(record);
  });
}

export async function updateCampaignStatus(rawInput: unknown) {
  const input = updateCampaignStatusSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "marketing:write");

    const result = await tx.campaign.updateMany({
      where: {
        id: input.campaignId,
        organizationId: access.organizationId,
        version: input.expectedVersion,
      },
      data: {
        status: input.status,
        startedAt: input.status === "ACTIVE" ? new Date() : undefined,
        completedAt: input.status === "COMPLETED" ? new Date() : undefined,
        version: {
          increment: 1,
        },
      },
    });

    if (result.count !== 1) {
      throw new ConcurrencyConflictError("Campaign");
    }

    const record = await tx.campaign.findFirstOrThrow({
      where: {
        id: input.campaignId,
        organizationId: access.organizationId,
      },
      select: campaignSelect,
    });

    return toCampaignDTO(record);
  });
}

```