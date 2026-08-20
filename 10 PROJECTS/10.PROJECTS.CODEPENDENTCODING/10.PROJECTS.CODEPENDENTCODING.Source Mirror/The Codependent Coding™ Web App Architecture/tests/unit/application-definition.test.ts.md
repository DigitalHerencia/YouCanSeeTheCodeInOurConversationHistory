---
title: 'The Hipster Stack™ Technology Stack\tests\unit\application-definition.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\tests\unit\application-definition.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.tests.unit.application-definition.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\tests\unit\application-definition.test.ts'
source_file: 'application-definition.test.ts'
source_sha256: '81b5ca4379b5eea0a1c0faf895c10726a49ad8cb7e573a3a83ec19f02d73ca4c'
generated: true
---

# `application-definition.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\tests\unit\application-definition.test.ts`
> SHA-256: `81b5ca4379b5eea0a1c0faf895c10726a49ad8cb7e573a3a83ec19f02d73ca4c`

```ts
import { describe, expect, it } from 'vitest';
import {
  applicationProperties,
  createGenerationPlan,
  normalizeConfig,
  resolveApplicationDefinition,
  resolveRecipe,
} from '@hipster-stack/core';

const baseDefinition = {
  identity: {
    packageName: 'constituted-app',
    displayName: 'Constituted App',
    description: 'One canonical application definition.',
  },
} as const;

describe('Application Definition resolution', () => {
  it('exports typed property metadata for the canonical model', () => {
    expect(applicationProperties.map((property) => property.type)).toEqual(
      expect.arrayContaining([
        'select',
        'structured',
        'multi-select',
        'relation',
        'rollup',
        'derived',
      ]),
    );
    expect(
      applicationProperties.find((property) => property.id === 'capabilities')
        ?.affects,
    ).toEqual(expect.arrayContaining(['providers', 'routes', 'artifact-sets']));
  });

  it('seeds a preset, applies overrides, and explains dependencies', () => {
    const result = resolveApplicationDefinition({
      ...baseDefinition,
      preset: 'bare-golden-app',
      capabilities: {
        include: ['stripeConnect'],
        exclude: [],
      },
    });

    expect(result.resolved.capabilities).toEqual(
      expect.arrayContaining([
        'organizations',
        'rbac',
        'billing',
        'stripeConnect',
      ]),
    );
    expect(result.resolved.autoIncluded).toEqual(['billing']);
    expect(result.resolved.propertyStates).toMatchObject({
      'capabilities.organizations': 'PRESET',
      'capabilities.billing': 'REQUIRED',
      requiredProviders: 'DERIVED',
    });
    expect(
      result.resolved.reasons.find((reason) => reason.selection === 'billing')
        ?.requiredBy,
    ).toContain('stripeConnect');
  });

  it('derives providers and output consequences without serializing them', () => {
    const result = resolveApplicationDefinition({
      ...baseDefinition,
      capabilities: { include: ['billing'], exclude: [] },
    });

    expect(result.resolved.providers.map((provider) => provider.id)).toEqual([
      'clerk',
      'neon',
      'stripe',
    ]);
    expect(result.plan.environmentRequirements).toContain('STRIPE_SECRET_KEY');
    expect(result.plan.routes.map((route) => route.id)).toContain('billing');
    expect(result.plan.artifactSets.map((set) => set.id)).toContain('billing');
    expect(result.resolved.definition.providers).toEqual({});
    expect(result.resolved.definition.routes).toEqual([]);
    expect(result.resolved.definition).not.toHaveProperty('resources');
  });

  it('rejects exclusion of an artifact set required by a capability', () => {
    expect(() =>
      resolveApplicationDefinition({
        ...baseDefinition,
        capabilities: { include: ['billing'], exclude: [] },
        outputOverrides: { artifactSets: { billing: 'EXCLUDE' } },
      }),
    ).toThrowError(
      expect.objectContaining({ code: 'UNSUPPORTED_CONFIGURATION' }),
    );
  });

  it('produces equivalent plans for identical definitions', () => {
    const first = resolveApplicationDefinition(baseDefinition).plan;
    const second = resolveApplicationDefinition(baseDefinition).plan;
    expect(second).toEqual(first);
  });

  it('places the same resolved definition in the filesystem generation plan', () => {
    const config = normalizeConfig(
      { applicationDefinition: baseDefinition, targetDirectory: 'output' },
      'D:/work',
    );
    const generationPlan = createGenerationPlan(config, 'D:/template');

    expect(generationPlan.applicationDefinition).toEqual(
      config.applicationDefinition,
    );
    expect(generationPlan.applicationPlan.selectedCapabilities).toEqual(
      resolveApplicationDefinition(baseDefinition).plan.selectedCapabilities,
    );
  });

  it('keeps the recipe adapter on the same canonical resolver', () => {
    const result = resolveRecipe({
      name: 'adapter-app',
      modules: { billing: true },
    });
    expect(result.application.plan.selectedCapabilities).toEqual(
      expect.arrayContaining(['organizations', 'rbac', 'billing']),
    );
    expect(result.application.resolved.capabilities).toEqual(
      Object.entries(result.recipe.modules)
        .filter(([, value]) => value !== false)
        .map(([id]) => id),
    );
  });
});

```