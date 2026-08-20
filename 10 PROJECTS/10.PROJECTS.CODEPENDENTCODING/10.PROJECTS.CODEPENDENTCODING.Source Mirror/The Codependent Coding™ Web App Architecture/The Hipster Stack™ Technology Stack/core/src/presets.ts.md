---
title: 'The Hipster Stack™ Technology Stack\packages\core\src\presets.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\packages\core\src\presets.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.packages.core.src.presets.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\packages\core\src\presets.ts'
source_file: 'presets.ts'
source_sha256: '9bfd20cab13b433e9e10282def55455f2e9d781f2607cd8b4571dc5e4ff1f109'
generated: true
---

# `presets.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\packages\core\src\presets.ts`
> SHA-256: `9bfd20cab13b433e9e10282def55455f2e9d781f2607cd8b4571dc5e4ff1f109`

```ts
import type { ProductPresetId, ResolvedModules } from '@hipster-stack/schema';

export interface ProductPreset {
  id: ProductPresetId;
  label: string;
  description: string;
  modules: ResolvedModules;
}

const goldenFoundation = {
  organizations: true,
  invitations: false,
  rbac: true,
  billing: false,
  stripeConnect: false,
  onboarding: false,
  admin: false,
  uploads: false,
  ai: false,
  maps: false,
  marketing: false,
  sampleDomain: false,
  governance: true,
} as const satisfies ResolvedModules;

export const productPresets = {
  'bare-golden-app': {
    id: 'bare-golden-app',
    label: 'Bare golden app',
    description: 'The proven auth, tenancy, RBAC, and governance foundation.',
    modules: goldenFoundation,
  },
  'b2b-saas': {
    id: 'b2b-saas',
    label: 'B2B SaaS',
    description: 'Team accounts, subscriptions, onboarding, and admin tools.',
    modules: {
      ...goldenFoundation,
      invitations: true,
      billing: true,
      onboarding: true,
      admin: true,
      marketing: true,
      sampleDomain: 'projects',
    },
  },
  'client-portal': {
    id: 'client-portal',
    label: 'Client portal',
    description:
      'A secure client workspace with onboarding and administration.',
    modules: {
      ...goldenFoundation,
      invitations: true,
      onboarding: true,
      admin: true,
      marketing: true,
      sampleDomain: 'projects',
    },
  },
  'platform-marketplace': {
    id: 'platform-marketplace',
    label: 'Platform or marketplace',
    description: 'A subscription platform with connected-account payments.',
    modules: {
      ...goldenFoundation,
      invitations: true,
      billing: true,
      stripeConnect: true,
      onboarding: true,
      admin: true,
      marketing: true,
      sampleDomain: 'projects',
    },
  },
} as const satisfies Record<ProductPresetId, ProductPreset>;

export function getProductPreset(id: ProductPresetId): ProductPreset {
  return productPresets[id];
}

```