---
title: 'The Maximal Template™ Domain Library\lib\db\selects\support.selects.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\selects\support.selects.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.selects.support.selects.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\selects\support.selects.ts'
source_file: 'support.selects.ts'
source_sha256: 'dd1c9891867b0e4eef08e9f5a656c1d72f698c3390b333435d4a0070effa76b2'
generated: true
---

# `support.selects.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\selects\support.selects.ts`
> SHA-256: `dd1c9891867b0e4eef08e9f5a656c1d72f698c3390b333435d4a0070effa76b2`

```ts
import type { Prisma } from "../../../generated/prisma/client";

export const supportTicketSelect = {
  id: true,
  number: true,
  subject: true,
  description: true,
  status: true,
  priority: true,
  firstResponseDueAt: true,
  resolutionDueAt: true,
  resolvedAt: true,
  closedAt: true,
  version: true,
  requester: {
    select: {
      id: true,
      displayName: true,
      email: true,
    },
  },
  assignee: {
    select: {
      id: true,
      user: {
        select: {
          displayName: true,
        },
      },
    },
  },
  _count: {
    select: {
      messages: true,
    },
  },
  createdAt: true,
  updatedAt: true,
} satisfies Prisma.SupportTicketSelect;

export type SupportTicketRecord = Prisma.SupportTicketGetPayload<{
  select: typeof supportTicketSelect;
}>;

export const knowledgeArticleSelect = {
  id: true,
  slug: true,
  title: true,
  body: true,
  status: true,
  publishedAt: true,
  updatedAt: true,
} satisfies Prisma.KnowledgeArticleSelect;

export type KnowledgeArticleRecord = Prisma.KnowledgeArticleGetPayload<{
  select: typeof knowledgeArticleSelect;
}>;

```