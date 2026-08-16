---
title: "Implement Mechanical Architecture Validators"
type: work-package
scope: project
project: "Loaded Vibes Codex Plugin"
domain: "validation"
artifact: "architecture-validators"
kind: work-package
namespace: loaded-vibes.architecture-validators.work-package
status: active
authority: working-note
parent: "[[loaded-vibes.execution.tasks.map]]"
depends_on:
  - "[[loaded-vibes.governance-slices.work-package]]"
supersedes: []
tags:
  - projects/loaded-vibes
  - work-package
  - work/backlog
  - priority/p0
created: 2026-08-16
updated: 2026-08-16
priority: P0
task_status: backlog
phase: "Validation"
---

# Implement Mechanical Architecture Validators

**Priority:** P0  
**Phase:** Validation  
**Task status:** Backlog

## Outcome

Enforce stable architecture boundaries mechanically where reliable checks are possible.

## Why This Exists

The master explicitly lists illegal Prisma placement, feature→primitive exceptions, block purity, provider SDK boundaries, reads outside fetchers, client/server violations, structure, and required files as validator targets.

## Execution Checklist

- [ ] Implement import/path rule for Prisma/database client usage.
- [ ] Implement normal feature → `components/ui` prohibition with explicit form-feature exception.
- [ ] Implement block prohibition on server/database/provider/authz imports.
- [ ] Implement persisted-read placement checks where statically reliable.
- [ ] Implement provider SDK placement rules, including Clerk/Neon/Prisma special ownership.
- [ ] Implement server-only/client import boundary checks.
- [ ] Validate expected Ordinary Object root/application structure.
- [ ] Validate required architecture/config files.
- [ ] Detect generator-only metadata accidentally copied into generated apps.
- [ ] Produce precise file/line evidence and remediation guidance.
- [ ] Clearly label semantic rules that cannot be proven mechanically.

## Acceptance Criteria

- [ ] Validators fail on known architecture violations and pass known-conformant fixtures.
- [ ] False claims of semantic assurance are avoided.
- [ ] Rules are traceable to the layer-contract matrix.

## Dependencies

- [[loaded-vibes.governance-slices.work-package]]

## Source Basis

- `codependentcoding.webapp-architecture.master.source-document.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.
