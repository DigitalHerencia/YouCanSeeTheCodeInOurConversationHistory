---
title: "Publish Loaded Vibes Plugin Documentation from the Actual Shipped Package"
type: work-package
scope: project
project: "Public Website and Documentation"
domain: "documentation"
artifact: "loaded-vibes-public-docs"
kind: work-package
namespace: website-docs.loaded-vibes-public-docs.work-package
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
  - priority/p1
created: 2026-08-16
updated: 2026-08-16
priority: P1
task_status: backlog
phase: "Documentation"
---

# Publish Loaded Vibes Plugin Documentation from the Actual Shipped Package

**Priority:** P1  
**Phase:** Documentation  
**Task status:** Backlog

## Outcome

Document the plugin as an architecture-aware Codex execution environment only after package contents and names are verified.

## Why This Exists

The master explicitly warns that a shipped plugin manifest must be verified in the eventual implementation rather than inferred from normative design.

## Execution Checklist

- [ ] Write plugin overview and intended repository compatibility.
- [ ] Document install/update flow using actual supported mechanism.
- [ ] Document agents using shipped role names.
- [ ] Document skills using shipped names and responsibilities.
- [ ] Document governance/instruction loading behavior.
- [ ] Document architecture validators and what they can/cannot prove.
- [ ] Document smoke tests and evidence conventions.
- [ ] Document developer-environment assets.
- [ ] Document repository-local precedence and human gates.
- [ ] Do not list speculative agent/skill filenames as shipped.

## Acceptance Criteria

- [ ] Public plugin docs match the actual release package.
- [ ] Capabilities are not overstated.
- [ ] Repository-local instruction precedence is clear.

## Dependencies

- None recorded.

## Source Basis

- `Loaded Vibes™ Codex Plugin — Current State Workup.md`
- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
