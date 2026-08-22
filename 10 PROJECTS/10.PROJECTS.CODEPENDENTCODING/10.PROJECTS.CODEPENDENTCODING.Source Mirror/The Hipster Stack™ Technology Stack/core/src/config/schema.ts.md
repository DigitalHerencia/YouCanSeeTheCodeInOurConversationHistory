---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\config\schema.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\config\schema.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.config.schema.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\config\schema.ts'
source_file: 'schema.ts'
source_sha256: '995613ffb5a457b7399f6d11d50c50cde5b7b48d114dc072088053a6382f1859'
generated: true
---

# `schema.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\config\schema.ts`
> SHA-256: `995613ffb5a457b7399f6d11d50c50cde5b7b48d114dc072088053a6382f1859`

```ts
import { z } from 'zod';
import {
  applicationDefinitionSchema,
  normalizedRecipeSchema,
} from '@hipster-stack/schema';

export const loadedVibesConfigSchema = z
  .object({
    applicationDefinition: applicationDefinitionSchema,
    recipe: normalizedRecipeSchema,
    targetDirectory: z.string().min(1),
    git: z
      .object({ initialize: z.boolean() })
      .strict()
      .default({ initialize: true }),
    install: z
      .object({ enabled: z.boolean() })
      .strict()
      .default({ enabled: true }),
  })
  .strict();

export type LoadedVibesConfig = z.infer<typeof loadedVibesConfigSchema>;

```