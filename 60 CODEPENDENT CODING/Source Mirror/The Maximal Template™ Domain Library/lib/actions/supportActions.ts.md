---
title: 'The Maximal Template™ Domain Library\lib\actions\supportActions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\actions\supportActions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.actions.supportactions.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\actions\supportActions.ts'
source_file: 'supportActions.ts'
source_sha256: '45e094ead5c5771eeff4a03c54e5faf8db64e3efcda6ad7167af30f97b8a6302'
generated: true
---

# `supportActions.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\actions\supportActions.ts`
> SHA-256: `45e094ead5c5771eeff4a03c54e5faf8db64e3efcda6ad7167af30f97b8a6302`

```ts
"use server";

import {
  createSupportTicketSchema,
  updateSupportTicketStatusSchema,
} from "../../schemas/supportSchemas";

import { requireIdentity } from "../auth/identity";
import { assertPermission } from "../authz/permissions";
import { toSupportTicketDTO } from "../db/dto/support.dto";
import { supportTicketSelect } from "../db/selects/support.selects";
import { withTenantTransaction } from "../db/tenant";
import { updateTicketStatusTx } from "../db/transactions/update-ticket-status.tx";

export async function createSupportTicket(rawInput: unknown) {
  const input = createSupportTicketSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "support:write");

    const latest = await tx.supportTicket.aggregate({
      where: {
        organizationId: access.organizationId,
      },
      _max: {
        number: true,
      },
    });

    const record = await tx.supportTicket.create({
      data: {
        organizationId: access.organizationId,
        requesterUserId: access.userId,
        number: (latest._max.number ?? 0) + 1,
        subject: input.subject,
        description: input.description ?? null,
        priority: input.priority,
      },
      select: supportTicketSelect,
    });

    return toSupportTicketDTO(record);
  });
}

export async function updateSupportTicketStatus(rawInput: unknown) {
  const input = updateSupportTicketStatusSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "support:write");

    const record = await updateTicketStatusTx(tx, {
      organizationId: access.organizationId,
      ticketId: input.ticketId,
      status: input.status,
      expectedVersion: input.expectedVersion,
    });

    return toSupportTicketDTO(record);
  });
}

```