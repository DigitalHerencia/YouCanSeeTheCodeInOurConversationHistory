---
title: "Normalize Static Public Pages to the Block Doctrine"
type: work-package
scope: project
project: "The Maximal Template"
domain: "showroom"
artifact: "public-pages-presentation-doctrine"
kind: work-package
namespace: maximal-template.public-pages-presentation-doctrine.work-package
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

# Normalize Static Public Pages to the Block Doctrine

**Priority:** P1  
**Phase:** Showroom  
**Task status:** Backlog

## Outcome

Ensure static public pages compose reusable blocks directly and do not import UI primitives or meaningless feature wrappers.

## Why This Exists

The backlog specifically identifies `/architecture` and `/components` as pages that explain an architecture they currently violate.

## Execution Checklist

- [ ] Audit every `app/(public)` page for direct `components/ui` imports.
- [ ] Audit for feature wrappers that have no data/workflow/auth/provider orchestration.
- [ ] Move reusable static compositions into grouped blocks.
- [ ] Keep page files thin and declarative.
- [ ] Preserve form-feature exceptions on genuinely interactive forms.
- [ ] Add a focused architecture rule for static public route imports if practical.

## Acceptance Criteria

- [ ] Static public pages with no application behavior compose blocks directly.
- [ ] No meaningless public feature wrappers remain.
- [ ] No direct primitive imports remain at static route level unless explicitly justified.

## Dependencies

- None recorded.

## Source Basis

- `The Maximal Template™ Backlog.md`
- `The Maximal Template™ Demo Doctrine.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
