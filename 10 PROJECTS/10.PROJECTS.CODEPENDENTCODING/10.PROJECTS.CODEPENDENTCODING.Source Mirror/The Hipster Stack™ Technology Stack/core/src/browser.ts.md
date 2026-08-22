---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\browser.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\browser.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.browser.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\browser.ts'
source_file: 'browser.ts'
source_sha256: 'ded3170138900e637c0264614e6332af44f504a9ad8ada2a4a51e3f82aa26f46'
generated: true
---

# `browser.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\browser.ts`
> SHA-256: `ded3170138900e637c0264614e6332af44f504a9ad8ada2a4a51e3f82aa26f46`

```ts
export {
  capabilityRegistry,
  resolveCapabilitySelection,
  type CapabilityDefinition,
  type CapabilityResolution,
} from './capabilities.js';
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
  applicationDefinitionFromRecipe,
  normalizeRecipe,
  recipeFromApplicationDefinition,
  recipeFromApplicationResolution,
  resolveRecipe,
  type ResolvedBuildSummary,
  type ResolvedRecipe,
} from './recipe.js';
export { getProductPreset, productPresets } from './presets.js';
export {
  applicationDefinitionSchema,
  applicationDefinitionSchemaVersion,
  artifactSetIds,
  authorizationModelIds,
  capabilityIds,
  defaultDesign,
  designChoices,
  outputPolicyIds,
  propertyMechanismIds,
  propertyStateIds,
  productPresetIds,
  providerIds,
  recipeSchema,
  type ApplicationDefinition,
  type ApplicationDefinitionInput,
  type Artifact,
  type ArtifactSet,
  type ArtifactSetId,
  type AuthorizationModelId,
  type CapabilityId,
  type Constraint,
  type Dependency,
  type Design,
  type ModuleSelection,
  type NormalizedRecipe,
  type OutputPolicy,
  type PropertyDefinition,
  type PropertyMechanism,
  type PropertyState,
  type ProductPresetId,
  type ProviderDefinition,
  type ProviderId,
  type ProviderSelection,
  type RecipeInput,
  type ResourceDefinition,
  type RoleDefinition,
  type RouteSurfaceDefinition,
} from '@hipster-stack/schema';

```