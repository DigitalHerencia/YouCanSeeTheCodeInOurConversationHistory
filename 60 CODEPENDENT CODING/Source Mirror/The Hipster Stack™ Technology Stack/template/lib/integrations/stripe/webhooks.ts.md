---
title: 'The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\webhooks.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\webhooks.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.integrations.stripe.webhooks.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\webhooks.ts'
source_file: 'webhooks.ts'
source_sha256: '7676abc18452850b9f2438f1b7488cce966aaaa2585030ad275ea9d67c171910'
generated: true
---

# `webhooks.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\webhooks.ts`
> SHA-256: `7676abc18452850b9f2438f1b7488cce966aaaa2585030ad275ea9d67c171910`

```ts
import "server-only"

import {
  stripeSubscriptionTriggerSchema,
  stripeWebhookEnvelopeSchema,
} from "@/schemas/stripeWebhookSchemas"
import type { StripeWebhookTrigger } from "@/types/billingTypes"

export type StripeWebhookMappingResult =
  | { ok: true; event: StripeWebhookTrigger }
  | { ok: false; reason: "malformed_payload" }

export function mapVerifiedStripeWebhook(value: unknown): StripeWebhookMappingResult {
  const envelope = stripeWebhookEnvelopeSchema.safeParse(value)
  if (!envelope.success) return { ok: false, reason: "malformed_payload" }

  const supported = stripeSubscriptionTriggerSchema.safeParse(value)
  if (!supported.success) {
    if (
      envelope.data.type === "customer.subscription.created" ||
      envelope.data.type === "customer.subscription.updated" ||
      envelope.data.type === "customer.subscription.deleted"
    ) {
      return { ok: false, reason: "malformed_payload" }
    }
    return {
      ok: true,
      event: {
        provider: "stripe",
        providerEventId: envelope.data.id,
        eventType: envelope.data.type,
        disposition: "ignore",
        safeMetadata: {
          resource_type: envelope.data.type.split(".")[1]?.slice(0, 80) ?? "unknown",
        },
      },
    }
  }

  return {
    ok: true,
    event: {
      provider: "stripe",
      providerEventId: supported.data.id,
      eventType: supported.data.type,
      disposition: "process",
      subscriptionId: supported.data.data.object.id,
      safeMetadata: {
        resource_type: "subscription",
        stripe_subscription_id: supported.data.data.object.id,
      },
    },
  }
}

```