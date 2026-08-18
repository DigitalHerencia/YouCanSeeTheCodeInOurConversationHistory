---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "lm8zwaowmsy9yw7r"
title: "loaded-vibes.security-review-skills.work-package"
type: "task"
status: "todo"
priority: "medium"
start: "2026-08-18"
due: ""
progress: 0
assignees: []
tags: []
subtaskIds: []
dependencies: []
createdAt: "2026-08-18T06:21:50.103Z"
updatedAt: "2026-08-18T06:21:50.103Z"
---

# Build Authz, Tenancy, Provider, and Security Review Skills

**Priority:** P0  
**Phase:** Review  
**Task status:** Backlog

## Outcome

Give Codex focused review procedures for consequential boundaries that cannot be trusted to generic code review alone.

## Why This Exists

The architecture and template backlog expose concrete failure classes: broad RBAC without ABAC, tenant relationship holes, RLS bypass, webhook retry defects, provider-boundary drift, and stale-cache decisions.

## Execution Checklist

- [ ] Auth/authz review: identity establishment, policy location, RBAC/ABAC, ownership/assignment, tenant scope.
- [ ] RLS review: runtime role, session context, policy coverage, owner/bypass separation.
- [ ] Cross-resource integrity review: foreign IDs and tenant/project/account relationship validation.
- [ ] Provider review: SDK placement, secrets, error translation, network/transaction boundary.
- [ ] Webhook review: signature verification, idempotency, retries, ordering, reconciliation truth.
- [ ] Cache review for security/payment/readiness decisions.
- [ ] Secret exposure review for client bundles, logs, issues, and generated files.
- [ ] Require concrete evidence and avoid claiming semantic guarantees a static review cannot prove.

## Acceptance Criteria

- [ ] Review skills target known architecture failure modes.
- [ ] Findings distinguish proven defects from unverifiable risk.
- [ ] No review skill weakens repository security controls to make checks pass.

## Dependencies

- [[loaded-vibes.governance-slices.work-package]]

## Source Basis

- `The Maximal Template™ Backlog.md`
- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]