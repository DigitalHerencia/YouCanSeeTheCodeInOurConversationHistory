---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\commands\explain.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\commands\explain.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.commands.explain.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\commands\explain.ts'
source_file: 'explain.ts'
source_sha256: '0a9785120e390e8d92c6642a36ec5e8f254359792f00ce097b575066ffa55c69'
generated: true
---

# `explain.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\commands\explain.ts`
> SHA-256: `0a9785120e390e8d92c6642a36ec5e8f254359792f00ce097b575066ffa55c69`

```ts
import { capabilityIds, type CapabilityId } from '@hipster-stack/schema';
import { capabilityRegistry } from '../capabilities.js';
import { getProductPreset } from '../presets.js';
import { loadGeneratedProject } from '../project.js';
import { diagnoseProject } from './doctor.js';

export interface ProjectExplanation {
  product: string;
  preset: { id: string; label: string };
  capabilities: string[];
  modules: string[];
  design: string[];
  providers: string[];
  architecture: string[];
  remainingSetup: string[];
}

function enabled(
  modules: Awaited<
    ReturnType<typeof loadGeneratedProject>
  >['recipe']['modules'],
  id: CapabilityId,
): boolean {
  return id === 'sampleDomain' ? modules.sampleDomain !== false : modules[id];
}

export async function explainProject(
  directory = '.',
): Promise<ProjectExplanation> {
  const project = await loadGeneratedProject(directory);
  const doctor = await diagnoseProject(project.directory);
  const preset = getProductPreset(project.recipe.product);
  const providers = [
    'Clerk owns identity and sessions; application rows own authorization.',
    'Neon/PostgreSQL owns persistence; Prisma is the typed data client.',
  ];
  if (project.recipe.modules.billing)
    providers.push(
      'Stripe owns subscription payment truth and webhook events.',
    );
  if (project.recipe.modules.stripeConnect)
    providers.push('Stripe Connect owns connected-account and transfer truth.');
  return {
    product: project.recipe.identity.displayName,
    preset: { id: preset.id, label: preset.label },
    capabilities: capabilityIds
      .filter((id) => enabled(project.recipe.modules, id))
      .map((id) => capabilityRegistry[id].label),
    modules: project.manifest.modules,
    design: [
      project.recipe.design.theme,
      project.recipe.design.mode,
      project.recipe.design.radius,
      project.recipe.design.density,
      project.recipe.design.navigation,
    ],
    providers,
    architecture: [
      'Routes adapt; features orchestrate; components render.',
      'Fetchers read; Server Actions write; schemas validate.',
      'Authorization decides; transactions preserve invariants; webhooks reconcile provider truth.',
    ],
    remainingSetup: doctor.checks
      .filter((check) => check.status === 'fail' && check.action)
      .map((check) => `${check.label}: ${check.action}`),
  };
}

```