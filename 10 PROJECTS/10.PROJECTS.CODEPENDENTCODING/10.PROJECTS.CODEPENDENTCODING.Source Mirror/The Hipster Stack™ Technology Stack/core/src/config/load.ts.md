---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\config\load.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\config\load.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.config.load.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\config\load.ts'
source_file: 'load.ts'
source_sha256: '64bdb79559f70cb6bffb9c2a3da692e0aaf691afc489a4a7dc84632cbf2c642e'
generated: true
---

# `load.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\config\load.ts`
> SHA-256: `64bdb79559f70cb6bffb9c2a3da692e0aaf691afc489a4a7dc84632cbf2c642e`

```ts
import { readFile } from 'node:fs/promises';
import path from 'node:path';
import { LoadedVibesError } from '../errors.js';
import type { ConfigInput } from './normalize.js';

export async function loadConfigFile(
  filePath: string,
  cwd = process.cwd(),
): Promise<ConfigInput> {
  try {
    const contents = await readFile(path.resolve(cwd, filePath), 'utf8');
    return JSON.parse(contents) as ConfigInput;
  } catch (error) {
    throw new LoadedVibesError(
      'INVALID_CONFIG',
      `Unable to read config file: ${filePath}`,
      error,
    );
  }
}

```