---
title: Codependent Coding™ Codex Handoff
type: handoff
project: Codependent Coding
status: active
authority: execution
updated: 2026-08-20
---

# Codependent Coding™ Codex Handoff

## Read first

1. [[README]]
2. [[CODEPENDENTCODING.TERMINOLOGY]]
3. [[CODEPENDENTCODING.GOVERNANCE]]
4. [[CODEPENDENTCODING.EXECUTION]]
5. The current Project Manager task being executed.
6. Relevant master architecture / Simples / Source Mirror evidence.
7. Actual repository-local instructions and current source state.

## Immediate engineering goal

**Consolidate `DigitalHerencia/CodependentCoding` into the single executable Codependent Coding application before implementing deeper Simple Workbench UI.**

### Current observed repository state

- `DigitalHerencia/CodependentCoding` is still the older knowledge-system repository with `.agents`, `.github`, `AGENTS.md`, `MANIFEST.md`, `README.md`, `docs/`, `patterns/`, and `provenance/`; it has no root Next.js `app/`.
- `DigitalHerencia/TheHipsterStack` still owns the current website under `apps/web` and the package candidates under `packages/*`.
- `DigitalHerencia/TheMaximalTemplate` remains a separate real application source repository.
- The DevNotes Source Mirror expresses the intended semantic topology but is not evidence that those repositories have already been physically merged.

## Target topology

```text
CodependentCoding/
├── app/
├── components/
├── features/
├── lib/
├── public/
├── docs/                 # only where actually needed
├── packages/             # only genuine shared/distributed boundaries
├── tests/                # only justified tests
├── package.json
└── root configuration
```

Hard rules:

- one Next.js application;
- one root `app/`;
- no `src/`;
- no permanent `apps/web` wrapper;
- no monorepo/package ceremony without a real ownership reason;
- do not duplicate `@hipster-stack/core` merely to remove a workspace import—decide its ownership from actual consumers;
- preserve the existing Hipster Stack website rather than redesigning during migration;
- preserve useful Context Utility file-tree/source-inspection capabilities, but do not create another app or Simple model;
- keep source repositories intact until the consolidated target is verified.

## Bounded sequence

1. Inspect current branches, repository instructions, package manifests, imports, and build gates.
2. Reconcile `CodependentCoding` governance from “written knowledge system is the product” to the umbrella application direction while preserving useful doctrine/provenance.
3. Rehome the current Hipster Stack website to the target root topology.
4. Preserve genuine shared/distribution packages intentionally; eliminate only obsolete topology.
5. Resolve imports/configuration without duplicating shared engine code.
6. Preserve public landing, docs, Simples/Libraries ancestry, configuration surfaces, and Visual Vibes presentation already worth keeping.
7. Install and run the repository's real format/typecheck/lint/build/tests as applicable.
8. Verify the application actually runs.
9. Stop and hand back evidence before beginning the Database Workbench implementation unless the assigned goal explicitly includes the next phase.

## Next goal after consolidation

Implement the source-backed Simples Workbench contract using Database as the first end-to-end slice. The existing Simple records already distinguish public showroom code from proposed hardened code; do not replace that model with a second catalog.

## Completion report

Report:

- actual files/topology changed;
- package-boundary decisions and evidence;
- gates run and results;
- unresolved blockers or architecture questions;
- exact next task from [[Codependent Coding]].
