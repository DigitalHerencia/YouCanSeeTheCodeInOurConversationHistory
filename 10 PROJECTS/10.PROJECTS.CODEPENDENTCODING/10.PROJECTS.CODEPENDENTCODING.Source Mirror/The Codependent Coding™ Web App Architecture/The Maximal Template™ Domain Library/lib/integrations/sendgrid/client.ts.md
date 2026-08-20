---
title: 'The Maximal Template™ Domain Library\lib\integrations\sendgrid\client.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\sendgrid\client.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.sendgrid.client.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\sendgrid\client.ts'
source_file: 'client.ts'
source_sha256: '04361cb392bb7d1ee2cd53875d58d0b09b39c2229bb97bdfe591efad27da9098'
generated: true
---

# `client.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\sendgrid\client.ts`
> SHA-256: `04361cb392bb7d1ee2cd53875d58d0b09b39c2229bb97bdfe591efad27da9098`

```ts
import "server-only";

import sgMail from "@sendgrid/mail";

let configured = false;
export function getSendGridClient() {
  const apiKey = process.env.SENDGRID_API_KEY;
  if (!apiKey)
    throw new Error(
      "SendGrid is not configured. Add SENDGRID_API_KEY to .env.local.",
    );
  if (!configured) {
    sgMail.setApiKey(apiKey);
    configured = true;
  }
  return sgMail;
}

```