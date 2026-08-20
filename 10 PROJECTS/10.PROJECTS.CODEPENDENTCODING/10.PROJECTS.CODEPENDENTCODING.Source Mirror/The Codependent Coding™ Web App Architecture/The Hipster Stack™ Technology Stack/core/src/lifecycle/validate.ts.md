---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\validate.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\validate.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.lifecycle.validate.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\validate.ts'
source_file: 'validate.ts'
source_sha256: 'f846646482cbee889884d46706586687e0924ee645594fc430b3240046aa6f9a'
generated: true
---

# `validate.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\validate.ts`
> SHA-256: `f846646482cbee889884d46706586687e0924ee645594fc430b3240046aa6f9a`

```ts
import { runCommand } from './run.js';

export async function validateProject(cwd: string): Promise<void> {
  await runCommand(
    cwd,
    'corepack',
    ['pnpm', 'validate:ci'],
    'VALIDATION_FAILED',
  );
}

```