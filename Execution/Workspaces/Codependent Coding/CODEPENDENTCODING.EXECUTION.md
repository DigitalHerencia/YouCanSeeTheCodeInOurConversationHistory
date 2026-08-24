---
title: Codependent Coding™ Execution
type: execution-plan
project: Codependent Coding
status: active
authority: canonical
updated: 2026-08-20
role: execution
system: codependent-coding
workspace: codependent-coding
tags: []
---

# Codependent Coding™ Execution

The Project Manager board [[Codependent Coding]] is the human interface. This note explains the order and the reason for it.

## Current position

```text
Product topology / architecture      substantially decided
DevNotes project consolidation       substantially complete
First source-backed Simples          present
Database reference knowledge slice   present
Workbench contract                    present

NEXT → physical CodependentCoding repository consolidation
```

## Ordered execution

```text
1. Lock Canon + Governance
          ↓
2. Consolidate CodependentCoding repository
          ↓
3. Canonicalize Simples from Ontologies
          ↓
4. Implement Simples Workbench + Database proof
          ↓
5. Complete Maximal Template + Public Demo
          ↓
6. Harden Maximal Template + classify generation surface
          ↓
7. Finish Virgule + Hipster Stack CLI + Anthimeria
          ↓
8. Build Loaded Vibes Codex Plugin
          ↓
9. Finish public docs + independent verification + release handoff
```

## Why this order

- Do not build deeper workbench/UI into the old `TheHipsterStack/apps/web` topology when `CodependentCoding` is supposed to own the application.
- Prove the Simple model with Database before trying to canonicalize the entire Maximal Template blindly.
- Complete and harden real source before treating the generation catalog as authoritative.
- Build Anthimeria and CLI over the same trusted Virgule schema/resolver; do not create parallel semantics.
- Loaded Vibes consumes the architecture; it does not define it.

## Source roles

| Source | Role |
| --- | --- |
| Role `Workspaces/Codependent Coding/` | Current architecture, project planning, implementation, and evidence. |
| `Execution/Workspaces/Codependent Coding/...Simples` | Source-backed knowledge records and workbench model. |
| `_mounts/CodependentCoding` | Live source access through Code Space. |
| [[codependent-coding.project-management.dashboard]] | Current project sequencing, Kanban, agenda, and calendar. |
| Role `Canon/Codependent Coding/` | Durable knowledge and doctrine. |
| Actual GitHub/local repositories | Source of truth for what is really implemented now. |

## Delegation rule

Codex receives **one work-package goal at a time** plus this project context. It may break that goal into internal steps, but it should not jump ahead into later product phases merely because related code is nearby.
