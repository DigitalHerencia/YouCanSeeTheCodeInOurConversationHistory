---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\config\normalize.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\config\normalize.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.config.normalize.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\config\normalize.ts'
source_file: 'normalize.ts'
source_sha256: '0d7991ae8dcbd40de477699f55ad8668f36dd61a974a9353e1c214bd2935b82c'
generated: true
---

# `normalize.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\config\normalize.ts`
> SHA-256: `0d7991ae8dcbd40de477699f55ad8668f36dd61a974a9353e1c214bd2935b82c`

```ts
import path from 'node:path';
import { z } from 'zod';
import {
  applicationDefinitionSchema,
  recipeSchema,
  type ApplicationDefinitionInput,
  type DesignInput,
  type ModuleSelection,
  type ProductIdentityInput,
  type ProductPresetId,
  type RecipeInput,
} from '@hipster-stack/schema';
import { resolveApplicationDefinition } from '../application-definition.js';
import { LoadedVibesError } from '../errors.js';
import { recipeFromApplicationResolution, resolveRecipe } from '../recipe.js';
import { loadedVibesConfigSchema, type LoadedVibesConfig } from './schema.js';

export interface ConfigInput {
  applicationDefinition?: ApplicationDefinitionInput;
  recipe?: RecipeInput;
  schemaVersion?: 1;
  name?: string;
  product?: ProductPresetId;
  modules?: ModuleSelection;
  identity?: ProductIdentityInput;
  design?: DesignInput;
  /** @deprecated Use `name` or `recipe.name`. */
  projectName?: string;
  targetDirectory?: string;
  /** @deprecated The legacy standard preset maps to bare-golden-app. */
  preset?: 'standard';
  git?: { initialize?: boolean };
  install?: { enabled?: boolean };
}

const configInputSchema = z
  .object({
    applicationDefinition: applicationDefinitionSchema.optional(),
    recipe: recipeSchema.partial().optional(),
    schemaVersion: z.literal(1).optional(),
    name: z.string().optional(),
    product: recipeSchema.shape.product.unwrap().optional(),
    modules: recipeSchema.shape.modules.unwrap().optional(),
    identity: recipeSchema.shape.identity.unwrap().optional(),
    design: recipeSchema.shape.design.unwrap().optional(),
    projectName: z.string().optional(),
    targetDirectory: z.string().optional(),
    preset: z.literal('standard').optional(),
    git: z.object({ initialize: z.boolean().optional() }).strict().optional(),
    install: z.object({ enabled: z.boolean().optional() }).strict().optional(),
  })
  .strict();

export function normalizeConfig(
  input: ConfigInput,
  cwd = process.cwd(),
): LoadedVibesConfig {
  const parsedInput = configInputSchema.safeParse(input);
  if (!parsedInput.success) {
    throw new LoadedVibesError('INVALID_CONFIG', parsedInput.error.message);
  }
  const targetDirectory = path.resolve(
    cwd,
    parsedInput.data.targetDirectory ?? '',
  );
  const suppliedNames = [
    parsedInput.data.applicationDefinition?.identity.packageName,
    parsedInput.data.recipe?.name,
    parsedInput.data.name,
    parsedInput.data.projectName,
  ].filter((value): value is string => value !== undefined);
  if (new Set(suppliedNames).size > 1) {
    throw new LoadedVibesError(
      'INVALID_CONFIG',
      'Application Definition package name and legacy recipe names must agree when combined.',
    );
  }
  const legacyDefinitionFields = [
    parsedInput.data.recipe,
    parsedInput.data.schemaVersion,
    parsedInput.data.name,
    parsedInput.data.product,
    parsedInput.data.modules,
    parsedInput.data.identity,
    parsedInput.data.design,
    parsedInput.data.projectName,
    parsedInput.data.preset,
  ];
  if (
    parsedInput.data.applicationDefinition &&
    legacyDefinitionFields.some((value) => value !== undefined)
  ) {
    throw new LoadedVibesError(
      'INVALID_CONFIG',
      'applicationDefinition cannot be combined with legacy recipe fields.',
    );
  }
  const name = suppliedNames[0] ?? path.basename(targetDirectory).toLowerCase();
  const applicationResolution = parsedInput.data.applicationDefinition
    ? resolveApplicationDefinition(parsedInput.data.applicationDefinition)
    : resolveRecipe({
        ...parsedInput.data.recipe,
        schemaVersion:
          parsedInput.data.recipe?.schemaVersion ??
          parsedInput.data.schemaVersion ??
          1,
        name,
        product:
          parsedInput.data.recipe?.product ??
          parsedInput.data.product ??
          'bare-golden-app',
        modules: {
          ...parsedInput.data.recipe?.modules,
          ...parsedInput.data.modules,
        },
        identity: {
          ...parsedInput.data.recipe?.identity,
          ...parsedInput.data.identity,
        },
        design: {
          ...parsedInput.data.recipe?.design,
          ...parsedInput.data.design,
        },
      }).application;
  const recipe = recipeFromApplicationResolution(applicationResolution);

  const result = loadedVibesConfigSchema.safeParse({
    applicationDefinition: applicationResolution.resolved.definition,
    recipe,
    targetDirectory,
    git: { initialize: parsedInput.data.git?.initialize ?? true },
    install: { enabled: parsedInput.data.install?.enabled ?? true },
  });
  if (!result.success) {
    throw new LoadedVibesError('INVALID_CONFIG', result.error.message);
  }
  return result.data;
}

```