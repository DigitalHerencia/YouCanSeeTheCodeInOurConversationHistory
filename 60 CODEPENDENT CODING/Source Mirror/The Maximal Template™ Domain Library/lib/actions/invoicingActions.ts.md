---
title: 'The Maximal Template™ Domain Library\lib\actions\invoicingActions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\actions\invoicingActions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.actions.invoicingactions.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\actions\invoicingActions.ts'
source_file: 'invoicingActions.ts'
source_sha256: '15abc412b8a1df45199c6af569ce7bd62a5399c84e32450edc952ba311772d37'
generated: true
---

# `invoicingActions.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\actions\invoicingActions.ts`
> SHA-256: `15abc412b8a1df45199c6af569ce7bd62a5399c84e32450edc952ba311772d37`

```ts
"use server";

import {
  createInvoiceSchema,
  updateInvoiceStatusSchema,
} from "../../schemas/invoicingSchemas";

import { requireIdentity } from "../auth/identity";
import { assertPermission } from "../authz/permissions";
import { toInvoiceDTO } from "../db/dto/invoicing.dto";
import { withTenantTransaction } from "../db/tenant";
import { createInvoiceTx } from "../db/transactions/create-invoice.tx";
import { updateInvoiceStatusTx } from "../db/transactions/update-invoice-status.tx";

export async function createInvoice(rawInput: unknown) {
  const input = createInvoiceSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "invoicing:write");

    const record = await createInvoiceTx(tx, {
      organizationId: access.organizationId,
      createdByMembershipId: access.membershipId,
      customerName: input.customerName,
      customerEmail: input.customerEmail,
      currency: input.currency,
      issuedAt: input.issuedAt,
      dueAt: input.dueAt,
      lines: input.lines,
    });

    await tx.auditEvent.create({
      data: {
        organizationId: access.organizationId,
        actorUserId: access.userId,
        action: "invoice.created",
        resourceType: "Invoice",
        resourceId: record.id,
        metadata: {
          number: record.number,
          total: record.total.toString(),
          currency: record.currency,
        },
      },
    });

    return toInvoiceDTO(record);
  });
}

export async function updateInvoiceStatus(rawInput: unknown) {
  const input = updateInvoiceStatusSchema.parse(rawInput);
  const identity = await requireIdentity();

  return withTenantTransaction(identity, async (tx, access) => {
    assertPermission(access, "invoicing:write");

    const record = await updateInvoiceStatusTx(tx, {
      organizationId: access.organizationId,
      invoiceId: input.invoiceId,
      status: input.status,
      expectedVersion: input.expectedVersion,
    });

    return toInvoiceDTO(record);
  });
}

```