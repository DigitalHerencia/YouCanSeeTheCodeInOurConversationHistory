---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\git.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\git.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.lifecycle.git.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\git.ts'
source_file: 'git.ts'
source_sha256: '4b7eb17b4c68c092c38592d78a6e74ea6a83a977fa9dff3682e3bf0226375dc2'
generated: true
---

# `git.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\git.ts`
> SHA-256: `4b7eb17b4c68c092c38592d78a6e74ea6a83a977fa9dff3682e3bf0226375dc2`

```ts
import { runCommand } from './run.js';

export async function initializeGit(cwd: string): Promise<void> {
  await runCommand(
    cwd,
    'git',
    ['init', '--initial-branch=main'],
    'GIT_INIT_FAILED',
  );
}

```