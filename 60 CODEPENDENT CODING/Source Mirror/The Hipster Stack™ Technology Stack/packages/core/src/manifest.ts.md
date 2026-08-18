---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\manifest.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\manifest.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.manifest.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\manifest.ts'
source_file: 'manifest.ts'
source_sha256: '237545f3f552ee717aaa14b8c6025484bb65e8456f124ada7ca8e3c44533a5a2'
generated: true
---

# `manifest.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\manifest.ts`
> SHA-256: `237545f3f552ee717aaa14b8c6025484bb65e8456f124ada7ca8e3c44533a5a2`

```ts
import { z } from 'zod';
import {
  applicationDefinitionSchema,
  normalizedRecipeSchema,
  productPresetSchema,
} from '@hipster-stack/schema';
import { generatedModuleIds } from './ownership.js';
import { LoadedVibesError } from './errors.js';

export const generationManifestSchema = z
  .object({
    schemaVersion: z.literal(2),
    generator: z
      .object({ name: z.literal('hipster-stack'), version: z.string() })
      .strict(),
    template: z
      .object({
        id: z.string(),
        version: z.string(),
        composition: z
          .literal('copy-one-template-retain-remove-transform')
          .default('copy-one-template-retain-remove-transform'),
      })
      .strict(),
    preset: productPresetSchema,
    modules: z.array(z.enum(generatedModuleIds)),
    excludedOwnedPaths: z.array(z.string()).default([]),
    applicationDefinition: applicationDefinitionSchema.optional(),
    recipe: normalizedRecipeSchema,
  })
  .strict();

export type GenerationManifest = z.infer<typeof generationManifestSchema>;

export function parseGenerationManifest(value: unknown): GenerationManifest {
  const result = generationManifestSchema.safeParse(value);
  if (!result.success) {
    throw new LoadedVibesError(
      'PROJECT_NOT_GENERATED',
      'The Hipster Stack manifest is missing or invalid.',
      result.error,
    );
  }
  return result.data;
}

```