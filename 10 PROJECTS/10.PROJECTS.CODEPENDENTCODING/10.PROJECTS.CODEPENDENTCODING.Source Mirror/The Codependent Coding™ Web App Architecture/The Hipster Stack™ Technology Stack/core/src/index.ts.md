---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\index.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\index.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.index.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\index.ts'
source_file: 'index.ts'
source_sha256: '2578867374479e40b5ff4a340724f90d38288fee8390f753d0777da44db6807e'
generated: true
---

# `index.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\index.ts`
> SHA-256: `2578867374479e40b5ff4a340724f90d38288fee8390f753d0777da44db6807e`

```ts
export { createProject, type CreateOptions } from './commands/create.js';
export {
  applyProjectModuleAddition,
  planProjectModuleAddition,
  type ModuleAdditionPlan,
  type ModuleAdditionResult,
} from './commands/add.js';
export {
  diagnoseProject,
  type DiagnosticCheck,
  type DiagnosticOwner,
  type DiagnosticStatus,
  type DoctorResult,
} from './commands/doctor.js';
export { explainProject, type ProjectExplanation } from './commands/explain.js';
export { loadConfigFile } from './config/load.js';
export { normalizeConfig, type ConfigInput } from './config/normalize.js';
export {
  loadedVibesConfigSchema,
  type LoadedVibesConfig,
} from './config/schema.js';
export { LoadedVibesError, type LoadedVibesErrorCode } from './errors.js';
export { createGenerationPlan, type GenerationPlan } from './generator/plan.js';
export {
  applicationProperties,
  providerRegistry,
  resolveApplicationDefinition,
  type ApplicationGenerationPlan,
  type ApplicationResolution,
  type ResolutionReason,
  type ResolvedApplicationDefinition,
  type ResolvedArtifactSet,
} from './application-definition.js';
export {
  generatedModuleIds,
  getAddableOwnership,
  optionalSurfaceOwnership,
  selectedGeneratedModuleIds,
  excludedOwnedPaths,
  excludedOwnedPathsForApplication,
  providerSurfaceOwnership,
  type GeneratedModuleId,
  type OptionalSurfaceOwnership,
} from './ownership.js';
export {
  generationManifestSchema,
  parseGenerationManifest,
  type GenerationManifest,
} from './manifest.js';
export { loadGeneratedProject, type GeneratedProject } from './project.js';
export {
  capabilityRegistry,
  resolveCapabilitySelection,
  type CapabilityDefinition,
  type CapabilityResolution,
} from './capabilities.js';
export {
  capabilityIds,
  designChoices,
  productPresetIds,
} from '@hipster-stack/schema';
export {
  applicationDefinitionFromRecipe,
  normalizeRecipe,
  recipeFromApplicationDefinition,
  recipeFromApplicationResolution,
  resolveRecipe,
  type ResolvedBuildSummary,
  type ResolvedRecipe,
} from './recipe.js';
export { getProductPreset, productPresets } from './presets.js';
export type {
  ApplicationDefinition,
  ApplicationDefinitionInput,
  Artifact,
  ArtifactSet,
  ArtifactSetId,
  AuthorizationModelId,
  CapabilityId,
  Constraint,
  Dependency,
  Design,
  DesignInput,
  ModuleSelection,
  NormalizedRecipe,
  OutputPolicy,
  PropertyDefinition,
  PropertyMechanism,
  PropertyState,
  ProductIdentity,
  ProductIdentityInput,
  ProductPresetId,
  ProviderDefinition,
  ProviderId,
  ProviderSelection,
  RecipeInput,
  ResourceDefinition,
  RoleDefinition,
  RouteSurfaceDefinition,
} from '@hipster-stack/schema';

```