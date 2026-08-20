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

## Codex Goal Prompts

Use **one** goal at a time. Codex should read the project README, terminology, governance, execution plan, the corresponding Project Manager task, relevant evidence, and repository-local instructions before acting.

### Goal 1 — Close the canon

> In `DigitalHerencia/DevNotes`, execute **Task 01 — Lock the Canon and Governance**. Propagate the canonical branded vocabulary and Workflow Constitution Correction through the active master architecture and current supporting architecture docs without rewriting historical provenance or Source Mirror evidence. Recheck the active architecture set for remaining current contradictions, update the task from actual evidence, and stop with a concise handoff.

### Goal 2 — Consolidate the repository

> Execute **Task 02 — Consolidate the CodependentCoding Repository**. Inspect the actual `CodependentCoding` and `TheHipsterStack` repositories, then make `CodependentCoding` the single executable root application using the existing Hipster Stack website as the foundation. Preserve only genuine shared/distributed package boundaries, preserve useful doctrine/provenance and current site behavior, run the real engineering gates, verify the app runs, and stop before deeper Simple Workbench implementation.

### Goal 3 — Canonicalize Simples

> Execute **Task 03 — Canonicalize Simples from the Ontology Master List**. Use `Ontologies.md` as the coverage inventory and the existing Database/read-path Simple records as the model. Work in dependency-closed batches of real supported source units. For each Simple, produce architecture knowledge, technical implementation, Public Demo source, Hardened source, Hardening Delta, relationships, generation disposition, and evidence/approval state. Do not invent implementation for inventory entries that remain stubs.

### Goal 4 — Build the Database Workbench proof

> Execute **Task 04 — Build the Simples Workbench and Database Reference Slice** in the consolidated CodependentCoding application. Implement Architecture / Implementation / Source as projections of the same Simple model, expose real relationships and Public/Hardened source differences, use Database as the first complete slice, and do not create a second catalog or optional security toggles. Verify the real UI and build gates before handoff.

### Goal 5 — Complete the public Maximal Template

> Execute **Task 05 — Complete the Maximal Template and Public Demo**. Use the actual Maximal Template repository and its canonical backlog. Complete supported Ontology surfaces and missing implementation-backed stubs, make the showroom exploration-first and populated, remove accidental auth gating/mutation failures, keep architecture/security claims evidence-based, verify the public route/UI surface, and record affected Simple evidence.

### Goal 6 — Harden the Maximal Template

> Execute **Task 06 — Harden the Maximal Template for Generation**. Derive the hardened edition from the verified public showroom, close the known tenant/RLS/authz/webhook/concurrency/security-test gaps, keep provider/network work outside DB transactions, add only proportional verification, and write Public Demo ↔ Hardened deltas back to affected Simples. Do not claim production/security properties without executed evidence.

### Goal 7 — Finish Virgule, Hipster Stack, and Anthimeria

> Execute **Task 07 — Finish The Virgule™, Hipster Stack™ CLI, and The Anthimeria™ Workbench**. Implement one portable Virgule recipe/schema and one deterministic normalization/resolution/materialization engine shared by Anthimeria and CLI. Use real Maximal Template source plus implementation-backed Simple metadata, preserve dependency/provenance explanations, prove deterministic generation, and verify the resulting Arrangement™ is standalone and runnable.

### Goal 8 — Build Loaded Vibes

> Execute **Task 08 — Build The Loaded Vibes™ Codex Plugin**. Mine only the useful capabilities from the first-generation prototype, then build a small architecture-aware Codex plugin for context acquisition, classification, bounded execution, validation, environment inspection, Git/GitHub delivery, and evidence-backed handoff. Do not resurrect obsolete 18-phase ceremony, GenAIScript assumptions, fake capability enforcement, or a second architecture system.

### Goal 9 — Finish docs and verify release

> Execute **Task 09 — Finish Public Docs, Verify the System, and Release the Handoff**. Make public docs and site navigation derive from the current canon and branded terminology, apply Visual Vibes consistently, document the actual Maximal Template / Simples / Ontologies / Hipster Stack / Virgule / Anthimeria / Loaded Vibes system, then perform end-to-end conformance against real generated output and record only evidence-backed completion claims.

## Completion report

Report:

- actual files/topology changed;
- package-boundary decisions and evidence;
- gates run and results;
- unresolved blockers or architecture questions;
- exact next task from [[Codependent Coding]].
