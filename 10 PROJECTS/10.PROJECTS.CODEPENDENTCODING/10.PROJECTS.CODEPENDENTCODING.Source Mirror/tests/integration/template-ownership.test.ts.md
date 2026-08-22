---
title: 'The Hipster Stack™ Technology Stack\tests\integration\template-ownership.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\tests\integration\template-ownership.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.tests.integration.template-ownership.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\tests\integration\template-ownership.test.ts'
source_file: 'template-ownership.test.ts'
source_sha256: '5a888dd40da3df5dba43e09572035eb22ace096f805286efb4c6ea8c845384c1'
generated: true
---

# `template-ownership.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\tests\integration\template-ownership.test.ts`
> SHA-256: `5a888dd40da3df5dba43e09572035eb22ace096f805286efb4c6ea8c845384c1`

```ts
import { access, readFile, stat } from 'node:fs/promises';
import path from 'node:path';
import { describe, expect, it } from 'vitest';

const root = process.cwd();

describe('template ownership', () => {
  it('keeps generator metadata outside the standalone template', async () => {
    await expect(
      access(path.join(root, 'template', '.loaded-vibes-template.json')),
    ).rejects.toMatchObject({ code: 'ENOENT' });
    await expect(
      readFile(
        path.join(root, 'packages', 'core', 'src', 'template-metadata.ts'),
        'utf8',
      ),
    ).resolves.toContain("templateId: 'loaded-vibes-maximal-saas'");
  });

  it('keeps every supported capability in the canonical template', async () => {
    const template = path.join(root, 'template');
    for (const capabilityPath of [
      path.join('app', '(public)', 'pricing', 'page.tsx'),
      path.join('app', '(tenant)', 'projects', 'page.tsx'),
      path.join('app', 'api', 'stripe', 'connect', 'webhooks', 'route.ts'),
    ]) {
      await expect(
        stat(path.join(template, capabilityPath)),
      ).resolves.toBeTruthy();
    }

    await expect(stat(path.join(root, 'templates'))).rejects.toMatchObject({
      code: 'ENOENT',
    });
  });

  it('has no external template synchronization command or script', async () => {
    const packageJson = JSON.parse(
      await readFile(path.join(root, 'package.json'), 'utf8'),
    ) as { scripts: Record<string, string> };
    expect(packageJson.scripts).not.toHaveProperty('template:sync');
    await expect(
      access(path.join(root, 'scripts', 'sync-template.ps1')),
    ).rejects.toMatchObject({ code: 'ENOENT' });
  });
});

```