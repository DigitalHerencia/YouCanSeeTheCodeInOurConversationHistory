---
title: 'The Hipster Stack™ Technology Stack\template\content\loadedvibes.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\content\loadedvibes.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.content.loadedvibes.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\content\loadedvibes.ts'
source_file: 'loadedvibes.ts'
source_sha256: '6fdd612165152fee4deeee912d7e892d880519c129d77ef9fd6b5fc9b483f0c1'
generated: true
---

# `loadedvibes.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\content\loadedvibes.ts`
> SHA-256: `6fdd612165152fee4deeee912d7e892d880519c129d77ef9fd6b5fc9b483f0c1`

```ts
export const loadedVibesProduct = {
  name: "Next Stack",
  description: "A focused product for teams who need clear, useful software.",
} as const

export type LoadedVibesDesign = {
  theme: "obsidian" | "paper" | "electric"
  radius: "compact" | "medium" | "rounded"
  density: "compact" | "comfortable"
  navigation: "sidebar" | "topbar"
  mode: "light" | "dark" | "system"
}

export const loadedVibesDesign: LoadedVibesDesign = {
  theme: "obsidian",
  radius: "medium",
  density: "comfortable",
  navigation: "sidebar",
  mode: "system",
}

export const loadedVibesCapabilities = {
  organizations: true,
  invitations: true,
  rbac: true,
  billing: true,
  onboarding: true,
  admin: true,
  marketing: true,
  sampleDomain: true,
  stripeConnect: true,
  uploads: true,
  ai: true,
  maps: true,
} as const

```