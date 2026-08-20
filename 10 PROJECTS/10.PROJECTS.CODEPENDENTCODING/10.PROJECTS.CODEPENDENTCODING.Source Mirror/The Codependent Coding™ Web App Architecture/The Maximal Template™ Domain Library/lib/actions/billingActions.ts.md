---
title: 'The Hipster Stack™ Technology Stack\template\lib\actions\billingActions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\actions\billingActions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.actions.billingactions.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\actions\billingActions.ts'
source_file: 'billingActions.ts'
source_sha256: '810cacf0bb82e30430c97da3c71420e1aeb9e055739d0bc6ac33562ee68eea98'
generated: true
---

# `billingActions.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\actions\billingActions.ts`
> SHA-256: `810cacf0bb82e30430c97da3c71420e1aeb9e055739d0bc6ac33562ee68eea98`

```ts
"use server"

import {
  createBillingPortalSessionWorkflow,
  createCheckoutSessionWorkflow,
} from "@/lib/billing/workflows/billingWorkflows"
import { redirect } from "next/navigation"
import { expectedActionFailure } from "@/lib/errors/expectedActionError"
import { actionSuccess, type ActionResult } from "@/types/actionResultTypes"

export async function createCheckoutSessionAction(): Promise<ActionResult<{ url: string }>> {
  try {
    return actionSuccess(await createCheckoutSessionWorkflow())
  } catch (error) {
    return expectedActionFailure(error)
  }
}

export async function createBillingPortalSessionAction(): Promise<ActionResult<{ url: string }>> {
  try {
    return actionSuccess(await createBillingPortalSessionWorkflow())
  } catch (error) {
    return expectedActionFailure(error)
  }
}

export async function createCheckoutRedirectAction(): Promise<void> {
  const result = await createCheckoutSessionAction()
  if (result.ok) redirect(result.data.url)
}

export async function createBillingPortalRedirectAction(): Promise<void> {
  const result = await createBillingPortalSessionAction()
  if (result.ok) redirect(result.data.url)
}

```