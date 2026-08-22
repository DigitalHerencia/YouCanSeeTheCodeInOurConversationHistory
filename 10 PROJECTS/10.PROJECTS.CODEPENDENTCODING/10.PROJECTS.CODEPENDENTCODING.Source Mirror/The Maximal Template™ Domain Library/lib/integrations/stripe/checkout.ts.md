---
title: 'The Maximal Template™ Domain Library\lib\integrations\stripe\checkout.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\stripe\checkout.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.stripe.checkout.ts'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\lib\integrations\stripe\checkout.ts'
source_file: 'checkout.ts'
source_sha256: 'c65d1c466a4d7c5e144b2a376f19dbab78ed4522c0bc4bd8b0b0acf6b8bc9ca6'
generated: true
---

# `checkout.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\stripe\checkout.ts`
> SHA-256: `c65d1c466a4d7c5e144b2a376f19dbab78ed4522c0bc4bd8b0b0acf6b8bc9ca6`

```ts
import "server-only";

import { getStripeClient } from "./client";

export function createCheckoutSession(input: {
  organizationId: string;
  priceId: string;
  successUrl: string;
  cancelUrl: string;
  customerId?: string;
}) {
  return getStripeClient().checkout.sessions.create({
    mode: "subscription",
    customer: input.customerId,
    line_items: [{ price: input.priceId, quantity: 1 }],
    success_url: input.successUrl,
    cancel_url: input.cancelUrl,
    client_reference_id: input.organizationId,
    metadata: { organizationId: input.organizationId },
    subscription_data: { metadata: { organizationId: input.organizationId } },
  });
}

```