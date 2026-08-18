---
title: 'The Hipster Stack™ Technology Stack\template\lib\integrations\clerk\webhooks.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\integrations\clerk\webhooks.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.integrations.clerk.webhooks.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\integrations\clerk\webhooks.ts'
source_file: 'webhooks.ts'
source_sha256: '115d9792187071030094168b50cd4422d1be4a0bd1f79b3f68491ceca39e35b2'
generated: true
---

# `webhooks.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\integrations\clerk\webhooks.ts`
> SHA-256: `115d9792187071030094168b50cd4422d1be4a0bd1f79b3f68491ceca39e35b2`

```ts
import "server-only"

import { clerkUserWebhookSchema, clerkWebhookEnvelopeSchema } from "@/schemas/clerkWebhookSchemas"
import type { NormalizedClerkEvent } from "@/types/webhookTypes"

export type ClerkWebhookMappingResult =
  | { ok: true; event: NormalizedClerkEvent }
  | { ok: false; reason: "malformed_payload" }

function resourceType(eventType: string): string {
  return eventType.split(".")[0]?.slice(0, 80) || "unknown"
}

function providerDate(timestamp: number): Date {
  return new Date(timestamp < 1_000_000_000_000 ? timestamp * 1000 : timestamp)
}

export function mapVerifiedClerkWebhook(
  value: unknown,
  providerEventId: string
): ClerkWebhookMappingResult {
  const envelope = clerkWebhookEnvelopeSchema.safeParse(value)
  if (!envelope.success) return { ok: false, reason: "malformed_payload" }

  if (
    envelope.data.type !== "user.created" &&
    envelope.data.type !== "user.updated" &&
    envelope.data.type !== "user.deleted"
  ) {
    return {
      ok: true,
      event: {
        provider: "clerk",
        providerEventId,
        eventType: envelope.data.type,
        occurredAt: null,
        disposition: "ignore",
        safeMetadata: {
          provider_occurred_at: null,
          resource_type: resourceType(envelope.data.type),
        },
      },
    }
  }

  const parsed = clerkUserWebhookSchema.safeParse(value)
  if (!parsed.success) return { ok: false, reason: "malformed_payload" }

  if (parsed.data.type === "user.deleted") {
    return {
      ok: true,
      event: {
        provider: "clerk",
        providerEventId,
        eventType: "user.deleted",
        occurredAt: null,
        disposition: "process",
        user: { clerkUserId: parsed.data.data.id, email: null, displayName: null },
        safeMetadata: {
          clerk_user_id: parsed.data.data.id,
          provider_occurred_at: null,
          resource_type: "user",
        },
      },
    }
  }

  const data = parsed.data.data
  const primaryEmail =
    data.email_addresses?.find((email) => email.id === data.primary_email_address_id)
      ?.email_address ?? data.email_addresses?.[0]?.email_address
  const fullName = [data.first_name, data.last_name]
    .filter((part): part is string => Boolean(part))
    .join(" ")
    .trim()
    .slice(0, 120)
  const occurredAt = providerDate(data.updated_at)

  return {
    ok: true,
    event: {
      provider: "clerk",
      providerEventId,
      eventType: parsed.data.type,
      occurredAt,
      disposition: "process",
      user: {
        clerkUserId: data.id,
        email: primaryEmail ?? null,
        displayName: fullName || data.username || null,
      },
      safeMetadata: {
        clerk_user_id: data.id,
        provider_occurred_at: occurredAt?.toISOString() ?? null,
        resource_type: "user",
      },
    },
  }
}

```