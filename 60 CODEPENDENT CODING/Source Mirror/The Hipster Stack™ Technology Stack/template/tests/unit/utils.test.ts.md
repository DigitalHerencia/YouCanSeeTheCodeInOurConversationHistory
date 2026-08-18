---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\utils.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\utils.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.utils.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\utils.test.ts'
source_file: 'utils.test.ts'
source_sha256: '160aef4b538e90c136c6c2bfc3ec3435e4e149b78de3ffa0a37830677e49da71'
generated: true
---

# `utils.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\utils.test.ts`
> SHA-256: `160aef4b538e90c136c6c2bfc3ec3435e4e149b78de3ffa0a37830677e49da71`

```ts
import { describe, expect, it } from "vitest"

import { safeHref } from "@/lib/utils"

describe("safeHref", () => {
  it("accepts relative application paths and HTTPS URLs", () => {
    expect(safeHref("/pricing")).toBe("/pricing")
    expect(safeHref("#details")).toBe("#details")
    expect(safeHref("https://example.com/docs")).toBe("https://example.com/docs")
  })

  it("rejects executable and protocol-relative URLs", () => {
    expect(() => safeHref("javascript:alert(1)")).toThrow(TypeError)
    expect(() => safeHref("//attacker.example/path")).toThrow(TypeError)
  })
})

```