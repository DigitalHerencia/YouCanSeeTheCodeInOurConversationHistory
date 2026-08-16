---
title: "Normalize the Application Block Catalog by Presentation Category"
type: work-package
scope: project
project: "The Maximal Template"
domain: "showroom"
artifact: "block-catalog-normalization"
kind: work-package
namespace: maximal-template.block-catalog-normalization.work-package
status: active
authority: working-note
parent: "[[maximal-template.execution.tasks.map]]"
depends_on:
  []
supersedes: []
tags:
  - projects/maximal-template
  - work-package
  - work/backlog
  - priority/p1
created: 2026-08-16
updated: 2026-08-16
priority: P1
task_status: backlog
phase: "Showroom"
---

# Normalize the Application Block Catalog by Presentation Category

**Priority:** P1  
**Phase:** Showroom  
**Task status:** Backlog

## Outcome

Replace catch-all block files with shallow category-oriented grouped block modules.

## Why This Exists

The backlog identifies `application-sections.tsx` as a growing presentation junk drawer, which violates the doctrine’s category-oriented block catalog.

## Execution Checklist

- [ ] Inventory exports currently living in catch-all application block files.
- [ ] Group exports by presentation responsibility such as data tables, dashboards/metrics, kanban, timeline, file/media, chat, audit, settings, onboarding, invoice, empty/error states.
- [ ] Use lowercase-kebab-case filenames and descriptive PascalCase variant exports.
- [ ] Preserve block purity: no persisted reads/writes, auth/authz, providers, workflows, or RHF state.
- [ ] Update imports throughout features/pages without introducing route/domain-specific block files.
- [ ] Remove obsolete catch-all exports only after all callers migrate.
- [ ] Add/adjust architecture validator rules if file-category constraints are stable enough to check.

## Acceptance Criteria

- [ ] No catch-all application block file owns unrelated presentation categories.
- [ ] Block files remain shallow and category-oriented.
- [ ] Features/pages compile with no duplicate/obsolete exports.
- [ ] Block purity remains intact.

## Dependencies

- None recorded.

## Source Basis

- `The Maximal Template™ Backlog.md`
- `The Maximal Template™ Demo Doctrine.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
