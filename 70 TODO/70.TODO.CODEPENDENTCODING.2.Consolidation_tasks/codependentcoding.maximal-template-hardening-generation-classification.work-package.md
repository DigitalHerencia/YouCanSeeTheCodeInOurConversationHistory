---
pm-task: true
projectId: "klb30ky6lcbogzet"
parentId:
id: "kioh3vleg6fw39er"
title: "Harden the Maximal Template and classify the generation surface"
type: "task"
status: "todo"
priority: "medium"
start: "2026-08-18"
due: ""
progress: 0
assignees: []
tags: ["codependent-coding", "consolidation"]
subtaskIds: []
dependencies: ["28dklimfqmydecwd"]
createdAt: "2026-08-18T18:23:00.000Z"
updatedAt: "2026-08-18T18:23:00.000Z"
---

# Harden the Maximal Template and classify the generation surface

**Priority:** P1  
**Phase:** Hardening

## Outcome

Convert the completed public Maximal Template demonstration into the hardened canonical application while classifying what is invariant, derived, selectable, and presentation-configurable.

## Checklist

- [ ] Apply real authenticated tenant context and a restricted PostgreSQL runtime role.
- [ ] Enforce actual RLS and cross-resource tenant integrity.
- [ ] Apply consistent authorization/ABAC boundaries.
- [ ] Implement webhook signature/retry/idempotency/reconciliation semantics.
- [ ] Use concurrency-safe sequencing and correct transaction boundaries.
- [ ] Use atomic rate limiting where required.
- [ ] Align production route semantics and focused security/architecture tests.
- [ ] Keep CI proportional to the evidence required.
- [ ] Classify each relevant Simple/relationship as Invariant, Derived, Selectable, or Presentation-configurable.
- [ ] Do not expose mandatory backend architecture/security machinery as user toggles.

## Acceptance

- [ ] Hardened source exists for completed Simples or has explicit blocking reasons.
- [ ] Backend architecture/security choices remain deterministic/derived.
- [ ] Generation-readiness state is recorded in the Simple model.

## Dependencies

- [[codependentcoding.maximal-template-simple-by-simple-execution.work-package]]

Project: [[70.TODO.CODEPENDENTCODING.2.Consolidation|Codependent Coding Consolidation]]
