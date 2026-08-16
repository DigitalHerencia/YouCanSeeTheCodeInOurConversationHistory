---
title: "Rebuild Layer Contracts and the Dependency Matrix"
type: work-package
scope: project
project: "Codependent Coding WebApp Architecture"
domain: "canonical-model"
artifact: "layer-contracts-dependency-matrix"
kind: work-package
namespace: codependentcoding.layer-contracts-dependency-matrix.work-package
status: active
authority: working-note
parent: "[[codependentcoding.execution.tasks.map]]"
depends_on:
  - "[[codependentcoding.terminology-ontology-normalization.work-package]]"
  - "[[codependentcoding.workflow-constitution-correction.work-package]]"
supersedes: []
tags:
  - projects/codependentcoding
  - work-package
  - work/backlog
  - priority/p0
created: 2026-08-16
updated: 2026-08-16
priority: P0
task_status: backlog
phase: "Canonical Model"
---

# Rebuild Layer Contracts and the Dependency Matrix

**Priority:** P0  
**Phase:** Canonical Model  
**Task status:** Backlog

## Outcome

Turn the canonical architecture into an explicit allowed/forbidden dependency model that can drive implementation guidance and mechanical validators.

## Why This Exists

The architecture already names responsibilities and anti-patterns. Formal dependency rules are needed so downstream agents do not have to infer import legality from prose.

## Execution Checklist

- [ ] Define allowed dependencies for routes, features, client features, blocks, primitives, form features, fetchers, actions, workflows, transactions, auth, authz, integrations, webhook routes, schemas, types, cache, constants, and utils.
- [ ] Define forbidden dependencies and explicit exceptions.
- [ ] State whether a feature may call an action directly, a workflow directly, or both depending on behavior.
- [ ] State the form-feature direct primitive-import exception precisely.
- [ ] State block purity rules including what local presentation behavior is allowed.
- [ ] State transaction restrictions, especially no network/provider I/O.
- [ ] State provider SDK import boundaries and Clerk/Neon/Prisma exceptions.
- [ ] State server/client import boundaries.
- [ ] Map each rule to a validator candidate: mechanically enforceable, partially enforceable, or semantic-only.
- [ ] Update architecture diagrams and classifier from the matrix.

## Acceptance Criteria

- [ ] Every canonical layer has explicit inbound/outbound dependency rules.
- [ ] Exceptions are enumerated instead of implied.
- [ ] Each stable rule is tagged with its enforceability class.
- [ ] The matrix can be directly consumed when writing Loaded Vibes validators.

## Dependencies

- [[codependentcoding.terminology-ontology-normalization.work-package]]
- [[codependentcoding.workflow-constitution-correction.work-package]]

## Source Basis

- `codependentcoding.docs.layer-contracts.contract.md`
- `hipsterstack.patterns.layer-contract.reference.md`
- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
