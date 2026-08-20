---
title: 'The Hipster Stack™ Technology Stack\tests\unit\web-configurator.test.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\tests\unit\web-configurator.test.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.tests.unit.web-configurator.test.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\tests\unit\web-configurator.test.ts'
source_file: 'web-configurator.test.ts'
source_sha256: 'a0dc154cb98446d8d9ccfcb8bc4eb07caddc9effa4555e610bcab06dbdc88301'
generated: true
---

# `web-configurator.test.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\tests\unit\web-configurator.test.ts`
> SHA-256: `a0dc154cb98446d8d9ccfcb8bc4eb07caddc9effa4555e610bcab06dbdc88301`

```ts
import { describe, expect, it } from 'vitest';
import { normalizeConfig, type ConfigInput } from '@hipster-stack/core';
import {
  createCliCommand,
  createShareUrl,
  defaultConfiguratorRecipe,
  deserializeRecipe,
  resolveConfiguratorRecipe,
  selectProductPreset,
  serializeRecipe,
  setCapability,
} from '../../apps/web/lib/configurator.js';

describe('web configurator recipe', () => {
  it('automatically resolves capability dependencies', () => {
    let draft = defaultConfiguratorRecipe;
    draft = setCapability(draft, 'stripeConnect', true);
    const resolved = resolveConfiguratorRecipe(draft);
    expect(resolved.recipe.modules.billing).toBe(true);
    expect(resolved.summary.autoIncluded).toContain('Subscription billing');
  });

  it('round trips a normalized reproducible recipe', () => {
    const serialized = serializeRecipe(defaultConfiguratorRecipe);
    expect(serializeRecipe(deserializeRecipe(serialized))).toBe(serialized);
    expect(
      normalizeConfig(JSON.parse(serialized) as ConfigInput, 'D:/recipes')
        .recipe.name,
    ).toBe('my-saas');
  });

  it('provides the canonical Hipster Stack package command', () => {
    expect(createCliCommand(defaultConfiguratorRecipe)).toBe(
      'pnpm dlx hipster-stack@latest my-saas --config hipsterstack.json --yes',
    );
  });

  it('applies a preset through shared resolution without retaining overrides', () => {
    const customized = setCapability(
      defaultConfiguratorRecipe,
      'stripeConnect',
      true,
    );
    const selected = selectProductPreset(customized, 'client-portal');

    expect(selected.capabilities).toEqual({ include: [], exclude: [] });
    expect(resolveConfiguratorRecipe(selected).summary.preset.id).toBe(
      'client-portal',
    );
    expect(resolveConfiguratorRecipe(selected).recipe.modules.onboarding).toBe(
      true,
    );
  });

  it('creates a portable share URL that hydrates the same recipe', () => {
    const shared = createShareUrl(
      defaultConfiguratorRecipe,
      'https://hipster.example/configure?source=test',
    );
    const url = new URL(shared);
    const encoded = url.searchParams.get('recipe');

    expect(url.searchParams.get('source')).toBe('test');
    expect(encoded).not.toBeNull();
    expect(serializeRecipe(deserializeRecipe(encoded!))).toBe(
      serializeRecipe(defaultConfiguratorRecipe),
    );
  });
});

```