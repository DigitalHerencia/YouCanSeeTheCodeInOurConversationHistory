---
pm-task: true
projectId: "klb30ky6lcbogzet"
parentId:
id: "i5tw3dd560kf8ngv"
title: "Establish the single-app foundation and absorb Codebase Context Utility capabilities"
type: "task"
status: "todo"
priority: "high"
start: "2026-08-18"
due: ""
progress: 10
assignees: []
tags: ["codependent-coding", "consolidation"]
subtaskIds: []
dependencies: ["i42wstxptn680fly", "512mrcv0rfcvsz91"]
createdAt: "2026-08-18T18:23:00.000Z"
updatedAt: "2026-08-18T20:13:00.000Z"
---

# Establish the single-app foundation and absorb Codebase Context Utility capabilities

**Priority:** P0  
**Phase:** App Foundation

## Outcome

Create the consolidated Codependent Coding application using the current Hipster Stack website as the foundation while folding in useful Codebase Context Utility capabilities rather than maintaining another application.

## Current-State Analysis

- [x] Inspected the actual `DigitalHerencia/CodependentCoding` root: it is still the older documentation/knowledge-system repository shape with `.agents`, `.github`, `docs`, `patterns`, `provenance`, README/MANIFEST/AGENTS and no root Next.js application.
- [x] Confirmed the current CodependentCoding `AGENTS.md` still says the written knowledge system is the product; this conflicts with the approved umbrella-application direction and must be reconciled during migration.
- [x] Inspected `DigitalHerencia/TheHipsterStack`: it is currently a pnpm workspace combining a publishable CLI root, `apps/web`, and `packages/*`.
- [x] Confirmed `apps/web` is the actual website foundation and is already shallow: `app/`, `components/`, `features/`, `lib/` plus root web configs.
- [x] Confirmed `apps/web` currently depends on `@hipster-stack/core` via `workspace:*`; package boundaries therefore need ownership review rather than mechanical deletion.
- [x] Inspected Codebase Context Utility's file tree and preview implementation; useful explorer/file-state behavior exists, while Monaco remains new work.
- [x] Prepared [[70.TODO.CODEPENDENTCODING.2.Codex-Handoff|Codex Consolidation Handoff]] with the exact next-run sequence and stop conditions.
- [ ] No repository source migration has been performed yet.

## Checklist

- [ ] Migrate toward one Next.js application with one root `app/`, no `src/`, and no permanent `apps/web` wrapper.
- [ ] Preserve valid Hipster Stack visual/presentation work.
- [ ] Rehome useful context-utility ingestion, file-tree, context export, code analysis, dependency inspection, and architecture-summary capabilities.
- [ ] Refactor/retire obsolete utility code instead of copying the old app wholesale.
- [ ] Do not create a second Simple model or rules engine.
- [ ] Keep Maximal Template implementation as real source files, not source serialized into JSON/YAML.
- [x] Treat Monaco as new deliberate work if adopted; the current utility does not include Monaco.
- [ ] Keep source repositories intact until the consolidated app is verified.

## Acceptance

- [ ] Codependent Coding has one coherent application topology.
- [ ] Hipster Stack website work is the runtime/visual foundation rather than a competing site.
- [ ] Useful context-utility capabilities have explicit owners.

## Dependencies

- [[codependentcoding.umbrella-product-reconciliation.work-package]]
- [[codependentcoding.source-intake-canonicalization-pipeline.work-package]]

## Execution Handoff

- [[70.TODO.CODEPENDENTCODING.2.Codex-Handoff]]

Project: [[70.TODO.CODEPENDENTCODING.2.Consolidation|Codependent Coding Consolidation]]
