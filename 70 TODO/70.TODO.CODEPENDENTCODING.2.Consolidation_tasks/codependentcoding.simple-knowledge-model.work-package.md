---
pm-task: true
projectId: "klb30ky6lcbogzet"
parentId:
id: "cwz4l3c0iee3814s"
title: "Define the Simple knowledge model and Obsidian relationship semantics"
type: "task"
status: "todo"
priority: "high"
start: "2026-08-18"
due: ""
progress: 0
assignees: []
tags: ["codependent-coding", "consolidation"]
subtaskIds: []
dependencies: ["i42wstxptn680fly", "512mrcv0rfcvsz91"]
createdAt: "2026-08-18T18:23:00.000Z"
updatedAt: "2026-08-18T18:23:00.000Z"
---

# Define the Simple knowledge model and Obsidian relationship semantics

**Priority:** P0  
**Phase:** Simple Model

## Outcome

Make each Simple a first-class knowledge record for one real file, with typed metadata, canonical architectural contracts, implementation state, and machine-usable relationship rules.

## Checklist

- [ ] Define identity/location properties: ID/title/type, source path, canonical path, domain, layer/responsibility.
- [ ] Define architectural properties: responsibility, ownership, boundaries, contracts/interfaces, invariants, constraints, lifecycle/state, side effects, providers/integrations.
- [ ] Define uses/depends-on, required, permitted, conditional, prohibited, substitutes/variants, composes/composed-of, and responsibility-specific relations.
- [ ] Derive inverse relationships through backlinks/Dataview where feasible.
- [ ] Define reconciliation, approval, demo, hardened, generation-readiness, validation, and security-evidence states.
- [ ] Create/specify templates for legitimate Simple classes: Fetcher, Action, Workflow, Feature, Route, Template, Block, Primitive, Select, DTO Mapper, Transaction Helper, Auth/AuthZ, Integration, Webhook, Schema, Type, Config/Root Config, and justified additions.
- [ ] Use tags only for coarse discovery/faceting; keep semantic relationships in links/properties.
- [ ] Represent required, permitted, conditional, prohibited, and architecturally invalid composition as rules.

## Acceptance

- [ ] One property schema distinguishes scalar metadata, links/relationships, derived values, and tags.
- [ ] Every legitimate Simple class has a template or documented shared-template reason.
- [ ] Dataview/backlinks can expose inverse and transitive relationships.
- [ ] Owner approval remains the canonicalization gate.

## Dependencies

- [[codependentcoding.umbrella-product-reconciliation.work-package]]
- [[codependentcoding.source-intake-canonicalization-pipeline.work-package]]

Project: [[70.TODO.CODEPENDENTCODING.2.Consolidation|Codependent Coding Consolidation]]
