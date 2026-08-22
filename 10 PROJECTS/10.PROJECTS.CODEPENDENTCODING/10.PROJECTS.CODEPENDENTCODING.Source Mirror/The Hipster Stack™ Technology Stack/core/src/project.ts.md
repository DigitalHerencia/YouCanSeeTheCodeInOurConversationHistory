---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\project.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\project.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.project.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\project.ts'
source_file: 'project.ts'
source_sha256: '29a3ae6a97cc1c7b9b92ec7d8167fc60946abde99fe5702079a2bc6308c07faa'
generated: true
---

# `project.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\project.ts`
> SHA-256: `29a3ae6a97cc1c7b9b92ec7d8167fc60946abde99fe5702079a2bc6308c07faa`

```ts
import { readFile } from 'node:fs/promises';
import path from 'node:path';
import type {
  ApplicationDefinitionInput,
  NormalizedRecipe,
} from '@hipster-stack/schema';
import { LoadedVibesError } from './errors.js';
import {
  parseGenerationManifest,
  type GenerationManifest,
} from './manifest.js';
import { recipeFromApplicationDefinition, resolveRecipe } from './recipe.js';

export interface GeneratedProject {
  directory: string;
  manifest: GenerationManifest;
  recipe: NormalizedRecipe;
}

async function readJson(file: string): Promise<unknown> {
  try {
    return JSON.parse(await readFile(file, 'utf8')) as unknown;
  } catch (error) {
    throw new LoadedVibesError(
      'PROJECT_NOT_GENERATED',
      `Unable to read generated project metadata at ${file}.`,
      error,
    );
  }
}

export async function loadGeneratedProject(
  directory: string,
): Promise<GeneratedProject> {
  const target = path.resolve(directory);
  const manifest = parseGenerationManifest(
    await readJson(path.join(target, '.hipsterstack', 'manifest.json')),
  );
  const saved = await readJson(path.join(target, 'hipsterstack.json'));
  const recipe =
    typeof saved === 'object' &&
    saved !== null &&
    'applicationDefinition' in saved
      ? recipeFromApplicationDefinition(
          (saved as { applicationDefinition: ApplicationDefinitionInput })
            .applicationDefinition,
        )
      : resolveRecipe(saved as NormalizedRecipe).recipe;
  if (JSON.stringify(manifest.recipe) !== JSON.stringify(recipe)) {
    throw new LoadedVibesError(
      'MODULE_CONFLICT',
      'hipsterstack.json and .hipsterstack/manifest.json disagree.',
    );
  }
  return { directory: target, manifest, recipe };
}

```