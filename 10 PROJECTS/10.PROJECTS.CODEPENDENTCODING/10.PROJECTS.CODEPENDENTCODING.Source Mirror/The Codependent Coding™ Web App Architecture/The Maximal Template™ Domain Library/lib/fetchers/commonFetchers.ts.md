---
title: 'The Maximal Template™ Domain Library\lib\fetchers\commonFetchers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\fetchers\commonFetchers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.fetchers.commonfetchers.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\fetchers\commonFetchers.ts'
source_file: 'commonFetchers.ts'
source_sha256: 'd88df5f5418a0ef57c82129eeb0ba78bedadb487bf63b53e746611d1b7fcda9c'
generated: true
---

# `commonFetchers.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\fetchers\commonFetchers.ts`
> SHA-256: `d88df5f5418a0ef57c82129eeb0ba78bedadb487bf63b53e746611d1b7fcda9c`

```ts
import "server-only";

import { assertPermission } from "../authz/permissions";
import { toOrganizationDTO } from "../db/dto/common.dto";
import { organizationOverviewSelect } from "../db/selects/common.selects";
import { withTemplateReadTransaction } from "../db/tenant";

export async function getCurrentOrganization() {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "organization:read");

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