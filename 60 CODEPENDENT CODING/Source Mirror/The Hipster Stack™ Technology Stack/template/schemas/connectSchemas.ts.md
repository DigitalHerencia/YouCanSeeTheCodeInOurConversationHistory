---
title: 'The Hipster Stack™ Technology Stack\template\schemas\connectSchemas.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\schemas\connectSchemas.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.schemas.connectschemas.ts'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\schemas\connectSchemas.ts'
source_file: 'connectSchemas.ts'
source_sha256: 'cd6fd5a6b0908847892c1e59ff60e8c61cb2f01d6746bb0fcbb90817b1ae650b'
generated: true
---

# `connectSchemas.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\schemas\connectSchemas.ts`
> SHA-256: `cd6fd5a6b0908847892c1e59ff60e8c61cb2f01d6746bb0fcbb90817b1ae650b`

```ts
import { z } from "zod"

export const connectResourceIdSchema = z.string().min(1).max(120)

export const connectWebhookEnvelopeSchema = z.object({
  id: z.string().min(1).max(255),
  type: z.string().min(1).max(120),
  data: z.object({ object: z.record(z.string(), z.unknown()) }),
})

export const connectWebhookObjectSchema = z.object({
  id: z.string().min(1).max(255),
})

export const connectRefundTriggerSchema = connectWebhookObjectSchema.extend({
  payment_intent: z.union([
    z.string().min(1).max(255),
    z.object({ id: z.string().min(1).max(255) }).transform((value) => value.id),
  ]),
})

export const connectAccountSnapshotSchema = z.object({
  id: z.string().min(1).max(255),
  country: z.string().length(2),
  details_submitted: z.boolean(),
  charges_enabled: z.boolean(),
  payouts_enabled: z.boolean(),
  requirements: z
    .object({
      currently_due: z.array(z.string()).nullable(),
      disabled_reason: z.string().nullable(),
    })
    .nullable(),
})

const expandableIdSchema = z.union([
  z.string().min(1).max(255),
  z.object({ id: z.string().min(1).max(255) }).transform((value) => value.id),
])

export const connectPaymentSnapshotSchema = z.object({
  id: z.string().min(1).max(255),
  status: z.string().min(1).max(80),
  amount: z.number().int().positive(),
  currency: z.string().regex(/^[a-z]{3}$/),
  application_fee_amount: z.number().int().nonnegative().nullable(),
  amount_capturable: z.number().int().nonnegative(),
  amount_received: z.number().int().nonnegative(),
  latest_charge: expandableIdSchema.nullable(),
  transfer_data: z.object({ destination: expandableIdSchema }),
  metadata: z.object({ connect_payment_id: z.string().min(1).max(120) }).catchall(z.string()),
})

export const connectRefundSnapshotSchema = z.object({
  id: z.string().min(1).max(255),
  payment_intent: expandableIdSchema,
  amount: z.number().int().positive(),
  status: z.string().min(1).max(80),
})

export const connectCheckoutSnapshotSchema = z.object({
  id: z.string().min(1).max(255),
  payment_intent: expandableIdSchema.nullable(),
  metadata: z.record(z.string(), z.string()).nullable(),
})

```