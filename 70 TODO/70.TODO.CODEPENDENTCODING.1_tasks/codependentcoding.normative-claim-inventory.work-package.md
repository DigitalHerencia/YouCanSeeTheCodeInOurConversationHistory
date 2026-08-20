---
pm-task: true
projectId: "corc1ymtmsw98exn"
parentId:
id: "8ryfz3gxmsw9d1v3"
title: "codependentcoding.normative-claim-inventory.work-package"
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
createdAt: "2026-08-16T20:29:18.639Z"
updatedAt: "2026-08-16T20:29:18.639Z"
---

# Build the Atomic Normative Claim Inventory

**Priority:** P0  
**Phase:** Specification Closure  
**Task status:** Backlog

## Outcome

Create a machine-auditable inventory of the architecture’s normative claims so completeness and contradictions can be checked at the claim level instead of the document-title level.

## Why This Exists

The corpus is large enough that “we have a document about X” is no longer a sufficient completeness test. The finish line requires knowing whether every architectural decision has one controlling meaning and whether downstream artifacts can derive from it without interpretation.

## Execution Checklist

- [ ] Extract normative statements from the master architecture, Demo Doctrine, Maximal Template architecture/backlog where architectural, and active DevNotes contracts/patterns.
- [ ] Assign each claim a stable identifier and subject such as routes, features, blocks, forms, workflows, fetchers, actions, auth, authz, tenancy, RLS, integrations, webhooks, transactions, generator, Simples, Ontologies, Constituter, Loaded Vibes, validation, and evidence.
- [ ] Classify each claim as definition, responsibility, allowed dependency, forbidden dependency, invariant, exception, lifecycle rule, placement rule, security rule, generation rule, or evidence rule.
- [ ] Record source authority and the newest controlling source for each claim.
- [ ] Mark duplicate statements that are semantically equivalent.
- [ ] Mark statements that conflict, partially overlap, or use different terminology for the same concept.
- [ ] Record areas with no normative statement where a recurring architectural decision exists.
- [ ] Create a compact coverage matrix by architecture concept and claim type.

## Acceptance Criteria

- [ ] Every major architecture concept has at least a definition, owner/responsibility, boundary, and dependency/placement rule.
- [ ] Every claim has a controlling source and status.
- [ ] Conflicts and gaps can be queried without rereading the entire corpus.
- [ ] The inventory is suitable as input to later contract and validator derivation.

## Dependencies

- [[codependentcoding.workflow-constitution-correction.work-pack]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`
- `The Maximal Template™ Demo Doctrine.md`
- 40 TECH STACK/*
- 60 CODEPENDENT CODING/*

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[70.TODO.CODEPENDENTCODING.01.Webapp-Architecture|70.TODO.CODEPENDENTCODING.1]]