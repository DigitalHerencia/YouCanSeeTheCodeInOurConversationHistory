---
title: 'The Maximal Template™ Domain Library\lib\db\dto\support.dto.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\db\dto\support.dto.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.db.dto.support.dto.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\db\dto\support.dto.ts'
source_file: 'support.dto.ts'
source_sha256: '12c98492c310d118377bbe82ebd4538f47bc035dbbe25918cad86a1974728c0a'
generated: true
---

# `support.dto.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\db\dto\support.dto.ts`
> SHA-256: `12c98492c310d118377bbe82ebd4538f47bc035dbbe25918cad86a1974728c0a`

```ts
import type {
  KnowledgeArticleDTO,
  SupportTicketDTO,
} from "../../../types/supportTypes";
import type {
  KnowledgeArticleRecord,
  SupportTicketRecord,
} from "../selects/support.selects";

export function toKnowledgeArticleDTO(
  record: KnowledgeArticleRecord,
): KnowledgeArticleDTO {
  return {
    id: record.id,
    slug: record.slug,
    title: record.title,
    body: record.body,
    status: record.status,
    publishedAt: record.publishedAt?.toISOString() ?? null,
    updatedAt: record.updatedAt.toISOString(),
  };
}

export function toSupportTicketDTO(
  record: SupportTicketRecord,
): SupportTicketDTO {
  return {
    id: record.id,
    number: record.number,
    subject: record.subject,
    description: record.description,
    status: record.status,
    priority: record.priority,
    firstResponseDueAt: record.firstResponseDueAt?.toISOString() ?? null,
    resolutionDueAt: record.resolutionDueAt?.toISOString() ?? null,
    resolvedAt: record.resolvedAt?.toISOString() ?? null,
    closedAt: record.closedAt?.toISOString() ?? null,
    version: record.version,
    requester: record.requester
      ? {
          id: record.requester.id,
          displayName: record.requester.displayName,
          email: record.requester.email,
        }
      : null,
    assignee: record.assignee
      ? {
          membershipId: record.assignee.id,
          displayName: record.assignee.user.displayName,
        }
      : null,
    messageCount: record._count.messages,
    createdAt: record.createdAt.toISOString(),
    updatedAt: record.updatedAt.toISOString(),
  };
}

```