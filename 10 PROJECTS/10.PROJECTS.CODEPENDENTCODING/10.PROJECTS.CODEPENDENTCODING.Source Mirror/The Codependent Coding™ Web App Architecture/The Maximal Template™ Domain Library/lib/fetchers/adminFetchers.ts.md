---
title: 'The Maximal Template™ Domain Library\lib\fetchers\adminFetchers.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\fetchers\adminFetchers.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.fetchers.adminfetchers.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\fetchers\adminFetchers.ts'
source_file: 'adminFetchers.ts'
source_sha256: 'df20b81c4ec1cdfa90058096998ecc61683284e285ecbd5186451760c96da434'
generated: true
---

# `adminFetchers.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\fetchers\adminFetchers.ts`
> SHA-256: `df20b81c4ec1cdfa90058096998ecc61683284e285ecbd5186451760c96da434`

```ts
import "server-only";

import { assertPermission } from "../authz/permissions";
import { toAdminMembershipDTO, toAuditEventDTO } from "../db/dto/admin.dto";
import {
  adminMembershipSelect,
  auditEventSelect,
} from "../db/selects/admin.selects";
import { withTemplateReadTransaction } from "../db/tenant";

export async function getAuditEvents(limit = 100) {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "admin:audit");

    const rows = await tx.auditEvent.findMany({
      where: {
        organizationId: access.organizationId,
      },
      orderBy: {
        createdAt: "desc",
      },
      take: Math.min(Math.max(limit, 1), 250),
      select: auditEventSelect,
    });

    return rows.map(toAuditEventDTO);
  });
}

export async function getAdminMemberships() {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "admin:users");
    const rows = await tx.membership.findMany({
      where: { organizationId: access.organizationId },
      orderBy: { createdAt: "asc" },
      select: adminMembershipSelect,
    });
    return rows.map(toAdminMembershipDTO);
  });
}

export async function getAdminRecordSummary() {
  return withTemplateReadTransaction(async (tx, access) => {
    assertPermission(access, "admin:records");
    const [
      contacts,
      projects,
      tickets,
      campaigns,
      invoices,
      socialPosts,
      generations,
      documents,
    ] = await Promise.all([
      tx.crmContact.count({ where: { organizationId: access.organizationId } }),
      tx.project.count({ where: { organizationId: access.organizationId } }),
      tx.supportTicket.count({
        where: { organizationId: access.organizationId },
      }),
      tx.campaign.count({ where: { organizationId: access.organizationId } }),
      tx.invoice.count({ where: { organizationId: access.organizationId } }),
      tx.socialPost.count({ where: { organizationId: access.organizationId } }),
      tx.aiGeneration.count({
        where: { organizationId: access.organizationId },
      }),
      tx.portalDocument.count({
        where: { organizationId: access.organizationId },
      }),
    ]);
    return [
      ["CRM contacts", contacts],
      ["Projects", projects],
      ["Support tickets", tickets],
      ["Campaigns", campaigns],
      ["Invoices", invoices],
      ["Social posts", socialPosts],
      ["AI generations", generations],
      ["Portal documents", documents],
    ].map(([resource, count]) => ({
      resource: String(resource),
      count: Number(count),
    }));
  });
}

```