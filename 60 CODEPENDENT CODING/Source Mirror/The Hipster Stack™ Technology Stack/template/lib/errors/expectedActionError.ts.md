---
title: 'The Hipster Stack™ Technology Stack\template\lib\errors\expectedActionError.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\lib\errors\expectedActionError.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.lib.errors.expectedactionerror.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\lib\errors\expectedActionError.ts'
source_file: 'expectedActionError.ts'
source_sha256: '8d74cec908311619140b07d468fd97cfc6478383191dbb48b0c2011baea62cce'
generated: true
---

# `expectedActionError.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\lib\errors\expectedActionError.ts`
> SHA-256: `8d74cec908311619140b07d468fd97cfc6478383191dbb48b0c2011baea62cce`

```ts
import "server-only"

import { actionFailure, type ActionResult } from "@/types/actionResultTypes"

export class ExpectedActionError extends Error {
  constructor(
    readonly code: string,
    readonly publicMessage: string
  ) {
    super(publicMessage)
    this.name = "ExpectedActionError"
  }
}

export function expectedActionFailure(error: unknown): ActionResult<never> {
  if (!(error instanceof ExpectedActionError)) throw error
  return actionFailure(error.code, error.publicMessage)
}

```