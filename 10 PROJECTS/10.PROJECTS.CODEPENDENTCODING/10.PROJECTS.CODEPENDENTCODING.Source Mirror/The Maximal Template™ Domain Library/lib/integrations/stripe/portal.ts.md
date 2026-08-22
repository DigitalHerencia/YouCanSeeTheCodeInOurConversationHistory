---
title: 'The Maximal Template™ Domain Library\lib\integrations\stripe\portal.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\stripe\portal.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.stripe.portal.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\stripe\portal.ts'
source_file: 'portal.ts'
source_sha256: '45057046c0693a5a49a3435f269e311858710e78e92fa2eb002d0717068c9753'
generated: true
---

# `portal.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\stripe\portal.ts`
> SHA-256: `45057046c0693a5a49a3435f269e311858710e78e92fa2eb002d0717068c9753`

```ts
import "server-only";

import { getStripeClient } from "./client";

export function createBillingPortalSession(
  customerId: string,
  returnUrl: string,
) {
  return getStripeClient().billingPortal.sessions.create({
    customer: customerId,
    return_url: returnUrl,
  });
}

```