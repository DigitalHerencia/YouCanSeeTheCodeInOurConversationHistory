---
title: 'The Maximal Template™ Domain Library\schemas\portalSchemas.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\schemas\portalSchemas.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.schemas.portalschemas.ts'
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
source_path: 'The Maximal Template™ Domain Library\schemas\portalSchemas.ts'
source_file: 'portalSchemas.ts'
source_sha256: 'c9660207c866bc8244da5983287b909ec29312311c05f110328e739a9d4a75fc'
generated: true
---

# `portalSchemas.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\schemas\portalSchemas.ts`
> SHA-256: `c9660207c866bc8244da5983287b909ec29312311c05f110328e739a9d4a75fc`

```ts
import { z } from "zod";

export const createPortalDocumentSchema = z.object({
  title: z.string().trim().min(1).max(300),
  description: z.string().max(10_000).nullable().optional(),
  clientVisible: z.boolean().default(false),
});

export const addPortalDocumentVersionSchema = z.object({
  documentId: z.string().uuid(),
  assetId: z.string().uuid(),
  notes: z.string().max(10_000).nullable().optional(),
  expectedVersion: z.number().int().positive(),
});

export const decidePortalApprovalSchema = z.object({
  approvalId: z.string().uuid(),
  status: z.enum(["APPROVED", "REJECTED"]),
  note: z.string().max(10_000).nullable().optional(),
});

```