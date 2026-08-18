---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\commands\create.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\commands\create.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.commands.create.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\commands\create.ts'
source_file: 'create.ts'
source_sha256: 'b085aeb2800429fdcf54d79f9eb2764133b78a0aa21c55a737cd1649c23d25bf'
generated: true
---

# `create.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\commands\create.ts`
> SHA-256: `b085aeb2800429fdcf54d79f9eb2764133b78a0aa21c55a737cd1649c23d25bf`

```ts
import { access, mkdir } from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import type { ConfigInput } from '../config/normalize.js';
import { normalizeConfig } from '../config/normalize.js';
import { createGenerationPlan } from '../generator/plan.js';
import { materialize } from '../generator/materialize.js';
import { installProject } from '../lifecycle/install.js';
import { initializeGit } from '../lifecycle/git.js';
import { validateProject } from '../lifecycle/validate.js';
import { assertSafeTarget } from '../preflight/target.js';

export interface CreateOptions {
  dryRun?: boolean;
}

export async function resolveTemplateDirectory(): Promise<string> {
  const moduleDirectory = path.dirname(fileURLToPath(import.meta.url));
  const candidates = [
    path.resolve(moduleDirectory, '../../../../template'),
    path.resolve(moduleDirectory, '../../../template'),
    path.resolve(moduleDirectory, '../../template'),
    path.resolve(moduleDirectory, '../template'),
  ];
  for (const candidate of candidates) {
    try {
      await access(path.join(candidate, 'package.json'));
      return candidate;
    } catch {
      // Try the source-tree or packed-package layout next.
    }
  }
  return candidates[0]!;
}

async function ensureTargetParent(targetDirectory: string): Promise<void> {
  const parent = path.dirname(targetDirectory);
  try {
    await access(parent);
  } catch {
    await mkdir(parent, { recursive: true });
  }
}

export async function createProject(
  input: ConfigInput,
  options: CreateOptions = {},
) {
  const config = normalizeConfig(input);
  const templateDirectory = await resolveTemplateDirectory();
  const plan = createGenerationPlan(config, templateDirectory);
  await assertSafeTarget(config.targetDirectory);
  if (options.dryRun) return { status: 'planned' as const, plan };

  await ensureTargetParent(config.targetDirectory);
  await materialize(plan);
  if (config.install.enabled) {
    await installProject(config.targetDirectory);
    await validateProject(config.targetDirectory);
  }
  if (config.git.initialize) await initializeGit(config.targetDirectory);
  return {
    status: config.install.enabled
      ? ('accepted' as const)
      : ('generated-not-acceptance-validated' as const),
    plan,
  };
}

```