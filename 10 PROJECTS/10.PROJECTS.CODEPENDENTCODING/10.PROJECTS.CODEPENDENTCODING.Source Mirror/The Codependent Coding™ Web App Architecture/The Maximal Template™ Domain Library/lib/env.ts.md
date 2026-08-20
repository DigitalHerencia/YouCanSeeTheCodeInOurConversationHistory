---
title: 'The Hipster Stack™ Technology Stack\template\lib\env.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\env.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.env.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\env.ts'
source_file: 'env.ts'
source_sha256: 'e0bf6fdcf4302b69376364a5f01f1fdc664554226dbb6c4db387052782f94dc4'
generated: true
---

# `env.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\env.ts`
> SHA-256: `e0bf6fdcf4302b69376364a5f01f1fdc664554226dbb6c4db387052782f94dc4`

```ts
import "server-only"

type RuntimeEnv = {
  databaseUrl: string
  appUrl: string
  clerkSecretKey: string | undefined
  clerkWebhookSigningSecret: string | undefined
}

export function getRequiredEnv(name: string): string {
  const value = process.env[name]

  if (!value) {
    throw new Error(`Missing required environment variable: ${name}`)
  }

  return value
}

export function getOptionalEnv(name: string): string | undefined {
  return process.env[name]
}

export function getRuntimeEnv(): RuntimeEnv {
  return {
    databaseUrl: getRequiredEnv("DATABASE_URL"),
    appUrl:
      getOptionalEnv("NEXT_PUBLIC_APP_URL") ??
      (getOptionalEnv("VERCEL_URL")
        ? `https://${getOptionalEnv("VERCEL_URL")}`
        : "http://localhost:3000"),
    clerkSecretKey: getOptionalEnv("CLERK_SECRET_KEY"),
    clerkWebhookSigningSecret: getOptionalEnv("CLERK_WEBHOOK_SIGNING_SECRET"),
  }
}

```