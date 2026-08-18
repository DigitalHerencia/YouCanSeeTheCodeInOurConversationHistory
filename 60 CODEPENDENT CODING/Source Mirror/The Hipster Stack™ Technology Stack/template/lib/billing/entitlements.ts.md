---
title: 'The Hipster Stack™ Technology Stack\template\lib\billing\entitlements.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\billing\entitlements.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.billing.entitlements.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\billing\entitlements.ts'
source_file: 'entitlements.ts'
source_sha256: '17224cd8ac26bc40363beb49851e66d4ac9b6eb2fc44537a6da69275ee9d77bb'
generated: true
---

# `entitlements.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\billing\entitlements.ts`
> SHA-256: `17224cd8ac26bc40363beb49851e66d4ac9b6eb2fc44537a6da69275ee9d77bb`

```ts
import type { BillingSubscriptionStatus } from "@/types/billingTypes"

export function statusGrantsCoreEntitlement(status: BillingSubscriptionStatus): boolean {
  return status === "active" || status === "trialing"
}

```