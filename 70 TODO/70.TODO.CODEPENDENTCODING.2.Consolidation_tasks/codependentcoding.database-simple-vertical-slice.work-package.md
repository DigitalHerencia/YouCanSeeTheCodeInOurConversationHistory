---
pm-task: true
projectId: "klb30ky6lcbogzet"
parentId:
id: "ti7yewh8watst7ue"
title: "Use Database as the first end-to-end Simple vertical slice"
type: "task"
status: "todo"
priority: "high"
start: "2026-08-18"
due: ""
progress: 0
assignees: []
tags: ["codependent-coding", "consolidation"]
subtaskIds: []
dependencies: ["5uhjxrd0yyhralze"]
createdAt: "2026-08-18T18:23:00.000Z"
updatedAt: "2026-08-18T18:23:00.000Z"
---

# Use Database as the first end-to-end Simple vertical slice

**Priority:** P0  
**Phase:** Workbench

## Outcome

Use the existing Database Simple page to prove the full model/workbench/canonicalization loop before converting the broader catalog.

## Checklist

- [ ] Replace the large `Included / Fixed foundation` card with a real code/source surface.
- [ ] Use a TanStack-inspired composition with compact file/path context, code viewer, and inspectable implementation controls.
- [ ] Convert Related Simples / Works With cards into relationship controls that explain the relation and consequences.
- [ ] Expose only real supported implementation/configuration choices; no fake toggles.
- [ ] Show source/configuration consequences when a supported control changes.
- [ ] Represent Postgres, Prisma, tenant containment/RLS, Organizations, RBAC, Billing/Auth relationships through the canonical Simple model.
- [ ] Show hardened canonical code separately from demo/showcase code where they differ.
- [ ] Capture the reconciliation/canonicalization procedure as the repeatable Simple workflow.

## Acceptance

- [ ] The Database page no longer uses the decorative fixed-status card as primary content.
- [ ] Users can inspect real code and relationship/configuration consequences.
- [ ] At least one real supported control demonstrates a visible consequence when applicable.
- [ ] The page uses the shared Simple model rather than Database-specific rules.

## Dependencies

- [[codependentcoding.simples-three-view-workbench.work-package]]

Project: [[70.TODO.CODEPENDENTCODING.2.Consolidation|Codependent Coding Consolidation]]
