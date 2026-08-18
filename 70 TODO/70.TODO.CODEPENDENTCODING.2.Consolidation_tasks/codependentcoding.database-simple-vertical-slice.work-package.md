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
progress: 40
assignees: []
tags: ["codependent-coding", "consolidation"]
subtaskIds: []
dependencies: ["5uhjxrd0yyhralze"]
createdAt: "2026-08-18T18:23:00.000Z"
updatedAt: "2026-08-18T20:09:00.000Z"
---

# Use Database as the first end-to-end Simple vertical slice

**Priority:** P0  
**Phase:** Workbench

## Outcome

Use the existing Database Simple page to prove the full model/workbench/canonicalization loop before converting the broader catalog.

## Current Knowledge-Layer Progress

- [x] Created [[codependentcoding.simples.database.map|Database Library Map]].
- [x] Instantiated eleven real file-level records across Database, Auth, Fetchers, Selects, DTO, Transactions, Prisma, Config, and Types.
- [x] Linked the records to their generated Source Mirror and governing Codependent Coding knowledge.
- [x] Added separate **Public Demo Golden Prototype**, **Hardened Golden Prototype**, and **Hardening Delta** sections.
- [x] Encoded required/permitted/conditional/prohibited relationships and Dataview/backlink surfaces.
- [x] Captured the public-demo identity vs authenticated generated-template boundary.
- [x] Captured the privileged migration credential vs restricted runtime-role RLS boundary.
- [x] Modeled a real end-to-end persisted read chain: Clerk identity → tenant transaction → tenant-context/RLS → Projects fetcher → Prisma select → DTO mapper.
- [x] Established the first real source consequence: `withTemplateReadTransaction` vs proposed hardened `withAuthenticatedTenantTransaction`.
- [x] Defined the Database UI projection in [[codependentcoding.simples.workbench.contract]].
- [ ] Owner canonicalization approval remains pending.
- [ ] Website workbench projection has not been implemented yet.

## Checklist

- [ ] Replace the large `Included / Fixed foundation` card with a real code/source surface.
- [x] Define the TanStack-inspired composition with compact file/path context, code viewer, and inspectable implementation controls.
- [x] Define the semantic replacement for Related Simples / Works With cards.
- [x] Expose only real supported implementation/configuration choices in the model; no fake security toggles.
- [x] Identify a real source/configuration consequence when a supported view changes.
- [x] Represent Postgres, Prisma, tenant containment/RLS, and Auth relationships through the canonical Simple model; remaining cross-library relationships expand as their child Simples are canonicalized.
- [x] Show hardened canonical code separately from demo/showcase code where they differ in the knowledge model.
- [x] Capture the reconciliation/canonicalization procedure as [[codependentcoding.simples.canonicalization.workflow]].

## Acceptance

- [ ] The Database page no longer uses the decorative fixed-status card as primary content.
- [ ] Users can inspect real code and relationship/configuration consequences on the deployed site.
- [ ] At least one real supported control demonstrates a visible consequence on the deployed site.
- [ ] The deployed page uses the shared Simple model rather than Database-specific rules.

## Dependencies

- [[codependentcoding.simples-three-view-workbench.work-package]]

## Working Set

### Library / Workflow

- [[codependentcoding.simples.database.map]]
- [[codependentcoding.simples.canonicalization.workflow]]
- [[codependentcoding.simples.workbench.contract]]
- [[codependentcoding.simples.dashboard]]

### File-Level Simples

- [[codependentcoding.database.client.simple]]
- [[codependentcoding.database.tenant.simple]]
- [[codependentcoding.database.provider.simple]]
- [[codependentcoding.transactions.tenant-context.simple]]
- [[codependentcoding.prisma.application-owned-tenancy.simple]]
- [[codependentcoding.config.prisma.simple]]
- [[codependentcoding.types.access.simple]]
- [[codependentcoding.auth.identity.simple]]
- [[codependentcoding.fetchers.projects.simple]]
- [[codependentcoding.selects.projects.simple]]
- [[codependentcoding.dto.projects.simple]]

Project: [[70.TODO.CODEPENDENTCODING.2.Consolidation|Codependent Coding Consolidation]]
