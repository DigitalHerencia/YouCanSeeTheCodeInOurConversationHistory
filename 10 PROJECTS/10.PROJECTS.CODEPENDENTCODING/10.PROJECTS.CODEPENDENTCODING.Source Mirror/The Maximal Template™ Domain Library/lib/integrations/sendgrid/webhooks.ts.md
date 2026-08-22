---
title: 'The Maximal Template™ Domain Library\lib\integrations\sendgrid\webhooks.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\integrations\sendgrid\webhooks.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.integrations.sendgrid.webhooks.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\integrations\sendgrid\webhooks.ts'
source_file: 'webhooks.ts'
source_sha256: '716a8de1907aee366a1b67eaaa54479f55d121593275e0008d515e59676ab4f7'
generated: true
---

# `webhooks.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\integrations\sendgrid\webhooks.ts`
> SHA-256: `716a8de1907aee366a1b67eaaa54479f55d121593275e0008d515e59676ab4f7`

```ts
import "server-only";

import { EventWebhook } from "@sendgrid/eventwebhook";

export function verifySendGridWebhook(
  payload: string,
  signature: string | null,
  timestamp: string | null,
) {
  const verificationKey = process.env.SENDGRID_WEBHOOK_VERIFICATION_KEY;
  if (!verificationKey)
    throw new Error(
      "SendGrid webhooks are not configured. Add SENDGRID_WEBHOOK_VERIFICATION_KEY to .env.local.",
    );
  if (!signature || !timestamp)
    throw new Error("SendGrid webhook signature headers are required.");
  const verifier = new EventWebhook();
  return verifier.verifySignature(
    verifier.convertPublicKeyToECDSA(verificationKey),
    payload,
    signature,
    timestamp,
  );
}

```