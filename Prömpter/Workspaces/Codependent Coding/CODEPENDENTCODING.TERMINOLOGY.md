---
title: Codependent Coding™ Terminology
type: terminology
project: Codependent Coding
status: active
authority: canonical
updated: 2026-08-20
role: prompter
system: codependent-coding
workspace: codependent-coding
tags: []
---

# Codependent Coding™ Terminology

This note is the current naming authority. Where an older active document still uses a superseded branded product noun, this vocabulary controls until that document is propagated.

## Architecture terminology

| Term | Meaning |
| --- | --- |
| Tenant Routes | Authenticated URL/HTTP boundary. |
| Public Routes | Static public content is `(public)`, not the marketing business domain. |
| Static Pages | Static pages may compose blocks directly; they do not require empty features. |
| Feature | Application capability orchestration boundary. |
| Client Feature | Deliberate browser-only orchestration companion. |
| Forms | RHF form features are an explicit feature → UI primitive exception. |
| Block | Pure reusable UI composition. |
| Primitive | Lowest-level UI component. |
| Fetcher | Read-only persisted application data operation. |
| Action | Ordinary persisted CRUD mutation boundary. |
| Transaction Helper | Atomic database persistence helper preserving multi-write invariants. |
| Select | Precise Prisma projection. |
| DTO Mapper | Persistence/domain → transport-safe mapping function. |
| Schema | Runtime boundary validation contract. |
| Authentication | Establishes verified identity/session. |
| Authorization | Decides permitted operation/resource/context. |
| Tenant | Architectural isolation concept. |
| Organization | Canonical application-owned tenant entity in the default model. |
| Membership | Contextual relationship connecting a User to an Organization and business authority. |
| RLS | PostgreSQL row-level containment layer. |
| Integration | Provider-specific external-service mechanics. |
| Webhook | Provider HTTP request boundary and reconciliation lifecycle. |

## Branded products

| Product | Canonical role |
| --- | --- |
| **The Codependent Coding™ Web App Architecture** | Governing architecture and documentation system: responsibilities, boundaries, invariants, composition, security posture, and implementation grammar. |
| **The Hipster Stack™ Technology Stack** | Concrete technology stack plus deterministic constitution/generation system and CLI. |
| **The Maximal Template™ Domain Library** | Single runnable superset application containing every supported implementation that may be retained, removed, or transformed during generation. |
| **The Anthimeria™ Workbench** | Stateless web configuration workbench over the shared recipe/configuration model and resolver. |
| **The Loaded Vibes™ Codex Plugin** | Codex-oriented architecture-enforcement and software-operations layer. |
| **The Visual Vibes™ Design System** | Modern dark industrial neo-brutalist technical design system with restrained signal. |
| **The Simples™ Normalized Blocks** | Source-backed normalized supported building blocks. |
| **The Ontology™ Normalized Defaults** | One of nine normalized default starter application definitions/presets. |
| **The BusinessLogic Blocks™ Workflows** | Named reusable workflow orchestration boundaries that constitute application logic from existing server operations/helpers. |
| **The PureUI Blocks™ Presentation Layer** | Pure reusable UI composition layer. |
| **The Virgule™ Application Definition** | The portable recipe created/configured in Anthimeria. It may move through draft → normalized → validated → dependency-closed states while remaining The Virgule™. |
| **The Arrangement™ Generated Artifact** | Generated standalone white-label application produced from a Virgule. |

## The generation sentence

> **The Ontology™ provides a normalized default; The Anthimeria™ lets the user configure it; The resulting Virgule™ is the recipe; The Hipster Stack™ consumes that recipe against The Maximal Template™; The Arrangement™ is the standalone application that comes out.**

```text
The Ontology™ Normalized Default
          ↓
The Anthimeria™ Workbench
          ↓
The Virgule™ Application Definition / Recipe
  draft → normalized → validated → dependency-closed
          ↓
The Hipster Stack™ Technology Stack / CLI
          +
The Maximal Template™ Domain Library
          ↓
The Arrangement™ Generated Artifact
```

## Classification note

Unqualified architectural **Block** continues to mean a pure reusable UI composition (`components/blocks/*`). The word “Blocks” inside the branded names Simples™, BusinessLogic Blocks™, and PureUI Blocks™ does not silently change source-file classification.

## Superseded product nouns

For current product vocabulary:

- `The Constituter™` → **The Anthimeria™ Workbench**
- `Ordinary Object™` → **The Arrangement™ Generated Artifact**
- the separate product noun `Generation Plan` → the **dependency-closed state of The Virgule™**

Historical material may retain old names as provenance; current architecture and product docs should use the canonical names above.
