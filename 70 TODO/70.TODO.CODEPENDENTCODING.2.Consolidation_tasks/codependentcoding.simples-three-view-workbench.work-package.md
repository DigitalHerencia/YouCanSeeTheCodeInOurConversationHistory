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
progress: 0
assignees: []
tags: ["codependent-coding", "consolidation"]
subtaskIds: []
dependencies: ["cwz4l3c0iee3814s", "i5tw3dd560kf8ngv"]
createdAt: "2026-08-18T18:23:00.000Z"
updatedAt: "2026-08-18T18:23:00.000Z"
---

# Build the unified Simples library and three-view workbench

**Priority:** P0  
**Phase:** Workbench

## Outcome

Turn the existing Simples/Libraries experience into the public interface for the canonical Simple model, with Architecture, Implementation, and Source as projections of one underlying record.

## Checklist

- [ ] Use the real repository responsibility taxonomy as the catalog spine.
- [ ] Architecture view exposes responsibility, contract, invariants, boundaries, anti-patterns, lifecycle/side effects, and relationship constraints.
- [ ] Implementation view exposes meaningful controls over real properties, variants, constraints, and compatible composition choices.
- [ ] Replace static relationship cards with compact inspectable/selectable controls where real consequences exist.
- [ ] Source view shows real hardened canonical and demo/showcase code with path/tree context, highlighting, copy behavior, and explicit state distinctions.
- [ ] Use the TanStack Router example as interaction/information-density inspiration without cloning its branding or structure.
- [ ] Adopt Monaco only if it materially improves the workbench and is explicitly introduced/owned.
- [ ] Update displayed source/consequences only for real supported transforms.

## Acceptance

- [ ] One Simple page exposes Architecture / Implementation / Source from one canonical model.
- [ ] Static status/relationship cards are replaced by meaningful surfaces where supported.
- [ ] Source is real code, not code-shaped marketing text.
- [ ] No duplicate docs/configuration rules engine exists.

## Dependencies

- [[codependentcoding.simple-knowledge-model.work-package]]
- [[codependentcoding.single-app-context-utility-consolidation.work-package]]

Project: [[70.TODO.CODEPENDENTCODING.2.Consolidation|Codependent Coding Consolidation]]
