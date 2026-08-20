---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "zjeizzonmsy9z28n"
title: "maximal-template.production-route-access-semantics.work-package"
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
createdAt: "2026-08-18T06:21:57.911Z"
updatedAt: "2026-08-18T06:21:57.911Z"
---

# Restore Production Route and Access Semantics

**Priority:** P1  
**Phase:** Hardening  
**Task status:** Backlog

## Outcome

Replace deliberate showroom openness with real generated-application authentication, onboarding, tenant context, and privilege boundaries.

## Why This Exists

The public demo intentionally leaves application browsing open; the generated template must establish actual access semantics while keeping public/auth routes public.

## Execution Checklist

- [ ] Define public, auth, onboarding, application, admin, portal/shared, and provider route categories.
- [ ] Establish identity and tenant context on protected application routes.
- [ ] Require authentication for protected mutations.
- [ ] Enforce admin privileges at both route/capability and resource boundaries as appropriate.
- [ ] Implement real onboarding transitions and membership readiness.
- [ ] Preserve application-owned tenancy rather than delegating domain organizations to Clerk.
- [ ] Keep public marketing/product pages accessible.
- [ ] Test signed-out, member, privileged, and unauthorized flows.

## Acceptance Criteria

- [ ] Generated application routes follow the intended access model.
- [ ] Public/auth routes remain public.
- [ ] Protected surfaces establish real identity/tenant context.
- [ ] Admin/portal boundaries are test-proven.

## Dependencies

- None recorded.

## Source Basis

- `The Maximal Template™ Backlog.md`
- `The Maximal Template™ Demo Doctrine.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]