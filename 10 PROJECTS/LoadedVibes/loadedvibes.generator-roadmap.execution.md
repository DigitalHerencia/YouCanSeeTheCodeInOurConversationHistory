---
title: Loaded Vibes Generator Roadmap
type: execution
scope: project
project: Loaded Vibes
domain: generator
artifact: roadmap
kind: execution
namespace: loadedvibes.generator-roadmap.execution
status: active
authority: working-note
parent: "[[loadedvibes.project.map]]"
depends_on:
  - "[[loadedvibes.project.source-document]]"
  - "[[loadedvibes.vibes-template.audit.research]]"
  - "[[hipsterstack.engineering-system.definition.source-document]]"
supersedes: []
tags:
  - projects/loaded-vibes
  - execution/roadmap
  - generator
  - status/active
created: 2026-08-05
updated: 2026-08-05
---

# Loaded Vibes Generator Roadmap

## Objective

Turn the validated Vibes starter into a package-manager-executable project initializer without redesigning the canonical application architecture.

The roadmap contains only unfinished generator work. Completed Vibes template construction, architecture normalization, and prior issue execution are not repeated here.

## Phase 1 — Freeze the Canonical Generated Output

- Identify the exact Vibes commit or branch that represents the canonical output.
- Confirm a clean clone can install, generate Prisma artifacts, validate, test, and build without provider credentials.
- Separate canonical runtime material from product-specific reference implementations and workbench-only content.
- Define one source location for the runnable template so the starter, template input, and fixtures cannot drift independently.
- Record the supported Node, pnpm, Next.js, Prisma, Clerk, Neon, Stripe, and Vercel assumptions.

**Exit condition:** one reproducible template source is explicitly designated and passes its credential-free acceptance gate.

## Phase 2 — Inventory Generation Variability

Classify every relevant template path and dependency as:

- core — always generated;
- optional — controlled by a supported module or preset;
- reference — retained as examples but not active runtime;
- workbench-only — excluded from generated projects;
- generated metadata — created or rewritten for the target project.

Define which choices are fixed architectural invariants and which are supported product variations.

**Exit condition:** a reviewed generation manifest describes every output contribution and transformation class.

## Phase 3 — Build the Thin Initializer

Implement the smallest legitimate create-project flow:

1. accept a target directory and project name;
2. reject unsafe, occupied, or invalid destinations;
3. copy the canonical template;
4. apply project-name and generic metadata transformations;
5. remove workbench-only and template-maintenance artifacts;
6. optionally initialize Git;
7. optionally install dependencies;
8. run a credential-free fast or CI validation gate;
9. report exact output and failures;
10. clean up partial output safely when generation fails.

Requirements:

- package-manager execution such as `pnpm dlx`;
- interactive and non-interactive invocation paths;
- Windows and PowerShell path behavior validated explicitly;
- deterministic output for identical configuration;
- no general module framework in this phase.

**Exit condition:** the initializer can generate, install, and validate a renamed copy of the canonical template from a clean environment.

## Phase 4 — Add Configuration and Presets

- Define a versioned configuration schema independent of the prompt UI.
- Normalize interactive answers, CLI flags, and optional config files into the same configuration model.
- Add a bounded preset set only after their exact support contracts are defined.
- Reject unsupported combinations before writing files.
- Ensure fixed Hipster Stack invariants cannot be disabled through prompts.

Potential preset names remain provisional:

- `standard` — the canonical multi-tenant SaaS baseline;
- `full` — canonical baseline plus explicitly supported optional capabilities;
- `minimal` — only after its architecture and downstream Codependent Coding compatibility are defined.

**Exit condition:** every supported preset produces deterministic output and passes its generated-project acceptance gate.

## Phase 5 — Prove One Dependency-Aware Module

Use the clearest existing optional subsystem as the first module candidate, likely Stripe Connect.

The module must declare:

- dependencies, implications, and conflicts;
- files and structured transformations;
- package and script contributions;
- environment-variable requirements;
- Prisma and webhook contributions;
- validation and documentation contributions;
- removal behavior.

Do not generalize the rest of the template into modules until this capability proves the module contract.

**Exit condition:** the selected module can be included and excluded without breaking the supported base output, and both configurations pass validation.

## Phase 6 — Generated-Output Test Matrix

Maintain separate test layers.

### Generator tests

- configuration parsing and normalization;
- dependency closure;
- compatibility rejection;
- file planning and collision handling;
- structured manifest merging;
- deterministic generation;
- failure rollback and cleanup.

### Generated-project tests

For each supported preset or module combination:

- generate into a temporary fixture;
- install from the frozen lockfile;
- generate Prisma and framework route types;
- run formatting, TypeScript, ESLint, contracts, unit and integration tests;
- run the production build;
- run targeted browser or removal tests where required.

**Exit condition:** CI proves both the generator and representative generated repositories.

## Phase 7 — Package and Release Discipline

- Define the package name and executable `bin` entry.
- Establish semantic versioning and release notes.
- Validate packed-package behavior rather than relying only on workspace execution.
- Test `pnpm dlx` from a clean environment.
- Ensure published contents exclude private notes, credentials, local caches, fixtures not intended for consumers, and workbench artifacts.
- Document that creation is supported before any upgrade promise.

**Exit condition:** a published or privately installable package creates the same validated output as the repository test path.

## Phase 8 — Codependent Coding Handoff

- Define the generated repository paths and contracts that Codependent Coding may assume.
- Ensure the generated project contains the required human-readable context and `.agents` structure.
- Define stable extension points for feature specifications without allowing architecture reinvention.
- Verify a representative product feature can be specified and implemented against generated output using Codependent Coding conventions.

**Exit condition:** a generated prototype can receive a product-specific specification and reach a validated MVP without restructuring the baseline.

## Non-Goals for the Initial Release

- arbitrary third-party plugins;
- every subsystem exposed as a prompt;
- unrestricted combinations of binary feature flags;
- automated upgrades of modified consumer repositories;
- a framework abstraction hiding the generated application’s architecture;
- provider provisioning before the local generation and validation lifecycle is reliable.

## Current Next Action

Design and document the canonical template-source boundary and generation manifest before implementing prompt flows or optional modules.
