---
title: "Build the Professional Public Documentation Information Architecture"
type: work-package
scope: project
project: "Public Website and Documentation"
domain: "documentation"
artifact: "public-docs-information-architecture"
kind: work-package
namespace: website-docs.public-docs-information-architecture.work-package
status: active
authority: working-note
parent: "[[website-docs.execution.tasks.map]]"
depends_on:
  []
supersedes: []
tags:
  - projects/website-docs
  - work-package
  - work/backlog
  - priority/p0
created: 2026-08-16
updated: 2026-08-16
priority: P0
task_status: backlog
phase: "Documentation"
---

# Build the Professional Public Documentation Information Architecture

**Priority:** P0  
**Phase:** Documentation  
**Task status:** Backlog

## Outcome

Split the master synthesis into navigable learning/reference sections without creating competing definitions.

## Why This Exists

The master already proposes a top-level Docs IA covering Architecture, Hipster Stack, Maximal Template, Patterns, Security, Loaded Vibes, and Reference.

## Execution Checklist

- [ ] Create Introduction entrypoint and system map.
- [ ] Create Architecture section: layer contracts, route/feature orchestration, data/trust boundaries, auth/authz/tenancy/RLS, integrations, webhooks, caching, errors/loading/ops.
- [ ] Create Hipster Stack section: technology stack, installation, CLI, config, generation lifecycle, Constituter.
- [ ] Create Maximal Template section: domain library, Simples, Ontologies, directory structure, Ordinary Object.
- [ ] Create Patterns section: fetchers, actions, workflows, transactions, selects/DTOs, forms, UI composition, provider webhooks.
- [ ] Create Security section: trust, tenancy, RBAC/ABAC, RLS, provider security.
- [ ] Create Loaded Vibes section: plugin, agents, skills, instructions/prompts, validators, environment assets.
- [ ] Create Reference section: classifier, glossary, configuration properties, Ontology matrix, Simple catalog, conformance rules.
- [ ] Use canonical-source links/provenance so split pages are derived views, not independent authorities.

## Acceptance Criteria

- [ ] Docs navigation matches the proposed master IA.
- [ ] Every page identifies its canonical source relationship.
- [ ] Definitions do not drift between pages.

## Dependencies

- None recorded.

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
