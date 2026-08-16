---
title: "Propagate the Canonical Workflow Constitution Correction"
type: work-package
scope: project
project: "Codependent Coding WebApp Architecture"
domain: "specification-closure"
artifact: "workflow-constitution-correction"
kind: work-package
namespace: codependentcoding.workflow-constitution-correction.work-package
status: active
authority: working-note
parent: "[[codependentcoding.execution.tasks.map]]"
depends_on:
  []
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
phase: "Specification Closure"
---

# Propagate the Canonical Workflow Constitution Correction

**Priority:** P0  
**Phase:** Specification Closure  
**Task status:** Backlog

## Outcome

Replace the residual “remaining business logic” definition of workflows everywhere the current canon or its derivatives still use it, and establish workflows as reusable constitutions of application logic built from existing server operations and helpers.

## Why This Exists

The newest architectural decision gives workflows a positive responsibility. The current master still contains the older residual definition in the governing sentence, invariants, classifier, glossary, quick reference, synthesis table, SOLID examples, and final statement. Leaving both meanings active would force downstream agents to choose between conflicting definitions.

## Execution Checklist

- [ ] Inventory every normative workflow definition in the master source document and all active pattern/contract notes.
- [ ] Replace “remaining domain/business logic” language with the positive workflow constitution definition.
- [ ] State explicitly that fetchers, actions, transactions, auth, authz, integrations, cache helpers, schemas, and other server capabilities retain their own ownership when used by a workflow.
- [ ] Update the architecture classifier so a workflow is selected when reusable application logic requires orchestration of multiple operations, rules, conditions, or effects.
- [ ] Preserve the rule that trivial CRUD does not require a workflow.
- [ ] Update diagrams so workflows sit between server operations/helpers and features as behavioral constitutions.
- [ ] Update SOLID and Clean Code examples so they no longer imply workflows are a residual junk-drawer category.
- [ ] Update Simples and Constituter semantics so workflow selection resolves its constituent dependency graph.
- [ ] Update glossary, quick reference, synthesis decisions, and final architecture statement.
- [ ] Record the older definition as superseded provenance rather than leaving it active.

## Acceptance Criteria

- [ ] Exactly one active canonical workflow definition remains.
- [ ] No active source-of-truth note describes workflows only as “remaining business logic.”
- [ ] The classifier distinguishes direct action/fetcher use from workflow-worthy behavioral orchestration.
- [ ] Simples and Constituter language reflects dependency-resolved workflow constitution.
- [ ] A reader can explain what workflows are, what they may invoke, what they do not own, and when they are unnecessary without inference.

## Dependencies

- None recorded.

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`
- Canonical Workflow Constitution Correction from this conversation

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
