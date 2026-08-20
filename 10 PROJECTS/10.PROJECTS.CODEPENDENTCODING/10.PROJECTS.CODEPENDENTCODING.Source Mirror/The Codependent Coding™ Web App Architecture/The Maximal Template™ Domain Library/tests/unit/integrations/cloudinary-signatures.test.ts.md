---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\integrations\cloudinary-signatures.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\integrations\cloudinary-signatures.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.integrations.cloudinary-signatures.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\integrations\cloudinary-signatures.test.ts'
source_file: 'cloudinary-signatures.test.ts'
source_sha256: 'cc9bf5df0ecc6dc47411270355fcfcffb3458d1d274cbd369857269532e538d8'
generated: true
---

# `cloudinary-signatures.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\integrations\cloudinary-signatures.test.ts`
> SHA-256: `cc9bf5df0ecc6dc47411270355fcfcffb3458d1d274cbd369857269532e538d8`

```ts
import { createHash } from "node:crypto"
import { describe, expect, it } from "vitest"

import {
  signCloudinaryParameters,
  verifyCloudinaryNotification,
} from "@/lib/integrations/cloudinary/signatures"

describe("Cloudinary signatures", () => {
  it("sorts upload parameters and defaults to SHA-1", () => {
    const expected = createHash("sha1").update("public_id=asset&timestamp=123secret").digest("hex")
    expect(signCloudinaryParameters({ timestamp: 123, public_id: "asset" }, "secret")).toBe(
      expected
    )
  })

  it("verifies the raw notification body and rejects stale timestamps", () => {
    const rawBody = '{"asset_id":"asset"}'
    const timestamp = "1000"
    const signature = createHash("sha1").update(`${rawBody}${timestamp}secret`).digest("hex")
    expect(
      verifyCloudinaryNotification({
        rawBody,
        timestamp,
        signature,
        apiSecret: "secret",
        now: 1_000_000,
      })
    ).toBe(true)
    expect(
      verifyCloudinaryNotification({
        rawBody,
        timestamp,
        signature,
        apiSecret: "secret",
        now: 10_000_000,
      })
    ).toBe(false)
  })
})

```