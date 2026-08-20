---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "l91vr11hmsy9z5jm"
title: "maximal-template.components-ui-catalog.work-package"
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
createdAt: "2026-08-18T06:22:02.194Z"
updatedAt: "2026-08-18T06:22:02.194Z"
---

# Turn `/components` into the Actual Primitive and Block Catalog

**Priority:** P1  
**Phase:** Showroom  
**Task status:** Backlog

## Outcome

Make the component route visibly demonstrate the reusable presentation system instead of merely describing it.

## Why This Exists

The backlog notes the repository already contains tables, metrics, kanban, timeline, split-pane, vault, media, chat, audit, and empty-state components that the current catalog does not expose.

## Execution Checklist

- [ ] Inventory actual supported `components/ui` primitives and grouped block variants.
- [ ] Create navigation/filtering by primitive/block category.
- [ ] Render real primitive states and variants.
- [ ] Render marketing/public block variants.
- [ ] Render application blocks: tables, metrics, kanban, timeline, split pane, file vault, media library, chat, audit log, settings, onboarding, invoice, empty/error/loading states.
- [ ] Demonstrate the primitive → block relationship visually.
- [ ] Keep catalog data static/presentational unless a demo interaction truly requires client state.
- [ ] Ensure the static public page composes blocks rather than arbitrary raw primitives at route level.

## Acceptance Criteria

- [ ] The catalog reflects the actual supported presentation library.
- [ ] Every major reusable block family has at least one visible example.
- [ ] Variants are rendered, not just named.
- [ ] The page follows the architecture it documents.

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