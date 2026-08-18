---
title: 'The Hipster Stack™ Technology Stack\template\schemas\stripeWebhookSchemas.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\schemas\stripeWebhookSchemas.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.schemas.stripewebhookschemas.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\schemas\stripeWebhookSchemas.ts'
source_file: 'stripeWebhookSchemas.ts'
source_sha256: 'c7ef4050fdb80894f8fd8e0482882751793ed09943f315382a7c5da774b801f9'
generated: true
---

# `stripeWebhookSchemas.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\schemas\stripeWebhookSchemas.ts`
> SHA-256: `c7ef4050fdb80894f8fd8e0482882751793ed09943f315382a7c5da774b801f9`

```ts
import { z } from "zod"

export const stripeWebhookEnvelopeSchema = z.object({
  id: z.string().min(1).max(255),
  type: z.string().min(1).max(120),
  data: z.object({
    object: z.record(z.string(), z.unknown()),
  }),
})

export const stripeSubscriptionTriggerSchema = z.object({
  id: z.string().min(1).max(255),
  type: z.enum([
    "customer.subscription.created",
    "customer.subscription.updated",
    "customer.subscription.deleted",
  ]),
  data: z.object({
    object: z.object({ id: z.string().min(1).max(255) }),
  }),
})

export const stripeSubscriptionSnapshotSchema = z.object({
  id: z.string().min(1).max(255),
  customer: z.string().min(1).max(255),
  status: z.string().min(1).max(40),
  cancel_at_period_end: z.boolean(),
  created: z.number().int().nonnegative(),
  items: z.object({
    data: z
      .array(
        z.object({
          id: z.string().min(1).max(255),
          quantity: z.number().int().positive().nullable(),
          current_period_end: z.number().int().nonnegative(),
          price: z.object({ id: z.string().min(1).max(255) }),
        })
      )
      .length(1),
  }),
})

```