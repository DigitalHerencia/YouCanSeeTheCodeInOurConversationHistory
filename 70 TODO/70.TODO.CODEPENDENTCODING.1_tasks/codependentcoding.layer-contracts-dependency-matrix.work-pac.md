---
pm-task: true
projectId: "corc1ymtmsw98exn"
parentId:
id: "ijw44zj1msw9d24t"
title: "codependentcoding.layer-contracts-dependency-matrix.work-package"
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
createdAt: "2026-08-16T20:29:18.989Z"
updatedAt: "2026-08-16T20:29:18.989Z"
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

- [[codependentcoding.terminology-ontology-normalization.work-pa]]
- [[codependentcoding.workflow-constitution-correction.work-pack]]

## Source Basis

- `codependentcoding.docs.layer-contracts.contract.md`
- `hipsterstack.patterns.layer-contract.reference.md`
- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[70.TODO.CODEPENDENTCODING.01.Webapp-Architecture|70.TODO.CODEPENDENTCODING.1]]