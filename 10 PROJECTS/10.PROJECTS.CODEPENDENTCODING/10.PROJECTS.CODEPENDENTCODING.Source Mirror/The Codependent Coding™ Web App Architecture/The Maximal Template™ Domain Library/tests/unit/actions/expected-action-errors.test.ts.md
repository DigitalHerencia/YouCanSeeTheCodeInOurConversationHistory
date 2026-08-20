---
title: 'The Hipster Stack™ Technology Stack\template\tests\unit\actions\expected-action-errors.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\tests\unit\actions\expected-action-errors.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.tests.unit.actions.expected-action-errors.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\tests\unit\actions\expected-action-errors.test.ts'
source_file: 'expected-action-errors.test.ts'
source_sha256: 'a9639d45d7944552879095a24539126fd56b94cf4b8d10a3ac3e858aa20da7c9'
generated: true
---

# `expected-action-errors.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\tests\unit\actions\expected-action-errors.test.ts`
> SHA-256: `a9639d45d7944552879095a24539126fd56b94cf4b8d10a3ac3e858aa20da7c9`

```ts
import { describe, expect, it } from "vitest"

import { ExpectedActionError, expectedActionFailure } from "@/lib/errors/expectedActionError"

describe("expected Server Action errors", () => {
  it("maps an explicitly public workflow error to ActionResult", () => {
    expect(
      expectedActionFailure(new ExpectedActionError("RESOURCE_STATE", "Try a different state."))
    ).toEqual({ ok: false, code: "RESOURCE_STATE", formError: "Try a different state." })
  })

  it("rethrows unexpected failures instead of swallowing them", () => {
    const unexpected = new Error("database unavailable")
    expect(() => expectedActionFailure(unexpected)).toThrow(unexpected)
  })
})

```