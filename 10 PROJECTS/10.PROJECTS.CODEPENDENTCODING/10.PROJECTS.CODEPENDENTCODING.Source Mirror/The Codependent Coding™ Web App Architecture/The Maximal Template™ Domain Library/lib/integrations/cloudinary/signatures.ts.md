---
title: 'The Hipster Stack™ Technology Stack\template\lib\integrations\cloudinary\signatures.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\integrations\cloudinary\signatures.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.integrations.cloudinary.signatures.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\integrations\cloudinary\signatures.ts'
source_file: 'signatures.ts'
source_sha256: 'c6019a8cd40394bd5ccc848cc40ebf70cd6a75689870a1ff205d2d9a40de7af8'
generated: true
---

# `signatures.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\integrations\cloudinary\signatures.ts`
> SHA-256: `c6019a8cd40394bd5ccc848cc40ebf70cd6a75689870a1ff205d2d9a40de7af8`

```ts
import "server-only"

import { createHash, timingSafeEqual } from "node:crypto"

export type CloudinarySignatureAlgorithm = "sha1" | "sha256"

function hash(value: string, algorithm: CloudinarySignatureAlgorithm): string {
  return createHash(algorithm).update(value).digest("hex")
}

export function signCloudinaryParameters(
  parameters: Record<string, string | number>,
  apiSecret: string,
  algorithm: CloudinarySignatureAlgorithm = "sha1"
): string {
  const serialized = Object.entries(parameters)
    .sort(([left], [right]) => left.localeCompare(right))
    .map(([key, value]) => `${key}=${value}`)
    .join("&")
  return hash(`${serialized}${apiSecret}`, algorithm)
}

export function verifyCloudinaryNotification(input: {
  rawBody: string
  timestamp: string
  signature: string
  apiSecret: string
  now?: number
  algorithm?: CloudinarySignatureAlgorithm
}): boolean {
  const timestamp = Number(input.timestamp)
  if (
    !Number.isFinite(timestamp) ||
    Math.abs((input.now ?? Date.now()) / 1000 - timestamp) > 3600
  ) {
    return false
  }
  const expected = Buffer.from(
    hash(`${input.rawBody}${input.timestamp}${input.apiSecret}`, input.algorithm ?? "sha1")
  )
  const received = Buffer.from(input.signature)
  return expected.length === received.length && timingSafeEqual(expected, received)
}

```