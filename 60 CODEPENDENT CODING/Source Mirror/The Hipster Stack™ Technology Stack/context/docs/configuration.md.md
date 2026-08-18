---
title: 'The Hipster Stack™ Technology Stack\context\docs\configuration.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\context\docs\configuration.md'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.context.docs.configuration.md'
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
source_path: 'The Hipster Stack™ Technology Stack\context\docs\configuration.md'
source_file: 'configuration.md'
source_sha256: '5dc59ed6a45e1b7d82adf40dfaa8e7b8b77b9f46123f2267f581cef3922b9c75'
generated: true
---

# `configuration.md`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\context\docs\configuration.md`
> SHA-256: `5dc59ed6a45e1b7d82adf40dfaa8e7b8b77b9f46123f2267f581cef3922b9c75`

````markdown
---
title: Hipster Stack Configuration Model
artifact: configuration
status: active
product: Hipster Stack
authority: source-of-truth
---

# Hipster Stack Configuration Model

## Principle

Configuration describes the application to compose. It does not ask the user to reinvent the engineering method.

Expose an editable property only when Hipster Stack can produce the corresponding repository correctly and deterministically.

## Shared contract

```text
CLI ───────────────┐
Web Builder ───────┼──> one runtime schema
config file ───────┘          │
                              ▼
                         normalize/resolve
                              │
                              ▼
                         generation plan
```

No interface gets hidden defaults, dependency rules, or conflicting semantics.

## Configuration categories

The target model is organized around the generated application:

- Project: directory/package/display identity, install, Git initialization.
- Preset: convenience defaults over the same model.
- Routes/presentation: supported route surfaces, navigation, semantic visual direction.
- Identity/access: supported authentication, tenancy, authorization, roles/capabilities/policies when the generator implements those choices.
- Data/persistence: supported database/ORM/tenant-containment choices when implemented.
- Integrations/capabilities: supported billing, payments, onboarding, admin, marketing, sample-domain, and other owned application surfaces.
- Engineering/delivery: supported tests, context/contracts, CI/deployment lifecycle options when deterministically composable.

Current schema/core support is narrower than this target. Do not expose future choices ahead of generator support.

## Canonical entities

The shared domain explicitly represents Application Definition, Preset, Property,
Provider, Capability, Dependency, Constraint, Resource, Authorization Model, Role,
Route Surface, Artifact Set, Artifact, and Generation Plan. Interfaces must not
infer these relationships independently.

## Property model

Properties use the machine-readable mechanisms `text`, `toggle`, `select`,
`multi-select`, `relation`, `rollup`, `derived`, `structured`, and `reorderable`.
Metadata declares allowed values, visibility, enablement, requirements, conflicts,
derivation, effects, and validation. Resolved provenance uses `DEFAULT`, `PRESET`,
`USER`, `DERIVED`, `REQUIRED`, and `LOCKED`.

Users configure application concepts. Generator-side ownership maps those concepts to files, dependencies, environment examples, transforms, and resources. Individual source files are not normal user-facing controls.

Presets seed the same Application Definition. The definition stores user intent;
providers, resources, effective permissions, routes, artifact ownership,
environment requirements, and setup instructions are derived by the shared
resolver and are not redundantly serialized.

Resolution proceeds deterministically through normalization, preset seeding,
explicit overrides, dependency and constraint resolution, provider/resource and
route resolution, artifact ownership, and safe output policies. The resulting
Generation Plan is the authority for both The Constituter™ preview and filesystem
materialization.

## Runtime contracts

Zod/runtime input validation belongs in schema concerns. Compile-time interfaces/types remain distinct. UI components consume trusted resolved values and do not reinterpret configuration authority.

## Honesty rule

No decorative toggles. If a selectable control cannot change real generated output, keep it read-only/hidden until the engine owns that behavior.

````