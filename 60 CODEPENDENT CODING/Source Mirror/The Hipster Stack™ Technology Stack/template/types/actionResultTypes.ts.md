---
title: 'The Hipster Stack™ Technology Stack\template\types\actionResultTypes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\types\actionResultTypes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.types.actionresulttypes.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\types\actionResultTypes.ts'
source_file: 'actionResultTypes.ts'
source_sha256: '2855ddc24e776ec6025b6e94a43337ddfeaccc8ebabcad6bc55755a03ada21dd'
generated: true
---

# `actionResultTypes.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\types\actionResultTypes.ts`
> SHA-256: `2855ddc24e776ec6025b6e94a43337ddfeaccc8ebabcad6bc55755a03ada21dd`

```ts
export type FieldErrors = Record<string, string[]>

export type ActionResult<TData = void> =
  | {
      ok: true
      data: TData
    }
  | {
      ok: false
      code: string
      formError?: string
      fieldErrors?: FieldErrors
    }

export function actionSuccess<TData>(data: TData): ActionResult<TData> {
  return { ok: true, data }
}

export function actionFailure<TCode extends string>(
  code: TCode,
  formError: string,
  fieldErrors?: FieldErrors
): ActionResult<never> {
  return {
    ok: false,
    code,
    formError,
    ...(fieldErrors ? { fieldErrors } : {}),
  }
}

```