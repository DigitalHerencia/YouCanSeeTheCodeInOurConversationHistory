---
title: 'The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\client.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\client.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.integrations.stripe.client.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\client.ts'
source_file: 'client.ts'
source_sha256: 'b3b06d1c7df0d7a3c9ef6d6591b9a1f48770beb375b4dbf88ecb3d0554932fe4'
generated: true
---

# `client.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\integrations\stripe\client.ts`
> SHA-256: `b3b06d1c7df0d7a3c9ef6d6591b9a1f48770beb375b4dbf88ecb3d0554932fe4`

```ts
import "server-only"

import Stripe from "stripe"

import { getRequiredEnv } from "@/lib/env"

let stripeClient: Stripe | undefined

export function getStripe(): Stripe {
  if (!stripeClient) {
    stripeClient = new Stripe(getRequiredEnv("STRIPE_SECRET_KEY"))
  }
  return stripeClient
}

```