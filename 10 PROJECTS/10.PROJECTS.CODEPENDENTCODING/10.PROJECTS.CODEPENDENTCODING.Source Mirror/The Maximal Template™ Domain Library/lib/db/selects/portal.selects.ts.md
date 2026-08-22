---
title: 'The Maximal Template™ Domain Library\lib\db\selects\portal.selects.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\selects\portal.selects.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.selects.portal.selects.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\selects\portal.selects.ts'
source_file: 'portal.selects.ts'
source_sha256: '3c096d0a1b65f9d0a9f6627cce4b4d056436e97aa96dfd1b36b87af33a1ccda0'
generated: true
---

# `portal.selects.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\selects\portal.selects.ts`
> SHA-256: `3c096d0a1b65f9d0a9f6627cce4b4d056436e97aa96dfd1b36b87af33a1ccda0`

```ts
import type { Prisma } from "../../../generated/prisma/client";

export const portalDocumentSelect = {
  id: true,
  title: true,
  description: true,
  status: true,
  clientVisible: true,
  currentVersionNumber: true,
  version: true,
  versions: {
    orderBy: {
      versionNumber: "desc",
    },
    take: 1,
    select: {
      id: true,
      versionNumber: true,
      createdAt: true,
      asset: {
        select: {
          filename: true,
          contentType: true,
          byteSize: true,
        },
      },
    },
  },
  createdAt: true,
  updatedAt: true,
} satisfies Prisma.PortalDocumentSelect;

export type PortalDocumentRecord = Prisma.PortalDocumentGetPayload<{
  select: typeof portalDocumentSelect;
}>;

export const portalBillingSelect = {
  planKey: true,
  status: true,
  currentPeriodEnd: true,
  cancelAtPeriodEnd: true,
} satisfies Prisma.BillingSubscriptionSelect;

export const portalInvoiceSelect = {
  id: true,
  number: true,
  customerName: true,
  status: true,
  total: true,
  currency: true,
  dueAt: true,
} satisfies Prisma.InvoiceSelect;

```