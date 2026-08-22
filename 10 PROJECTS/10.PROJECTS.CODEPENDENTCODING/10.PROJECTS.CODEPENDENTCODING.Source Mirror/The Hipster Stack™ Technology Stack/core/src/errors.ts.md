---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\errors.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\errors.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.errors.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\errors.ts'
source_file: 'errors.ts'
source_sha256: 'f7bf612c0d5ac9a41ea8cfa326ffbaa57b034d2b53451242448cbbb47fbefd39'
generated: true
---

# `errors.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\errors.ts`
> SHA-256: `f7bf612c0d5ac9a41ea8cfa326ffbaa57b034d2b53451242448cbbb47fbefd39`

```ts
export type LoadedVibesErrorCode =
  | 'INVALID_PROJECT_NAME'
  | 'UNSAFE_TARGET'
  | 'TARGET_NOT_EMPTY'
  | 'INVALID_CONFIG'
  | 'UNSUPPORTED_CONFIGURATION'
  | 'TEMPLATE_INVALID'
  | 'COPY_FAILED'
  | 'TRANSFORM_FAILED'
  | 'INSTALL_FAILED'
  | 'VALIDATION_FAILED'
  | 'GIT_INIT_FAILED'
  | 'PROJECT_NOT_GENERATED'
  | 'MODULE_UNSUPPORTED'
  | 'MODULE_ALREADY_PRESENT'
  | 'MODULE_CONFLICT';

export class LoadedVibesError extends Error {
  constructor(
    readonly code: LoadedVibesErrorCode,
    message: string,
    readonly cause?: unknown,
  ) {
    super(message);
    this.name = 'LoadedVibesError';
  }
}

```