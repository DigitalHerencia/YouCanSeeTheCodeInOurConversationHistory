---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\generator\plan.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\generator\plan.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.generator.plan.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\generator\plan.ts'
source_file: 'plan.ts'
source_sha256: 'c4345aaef8d14bf44f29171e2f2e6ff8d1039dfbc05d026fb31c51429cc1229c'
generated: true
---

# `plan.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\generator\plan.ts`
> SHA-256: `c4345aaef8d14bf44f29171e2f2e6ff8d1039dfbc05d026fb31c51429cc1229c`

```ts
import path from 'node:path';
import type { LoadedVibesConfig } from '../config/schema.js';
import {
  resolveApplicationDefinition,
  type ApplicationGenerationPlan,
  type ResolvedApplicationDefinition,
} from '../application-definition.js';
import { excludedOwnedPathsForApplication } from '../ownership.js';

export interface GenerationPlan {
  config: LoadedVibesConfig;
  templateDirectory: string;
  stagingDirectory: string;
  excludedOwnedPaths: readonly string[];
  validationGates: readonly string[];
  applicationDefinition: ResolvedApplicationDefinition['definition'];
  resolvedApplication: ResolvedApplicationDefinition;
  applicationPlan: ApplicationGenerationPlan;
}

export function createGenerationPlan(
  config: LoadedVibesConfig,
  templateDirectory: string,
): GenerationPlan {
  const parent = path.dirname(config.targetDirectory);
  const application = resolveApplicationDefinition(
    config.applicationDefinition,
  );
  return {
    config,
    templateDirectory,
    excludedOwnedPaths: excludedOwnedPathsForApplication(
      application.plan.selectedCapabilities,
      application.plan.selectedProviders,
      application.plan.filesOmitted,
    ),
    stagingDirectory: path.join(
      parent,
      `.hipster-stack-${path.basename(config.targetDirectory)}-staging`,
    ),
    validationGates: application.plan.validationRequirements,
    applicationDefinition: application.resolved.definition,
    resolvedApplication: application.resolved,
    applicationPlan: application.plan,
  };
}

```