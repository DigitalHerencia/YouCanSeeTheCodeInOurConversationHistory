---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "rhij85yhmsy9z1we"
title: "maximal-template.showroom-navigation-route-integrity.work-package"
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
createdAt: "2026-08-18T06:21:57.470Z"
updatedAt: "2026-08-18T06:21:57.470Z"
---

# Fix Showroom Navigation and Route Integrity

**Priority:** P0  
**Phase:** Showroom  
**Task status:** Backlog

## Outcome

Make the public application shell accurately expose the full maximal superset and eliminate route drift.

## Why This Exists

The backlog identifies a concrete `/users` → `/admin/users` defect and notes that the shell exposes only a fraction of the capabilities already represented by the Explorer.

## Execution Checklist

- [ ] Remove or redirect the invalid `/users` navigation target and use `/admin/users`.
- [ ] Inventory all current public/application routes exposed by the maximal template.
- [ ] Establish one canonical navigation/route definition used by desktop, mobile, and shell variants.
- [ ] Organize navigation into meaningful groups: CRM, Projects, Support, Marketing, Invoicing, Social, AI, Portal, Admin, Settings, Auth/Onboarding, Integrations, Components, Architecture.
- [ ] Ensure route groups do not accidentally change intended URL paths such as `/admin`.
- [ ] Verify every navigation item resolves to a real route.
- [ ] Add a focused route/navigation integrity check if a stable machine-checkable source exists.

## Acceptance Criteria

- [ ] No visible navigation link points to a missing or unintended route.
- [ ] Desktop and mobile navigation derive from the same source.
- [ ] The shell exposes the intended maximal breadth rather than a six-link subset.
- [ ] `/admin/users` is the canonical Admin Users destination.

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