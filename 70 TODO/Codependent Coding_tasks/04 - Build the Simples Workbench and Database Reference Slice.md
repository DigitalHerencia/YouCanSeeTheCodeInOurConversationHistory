---
pm-task: true
projectId: "klb30ky6lcbogzet"
parentId:
id: "i5tw3dd560kf8ngv"
title: "Build the Simples Workbench and Database Reference Slice"
type: "task"
status: "todo"
priority: "high"
start: ""
due: ""
progress: 15
assignees: []
tags: ["codependent-coding", "simples", "workbench", "database"]
subtaskIds: []
dependencies: ["512mrcv0rfcvsz91", "cwz4l3c0iee3814s"]
createdAt: "2026-08-18T18:23:00.000Z"
updatedAt: "2026-08-20T08:48:00.000Z"
---

# Build the Simples Workbench and Database Reference Slice

## Outcome

Replace the old static Libraries-page model with one source-backed Simple workbench using Database as the first complete vertical slice.

## Contract

Each Simple exposes three projections of one record:

1. **Architecture** — responsibility, invariants, boundaries, relationships, consequences.
2. **Implementation** — public/hardened behavior and Hardening Delta.
3. **Source** — the real source file, read-only.

## Checklist

- [ ] Explorer/navigation over the Simple catalog.
- [ ] Architecture / Implementation / Source tabs.
- [ ] Public / Hardened source selection where a real edition difference exists.
- [ ] Relationship views for uses/requires/permitted/conditional/prohibited/used-by/Ontologies.
- [ ] Database first slice proves tenant transaction → fetcher → select → DTO behavior.
- [ ] Do not expose authentication, tenant isolation, authorization, or RLS as optional checkboxes.
- [ ] Monaco is deliberate new work if adopted; do not claim the old Context Utility already contained it.

## Acceptance

The Database slice is rendered from the same Simple knowledge model that later feeds documentation and generation; no second catalog is invented in the UI.
