---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\generator\materialize.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\generator\materialize.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.generator.materialize.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\generator\materialize.ts'
source_file: 'materialize.ts'
source_sha256: 'e92797b53687fd058354d6ff84479d6b46c088cf19f2d388302b30f03f940c47'
generated: true
---

# `materialize.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\generator\materialize.ts`
> SHA-256: `e92797b53687fd058354d6ff84479d6b46c088cf19f2d388302b30f03f940c47`

```ts
import { cp, lstat, mkdir, rename, rm, rmdir } from 'node:fs/promises';
import path from 'node:path';
import { LoadedVibesError } from '../errors.js';
import type { GenerationPlan } from './plan.js';
import { applyTransforms } from './transforms.js';

export async function materialize(plan: GenerationPlan): Promise<void> {
  try {
    await lstat(path.join(plan.templateDirectory, 'package.json'));
  } catch (error) {
    throw new LoadedVibesError(
      'TEMPLATE_INVALID',
      'Canonical template is missing required metadata.',
      error,
    );
  }
  let stagingCreated = false;
  try {
    await mkdir(plan.stagingDirectory, { recursive: false });
    stagingCreated = true;
    await cp(plan.templateDirectory, plan.stagingDirectory, {
      recursive: true,
      force: false,
    });
    for (const relative of plan.excludedOwnedPaths) {
      await rm(path.join(plan.stagingDirectory, relative), {
        recursive: true,
        force: true,
      });
    }
    await applyTransforms(plan);
    try {
      await rmdir(plan.config.targetDirectory);
    } catch (error) {
      if ((error as NodeJS.ErrnoException).code !== 'ENOENT') throw error;
    }
    await rename(plan.stagingDirectory, plan.config.targetDirectory);
  } catch (error) {
    if (stagingCreated) {
      await rm(plan.stagingDirectory, { recursive: true, force: true });
    }
    if (error instanceof LoadedVibesError) throw error;
    throw new LoadedVibesError(
      'COPY_FAILED',
      'Failed to materialize the canonical template.',
      error,
    );
  }
}

```