---
title: 'The Hipster Stack™ Technology Stack\template\types\auditTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\types\auditTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.types.audittypes.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\types\auditTypes.ts'
source_file: 'auditTypes.ts'
source_sha256: 'b426c8a76254f328e04e0fb4536c699e5a886b8e4a497bf13361144882b1aedf'
generated: true
---

# `auditTypes.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\types\auditTypes.ts`
> SHA-256: `b426c8a76254f328e04e0fb4536c699e5a886b8e4a497bf13361144882b1aedf`

```ts
export type AuditEventName =
  | "organization.created"
  | "organization.updated"
  | "organization.invitation.created"
  | "organization.membership.role_changed"
  | "organization.membership.removed"
  | "project.created"
  | "project.status_changed"
  | "project.updated"

export type AuditEntityType = "organization" | "organization_invitation" | "membership" | "project"

export type BoundedAuditEvent = {
  eventName: AuditEventName
  actorUserId: string
  entityType: AuditEntityType
  entityId: string
  organizationId: string
  projectId?: string
  requestId?: string
  metadata?: Record<string, string | number | boolean | null>
}

```