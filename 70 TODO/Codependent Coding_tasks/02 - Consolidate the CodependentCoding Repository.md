---
pm-task: true
projectId: "klb30ky6lcbogzet"
parentId:
id: "512mrcv0rfcvsz91"
title: "Consolidate the CodependentCoding Repository"
type: "task"
status: "todo"
priority: "high"
start: "2026-08-20"
due: ""
progress: 10
assignees: []
tags: ["codependent-coding", "repository", "consolidation"]
subtaskIds: []
dependencies: ["i42wstxptn680fly"]
createdAt: "2026-08-18T18:23:00.000Z"
updatedAt: "2026-08-20T08:48:00.000Z"
---

# Consolidate the CodependentCoding Repository

## Outcome

Make `DigitalHerencia/CodependentCoding` the single executable Codependent Coding repository using the current Hipster Stack website as the application foundation.

## Known current state

- `CodependentCoding` is still the older knowledge-system repository and has no root Next.js app.
- `TheHipsterStack` still owns the current website under `apps/web` plus `packages/cli`, `packages/core`, and `packages/schema` candidates.
- The physical source migration has not happened yet.

## Checklist

- [x] Inspect the actual repositories and document the migration sequence.
- [ ] Reconcile root repository governance/AGENTS with the umbrella-product direction.
- [ ] Rehome the existing Hipster Stack website into one root `app/` application.
- [ ] Preserve existing visual/site work instead of redesigning during migration.
- [ ] Keep only package boundaries justified by shared ownership or distribution.
- [ ] No `src/`; no permanent `apps/web` wrapper; no fake packages.
- [ ] Preserve useful Codebase Context Utility explorer/source-inspection behavior without creating another app or rules engine.
- [ ] Keep the old source repositories intact until the consolidated app is verified.
- [ ] Run the real install/format/typecheck/lint/build/tests that apply.

## Acceptance

`DigitalHerencia/CodependentCoding` is a coherent runnable root application with intentional shared packages and no regression of the current public site.

## Handoff

Use [[10 PROJECTS/10.PROJECTS.CODEPENDENTCODING/CODEPENDENTCODING.CODEX-HANDOFF|CODEPENDENTCODING.CODEX-HANDOFF]].
