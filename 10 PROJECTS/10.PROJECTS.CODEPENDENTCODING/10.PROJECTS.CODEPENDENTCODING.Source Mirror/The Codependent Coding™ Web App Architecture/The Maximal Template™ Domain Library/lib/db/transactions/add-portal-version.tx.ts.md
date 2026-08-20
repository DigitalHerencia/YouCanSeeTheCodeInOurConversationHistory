---
title: 'The Maximal Template™ Domain Library\lib\db\transactions\add-portal-version.tx.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\transactions\add-portal-version.tx.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.transactions.add-portal-version.tx.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\transactions\add-portal-version.tx.ts'
source_file: 'add-portal-version.tx.ts'
source_sha256: '1611a9fc491a731e3c227d86795d78de27d72bd982086d3ca6c70e4df7ce5199'
generated: true
---

# `add-portal-version.tx.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\transactions\add-portal-version.tx.ts`
> SHA-256: `1611a9fc491a731e3c227d86795d78de27d72bd982086d3ca6c70e4df7ce5199`

```ts
import type { Prisma } from "../../../generated/prisma/client";

import { portalDocumentSelect } from "../selects/portal.selects";
import { ConcurrencyConflictError, ResourceNotFoundError } from "./errors";

export async function addPortalVersionTx(
  tx: Prisma.TransactionClient,
  input: {
    organizationId: string;
    membershipId: string;
    documentId: string;
    assetId: string;
    notes?: string | null;
    expectedVersion: number;
  },
) {
  const document = await tx.portalDocument.findFirst({
    where: {
      id: input.documentId,
      organizationId: input.organizationId,
      version: input.expectedVersion,
    },
    select: {
      id: true,
      currentVersionNumber: true,
    },
  });

  if (!document) {
    throw new ConcurrencyConflictError("Portal document");
  }

  const asset = await tx.asset.findFirst({
    where: {
      id: input.assetId,
      organizationId: input.organizationId,
    },
    select: {
      id: true,
    },
  });

  if (!asset) {
    throw new ResourceNotFoundError("Asset");
  }

  const nextVersion = document.currentVersionNumber + 1;

  await tx.portalDocumentVersion.create({
    data: {
      organizationId: input.organizationId,
      documentId: input.documentId,
      assetId: input.assetId,
      uploadedByMembershipId: input.membershipId,
      versionNumber: nextVersion,
      notes: input.notes ?? null,
    },
  });

  const result = await tx.portalDocument.updateMany({
    where: {
      id: input.documentId,
      organizationId: input.organizationId,
      version: input.expectedVersion,
    },
    data: {
      currentVersionNumber: nextVersion,
      status: "IN_REVIEW",
      version: {
        increment: 1,
      },
    },
  });

  if (result.count !== 1) {
    throw new ConcurrencyConflictError("Portal document");
  }

  return tx.portalDocument.findFirstOrThrow({
    where: {
      id: input.documentId,
      organizationId: input.organizationId,
    },
    select: portalDocumentSelect,
  });
}

```