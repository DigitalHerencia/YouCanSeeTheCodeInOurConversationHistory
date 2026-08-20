---
pm-task: true
projectId: "corc1ymtmsw98exn"
parentId:
id: "4ogwk8d9msw9d1dq"
title: "codependentcoding.terminology-ontology-normalization.work-package"
type: "task"
status: "todo"
priority: "medium"
start: "2026-08-16"
due: ""
progress: 0
assignees: []
tags: []
subtaskIds: []
dependencies: []
createdAt: "2026-08-16T20:29:18.014Z"
updatedAt: "2026-08-16T20:29:18.014Z"
---

# Normalize the Canonical Ontology, Terminology, and Nomenclature

**Priority:** P0  
**Phase:** Canonical Model  
**Task status:** Backlog

## Outcome

Produce one controlled semantic model for all named architectural entities, relationships, roles, and product-system terms.

## Why This Exists

The corpus already contains ontology/taxonomy/terminology material, but the new product topology and workflow correction require a current semantic layer that agents can use without translating between generations.

## Execution Checklist

- [ ] Define the canonical entity set: architecture, Hipster Stack, Maximal Template, Simples, Ontologies, Constituter, Application Definition, Generation Plan, Ordinary Object, Loaded Vibes, routes, features, blocks, primitives, workflows, server operations/helpers, and all server/data/security responsibilities.
- [ ] Define relation verbs carefully, including owns, invokes, orchestrates, constitutes, derives, resolves, validates, contains, depends on, requires, conflicts with, retains, removes, transforms, and generates.
- [ ] Document deprecated or discouraged terms and their canonical replacements.
- [ ] Separate business domain `marketing` from public-page classification.
- [ ] Separate authentication identity from application tenancy/authorization vocabulary.
- [ ] Separate provider truth from application interpretation.
- [ ] Normalize naming examples and filename conventions across the architecture.
- [ ] Update glossary and machine ontology contract to match the normalized terms.
- [ ] Add aliases only where they improve discoverability without creating competing names.

## Acceptance Criteria

- [ ] A term has one canonical meaning inside the architecture.
- [ ] Every major relation used by the generator or plugin has a defined semantic meaning.
- [ ] Deprecated terminology is clearly marked and does not appear as current doctrine.
- [ ] Human glossary and machine-readable ontology contract agree.

## Dependencies

- [[codependentcoding.contradiction-reconciliation.work-package]]
- [[codependentcoding.ambiguity-closure.work-package]]

## Source Basis

- `web-development.knowledge-modeling.ontology-taxonomy.reference.md`
- `software-development.system-architecture.terminology.reference.md`
- `codependentcoding.contracts.ontology.contract.yaml`
- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[70.TODO.CODEPENDENTCODING.01.Webapp-Architecture|70.TODO.CODEPENDENTCODING.1]]