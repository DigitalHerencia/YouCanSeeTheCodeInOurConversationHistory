---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\run.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\run.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.lifecycle.run.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\run.ts'
source_file: 'run.ts'
source_sha256: '8cac57918c96c6fe6f25400469bc0d22ca21819164e48b9580acec81adedb69c'
generated: true
---

# `run.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\run.ts`
> SHA-256: `8cac57918c96c6fe6f25400469bc0d22ca21819164e48b9580acec81adedb69c`

```ts
import { execa } from 'execa';
import { LoadedVibesError, type LoadedVibesErrorCode } from '../errors.js';

export async function runCommand(
  cwd: string,
  command: string,
  args: readonly string[],
  code: LoadedVibesErrorCode,
): Promise<void> {
  try {
    await execa(command, args, { cwd, stdio: 'inherit', shell: false });
  } catch (error) {
    throw new LoadedVibesError(
      code,
      `${command} ${args.join(' ')} failed.`,
      error,
    );
  }
}

```