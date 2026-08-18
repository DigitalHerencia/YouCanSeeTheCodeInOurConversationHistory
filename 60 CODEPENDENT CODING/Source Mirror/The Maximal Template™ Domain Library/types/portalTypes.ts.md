---
title: 'The Maximal Template™ Domain Library\types\portalTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\types\portalTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.types.portaltypes.ts'
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
source_path: 'The Maximal Template™ Domain Library\types\portalTypes.ts'
source_file: 'portalTypes.ts'
source_sha256: 'd25de16aa8abd794f0b2322f6849a760f81271f4ab0d2489157798c33c8c0378'
generated: true
---

# `portalTypes.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\types\portalTypes.ts`
> SHA-256: `d25de16aa8abd794f0b2322f6849a760f81271f4ab0d2489157798c33c8c0378`

```ts
export interface PortalDocumentDTO {
  id: string;
  title: string;
  description: string | null;
  status: string;
  clientVisible: boolean;
  currentVersionNumber: number;
  version: number;
  latestVersion: {
    id: string;
    versionNumber: number;
    filename: string;
    contentType: string;
    byteSize: string;
    createdAt: string;
  } | null;
  createdAt: string;
  updatedAt: string;
}
export interface PortalBillingDTO {
  subscription: {
    planKey: string;
    status: string;
    currentPeriodEnd: string | null;
    cancelAtPeriodEnd: boolean;
  } | null;
  invoices: Array<{
    id: string;
    number: number;
    customerName: string;
    status: string;
    total: string;
    currency: string;
    dueAt: string | null;
  }>;
}

```