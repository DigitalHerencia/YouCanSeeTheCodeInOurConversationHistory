---
title: 'The Hipster Stack™ Technology Stack\template\lib\connect\policy.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\connect\policy.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.connect.policy.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\connect\policy.ts'
source_file: 'policy.ts'
source_sha256: '1a113f9c30ca33ddf2baf5f5d6146fadae637c852422aba92f26a16c664ef06a'
generated: true
---

# `policy.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\connect\policy.ts`
> SHA-256: `1a113f9c30ca33ddf2baf5f5d6146fadae637c852422aba92f26a16c664ef06a`

```ts
import "server-only"

import { getOptionalEnv, getRequiredEnv } from "@/lib/env"

const MAX_MINOR_AMOUNT = 2_000_000_000

export type ConnectPaymentTerms = {
  reference: string
  amountMinor: number
  currency: string
  platformFeeMinor: number
}

function integerEnv(name: string, minimum: number, maximum: number): number {
  const raw = getRequiredEnv(name)
  if (!/^\d+$/.test(raw)) throw new Error(`${name} must be an integer.`)
  const parsed = Number(raw)
  if (!Number.isSafeInteger(parsed) || parsed < minimum || parsed > maximum) {
    throw new Error(`${name} is outside the supported range.`)
  }
  return parsed
}

export function connectCountry(): string {
  const value = getRequiredEnv("STRIPE_CONNECT_COUNTRY").toUpperCase()
  if (!/^[A-Z]{2}$/.test(value)) throw new Error("STRIPE_CONNECT_COUNTRY must be ISO alpha-2.")
  return value
}

export function deriveConnectPaymentTerms(input: {
  reference: string
  amountMinor: number
}): ConnectPaymentTerms {
  if (!input.reference.trim() || input.reference.length > 120) {
    throw new Error("A bounded server-owned payment reference is required.")
  }
  if (
    !Number.isSafeInteger(input.amountMinor) ||
    input.amountMinor <= 0 ||
    input.amountMinor > MAX_MINOR_AMOUNT
  ) {
    throw new Error("Payment amount must be a positive integer minor-unit value.")
  }
  const currency = getRequiredEnv("STRIPE_CONNECT_CURRENCY").toLowerCase()
  if (!/^[a-z]{3}$/.test(currency)) throw new Error("STRIPE_CONNECT_CURRENCY must be ISO alpha-3.")
  const feeBps = integerEnv("STRIPE_CONNECT_PLATFORM_FEE_BPS", 0, 9_999)
  const platformFeeMinor = Math.floor((input.amountMinor * feeBps) / 10_000)
  if (platformFeeMinor >= input.amountMinor)
    throw new Error("Platform fee must be below the payment amount.")
  return { reference: input.reference, amountMinor: input.amountMinor, currency, platformFeeMinor }
}

export function connectApplicationUrl(): URL {
  const raw = getOptionalEnv("NEXT_PUBLIC_APP_URL") ?? "http://localhost:3000"
  const url = new URL(raw)
  if (url.protocol !== "https:" && url.hostname !== "localhost" && url.hostname !== "127.0.0.1") {
    throw new Error("NEXT_PUBLIC_APP_URL must use HTTPS outside local development.")
  }
  return url
}

```