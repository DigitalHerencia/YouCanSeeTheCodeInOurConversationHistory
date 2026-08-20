---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "yjd0l0o7msy9z42h"
title: "maximal-template.production-integrations.work-package"
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
createdAt: "2026-08-18T06:22:00.281Z"
updatedAt: "2026-08-18T06:22:00.281Z"
---

# Verify and Classify Provider Integrations as Real Capabilities

**Priority:** P2  
**Phase:** Hardening  
**Task status:** Backlog

## Outcome

Ensure every provider advertised by the hardened template is either operational, correctly scaffolded as optional, or excluded by configuration.

## Why This Exists

The intended provider set includes Clerk, Neon, Prisma, Stripe, Hugging Face, SendGrid, Cloudinary, and Vercel Blob, but documentation must not present scaffolding as configured runtime truth.

## Execution Checklist

- [ ] Inventory the actual implementation status of each intended provider.
- [ ] Classify each as required operational foundation, optional operational capability, scaffolded-only capability, or unsupported/not selectable.
- [ ] Verify provider SDK imports remain in their canonical boundaries.
- [ ] Verify required webhook/signature handling where applicable.
- [ ] Verify environment-variable contracts and `.env.example` entries without secrets.
- [ ] Verify provider-specific error translation and retry semantics where required.
- [ ] Update Simples/config catalog so unsupported providers cannot be selected.
- [ ] Add focused smoke/integration tests appropriate to each shipped capability.

## Acceptance Criteria

- [ ] Every advertised provider status is truthful.
- [ ] Unsupported/scaffold-only providers are not labeled configured.
- [ ] Provider boundaries conform to architecture.
- [ ] Generator selection matches implementation truth.

## Dependencies

- None recorded.

## Source Basis

- `The Maximal Template™ Backlog.md`
- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]