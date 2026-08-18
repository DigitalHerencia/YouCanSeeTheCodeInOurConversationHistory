---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\install.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\install.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.lifecycle.install.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\install.ts'
source_file: 'install.ts'
source_sha256: '95053ef7decf6de97a1ba50c68ccaf2aaac3d9ab3933939cf45df70d5e88a4f9'
generated: true
---

# `install.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\lifecycle\install.ts`
> SHA-256: `95053ef7decf6de97a1ba50c68ccaf2aaac3d9ab3933939cf45df70d5e88a4f9`

```ts
import { runCommand } from './run.js';

export async function installProject(cwd: string): Promise<void> {
  await runCommand(
    cwd,
    'corepack',
    ['pnpm', 'install', '--frozen-lockfile'],
    'INSTALL_FAILED',
  );
  await runCommand(cwd, 'corepack', ['pnpm', 'db:generate'], 'INSTALL_FAILED');
}

```