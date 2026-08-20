---
title: 'The Hipster Stack™ Technology Stack\template\tests\e2e\presentation-catalog.spec.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\e2e\presentation-catalog.spec.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.e2e.presentation-catalog.spec.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\e2e\presentation-catalog.spec.ts'
source_file: 'presentation-catalog.spec.ts'
source_sha256: 'ffb568ece4821e8e021b0ac587605760e6ecfa6f742dbe1d6f41749e19715a94'
generated: true
---

# `presentation-catalog.spec.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\e2e\presentation-catalog.spec.ts`
> SHA-256: `ffb568ece4821e8e021b0ac587605760e6ecfa6f742dbe1d6f41749e19715a94`

```ts
import { expect, test } from "@playwright/test"

test("catalog supports keyboard search and mobile reflow", async ({ page }) => {
  await page.setViewportSize({ width: 375, height: 812 })
  await page.goto("/catalog")

  await expect(page.getByRole("heading", { name: "Typed asset catalog" })).toBeVisible()
  const search = page.getByRole("searchbox", { name: "Search assets" })
  await search.focus()
  await page.keyboard.type("Vouch")
  await expect(page.getByRole("status")).toContainText("asset")
  await expect(page.getByRole("heading", { name: "Vouch status", exact: true })).toBeVisible()

  await page.getByRole("combobox", { name: "Responsibility" }).selectOption("fixture-reference")
  await expect(page.getByRole("heading", { name: "Vouch presentation content" })).toBeVisible()
  await expect(page.getByRole("heading", { name: "Core page recipes" })).toBeVisible()

  const horizontalOverflow = await page.evaluate(
    () => document.documentElement.scrollWidth > document.documentElement.clientWidth
  )
  expect(horizontalOverflow).toBe(false)
})

```