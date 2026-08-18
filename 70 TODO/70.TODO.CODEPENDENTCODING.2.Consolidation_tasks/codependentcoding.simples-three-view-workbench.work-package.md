---
pm-task: true
projectId: "klb30ky6lcbogzet"
parentId:
id: "5uhjxrd0yyhralze"
title: "Build the unified Simples library and three-view workbench"
type: "task"
status: "todo"
priority: "high"
start: "2026-08-18"
due: ""
progress: 15
assignees: []
tags: ["codependent-coding", "consolidation"]
subtaskIds: []
dependencies: ["cwz4l3c0iee3814s", "i5tw3dd560kf8ngv"]
createdAt: "2026-08-18T18:23:00.000Z"
updatedAt: "2026-08-18T20:08:00.000Z"
---

# Build the unified Simples library and three-view workbench

**Priority:** P0  
**Phase:** Workbench

## Outcome

Turn the existing Simples/Libraries experience into the public interface for the canonical Simple model, with Architecture, Implementation, and Source as projections of one underlying record.

## Current Design Progress

- [x] Defined [[codependentcoding.simples.workbench.contract|Simple Workbench Contract]].
- [x] Grounded the contract in the current `libraries.ts`, `LibraryDetail`, Docs route, and Constituter source mirrors.
- [x] Inspected Codebase Context Utility's actual `file-tree.tsx` and `code-preview.tsx` reuse boundary.
- [x] Recorded that Codebase Context Utility's current preview is `<pre><code>`; Monaco is a deliberate **new** integration.
- [x] Defined the TanStack-inspired file-explorer + central-source layout without copying TanStack branding/structure.
- [x] Defined the semantic replacement for `Related Simples` / `Works With`: uses, requires, permitted, conditional, prohibited, used-by, Ontologies.
- [x] Identified the first real source-consequence control: Projects Fetcher public showroom vs hardened tenant adapter.
- [ ] Website implementation has not started.

## Checklist

- [x] Use the real repository responsibility taxonomy as the catalog spine in the workbench contract.
- [x] Architecture view contract exposes responsibility, contract, invariants, boundaries, anti-patterns, lifecycle/side effects, and relationship constraints.
- [x] Implementation view contract exposes meaningful controls over real properties, variants, constraints, and compatible composition choices.
- [x] Replace static relationship cards conceptually with compact semantic relationship controls.
- [x] Source view contract shows real hardened canonical and demo/showcase code with path/tree context, highlighting, copy behavior, and explicit state distinctions.
- [x] Use the TanStack Router example as interaction/information-density inspiration without cloning its branding or structure.
- [x] Adopt Monaco as an explicitly introduced/owned source-view integration in the contract.
- [x] Update displayed source/consequences only for real supported transforms in the contract.
- [ ] Implement the contract in the consolidated application.

## Acceptance

- [ ] One Simple page exposes Architecture / Implementation / Source from one canonical model.
- [ ] Static status/relationship cards are replaced by meaningful surfaces where supported.
- [ ] Source is real code, not code-shaped marketing text.
- [ ] No duplicate docs/configuration rules engine exists.

## Dependencies

- [[codependentcoding.simple-knowledge-model.work-package]]
- [[codependentcoding.single-app-context-utility-consolidation.work-package]]

## Working Documents

- [[codependentcoding.simples.workbench.contract]]
- [[codependentcoding.simples.canonicalization.workflow]]
- [[codependentcoding.simples.dashboard]]
- [[codependentcoding.simples.database.map]]

Project: [[70.TODO.CODEPENDENTCODING.2.Consolidation|Codependent Coding Consolidation]]
