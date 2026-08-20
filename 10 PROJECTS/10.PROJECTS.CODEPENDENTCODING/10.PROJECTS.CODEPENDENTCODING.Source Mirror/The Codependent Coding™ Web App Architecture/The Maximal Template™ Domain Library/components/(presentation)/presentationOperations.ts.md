---
title: 'The Hipster Stack™ Technology Stack\template\components\(presentation)\presentationOperations.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\(presentation)\presentationOperations.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.-presentation-.presentationoperations.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\(presentation)\presentationOperations.ts'
source_file: 'presentationOperations.ts'
source_sha256: 'a572ebb6ec07090af25c92a04c5345bf5c590026f9ed5b374775965027b5ba57'
generated: true
---

# `presentationOperations.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\(presentation)\presentationOperations.ts`
> SHA-256: `a572ebb6ec07090af25c92a04c5345bf5c590026f9ed5b374775965027b5ba57`

```ts
import type {
  VouchCreationActionResult,
  VouchCreationDraft,
} from "@/types/presentationPreviewTypes"

export async function saveStatusPreviewAmount(
  draft: VouchCreationDraft
): Promise<VouchCreationActionResult> {
  const amountCents = parseAmountCents(draft.amountDollars)

  if (amountCents < 500) {
    return {
      ok: false,
      fieldErrors: { amountCents: ["Protected amount must be at least $5.00."] },
    }
  }

  return { ok: true, data: buildPreviewData(amountCents) }
}

export async function saveStatusPreviewWindow(
  draft: VouchCreationDraft
): Promise<VouchCreationActionResult> {
  if (!draft.appointmentStartsAt || !draft.confirmationOpensAt || !draft.confirmationExpiresAt) {
    return {
      ok: false,
      formError: "Appointment, confirmation open, and confirmation expiration are required.",
    }
  }

  if (new Date(draft.confirmationOpensAt) >= new Date(draft.confirmationExpiresAt)) {
    return {
      ok: false,
      fieldErrors: {
        confirmationExpiresAt: ["Confirmation expiration must be after the open time."],
      },
    }
  }

  return { ok: true, data: buildPreviewData(parseAmountCents(draft.amountDollars)) }
}

export async function createStatusPreviewVouch(
  draft: VouchCreationDraft
): Promise<VouchCreationActionResult> {
  if (!draft.disclaimerAccepted) {
    return {
      ok: false,
      fieldErrors: { disclaimerAccepted: ["Acknowledge immutable creation before continuing."] },
    }
  }

  return {
    ok: true,
    data: {
      ...buildPreviewData(parseAmountCents(draft.amountDollars)),
      checkoutUrl: "/checkout/success?preview=status",
      detailPath: "/status",
    },
  }
}

function buildPreviewData(amountCents: number) {
  return {
    amountCents,
    customerTotalCents: amountCents,
    vouchServiceFeeCents: 2500,
    processingFeeOffsetCents: 277,
  }
}

function parseAmountCents(value: string) {
  const amount = Number(value.trim().replace(/[$,\s]/g, ""))
  return Number.isFinite(amount) ? Math.round(amount * 100) : 0
}

```