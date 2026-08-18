---
title: 'The Maximal Template™ Domain Library\lib\actions\portalActions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\actions\portalActions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.actions.portalactions.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\actions\portalActions.ts'
source_file: 'portalActions.ts'
source_sha256: 'd4e571a201d2ac91ac4232f4e8b90e8168f74f863f25d02b35a2ba9dcdef3d93'
generated: true
---

# `portalActions.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\actions\portalActions.ts`
> SHA-256: `d4e571a201d2ac91ac4232f4e8b90e8168f74f863f25d02b35a2ba9dcdef3d93`

```ts
"use server";

import {
  addPortalDocumentVersionSchema,
  createPortalDocumentSchema,
} from "../../schemas/portalSchemas";

import { requireIdentity } from "../auth/identity";
import { assertPermission } from "../authz/permissions";
import { toPortalDocumentDTO } from "../db/dto/portal.dto";
import { portalDocumentSelect } from "../db/selects/portal.selects";
import { withTenantTransaction } from "../db/tenant";
import { addPortalVersionTx } from "../db/transactions/add-portal-version.tx";

export async function createPortalDocument(rawInput: unknown) {
  const input = createPortalDocumentSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "portal:write");

    const record = await tx.portalDocument.create({
      data: {
        organizationId: access.organizationId,
        title: input.title,
        description: input.description ?? null,
        clientVisible: input.clientVisible,
      },
      select: portalDocumentSelect,
    });

    return toPortalDocumentDTO(record);
  });
}

export async function addPortalDocumentVersion(rawInput: unknown) {
  const input = addPortalDocumentVersionSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "portal:write");

    const record = await addPortalVersionTx(tx, {
      organizationId: access.organizationId,
      membershipId: access.membershipId,
      documentId: input.documentId,
      assetId: input.assetId,
      notes: input.notes,
      expectedVersion: input.expectedVersion,
    });

    return toPortalDocumentDTO(record);
  });
}

```