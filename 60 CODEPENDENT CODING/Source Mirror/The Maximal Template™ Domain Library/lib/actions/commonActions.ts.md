---
title: 'The Maximal Template™ Domain Library\lib\actions\commonActions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\actions\commonActions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.actions.commonactions.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\actions\commonActions.ts'
source_file: 'commonActions.ts'
source_sha256: '7550c63ce055179a90061c8f2edc05d36e0c012fe49cede7c9602d5594d2a69b'
generated: true
---

# `commonActions.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\actions\commonActions.ts`
> SHA-256: `7550c63ce055179a90061c8f2edc05d36e0c012fe49cede7c9602d5594d2a69b`

```ts
"use server";

import { organizationSettingsSchema } from "../../schemas/commonSchemas";

import { requireIdentity } from "../auth/identity";
import { assertPermission } from "../authz/permissions";
import { toOrganizationDTO } from "../db/dto/common.dto";
import { organizationOverviewSelect } from "../db/selects/common.selects";
import { withTenantTransaction } from "../db/tenant";

export async function updateOrganizationSettings(rawInput: unknown) {
  const input = organizationSettingsSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "organization:write");

    await tx.organizationSettings.upsert({
      where: {
        organizationId: access.organizationId,
      },
      update: {
        timezone: input.timezone,
        locale: input.locale,
        defaultCurrency: input.defaultCurrency,
      },
      create: {
        organizationId: access.organizationId,
        timezone: input.timezone,
        locale: input.locale,
        defaultCurrency: input.defaultCurrency,
      },
    });

    await tx.auditEvent.create({
      data: {
        organizationId: access.organizationId,
        actorUserId: access.userId,
        action: "organization.settings.updated",
        resourceType: "Organization",
        resourceId: access.organizationId,
      },
    });

    const record = await tx.organization.findFirstOrThrow({
      where: {
        id: access.organizationId,
      },
      select: organizationOverviewSelect,
    });

    return toOrganizationDTO(record);
  });
}

```