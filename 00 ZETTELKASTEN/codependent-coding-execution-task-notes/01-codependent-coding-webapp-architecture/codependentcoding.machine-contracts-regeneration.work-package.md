---
title: "Regenerate Machine-Readable Contracts from the Closed Canon"
type: work-package
scope: project
project: "Codependent Coding WebApp Architecture"
domain: "derived-contracts"
artifact: "machine-contracts-regeneration"
kind: work-package
namespace: codependentcoding.machine-contracts-regeneration.work-package
status: active
authority: working-note
parent: "[[codependentcoding.execution.tasks.map]]"
depends_on:
  - "[[codependentcoding.security-lifecycle-validation-reconciliation.work-package]]"
  - "[[codependentcoding.terminology-ontology-normalization.work-package]]"
supersedes: []
tags:
  - projects/codependentcoding
  - work-package
  - work/backlog
  - priority/p1
created: 2026-08-16
updated: 2026-08-16
priority: P1
task_status: backlog
phase: "Derived Contracts"
---

# Regenerate Machine-Readable Contracts from the Closed Canon

**Priority:** P1  
**Phase:** Derived Contracts  
**Task status:** Backlog

## Outcome

Update product, architecture, ontology, validation, and execution contracts so machine-readable governance reflects the final human canon instead of older knowledge-system generations.

## Why This Exists

The machine contracts are explicitly subordinate to Markdown doctrine. Once semantic closure is complete, they need to be regenerated/reconciled as deterministic subsets rather than left as historical payloads.

## Execution Checklist

- [ ] Define which normative claims are stable enough to encode mechanically.
- [ ] Update `product` contract for the new product topology and repository roles.
- [ ] Update `architecture` contract for layer ownership, workflow constitution, form exceptions, provider boundaries, and dependency direction.
- [ ] Update `ontology` contract for normalized entities, relations, and terms.
- [ ] Update `validation` contract for proportional checks, evidence semantics, and conformance categories.
- [ ] Update `execution` contract for bounded work, repository inspection, validation evidence, handoff, and human gates.
- [ ] Add schema validation for contract files.
- [ ] Document derivation provenance from canonical human owners.
- [ ] Ensure no contract silently introduces architecture absent from the source document.

## Acceptance Criteria

- [ ] All active machine contracts validate against their schemas.
- [ ] Machine contracts contain no known superseded product roles or workflow definitions.
- [ ] Every machine rule points back to a canonical human source.
- [ ] No machine contract outranks or contradicts the master architecture.

## Dependencies

- [[codependentcoding.security-lifecycle-validation-reconciliation.work-package]]
- [[codependentcoding.terminology-ontology-normalization.work-package]]

## Source Basis

- `codependentcoding.contracts.*.yaml`
- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
