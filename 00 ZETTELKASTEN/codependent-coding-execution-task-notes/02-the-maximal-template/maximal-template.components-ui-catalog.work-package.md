---
title: "Turn `/components` into the Actual Primitive and Block Catalog"
type: work-package
scope: project
project: "The Maximal Template"
domain: "showroom"
artifact: "components-ui-catalog"
kind: work-package
namespace: maximal-template.components-ui-catalog.work-package
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
