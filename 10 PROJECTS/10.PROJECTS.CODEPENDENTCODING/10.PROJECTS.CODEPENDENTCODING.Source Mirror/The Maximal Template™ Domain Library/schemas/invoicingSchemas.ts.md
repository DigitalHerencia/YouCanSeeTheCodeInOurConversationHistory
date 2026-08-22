---
title: 'The Maximal Template™ Domain Library\schemas\invoicingSchemas.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\schemas\invoicingSchemas.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.schemas.invoicingschemas.ts'
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
source_path: 'The Maximal Template™ Domain Library\schemas\invoicingSchemas.ts'
source_file: 'invoicingSchemas.ts'
source_sha256: '3a6180f5e0b27a29ca24030e5657851eef897bd0014a76125804a06ce06e2d4c'
generated: true
---

# `invoicingSchemas.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\schemas\invoicingSchemas.ts`
> SHA-256: `3a6180f5e0b27a29ca24030e5657851eef897bd0014a76125804a06ce06e2d4c`

```ts
import { z } from "zod";

const currency = z
  .string()
  .length(3)
  .transform((value) => value.toUpperCase());
const money = z
  .string()
  .regex(/^\d+(\.\d{1,4})?$/, "Expected a non-negative decimal.");
const taxRate = z
  .string()
  .regex(/^0(\.\d{1,6})?$|^1(\.0{1,6})?$/, "Expected a rate from 0 to 1.");

export const createInvoiceSchema = z.object({
  customerName: z.string().trim().min(1).max(200),
  customerEmail: z.string().email().nullable().optional(),
  currency: currency.default("USD"),
  issuedAt: z.coerce.date().nullable().optional(),
  dueAt: z.coerce.date().nullable().optional(),
  lines: z
    .array(
      z.object({
        description: z.string().trim().min(1).max(500),
        quantity: z.string().regex(/^\d+(\.\d{1,3})?$/),
        unitPrice: money,
        taxRate: taxRate.default("0"),
      }),
    )
    .min(1)
    .max(500),
});

export const updateInvoiceStatusSchema = z.object({
  invoiceId: z.string().uuid(),
  status: z.enum(["DRAFT", "OPEN", "PAID", "VOID", "OVERDUE"]),
  expectedVersion: z.number().int().positive(),
});

```