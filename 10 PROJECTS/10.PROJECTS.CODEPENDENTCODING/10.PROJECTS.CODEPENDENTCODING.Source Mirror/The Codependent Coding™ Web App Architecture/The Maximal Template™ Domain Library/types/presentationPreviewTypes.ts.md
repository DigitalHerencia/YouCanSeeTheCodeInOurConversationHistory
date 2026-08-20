---
title: 'The Hipster Stack™ Technology Stack\template\types\presentationPreviewTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\types\presentationPreviewTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.types.presentationpreviewtypes.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\types\presentationPreviewTypes.ts'
source_file: 'presentationPreviewTypes.ts'
source_sha256: '60a8e099297fa11e4d59696429b747447d5a0109372027a33de429e3388ebb28'
generated: true
---

# `presentationPreviewTypes.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\types\presentationPreviewTypes.ts`
> SHA-256: `60a8e099297fa11e4d59696429b747447d5a0109372027a33de429e3388ebb28`

```ts
export type VouchCreationDraft = {
  amountDollars: string
  appointmentStartsAt: string
  confirmationOpensAt: string
  confirmationExpiresAt: string
  disclaimerAccepted: boolean
}

export type VouchCreationActionResult =
  | {
      ok: true
      data?: VouchCreationPreviewData
    }
  | {
      ok: false
      formError?: string
      fieldErrors?: Record<string, string[]>
    }

export type VouchCreationPreviewData = {
  amountCents?: number
  customerTotalCents?: number
  vouchServiceFeeCents?: number
  processingFeeOffsetCents?: number
  detailPath?: string
  checkoutUrl?: string
}

```