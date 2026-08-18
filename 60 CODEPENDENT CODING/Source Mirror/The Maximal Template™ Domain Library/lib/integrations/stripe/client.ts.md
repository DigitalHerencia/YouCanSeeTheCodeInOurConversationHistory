---
title: 'The Maximal Template™ Domain Library\lib\integrations\stripe\client.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\stripe\client.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.stripe.client.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\stripe\client.ts'
source_file: 'client.ts'
source_sha256: '83fbb98b2347321002e3b01dee015ce2c24645cc2a3b5b081b276dd29647a191'
generated: true
---

# `client.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\stripe\client.ts`
> SHA-256: `83fbb98b2347321002e3b01dee015ce2c24645cc2a3b5b081b276dd29647a191`

```ts
import "server-only";

import Stripe from "stripe";

let client: Stripe | undefined;

export function getStripeClient() {
  const apiKey = process.env.STRIPE_SECRET_KEY;
  if (!apiKey)
    throw new Error(
      "Stripe is not configured. Add STRIPE_SECRET_KEY to .env.local.",
    );
  client ??= new Stripe(apiKey);
  return client;
}

```