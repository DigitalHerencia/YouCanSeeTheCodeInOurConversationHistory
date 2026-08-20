---
title: 'The Hipster Stack™ Technology Stack\template\tests\contract\clerk-webhook-surface.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\contract\clerk-webhook-surface.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.contract.clerk-webhook-surface.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\contract\clerk-webhook-surface.test.ts'
source_file: 'clerk-webhook-surface.test.ts'
source_sha256: 'e9bfeb7d4ad27f990945eda96ad772e493073920e3f5d5325467ab7231972d79'
generated: true
---

# `clerk-webhook-surface.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\contract\clerk-webhook-surface.test.ts`
> SHA-256: `e9bfeb7d4ad27f990945eda96ad772e493073920e3f5d5325467ab7231972d79`

```ts
import { readFileSync } from "node:fs"
import { join } from "node:path"
import { describe, expect, it } from "vitest"

const root = process.cwd()
const read = (path: string) => readFileSync(join(root, path), "utf8")

describe("Clerk identity and webhook contracts", () => {
  it("keeps one public canonical route with official verification", () => {
    const route = read("app/api/clerk/webhooks/route.ts")
    const proxy = read("proxy.ts")
    expect(proxy).toContain('"/api/clerk/webhooks"')
    expect(route).toContain('from "@clerk/nextjs/webhooks"')
    expect(route).toContain("verifyWebhook")
    expect(route).toContain("CLERK_WEBHOOK_SIGNING_SECRET")
  })

  it("keeps session lookup read-only and local RBAC canonical", () => {
    const session = read("lib/auth/session.ts")
    const mapper = read("lib/integrations/clerk/webhooks.ts")
    expect(session).not.toMatch(/currentUser|\.user\.(?:create|update|upsert)/)
    expect(mapper).not.toMatch(/public_metadata|private_metadata|unsafe_metadata/)
  })

  it("defines atomic claim and retry state", () => {
    const schema = read("prisma/schema.prisma")
    const transactions = read("lib/db/transactions/webhookTransactions.ts")
    for (const status of ["received", "processing", "processed", "ignored", "failed"]) {
      expect(schema).toContain(status)
    }
    expect(transactions).toContain("updateMany")
    expect(transactions).toContain("processingStartedAt")
    expect(transactions).toContain("attemptCount")
    expect(transactions).not.toContain("find-then-create")
  })
})

```