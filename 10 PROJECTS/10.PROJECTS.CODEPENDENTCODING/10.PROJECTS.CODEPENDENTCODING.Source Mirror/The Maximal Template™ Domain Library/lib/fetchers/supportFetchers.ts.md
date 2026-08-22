---
title: 'The Maximal Template™ Domain Library\lib\fetchers\supportFetchers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\fetchers\supportFetchers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.fetchers.supportfetchers.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\fetchers\supportFetchers.ts'
source_file: 'supportFetchers.ts'
source_sha256: 'e05be168f60eaf6b2377d4e0a65c5dcc87b0e2e1e388757f7262efc91884a2f7'
generated: true
---

# `supportFetchers.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\fetchers\supportFetchers.ts`
> SHA-256: `e05be168f60eaf6b2377d4e0a65c5dcc87b0e2e1e388757f7262efc91884a2f7`

```ts
import "server-only";

import { assertPermission } from "../authz/permissions";
import {
  toKnowledgeArticleDTO,
  toSupportTicketDTO,
} from "../db/dto/support.dto";
import {
  knowledgeArticleSelect,
  supportTicketSelect,
} from "../db/selects/support.selects";
import { withTemplateReadTransaction } from "../db/tenant";

export async function getSupportInbox(limit = 100) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "support:read");

    const rows = await tx.supportTicket.findMany({
      where: {
        organizationId: access.organizationId,
        status: {
          not: "CLOSED",
        },
      },
      orderBy: [
        {
          priority: "desc",
        },
        {
          createdAt: "asc",
        },
      ],
      take: Math.min(Math.max(limit, 1), 200),
      select: supportTicketSelect,
    });

    return rows.map(toSupportTicketDTO);
  });
}

export async function getSupportTicket(ticketId: string) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "support:read");

    const record = await tx.supportTicket.findFirst({
      where: {
        id: ticketId,
        organizationId: access.organizationId,
      },
      select: supportTicketSelect,
    });

    return record ? toSupportTicketDTO(record) : null;
  });
}

export async function getKnowledgeArticles(limit = 100) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "support:read");
    const rows = await tx.knowledgeArticle.findMany({
      where: { organizationId: access.organizationId, status: "PUBLISHED" },
      orderBy: { updatedAt: "desc" },
      take: Math.min(Math.max(limit, 1), 200),
      select: knowledgeArticleSelect,
    });
    return rows.map(toKnowledgeArticleDTO);
  });
}

```