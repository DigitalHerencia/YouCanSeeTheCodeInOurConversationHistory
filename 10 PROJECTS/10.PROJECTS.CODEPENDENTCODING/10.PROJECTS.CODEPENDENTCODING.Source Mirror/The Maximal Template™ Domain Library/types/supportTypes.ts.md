---
title: 'The Maximal Template™ Domain Library\types\supportTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\types\supportTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.types.supporttypes.ts'
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
source_path: 'The Maximal Template™ Domain Library\types\supportTypes.ts'
source_file: 'supportTypes.ts'
source_sha256: '58a45701d389717828240bf9fe4bbeb1230829a9dfef38268e2bfd30d966b3ad'
generated: true
---

# `supportTypes.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\types\supportTypes.ts`
> SHA-256: `58a45701d389717828240bf9fe4bbeb1230829a9dfef38268e2bfd30d966b3ad`

```ts
export interface SupportTicketDTO {
  id: string;
  number: number;
  subject: string;
  description: string | null;
  status: string;
  priority: string;
  firstResponseDueAt: string | null;
  resolutionDueAt: string | null;
  resolvedAt: string | null;
  closedAt: string | null;
  version: number;
  requester: {
    id: string;
    displayName: string | null;
    email: string | null;
  } | null;
  assignee: { membershipId: string; displayName: string | null } | null;
  messageCount: number;
  createdAt: string;
  updatedAt: string;
}
export interface KnowledgeArticleDTO {
  id: string;
  slug: string;
  title: string;
  body: string;
  status: string;
  publishedAt: string | null;
  updatedAt: string;
}

```