---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "8kvmltdvmsy9yx3q"
title: "loaded-vibes.governance-slices.work-package"
type: "task"
status: "todo"
priority: "medium"
start: "2026-08-18"
due: ""
progress: 0
assignees: []
tags: []
subtaskIds: []
dependencies: []
createdAt: "2026-08-18T06:21:51.254Z"
updatedAt: "2026-08-18T06:21:51.254Z"
---

# Derive Loaded Vibes Governance Slices from the Closed Architecture

**Priority:** P0  
**Phase:** Governance  
**Task status:** Backlog

## Outcome

Produce concise operational governance that teaches Codex the architecture boundaries without reproducing the full source corpus.

## Why This Exists

The master lists governance slices for classifier, layer contracts, security, orchestration, reads, mutations, workflows, transactions, webhooks, providers, configuration/secrets, validation, and evidence.

## Execution Checklist

- [ ] Derive architecture classifier guidance.
- [ ] Derive route/feature/presentation rules.
- [ ] Derive fetcher/action/workflow/transaction rules using the corrected workflow definition.
- [ ] Derive auth/authz/tenancy/RLS rules.
- [ ] Derive provider/webhook boundaries.
- [ ] Derive configuration/env/secrets rules.
- [ ] Derive proportional validation/evidence rules.
- [ ] Include anti-patterns and explicit exceptions.
- [ ] Keep each slice narrow enough to load only when relevant.
- [ ] Record canonical source/version in each derivative.

## Acceptance Criteria

- [ ] Every governance slice is traceable to current canon.
- [ ] No slice introduces a new architecture decision.
- [ ] Workflow, form, tenancy, provider, and evidence semantics match the latest source.

## Dependencies

- [[loaded-vibes.plugin-package-architecture.work-package]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]