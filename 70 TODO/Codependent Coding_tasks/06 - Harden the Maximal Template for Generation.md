---
pm-task: true
projectId: "klb30ky6lcbogzet"
parentId:
id: "ti7yewh8watst7ue"
title: "Harden the Maximal Template for Generation"
type: "task"
status: "todo"
priority: "critical"
start: ""
due: ""
progress: 10
assignees: []
tags: ["codependent-coding", "maximal-template", "hardening", "generation"]
subtaskIds: []
dependencies: ["5uhjxrd0yyhralze"]
createdAt: "2026-08-18T18:23:00.000Z"
updatedAt: "2026-08-20T08:48:00.000Z"
---

# Harden the Maximal Template for Generation

## Outcome

Derive and verify the production/hardened edition from the public showroom without confusing demo shortcuts with production security.

## Known hardening backlog

- [ ] Replace seeded/demo tenant reads with authenticated application-tenant context.
- [ ] Use a restricted runtime database role; prove RLS with cross-tenant tests.
- [ ] Complete action-level authorization/ABAC where current actions are broad.
- [ ] Enforce cross-resource tenant integrity.
- [ ] Correct webhook idempotency/retry lifecycle.
- [ ] Make human-readable sequences concurrency safe.
- [ ] Make usage/rate-limit accounting atomic where required.
- [ ] Add tests around the actual security and lifecycle boundaries.
- [ ] Add only proportional CI needed to prove the template.
- [ ] Restore production route/access semantics and verify supported providers.
- [ ] Record Public Demo ↔ Hardened deltas back into the affected Simples.

## Acceptance

The hardened source earns the security/production claims made for generated applications and the generation catalog can distinguish invariant, derived, selectable, and presentation-configurable material.
