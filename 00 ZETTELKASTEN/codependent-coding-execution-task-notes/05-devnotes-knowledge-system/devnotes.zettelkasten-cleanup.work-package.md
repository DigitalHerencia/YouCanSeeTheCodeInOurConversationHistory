---
title: "Clean the Zettelkasten After Promotion and Reconciliation"
type: work-package
scope: project
project: "DevNotes Knowledge System"
domain: "knowledge-migration"
artifact: "zettelkasten-cleanup"
kind: work-package
namespace: devnotes.zettelkasten-cleanup.work-package
status: active
authority: working-note
parent: "[[devnotes.execution.tasks.map]]"
depends_on:
  - "[[devnotes.vault-links-tags-properties.work-package]]"
  - "[[devnotes.provenance-preservation.work-package]]"
supersedes: []
tags:
  - projects/devnotes
  - work-package
  - work/backlog
  - priority/p1
created: 2026-08-16
updated: 2026-08-16
priority: P1
task_status: backlog
phase: "Knowledge Migration"
---

# Clean the Zettelkasten After Promotion and Reconciliation

**Priority:** P1  
**Phase:** Knowledge Migration  
**Task status:** Backlog

## Outcome

Return `00 ZETTELKASTEN` to an inbox/capture role once durable architecture and project materials have been processed.

## Why This Exists

The current Zettelkasten holds several large canonical-quality documents because the new direction was still being synthesized.

## Execution Checklist

- [ ] Confirm every processed architecture/product note has a durable destination or an explicit reason to remain a capture.
- [ ] Update `zettelkasten.map.md`.
- [ ] Remove duplicate canonical authority from inbox notes by moving or superseding rather than blind deletion.
- [ ] Keep genuinely unfinished captures in place.
- [ ] Verify no incoming links are broken by moves/renames.
- [ ] Run a final orphan/link/status review.
- [ ] Document the remaining Zettelkasten queue.

## Acceptance Criteria

- [ ] Zettelkasten contains unfinished captures rather than active canonical architecture.
- [ ] Processed notes have durable homes and preserved provenance.
- [ ] No important links are broken by cleanup.

## Dependencies

- [[devnotes.vault-links-tags-properties.work-package]]
- [[devnotes.provenance-preservation.work-package]]

## Source Basis

- 00 ZETTELKASTEN/*
- `zettelkasten.map.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
