---
title: 'The Hipster Stack™ Technology Stack\tests\integration\add-module.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\tests\integration\add-module.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.tests.integration.add-module.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\tests\integration\add-module.test.ts'
source_file: 'add-module.test.ts'
source_sha256: '5ddf11d55a9ee903f48b2f75eb6be85eab05565bb56c56da7fc902f4a87e1cb3'
generated: true
---

# `add-module.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\tests\integration\add-module.test.ts`
> SHA-256: `5ddf11d55a9ee903f48b2f75eb6be85eab05565bb56c56da7fc902f4a87e1cb3`

```ts
import { mkdtemp, readFile, stat, writeFile } from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import { describe, expect, it } from 'vitest';
import {
  applyProjectModuleAddition,
  createProject,
  planProjectModuleAddition,
} from '@hipster-stack/core';

async function createBareProject(prefix: string): Promise<string> {
  const root = await mkdtemp(path.join(os.tmpdir(), prefix));
  const target = path.join(root, 'app');
  await createProject({
    name: 'module-test-app',
    product: 'bare-golden-app',
    targetDirectory: target,
    git: { initialize: false },
    install: { enabled: false },
  });
  return target;
}

describe('post-generation module addition', () => {
  it('records a manifest and adds a supported module with updated provenance', async () => {
    const target = await createBareProject('hipster-stack-add-marketing-');
    const initialManifest = JSON.parse(
      await readFile(
        path.join(target, '.hipsterstack', 'manifest.json'),
        'utf8',
      ),
    ) as { modules: string[] };
    expect(initialManifest.modules).toEqual([]);

    const plan = await planProjectModuleAddition(target, 'marketing');
    expect(plan.addedCapabilities).toEqual(['marketing']);
    expect(plan.prerequisites).toEqual([]);
    const result = await applyProjectModuleAddition(plan);
    expect(result.filesAdded.length).toBeGreaterThan(0);
    await expect(
      stat(path.join(target, 'app', '(public)', 'pricing', 'page.tsx')),
    ).resolves.toBeTruthy();
    const updatedManifest = JSON.parse(
      await readFile(
        path.join(target, '.hipsterstack', 'manifest.json'),
        'utf8',
      ),
    ) as { modules: string[]; recipe: { modules: { marketing: boolean } } };
    expect(updatedManifest.modules).toEqual(['marketing']);
    expect(updatedManifest.recipe.modules.marketing).toBe(true);
    await expect(
      readFile(
        path.join(target, '.agents', 'contracts', 'routes.yaml'),
        'utf8',
      ),
    ).resolves.toContain('/pricing');
  });

  it('resolves capability prerequisites and reports setup before applying', async () => {
    const target = await createBareProject('hipster-stack-add-connect-');
    const plan = await planProjectModuleAddition(target, 'stripe-connect');
    expect(plan.addedCapabilities).toEqual(['billing', 'stripeConnect']);
    expect(plan.prerequisites).toEqual(['billing']);
    expect(plan.setup.join(' ')).toContain('STRIPE_CONNECT_WEBHOOK_SECRET');
    expect(plan.files).toContain(
      path.join('app', 'api', 'stripe', 'connect', 'webhooks', 'route.ts'),
    );
  });

  it('refuses to overwrite a user-modified intentional replacement', async () => {
    const target = await createBareProject('hipster-stack-add-conflict-');
    const dashboard = path.join(
      target,
      'features',
      'dashboard',
      'dashboard-feature.tsx',
    );
    await writeFile(dashboard, '// user-owned dashboard\n');
    await expect(
      planProjectModuleAddition(target, 'sample-domain'),
    ).rejects.toMatchObject({ code: 'MODULE_CONFLICT' });
    await expect(readFile(dashboard, 'utf8')).resolves.toBe(
      '// user-owned dashboard\n',
    );
  });
});

```