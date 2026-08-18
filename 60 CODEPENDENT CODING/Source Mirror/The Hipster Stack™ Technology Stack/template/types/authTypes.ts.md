---
title: 'The Hipster Stack™ Technology Stack\template\types\authTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\types\authTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.types.authtypes.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\types\authTypes.ts'
source_file: 'authTypes.ts'
source_sha256: 'b75997406b1f8d316d569e99602961a546609fc0bce599e12e3582c811c8568e'
generated: true
---

# `authTypes.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\types\authTypes.ts`
> SHA-256: `b75997406b1f8d316d569e99602961a546609fc0bce599e12e3582c811c8568e`

```ts
export type LocalUserContext = {
  id: string
  clerkUserId: string
  email: string | null
  displayName: string | null
  status: "active" | "disabled"
  isApplicationAdmin: boolean
}

export type AuthenticatedUserContext = {
  userId: string
  localUser: LocalUserContext
}

```