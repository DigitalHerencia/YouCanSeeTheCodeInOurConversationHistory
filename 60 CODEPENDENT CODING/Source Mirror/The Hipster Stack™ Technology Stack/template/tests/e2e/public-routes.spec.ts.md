---
title: 'The Hipster Stack™ Technology Stack\template\tests\e2e\public-routes.spec.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\e2e\public-routes.spec.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.e2e.public-routes.spec.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\e2e\public-routes.spec.ts'
source_file: 'public-routes.spec.ts'
source_sha256: '6d3a14256171298c68c0a88d487573a3fc3e67b8f85d58aeb5e5e84502bdbdf8'
generated: true
---

# `public-routes.spec.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\e2e\public-routes.spec.ts`
> SHA-256: `6d3a14256171298c68c0a88d487573a3fc3e67b8f85d58aeb5e5e84502bdbdf8`

```ts
import { expect, test } from "@playwright/test"

test("public routes render without authentication", async ({ page }) => {
  await page.goto("/")
  await expect(page.getByRole("heading", { name: /build the app/i })).toBeVisible()

  await page.goto("/pricing")
  await expect(page.getByRole("heading", { name: /bring your pricing model/i })).toBeVisible()

  await page.goto("/faq")
  await expect(page.getByRole("heading", { name: /boundaries before features/i })).toBeVisible()
})

test("tenant routes redirect anonymous users", async ({ page }) => {
  await page.goto("/dashboard")
  await expect(page).toHaveURL(/\/sign-in\?return_to=%2Fdashboard/)
})

```