---
title: "Run the Full Signed-Out Showroom Verification Pass"
type: work-package
scope: project
project: "The Maximal Template"
domain: "showroom"
artifact: "showroom-verification"
kind: work-package
namespace: maximal-template.showroom-verification.work-package
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
  - priority/p0
created: 2026-08-16
updated: 2026-08-16
priority: P0
task_status: backlog
phase: "Showroom"
---

# Run the Full Signed-Out Showroom Verification Pass

**Priority:** P0  
**Phase:** Showroom  
**Task status:** Backlog

## Outcome

Prove that the public demo is frictionless, navigable, responsive, truthful, and free of accidental auth/security failures.

## Why This Exists

Source-level checks did not catch the `/users` navigation defect, so the showroom requires real route/browser verification.

## Execution Checklist

- [ ] Crawl every public and application route while signed out.
- [ ] Exercise every header/sidebar/mobile navigation link.
- [ ] Exercise non-destructive interactive controls and demo mutation behavior.
- [ ] Verify no public flow unexpectedly redirects into Clerk.
- [ ] Check desktop and mobile layouts.
- [ ] Check browser console for errors/warnings that indicate broken behavior.
- [ ] Verify loading, empty, error, and populated states.
- [ ] Check architecture/security claims against observed showroom behavior.
- [ ] Run formatting, lint, typecheck, architecture validation, and production build as required by the repo.
- [ ] Record exact evidence and unresolved defects.

## Acceptance Criteria

- [ ] One URL provides complete signed-out exploration.
- [ ] All intended routes and controls work in supported viewports.
- [ ] No visible security claim exceeds verified behavior.
- [ ] Required static/build checks have fresh evidence.

## Dependencies

- None recorded.

## Source Basis

- `The Maximal Template™ Backlog.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
