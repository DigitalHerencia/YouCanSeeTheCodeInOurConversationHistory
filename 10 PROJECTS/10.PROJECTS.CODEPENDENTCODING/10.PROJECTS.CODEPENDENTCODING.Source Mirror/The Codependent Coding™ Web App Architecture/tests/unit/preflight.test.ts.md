---
title: 'The Hipster Stack™ Technology Stack\tests\unit\preflight.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\tests\unit\preflight.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.tests.unit.preflight.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\tests\unit\preflight.test.ts'
source_file: 'preflight.test.ts'
source_sha256: '304f742e2c5e6e9c8dc492a37bdbe7db4d2ba6267095138082a547db3d32792c'
generated: true
---

# `preflight.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\tests\unit\preflight.test.ts`
> SHA-256: `304f742e2c5e6e9c8dc492a37bdbe7db4d2ba6267095138082a547db3d32792c`

```ts
import { mkdtemp, mkdir, symlink, writeFile } from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import { describe, expect, it } from 'vitest';
import { assertSafeTarget } from '../../packages/core/src/preflight/target.js';

describe('assertSafeTarget', () => {
  it('accepts a missing destination', async () => {
    const root = await mkdtemp(
      path.join(os.tmpdir(), 'hipster-stack-preflight-'),
    );
    await expect(
      assertSafeTarget(path.join(root, 'new-project')),
    ).resolves.toBeUndefined();
  });

  it('rejects occupied destinations', async () => {
    const target = await mkdtemp(
      path.join(os.tmpdir(), 'hipster-stack-occupied-'),
    );
    await writeFile(path.join(target, 'keep.txt'), 'keep');
    await expect(assertSafeTarget(target)).rejects.toMatchObject({
      code: 'TARGET_NOT_EMPTY',
    });
  });

  it('rejects destination symlinks', async () => {
    const root = await mkdtemp(
      path.join(os.tmpdir(), 'hipster-stack-symlink-'),
    );
    const actual = path.join(root, 'actual');
    const link = path.join(root, 'link');
    await mkdir(actual);
    await symlink(actual, link, 'junction');
    await expect(assertSafeTarget(link)).rejects.toMatchObject({
      code: 'UNSAFE_TARGET',
    });
  });
});

```