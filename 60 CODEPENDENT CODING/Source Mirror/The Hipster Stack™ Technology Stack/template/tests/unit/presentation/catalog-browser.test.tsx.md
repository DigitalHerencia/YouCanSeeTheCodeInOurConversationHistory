---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\presentation\catalog-browser.test.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\presentation\catalog-browser.test.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.presentation.catalog-browser.test.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\presentation\catalog-browser.test.tsx'
source_file: 'catalog-browser.test.tsx'
source_sha256: '34aa93dee06aa79a9945d7006e5d32ee6efe0a435db56e8fd259f9b58b164278'
generated: true
---

# `catalog-browser.test.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\presentation\catalog-browser.test.tsx`
> SHA-256: `34aa93dee06aa79a9945d7006e5d32ee6efe0a435db56e8fd259f9b58b164278`

```tsx
import { render, screen } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import { describe, expect, it } from "vitest"

import { CatalogBrowser } from "@/components/(presentation)/catalog-browser"
import {
  presentationAssetKinds,
  presentationAssets,
  presentationPageRecipes,
} from "@/content/presentation/registry"

describe("presentation catalog browser", () => {
  it("supports labeled keyboard search and responsibility filtering", async () => {
    const user = userEvent.setup()
    render(
      <CatalogBrowser
        assets={presentationAssets}
        kinds={presentationAssetKinds}
        recipes={presentationPageRecipes}
      />
    )

    const search = screen.getByRole("searchbox", { name: "Search assets" })
    await user.click(search)
    await user.keyboard("Vouch")
    expect(screen.getByRole("status")).toHaveTextContent(/assets?$/)
    expect(screen.getByRole("heading", { name: /^Vouch status$/ })).toBeVisible()

    await user.selectOptions(
      screen.getByRole("combobox", { name: "Responsibility" }),
      "fixture-reference"
    )
    expect(screen.getByRole("heading", { name: "Vouch presentation content" })).toBeVisible()
    expect(screen.queryByRole("heading", { name: /^Vouch status$/ })).not.toBeInTheDocument()
  })
})

```