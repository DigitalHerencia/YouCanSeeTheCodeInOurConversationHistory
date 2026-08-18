---
title: 'The Hipster Stack™ Technology Stack\template\types\adminTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\types\adminTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.types.admintypes.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\types\adminTypes.ts'
source_file: 'adminTypes.ts'
source_sha256: '370ee4d696042a4dd28a5e265a7625925ca389d01b2a8b1b47574447ac89dbea'
generated: true
---

# `adminTypes.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\types\adminTypes.ts`
> SHA-256: `370ee4d696042a4dd28a5e265a7625925ca389d01b2a8b1b47574447ac89dbea`

```ts
export type AdminUserDTO = {
  id: string
  displayName: string
  email: string | null
  status: "active" | "disabled"
  isApplicationAdmin: boolean
  createdAt: string
}

export type AdminOrganizationDTO = {
  id: string
  name: string
  slug: string
  status: "active" | "suspended"
  memberCount: number
  projectCount: number
  createdAt: string
}

export type AdminBillingDTO = {
  id: string
  organizationName: string
  organizationSlug: string
  status: string
  priceId: string
  cancelAtPeriodEnd: boolean
  currentPeriodEnd: string | null
  updatedAt: string
}

export type AdminWebhookDTO = {
  id: string
  provider: string
  eventType: string
  status: string
  attemptCount: number
  receivedAt: string
  processedAt: string | null
  processingError: string | null
}

```