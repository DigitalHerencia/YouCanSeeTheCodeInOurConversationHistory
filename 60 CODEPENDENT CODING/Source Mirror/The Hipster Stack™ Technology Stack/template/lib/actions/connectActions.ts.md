---
title: 'The Hipster Stack™ Technology Stack\template\lib\actions\connectActions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\actions\connectActions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.actions.connectactions.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\actions\connectActions.ts'
source_file: 'connectActions.ts'
source_sha256: '08aee8960a2186fc0f2bb812d0fd6fbe424ff2d2b3eb6936783468ed4e93aa0c'
generated: true
---

# `connectActions.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\actions\connectActions.ts`
> SHA-256: `08aee8960a2186fc0f2bb812d0fd6fbe424ff2d2b3eb6936783468ed4e93aa0c`

```ts
"use server"

import {
  captureConnectPaymentWorkflow,
  createConnectOnboardingLinkWorkflow,
  refundConnectPaymentWorkflow,
} from "@/lib/connect/workflows/connectWorkflows"
import { expectedActionFailure } from "@/lib/errors/expectedActionError"
import { connectResourceIdSchema } from "@/schemas/connectSchemas"
import { actionFailure, actionSuccess, type ActionResult } from "@/types/actionResultTypes"

export async function createConnectOnboardingLinkAction(): Promise<ActionResult<{ url: string }>> {
  try {
    return actionSuccess(await createConnectOnboardingLinkWorkflow())
  } catch (error) {
    return expectedActionFailure(error)
  }
}

export async function captureConnectPaymentAction(
  paymentId: string
): Promise<ActionResult<{ status: string }>> {
  const parsed = connectResourceIdSchema.safeParse(paymentId)
  if (!parsed.success) return actionFailure("INVALID_INPUT", "Invalid payment reference.")
  try {
    const payment = await captureConnectPaymentWorkflow(parsed.data)
    return actionSuccess({ status: payment.status })
  } catch (error) {
    return expectedActionFailure(error)
  }
}

export async function refundConnectPaymentAction(
  paymentId: string
): Promise<ActionResult<{ refundedAmountMinor: number }>> {
  const parsed = connectResourceIdSchema.safeParse(paymentId)
  if (!parsed.success) return actionFailure("INVALID_INPUT", "Invalid payment reference.")
  try {
    const payment = await refundConnectPaymentWorkflow(parsed.data)
    return actionSuccess({ refundedAmountMinor: payment.refundedAmountMinor })
  } catch (error) {
    return expectedActionFailure(error)
  }
}

```