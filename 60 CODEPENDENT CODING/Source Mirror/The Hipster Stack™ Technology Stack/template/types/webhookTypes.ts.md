---
title: 'The Hipster Stack™ Technology Stack\template\types\webhookTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\types\webhookTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.types.webhooktypes.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\types\webhookTypes.ts'
source_file: 'webhookTypes.ts'
source_sha256: 'ec669737e649e1d2f0e07730ae739cbe298108204d56a5a45b5692c0a47d066f'
generated: true
---

# `webhookTypes.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\types\webhookTypes.ts`
> SHA-256: `ec669737e649e1d2f0e07730ae739cbe298108204d56a5a45b5692c0a47d066f`

```ts
export type ClerkUserEventType = "user.created" | "user.updated" | "user.deleted"

type NormalizedClerkUserEventBase = {
  provider: "clerk"
  providerEventId: string
  disposition: "process"
  user: {
    clerkUserId: string
    email: string | null
    displayName: string | null
  }
  safeMetadata: {
    clerk_user_id: string
    provider_occurred_at: string | null
    resource_type: "user"
  }
}

export type NormalizedClerkUserEvent = NormalizedClerkUserEventBase &
  (
    | { eventType: "user.created" | "user.updated"; occurredAt: Date }
    | { eventType: "user.deleted"; occurredAt: null }
  )

export type IgnoredClerkEvent = {
  provider: "clerk"
  providerEventId: string
  eventType: string
  occurredAt: null
  disposition: "ignore"
  safeMetadata: {
    provider_occurred_at: null
    resource_type: string
  }
}

export type NormalizedClerkEvent = NormalizedClerkUserEvent | IgnoredClerkEvent

export type ClaimableProviderEvent = {
  provider: "clerk" | "stripe" | "stripe_connect" | "cloudinary"
  providerEventId: string
  eventType: string
  safeMetadata: Record<string, string | null>
}

export type WebhookProcessingResult = {
  ok: boolean
  status: "processed" | "ignored" | "duplicate" | "processing" | "failed"
}

```