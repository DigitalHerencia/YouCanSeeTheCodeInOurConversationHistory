---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\preflight\target.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\preflight\target.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.preflight.target.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\preflight\target.ts'
source_file: 'target.ts'
source_sha256: '1aa7aea73f0e09fc721244edcebe18159f629abd981f9b44125d92e08dd5752c'
generated: true
---

# `target.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\preflight\target.ts`
> SHA-256: `1aa7aea73f0e09fc721244edcebe18159f629abd981f9b44125d92e08dd5752c`

```ts
import { lstat, readdir, realpath } from 'node:fs/promises';
import path from 'node:path';
import { LoadedVibesError } from '../errors.js';

async function exists(target: string): Promise<boolean> {
  try {
    await lstat(target);
    return true;
  } catch (error) {
    if ((error as NodeJS.ErrnoException).code === 'ENOENT') return false;
    throw error;
  }
}

export async function assertSafeTarget(target: string): Promise<void> {
  const resolved = path.resolve(target);
  const root = path.parse(resolved).root;
  if (resolved === root || resolved === path.resolve(process.cwd())) {
    throw new LoadedVibesError(
      'UNSAFE_TARGET',
      `Refusing unsafe target: ${resolved}`,
    );
  }
  const relativeSegments = path
    .relative(root, resolved)
    .split(path.sep)
    .filter(Boolean);
  let current = root;
  for (const segment of relativeSegments) {
    current = path.join(current, segment);
    if (!(await exists(current))) break;
    if ((await lstat(current)).isSymbolicLink()) {
      throw new LoadedVibesError(
        'UNSAFE_TARGET',
        `Refusing path through symlink: ${current}`,
      );
    }
  }
  if (!(await exists(resolved))) return;
  const stat = await lstat(resolved);
  if (stat.isSymbolicLink()) {
    const destination = await realpath(resolved);
    throw new LoadedVibesError(
      'UNSAFE_TARGET',
      `Refusing symlink target resolving to ${destination}`,
    );
  }
  if (!stat.isDirectory()) {
    throw new LoadedVibesError(
      'TARGET_NOT_EMPTY',
      `Target exists and is not a directory: ${resolved}`,
    );
  }
  if ((await readdir(resolved)).length > 0) {
    throw new LoadedVibesError(
      'TARGET_NOT_EMPTY',
      `Target directory is not empty: ${resolved}`,
    );
  }
}

```