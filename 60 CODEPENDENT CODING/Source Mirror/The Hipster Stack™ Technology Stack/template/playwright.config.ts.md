---
title: 'The Hipster Stack™ Technology Stack\template\playwright.config.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\playwright.config.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.playwright.config.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\playwright.config.ts'
source_file: 'playwright.config.ts'
source_sha256: '32f076a0fd9b05163dedb167cf9db4c07233ab86ada058d07021839a6a1560ca'
generated: true
---

# `playwright.config.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\playwright.config.ts`
> SHA-256: `32f076a0fd9b05163dedb167cf9db4c07233ab86ada058d07021839a6a1560ca`

```ts
import { defineConfig, devices, type PlaywrightTestConfig } from "@playwright/test"

const config: PlaywrightTestConfig = {
  testDir: "./tests/e2e",
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  reporter: "html",
  use: {
    baseURL: process.env.PLAYWRIGHT_BASE_URL ?? "http://127.0.0.1:3000",
    trace: "on-first-retry",
  },
  webServer: {
    command: "corepack pnpm@11.1.1 dev",
    url: "http://127.0.0.1:3000",
    reuseExistingServer: !process.env.CI,
    timeout: 120_000,
  },
  projects: [
    {
      name: "chromium",
      use: { ...devices["Desktop Chrome"] },
    },
  ],
}

if (process.env.CI) {
  config.workers = 1
}

export default defineConfig(config)

```