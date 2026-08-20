---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\webhooks\clerk-webhook-mapping.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\webhooks\clerk-webhook-mapping.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.webhooks.clerk-webhook-mapping.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\webhooks\clerk-webhook-mapping.test.ts'
source_file: 'clerk-webhook-mapping.test.ts'
source_sha256: 'a9e837b1733a67e6d6e9ae3afb99028577b83ab5244c9dbd18d0ac0f3d0ac6a4'
generated: true
---

# `clerk-webhook-mapping.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\webhooks\clerk-webhook-mapping.test.ts`
> SHA-256: `a9e837b1733a67e6d6e9ae3afb99028577b83ab5244c9dbd18d0ac0f3d0ac6a4`

```ts
import { describe, expect, it } from "vitest"

import { mapVerifiedClerkWebhook } from "@/lib/integrations/clerk/webhooks"

describe("Clerk webhook mapping", () => {
  it("rejects malformed user payloads at runtime", () => {
    expect(
      mapVerifiedClerkWebhook(
        { type: "user.created", data: { id: "", updated_at: 1_754_262_000_000 } },
        "event_1"
      )
    ).toEqual({ ok: false, reason: "malformed_payload" })
  })

  it("maps only bounded identity fields and excludes provider metadata", () => {
    const result = mapVerifiedClerkWebhook(
      {
        type: "user.updated",
        data: {
          id: "user_1",
          primary_email_address_id: "email_1",
          email_addresses: [{ id: "email_1", email_address: "person@example.com" }],
          first_name: "Ada",
          last_name: "Lovelace",
          updated_at: 1_754_262_000_000,
          public_metadata: { role: "owner", capability: "billing.manage" },
          private_metadata: { tenantId: "attacker-controlled" },
        },
      },
      "event_2"
    )

    expect(result).toEqual({
      ok: true,
      event: {
        provider: "clerk",
        providerEventId: "event_2",
        eventType: "user.updated",
        occurredAt: new Date("2025-08-03T23:00:00.000Z"),
        disposition: "process",
        user: {
          clerkUserId: "user_1",
          email: "person@example.com",
          displayName: "Ada Lovelace",
        },
        safeMetadata: {
          clerk_user_id: "user_1",
          provider_occurred_at: "2025-08-03T23:00:00.000Z",
          resource_type: "user",
        },
      },
    })
  })

  it("classifies verified unsupported events as ignored", () => {
    expect(
      mapVerifiedClerkWebhook(
        {
          type: "session.created",
          data: { id: "session_1", secret: "not-stored" },
        },
        "event_3"
      )
    ).toEqual({
      ok: true,
      event: {
        provider: "clerk",
        providerEventId: "event_3",
        eventType: "session.created",
        occurredAt: null,
        disposition: "ignore",
        safeMetadata: {
          provider_occurred_at: null,
          resource_type: "session",
        },
      },
    })
  })
})

```