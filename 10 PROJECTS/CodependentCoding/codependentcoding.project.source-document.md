---
title: Codependent Coding Project Definition
type: source-document
scope: project
project: Codependent Coding
domain: project
artifact: definition
kind: source-document
namespace: codependentcoding.project.source-document
status: active
authority: source-of-truth
parent: "[[codependentcoding.project.map]]"
depends_on:
  - "[[loadedvibes.project.source-document]]"
supersedes: []
tags:
  - projects/codependent-coding
  - agentic-development
  - spec-driven-development
  - status/active
created: 2026-08-05
updated: 2026-08-05
---

# Codependent Coding

## Purpose

Codependent Coding is the spec-driven AI engineering system that turns natural-language product and feature intent into governed implementation inside a Loaded Vibes-generated SaaS application.

It combines the operating ideas of specification-driven development and reusable agent capabilities: human-readable context, machine-readable contracts, execution state, Codex plugins, skills, custom agents, instructions, and prompts.

Its role is to take the canonical golden prototype produced by [[loadedvibes.project.source-document]] and transform it into a product-specific MVP without requiring the agent to rediscover the repository, architecture, boundaries, or implementation patterns.

## Product Definition

Codependent Coding must provide a constrained path from user intent to implementation:

```text
Natural-language product intent
        ↓
Human-readable context and specifications
        ↓
Machine-readable contracts and execution state
        ↓
Agent work packages and implementation
        ↓
Validation and quality gates
        ↓
Product-specific MVP
```

The system is intended to reduce ambiguity rather than encourage architectural invention. Agents work within the structure, conventions, and canonical patterns already encoded by Loaded Vibes and defined by the reusable engineering source of truth in `40 TECH STACK`.

## Human-Readable Context Model

The standard context layer uses Markdown.

### Documentation

The recurring documentation set is:

- product requirements document
- technical requirements
- architecture
- design
- authentication

These documents preserve human intent and project-level decisions.

### Specifications

Specifications decompose the product into bounded implementation subjects or work units. Their exact contents vary by project.

Examples discussed for the canonical SaaS system include:

- fetchers
- Server Actions
- application workflows
- DTO mappers
- Prisma selects
- transactions
- authentication
- authorization
- webhooks
- feature orchestration
- route orchestration
- presentational components
- routes
- Stripe
- Clerk
- Neon
- Prisma

Specifications are not required to be identical across every generated product. They exist to break a large product problem into explicit units an agent can implement and validate independently.

## Machine-Readable Agent Model

The standard `.agents` layer contains two directories.

### Contracts

YAML contracts define durable machine-readable constraints:

- `product`
- `architecture`
- `validation`

### Execution

JSON execution records preserve active agent state:

- `decisions`
- `progress`
- `handoff`

The contracts define what must remain true. The execution records describe what has been decided, what has been completed, and what another agent needs to continue without rediscovery.

## Agent Capability Layer

Codependent Coding is expected to package the reusable capabilities needed to work correctly inside the generated application, including:

- Codex plugins
- reusable skills
- custom agents
- repository instructions
- prompts
- specification translation workflows
- contract-aware execution workflows
- validation and quality-gate integration

These capabilities should teach the agent how to apply product-specific changes to known extension points rather than how to rebuild the base application.

## Operating Relationship with Loaded Vibes

Loaded Vibes owns the deterministic starting state.

Codependent Coding owns the deterministic transformation of that starting state into a product-specific application.

```text
Engineering source of truth
        ↓
Loaded Vibes generator
        ↓
Golden prototype repository
        ↓
Codependent Coding
        ↓
Product-specific MVP
```

Codependent Coding may assume the generated repository already contains the canonical file structure, architectural boundaries, integrations, governance scaffolding, tests, and validation machinery promised by Loaded Vibes.

## Goals

- Convert natural-language intent into explicit specifications and governed execution.
- Prevent agents from inventing alternate file structures or architectural patterns.
- Make the location, purpose, and allowed dependencies of implementation files predictable.
- Reuse established SaaS patterns instead of rebuilding foundational infrastructure.
- Preserve decisions, progress, and handoff state across agent runs.
- Run validation and quality gates before accepting implementation work.
- Reduce prototype-to-MVP delivery from days or weeks to hours, with an aspirational target of less than one hour for suitable products, including resource provisioning where supported.

## Non-Goals

Codependent Coding does not own:

- generation of the baseline SaaS repository
- definition of the reusable engineering system itself
- unrestricted agent improvisation
- product decisions the user has not supplied
- replacement of project-specific specifications with a universal fixed feature list

## Current State

The project definition is active, but the implementation is not yet formalized.

Existing notes in this project folder contain earlier material about development cycles, mental models, procedures, teams, and ticketing. They remain preserved as supporting material until they are deliberately reconciled with this source-of-truth definition.

## Open Decisions

The transcript does not yet settle:

- the final repository and package structure
- the exact plugin and skill interfaces
- the natural-language-to-specification translation pipeline
- the work-package and pull-request execution protocol
- the provider provisioning mechanism
- the exact division of validation responsibilities among lint rules, contract validators, tests, and review tooling

These decisions should be resolved without changing the core project boundary defined here.
