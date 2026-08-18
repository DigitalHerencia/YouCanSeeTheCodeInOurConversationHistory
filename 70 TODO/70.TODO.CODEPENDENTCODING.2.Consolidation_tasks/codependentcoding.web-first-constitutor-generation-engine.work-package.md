---
pm-task: true
projectId: "klb30ky6lcbogzet"
parentId:
id: "ls24rpbzu0a12o2k"
title: "Build the web-first Constitutor and shared generation engine"
type: "task"
status: "todo"
priority: "medium"
start: "2026-08-18"
due: ""
progress: 0
assignees: []
tags: ["codependent-coding", "consolidation"]
subtaskIds: []
dependencies: ["yrbq00vjopk5d8s7"]
createdAt: "2026-08-18T18:23:00.000Z"
updatedAt: "2026-08-18T18:23:00.000Z"
---

# Build the web-first Constitutor and shared generation engine

**Priority:** P1  
**Phase:** Constitutor

## Outcome

Build the whole-application Constitutor only after the hardened Simple catalog and constraint system are generation-ready, with a web-first path that produces a normal downloadable project zip without requiring GitHub authorization or terminal commands.

## Checklist

- [ ] Start from an Ontology/application recipe and derive relevant pages.
- [ ] Expose page presentation composition, compatible Blocks/Primitives/components, supported variants, semantic design tokens, product naming/copy, and other legitimate frontend choices.
- [ ] Derive Features, Workflows, Fetchers, Actions, Selects, DTOs, Transactions, Schemas, Auth/AuthZ, Integrations, Webhooks, and other backend Simples automatically.
- [ ] Reject unsupported compositions through the shared constraint model with actionable explanations.
- [ ] Reuse useful Codebase Context Utility patterns for project/file tree, source inspection, context/export, and structured output inspection.
- [ ] Do not build a giant freeform Figma/Webflow canvas.
- [ ] Generate from real source files plus structured metadata/transforms.
- [ ] Produce deterministic remote generation and a normal zip download with provenance for selected/derived/included/transformed/omitted artifacts.
- [ ] Keep one shared generation/resolution engine for web and automation.
- [ ] Retain an independent CLI only if its distribution boundary remains useful; if retained, make it a thin adapter over the same engine.
- [ ] Keep Loaded Vibes as the downstream agent/plugin knowledge layer rather than generator internals embedded in generated applications.

## Acceptance

- [ ] A supported application can be configured on the website and downloaded as a deterministic zip without GitHub authorization.
- [ ] Backend closure/validation comes from the canonical Simple/constraint model.
- [ ] The per-Simple workbench and whole-app Constitutor share semantics.
- [ ] Optional CLI behavior, if retained, uses the same engine.

## Dependencies

- [[codependentcoding.simple-catalog-composition-constraints.work-package]]

Project: [[70.TODO.CODEPENDENTCODING.2.Consolidation|Codependent Coding Consolidation]]
