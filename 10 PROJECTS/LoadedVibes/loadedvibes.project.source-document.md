---
title: Loaded Vibes Project Definition
type: source-document
scope: project
project: Loaded Vibes
domain: project
artifact: definition
kind: source-document
namespace: loadedvibes.project.source-document
status: active
authority: source-of-truth
parent: "[[loadedvibes.project.map]]"
depends_on: []
supersedes: []
tags:
  - projects/loaded-vibes
  - saas-generator
  - project-initializer
  - status/active
created: 2026-08-05
updated: 2026-08-05
---

# Loaded Vibes

## Purpose

Loaded Vibes is an opinionated SaaS project generator and interactive CLI initializer.

It produces a complete white-label golden prototype repository so a new SaaS product begins from the same known-good architecture instead of requiring an agent to rebuild foundational infrastructure for every project.

The intended experience is comparable to established create-project commands: the user starts the initializer, answers a bounded set of project and preference questions, and receives a runnable application codebase.

## Product Definition

Loaded Vibes owns the deterministic starting state for future SaaS products.

```text
Project name and supported preferences
        ↓
Loaded Vibes CLI initializer
        ↓
Canonical generation rules
        ↓
Golden prototype SaaS repository
        ↓
Validation and resource setup
        ↓
Ready for product-specific implementation
```

The output is not a blank framework scaffold. It is a batteries-included application foundation that already expresses the user's established engineering system.

## Generated Application Baseline

The generated repository is expected to include the reusable foundation repeatedly required across the user's SaaS products, including:

- TypeScript
- Next.js App Router
- React Server Components
- PostgreSQL on Neon
- Prisma ORM
- Clerk authentication
- local application users
- multi-tenant organization and membership modeling
- custom RBAC and resource authorization
- PostgreSQL row-level security where tenant isolation requires defense in depth
- Stripe and Stripe Connect integration boundaries
- Zod validation
- shadcn-compatible UI primitives and reusable presentation assets
- canonical fetcher, Server Action, workflow, transaction, auth/authz, and webhook patterns
- feature and route orchestration boundaries
- explicit layer contracts
- system lifecycle and data-flow definitions
- human-readable project context
- machine-readable agent contracts and execution state
- linting, formatting, type checking, tests, contract validation, and CI/CD gates
- Vercel-oriented deployment support

The exact generated modules and configuration options remain to be specified. The architectural grammar and security boundaries are not intended to vary casually between projects.

## Canonical Output Principle

Loaded Vibes exists so agents no longer rebuild or reinterpret the platform kernel.

The generated repository should already contain the approved locations and baseline implementations for concerns such as:

- authentication routes
- Clerk webhook reconciliation
- Prisma client construction
- tenant and authorization helpers
- database reads and writes
- provider integration adapters
- test infrastructure
- validation scripts
- governance files

For example, an agent should not decide how many Clerk sign-in routes to create or where Prisma may be instantiated. Those decisions belong to the generator's canonical output and its enforcement rules.

## Configuration Boundary

Project-specific configuration may change where the product genuinely requires variation.

Examples explicitly identified in the transcript include:

- project identity
- supported initializer preferences
- visual design system
- global styles
- semantic design tokens
- product-specific features added after generation

Configurable choices must not silently weaken the canonical architecture, trust boundaries, tenant isolation, or validation model.

## Relationship to Codependent Coding

Loaded Vibes generates the golden prototype.

[[codependentcoding.project.source-document]] takes that known repository and applies product-specific specifications through constrained agent workflows.

```text
Loaded Vibes
  generates the fixed application foundation

Codependent Coding
  transforms that foundation into the requested MVP
```

Loaded Vibes removes setup variability. Codependent Coding removes implementation ambiguity.

## Goals

- Replace repeated manual SaaS setup with one initializer workflow.
- Generate the same reliable file structure, integrations, and architectural boundaries every time.
- Prevent foundational concerns from being reimplemented inconsistently by agents.
- Provide a complete, runnable starting repository rather than a minimal boilerplate.
- Make the generated structure predictable enough for Codependent Coding to modify without rediscovery.
- Support validation of the generated repository before it is accepted.
- Provision required resources where the final implementation supports safe automated provisioning.
- Reduce the time required to reach a golden prototype from days or weeks to minutes.

## Non-Goals

Loaded Vibes does not own:

- product-specific MVP feature implementation after generation
- free-form architectural invention by the initializer
- every possible technology or application architecture
- replacement of Codependent Coding's specification and execution system
- replacement of the reusable engineering source of truth in `40 TECH STACK`

## Current State

The project definition is active, but the refreshed generator has not yet been formalized or implemented.

The completed Vibes starter-template work is relevant source material because it represents the current canonical generated output. Loaded Vibes is the future initializer and generator that will produce and configure that output.

## Open Decisions

The transcript does not yet settle:

- the final CLI package name and command
- the generator repository structure
- whether generation uses one base template, composable modules, or both
- the prompt and configuration schema
- dependency and compatibility rules among optional modules
- the template rendering and transformation strategy
- automated provider provisioning mechanics
- generated-project validation and rollback behavior
- release, versioning, and upgrade strategy

These decisions should be resolved while preserving the project boundary defined here.
