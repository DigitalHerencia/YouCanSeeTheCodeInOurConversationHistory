---
title: 'The Maximal Template™ Domain Library\lib\integrations\stripe\webhooks.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\stripe\webhooks.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.stripe.webhooks.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\stripe\webhooks.ts'
source_file: 'webhooks.ts'
source_sha256: 'd6cc36bb51b3822862f368165c19dff081680ea69f3ab73f421bde203c1b5def'
generated: true
---

# `webhooks.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\stripe\webhooks.ts`
> SHA-256: `d6cc36bb51b3822862f368165c19dff081680ea69f3ab73f421bde203c1b5def`

```ts
import "server-only";

import { getStripeClient } from "./client";

export function verifyStripeWebhook(payload: string, signature: string | null) {
  const secret = process.env.STRIPE_WEBHOOK_SECRET;
  if (!secret)
    throw new Error(
      "Stripe webhooks are not configured. Add STRIPE_WEBHOOK_SECRET to .env.local.",
    );
  if (!signature) throw new Error("The Stripe-Signature header is required.");
  return getStripeClient().webhooks.constructEvent(payload, signature, secret);
}

```