---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "iytz59uemsy9z3lo"
title: "maximal-template.hardened-architecture-claims.work-package"
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
createdAt: "2026-08-18T06:21:59.676Z"
updatedAt: "2026-08-18T06:21:59.676Z"
---

# Replace Architecture-Claimed with Architecture-Verified

**Priority:** P0  
**Phase:** Hardening  
**Task status:** Backlog

## Outcome

Make every security, generation, and architecture badge/claim correspond to fresh executable evidence in the hardened template.

## Why This Exists

The hardening backlog explicitly defines the final transition from the showroom’s illustrative architecture to a golden production template whose claims are true.

## Execution Checklist

- [ ] Map each public/runtime claim to its evidence source.
- [ ] Verify RLS with restricted-role cross-tenant tests.
- [ ] Verify ABAC through actual mutation paths.
- [ ] Verify webhook retry/idempotency behavior.
- [ ] Verify Clerk/auth/onboarding lifecycle.
- [ ] Verify generated recipe/provider inclusion against actual artifacts.
- [ ] Verify architecture import/boundary validators.
- [ ] Verify CI/build/test evidence on the release commit.
- [ ] Remove or qualify any claim whose evidence is missing.
- [ ] Record the verified commit and evidence matrix.

## Acceptance Criteria

- [ ] Every consequential runtime badge/claim has fresh evidence.
- [ ] No “should/configured” state is reported as passed.
- [ ] The release commit is tied to the evidence matrix.

## Dependencies

- [[maximal-template.proportional-ci.work-package]]
- [[maximal-template.production-route-access-semantics.work-pack]]
- [[maximal-template.production-integrations.work-package]]

## Source Basis

- `The Maximal Template™ Backlog.md`
- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]