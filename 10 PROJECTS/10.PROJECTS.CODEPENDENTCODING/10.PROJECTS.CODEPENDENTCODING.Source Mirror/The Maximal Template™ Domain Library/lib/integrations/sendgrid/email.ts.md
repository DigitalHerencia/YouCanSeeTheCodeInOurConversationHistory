---
title: 'The Maximal Template™ Domain Library\lib\integrations\sendgrid\email.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\sendgrid\email.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.sendgrid.email.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\sendgrid\email.ts'
source_file: 'email.ts'
source_sha256: '0eac8d93e0d8dbb66d4a4cf94ff7a634412e7b718ad2bbf446749c2fc8112127'
generated: true
---

# `email.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\sendgrid\email.ts`
> SHA-256: `0eac8d93e0d8dbb66d4a4cf94ff7a634412e7b718ad2bbf446749c2fc8112127`

```ts
import "server-only";

import { getSendGridClient } from "./client";

export async function sendTransactionalEmail(input: {
  to: string;
  subject: string;
  text: string;
  html?: string;
  organizationId: string;
}) {
  const from = process.env.SENDGRID_FROM_EMAIL;
  if (!from)
    throw new Error(
      "SendGrid is not configured. Add SENDGRID_FROM_EMAIL to .env.local.",
    );
  const { organizationId, ...message } = input;
  const [response] = await getSendGridClient().send({
    ...message,
    from,
    customArgs: { organizationId },
  });
  return {
    statusCode: response.statusCode,
    messageId: response.headers["x-message-id"],
  };
}

```