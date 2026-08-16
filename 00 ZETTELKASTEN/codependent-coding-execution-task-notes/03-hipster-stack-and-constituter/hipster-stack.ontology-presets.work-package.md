---
title: "Finalize the Nine Ontology Presets Against Supported Simples"
type: work-package
scope: project
project: "The Hipster Stack and The Constituter"
domain: "library"
artifact: "ontology-presets"
kind: work-package
namespace: hipster-stack.ontology-presets.work-package
status: active
authority: working-note
parent: "[[hipster-stack.execution.tasks.map]]"
depends_on:
  - "[[hipster-stack.simple-catalog-implementation-truth.work-package]]"
supersedes: []
tags:
  - projects/hipster-stack
  - work-package
  - work/backlog
  - priority/p1
created: 2026-08-16
updated: 2026-08-16
priority: P1
task_status: backlog
phase: "Library"
---

# Finalize the Nine Ontology Presets Against Supported Simples

**Priority:** P1  
**Phase:** Library  
**Task status:** Backlog

## Outcome

Define the nine default Ontologies as validated presets over the same Application Definition and verified Simple catalog.

## Why This Exists

The master defines nine starter specifications but they must resolve only to supported template capabilities.

## Execution Checklist

- [ ] Finalize CRM/Pipeline Tracker preset.
- [ ] Finalize Project Management/Task Tracker preset.
- [ ] Finalize Customer Support/Ticketing preset.
- [ ] Finalize Marketing Automation & Analytics preset.
- [ ] Finalize Invoicing & Expense Tracker preset.
- [ ] Finalize Social Media Scheduler preset.
- [ ] Finalize AI Wrapper/Micro-SaaS preset.
- [ ] Finalize B2B Client Portal preset.
- [ ] Finalize Internal Tools/Admin Portal preset.
- [ ] For each preset, define routes, features, presentation, workflows, providers, auth/authz requirements, and defaults.
- [ ] Validate each preset against the Simple catalog and dependency resolver.
- [ ] Document which wider business domains remain conceptual/non-default.

## Acceptance Criteria

- [ ] All nine presets resolve successfully using supported Simples only.
- [ ] Presets are data over one model, not separate generators/templates.
- [ ] User overrides remain possible within supported constraints.

## Dependencies

- [[hipster-stack.simple-catalog-implementation-truth.work-package]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
