---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "icsw391amsy9z5el"
title: "maximal-template.block-catalog-normalization.work-package"
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
createdAt: "2026-08-18T06:22:02.013Z"
updatedAt: "2026-08-18T06:22:02.013Z"
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

Project: [[New Project|New Project]]