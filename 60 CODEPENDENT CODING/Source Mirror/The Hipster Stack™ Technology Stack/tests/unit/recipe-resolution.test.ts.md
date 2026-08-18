---
title: 'The Hipster Stack™ Technology Stack\tests\unit\recipe-resolution.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\tests\unit\recipe-resolution.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.tests.unit.recipe-resolution.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\tests\unit\recipe-resolution.test.ts'
source_file: 'recipe-resolution.test.ts'
source_sha256: 'e753f45133c329aca056d1f909d5db7ea5b24c8054e269ccc52d9de41e7b65a7'
generated: true
---

# `recipe-resolution.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\tests\unit\recipe-resolution.test.ts`
> SHA-256: `e753f45133c329aca056d1f909d5db7ea5b24c8054e269ccc52d9de41e7b65a7`

```ts
import { describe, expect, it } from 'vitest';
import {
  capabilityRegistry,
  resolveCapabilitySelection,
  resolveRecipe,
} from '@hipster-stack/core';

describe('recipe resolution', () => {
  it.each([
    'b2b-saas',
    'client-portal',
    'platform-marketplace',
    'bare-golden-app',
  ] as const)('resolves the %s preset through one recipe model', (product) => {
    const result = resolveRecipe({ name: 'preset-app', product });
    expect(result.recipe.product).toBe(product);
    expect(result.recipe.modules).toMatchObject({
      organizations: true,
      rbac: true,
      governance: true,
    });
    expect(result.summary.preset.id).toBe(product);
  });

  it('automatically includes prerequisites after explicit overrides', () => {
    const result = resolveRecipe({
      name: 'payments-platform',
      product: 'bare-golden-app',
      modules: {
        billing: false,
        stripeConnect: true,
      },
    });
    expect(result.recipe.modules).toMatchObject({
      organizations: true,
      rbac: true,
      billing: true,
      stripeConnect: true,
    });
    expect(result.summary.autoIncluded).toEqual(['Subscription billing']);
  });

  it('keeps only fixed governance when configurable foundations are disabled', () => {
    const result = resolveRecipe({
      name: 'fixed-foundation',
      modules: { organizations: false, rbac: false, governance: false },
    });
    expect(result.recipe.modules).toMatchObject({
      organizations: false,
      rbac: false,
      governance: true,
    });
  });

  it('rejects declared capability conflicts with a useful message', () => {
    const conflictingRegistry = {
      ...capabilityRegistry,
      marketing: {
        ...capabilityRegistry.marketing,
        conflicts: ['admin'] as const,
      },
    };
    expect(() =>
      resolveCapabilitySelection(
        resolveRecipe({ name: 'base' }).recipe.modules,
        { marketing: true, admin: true },
        conflictingRegistry,
      ),
    ).toThrowError(
      expect.objectContaining({ code: 'UNSUPPORTED_CONFIGURATION' }),
    );
  });

  it('rejects unsupported capabilities during shared schema parsing', () => {
    expect(() =>
      resolveRecipe({
        name: 'unsupported',
        modules: { kubernetes: true },
      } as never),
    ).toThrowError(expect.objectContaining({ code: 'INVALID_CONFIG' }));
  });
});

```