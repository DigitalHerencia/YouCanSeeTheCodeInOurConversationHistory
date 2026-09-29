# Codependent Coding™ Birthday Release Plan

**Target:** September 1, 2026  
**Planning baseline:** August 22, 2026  
**Release type:** Local, coherent, verifiable v0.1 release candidate; no GitHub push required.

## Objective

Deliver a single coherent Codependent Coding™ repository and runnable web application that expresses the canonical product system:

```text
Codependent Coding™ WebApp Architecture
        ↓ governs
Ontology™
        ↓ normalized starting constitution
Anthimeria™ / CLI / portable config
        ↓
Virgule™ Application Definition
        ↓ normalize / validate / dependency-close
The Hipster Stack™ Technology Stack
        +
The Maximal Template™ Domain Library
        ↓ retain / remove / transform
The Arrangement™ Generated Artifact
        ↓ optional
Loaded Vibes™ Codex Plugin
```

The birthday release is not “every future idea.” It is the smallest version in which the architecture, site, domain library, configurator, generation path, docs, and validation all agree and work together.

## Current baseline

The consolidated archive is not greenfield. It already contains substantial implementation material, but it is still physically transitional:

- root package identity and documentation still largely describe Hipster Stack;
- root scripts still reference old `apps/web` / `template/` locations;
- `src/` contains separate `CodependentCoding-site`, `TheMaximalTemplate-main`, `TheMaximalTemplate-demo`, and `CodebaseContextUtility-main` trees;
- root already has a large reusable UI corpus (`components/ui`, charts, blocks, templates);
- the canonical Simples catalog defines 28 PureUI Blocks and 74 BusinessLogic Workflows;
- only 3 of the 28 canonical PureUI block paths currently exist at the consolidated root;
- the older Maximal Template source contains 24 workflow files, of which 21 semantically match canonical workflows; approximately 53 canonical workflows therefore still require implementation/reconciliation;
- the Ontologies catalog contains 76 `STUB — BUILD` entries spanning normalized route and presentation surfaces;
- the documentation corpus, patterns, machine contracts, provenance, generator packages, and Loaded Vibes v0.1 plugin are already present as substantial source material.

Therefore the main job is **convergence, canonical gap closure, generation integration, and validation**, not invention.

## Birthday Definition of Done

The release is done only when all of the following are true.

### Repository

- One canonical repository layout.
- One Next.js application at the root.
- No `src/` application nesting.
- No duplicate “main/demo/site” application trees acting as competing owners.
- Genuine independent packages remain only where packaging/distribution requires them, principally Hipster Stack schema/core/CLI.
- Root package scripts point at real paths and execute successfully.

### Product website

The root application has coherent public routes/surfaces for:

- Codependent Coding™ landing;
- Ontologies™;
- Simples™;
- Anthimeria™;
- Maximal™;
- Docs;
- any retained Codebase Context Utility surface that earns its place.

The supplied mockups remain visual acceptance authority. Public browsing does not require authentication.

### Ontologies and Maximal Template

- All nine canonical Ontologies are represented.
- Shared foundation is implemented once and reused.
- Route → Feature → PureUI/BusinessLogic relationships follow the canonical architecture.
- The Maximal Template remains a coherent runnable superset implementation.
- Any surface not genuinely implemented is labeled truthfully rather than represented as generator-supported.

### Simples

- Canonical PureUI inventory reconciled to 28 block paths.
- Canonical BusinessLogic inventory reconciled to 74 workflows.
- UI Primitives remain constituents, not top-level Simples.
- Actions/fetchers/auth/authz/transactions/schemas/types/integrations remain architecture-owned constituents of workflows.
- Presentation blocks contain no persisted reads/writes or business policy.

### Anthimeria / Virgule

- The public workbench is Anthimeria™, not The Constituter™.
- Anthimeria starts from one of nine Ontologies.
- Presentation configuration is user-editable; normalized behavior is not exposed as arbitrary toggles.
- Web and CLI use the same schema/resolver semantics.
- A definition can progress through draft → normalized → validated → dependency-closed states.
- The resulting portable definition is a Virgule™.

### Hipster Stack generation

- Resolver performs dependency closure.
- Generator owns artifact ownership and materialization rules.
- Maximal Template owns application source.
- A generation plan can explain why artifacts are retained, removed, or transformed.
- Materialization occurs safely through staging.
- Generated Arrangement is standalone and has no runtime dependency on Anthimeria.
- Provenance/config metadata is emitted without leaking generator runtime into the generated application.
- Representative generation smoke passes for every Ontology claimed as supported.

### Loaded Vibes

- Loaded Vibes remains post-generation Codex assistance, not generator authority.
- v0.1 package validates and its inspect/classify/implement/review/verify workflow operates against an Arrangement fixture.

### Docs

- Existing knowledge corpus is preserved and reconciled rather than replaced.
- Product identity and role conflicts are resolved deliberately.
- Docs navigation follows Start Here / Knowledge Model / Architecture / Patterns / Product System / Governance / Provenance.
- Consequential pages expose authority/status and appropriate links to patterns, contracts, and provenance.
- No obsolete product role is presented as current canon.

### Verification

At minimum:

- format check;
- lint;
- typecheck;
- unit/integration tests;
- architecture/contract validation;
- Next production build;
- generator package/build checks;
- generated Arrangement smoke;
- narrow and desktop visual inspection of core public routes;
- broken-link/docs navigation check;
- secret scan before any eventual remote publication.

## Target topology

The consolidation should converge toward this shape rather than preserving multiple nested Next applications:

```text
/
├── app/                         # one Next.js application
│   ├── ontologies/
│   ├── simples/
│   ├── anthimeria/
│   ├── maximal/
│   ├── docs/
│   └── ...shared/public/demo surfaces
├── components/
│   ├── blocks/                  # PureUI Blocks™
│   ├── ui/                      # UI Primitive constituents
│   └── chart/
├── features/                    # route-facing orchestration
├── lib/
│   ├── workflows/               # BusinessLogic Blocks™
│   ├── actions/
│   ├── fetchers/
│   ├── auth/
│   ├── authz/
│   ├── db/
│   └── integrations/
├── schemas/
├── types/
├── content/                     # user-editable/site/demo content
├── docs/ or content/docs/       # canonical website docs source
├── packages/
│   └── TheHipsterStackTechnologyStack/
│       ├── schema/
│       ├── core/
│       └── cli/
├── .agents/
│   └── Loaded-Vibes-Codex-Plugin-v0.1.0/
├── context/                     # authority, provenance, historical specs
├── tests/
└── package.json
```

The generator must select application-owned artifacts through explicit ownership metadata. Website/editorial surfaces must not leak into generated Arrangements simply because they live in the same repository.

## Work Breakdown Structure

### EPIC 0 — Authority and topology lock

**Purpose:** remove ambiguity before coding.

Tasks:

1. Create one authority index covering Codependent Coding, Ontologies, Simples, Anthimeria, Virgule, Hipster Stack, Maximal Template, Arrangement, Loaded Vibes, and Docs.
2. Define the final physical repository topology.
3. Classify every current top-level/nested tree as KEEP, MERGE, REFERENCE-ONLY, or REMOVE-AFTER-MIGRATION.
4. Produce an old-path → canonical-path migration map.
5. Mark compatibility identifiers that must survive temporarily; forbid blind global rename.
6. Freeze birthday scope and acceptance criteria.

**Exit:** there is exactly one answer for where every source family belongs.

### EPIC 1 — Physical consolidation and runnable baseline

Tasks:

1. Promote the chosen application source to root `app/`, `features/`, `lib/`, `schemas/`, `types/`, `content/`, etc.
2. Merge reusable root UI/components into canonical owners.
3. Remove `src/` application nesting after each source has a destination.
4. Eliminate duplicate Maximal main/demo/site ownership.
5. Repair workspace/package configuration and root scripts.
6. Repair imports/aliases/config paths.
7. Get install, typecheck, and production build green before domain expansion.

**Exit:** one root app runs and builds.

### EPIC 2 — Shared foundation and architecture contracts

Tasks:

1. Lock route → feature → block/workflow orchestration.
2. Normalize shared public/auth/onboarding/settings/navigation/shell/error/loading infrastructure.
3. Lock auth/authz/RLS responsibilities.
4. Normalize server-operation ownership: fetchers, actions, transactions, provider adapters, webhooks.
5. Ensure content is segregated from structural component source.
6. Establish semantic token baseline and mockup-compatible site shell.

**Exit:** every later Ontology can reuse the same foundation without inventing another architecture.

### EPIC 3 — Simples and nine Ontologies

Implement/reconcile by domain batches so each batch closes routes, features, PureUI blocks, workflows, constituents, and tests together.

Batch A: CRM + Project Management  
Batch B: Customer Support + Marketing  
Batch C: Invoicing + Social Media  
Batch D: AI + B2B Client Portal + Internal Tools/Admin

For each Ontology:

1. Reconcile canonical routes against existing route source.
2. Reconcile/create Features.
3. Implement required canonical PureUI blocks using existing primitives.
4. Reconcile/create canonical BusinessLogic workflows.
5. Reuse existing actions/fetchers/transactions/schemas/types/providers rather than duplicating them.
6. Add only missing constituents required by the workflow contracts.
7. Add focused tests for consequential behavior.
8. Mark implementation status truthfully in the catalog.

**Exit:** 28/28 PureUI blocks and 74/74 workflow identities are reconciled, or unsupported items are explicitly demoted rather than falsely claimed.

### EPIC 4 — Anthimeria and Virgule

Tasks:

1. Rename/reframe The Constituter user-facing surface to Anthimeria.
2. Replace four-preset UX with nine canonical Ontologies.
3. Separate locked/normalized behavior from presentation choices.
4. Implement page-template, feature-slot, block-variant, content, and token configuration.
5. Make provenance visible as LOCKED / PRESET / USER / REQUIRED / DERIVED / DEFAULT.
6. Implement/export portable Virgule definition.
7. Ensure web and CLI use one shared resolver.
8. Expose normalized, validated, and dependency-closed preview states.

**Exit:** Anthimeria can produce a dependency-closed Virgule without owning a parallel rules engine.

### EPIC 5 — Hipster Stack generation and Arrangement

Tasks:

1. Reconcile schema/core/CLI names and roles to canonical authority.
2. Build nine Ontology presets into the shared schema/resolver.
3. Implement behavioral and presentation dependency closure.
4. Build/repair artifact ownership metadata.
5. Generate an explainable generation plan.
6. Retain/remove/transform real Maximal Template source.
7. Stage output safely before promotion.
8. Emit portable provenance/manifest.
9. Run Arrangement acceptance smoke.
10. Generate one fixture per supported Ontology and verify independence from the generator/web workbench.

**Exit:** `Ontology → Virgule → plan → materialize → Arrangement` is a real executable path.

### EPIC 6 — Product website and Docs

Tasks:

1. Implement the supplied visual shell and navigation.
2. Build Ontologies catalog/detail presentation from canonical data.
3. Build Simples catalog/detail presentation with separate PureUI and BusinessLogic families.
4. Embed Anthimeria workbench.
5. Build Maximal explorer/demo surfaces.
6. Reconcile and migrate existing knowledge corpus into website Docs.
7. Add authority/status/provenance metadata and cross-links.
8. Integrate Codebase Context Utility only where it supports the product; do not preserve it as a second app.

**Exit:** a visitor can understand the entire product system from the website without reading repository archaeology.

### EPIC 7 — Loaded Vibes package

Tasks:

1. Validate plugin/package structure.
2. Verify inspect/classify/implement/review/verify against a generated Arrangement fixture.
3. Ensure architecture/security validators match current Arrangement conventions.
4. Keep Git/GitHub delivery optional and owner-controlled.

**Exit:** the package is usable locally as the post-generation execution derivative.

### EPIC 8 — Release hardening

Tasks:

1. Full validation suite.
2. Cross-route visual smoke.
3. Docs link/authority check.
4. Generator determinism smoke.
5. Arrangement independence smoke.
6. Secret scan.
7. Remove dead transitional source only after replacement is verified.
8. Freeze release candidate.
9. Create local release notes and birthday archive.

**Exit:** a clean local `v0.1.0-birthday` release candidate exists without requiring a GitHub push.

## Calendar: August 23 → September 1

### August 23 — Convergence Day

Critical path: EPIC 0 + EPIC 1.

Deliverables:

- authority index;
- final topology;
- migration map;
- one root application;
- repaired package/workspace scripts;
- first green build/typecheck baseline.

Do not start mass workflow/block generation until this is stable.

### August 24 — Foundation + Domain Batch A

Critical path:

- shared architecture foundation;
- CRM;
- Project Management.

Secondary lane:

- site shell/navigation and semantic tokens from mockups.

### August 25 — Domain Batch B

Critical path:

- Customer Support;
- Marketing Automation.

Secondary lane:

- Ontologies and Simples catalog data/adapters.

### August 26 — Domain Batch C

Critical path:

- Invoicing;
- Social Media Scheduler.

Secondary lane:

- Docs migration tooling/navigation.

### August 27 — Domain Batch D

Critical path:

- AI Wrapper;
- B2B Client Portal;
- Internal Tools/Admin.

Gate at end of day:

- reconcile 28 PureUI identities;
- reconcile 74 workflow identities;
- generate truthful implemented/missing status report.

### August 28 — Anthimeria / Virgule Day

Critical path:

- nine Ontology selection;
- presentation configuration;
- shared resolver;
- provenance;
- normalized/validated/dependency-closed states;
- portable Virgule output.

No new domain features unless they block dependency closure.

### August 29 — Generation Day

Critical path:

- ownership graph;
- generation plan;
- staging/materialization;
- Arrangement provenance;
- one smoke-generated Arrangement for each Ontology claimed supported.

This is the most important schedule gate. If an Ontology cannot pass the chain by the end of this day, downgrade its support claim rather than shipping a false “supported” badge.

### August 30 — Website + Docs Integration Day

Critical path:

- final public pages;
- Maximal explorer;
- docs reconciliation;
- authority/status/provenance links;
- visual comparison to supplied mockups;
- narrow/desktop responsive fixes.

The generation path should already be stable; do not redesign it here.

### August 31 — Hardening / Release Candidate

No new features.

Run:

- formatting;
- lint;
- typecheck;
- tests;
- architecture/contracts;
- production build;
- generation/package/release checks;
- nine-Ontology smoke matrix;
- docs links;
- visual smoke;
- secret scan.

Fix only release-blocking defects. Create release notes and `v0.1.0-birthday` archive.

### September 1 — Birthday Release

No architecture work and no speculative feature work.

Only:

1. clean install/build smoke;
2. open the core public routes;
3. run one representative Anthimeria → Virgule → Arrangement flow;
4. verify archive contents;
5. mark the local release candidate complete.

GitHub publication/deployment can remain a separate owner-controlled action.

## Codex Work-Package Contract

Every Codex assignment should be small enough to finish, verify, and hand back without carrying hidden context.

Each work package must state:

- exact authority documents;
- exact objective;
- owned files/directories;
- forbidden scope;
- acceptance criteria;
- validation commands;
- expected handoff format.

The loop is:

```text
inspect
→ classify
→ implement smallest complete unit
→ review architecture/security drift
→ verify proportionally
→ record evidence
→ move to next package
```

No PR ceremony is required during the local sprint. Local commits/checkpoints are useful for rollback; remote push remains off-limits until authorized.

## Scope controls

The following do **not** belong in the birthday critical path unless already required by canonical acceptance:

- tenth/future Ontology;
- hosted control plane;
- account system for Anthimeria;
- remote build worker;
- arbitrary provider/plugin marketplace;
- npm publication;
- OpenAI Plugin Directory submission;
- generalized upgrade/merge engine;
- new provider integrations beyond current canonical support;
- speculative redesign of the visual language;
- GitHub PR bureaucracy for a repository not yet ready to publish.

## Failure and recovery rules

- A task blocked longer than one focused debugging cycle is isolated, documented, and bypassed if an independent work package can proceed.
- Canonical authority wins over legacy implementation naming.
- Existing working source wins over rewriting from scratch when it satisfies the new contract.
- “Implemented” means executable/verified, not merely documented or mocked.
- If schedule pressure forces a tradeoff, reduce the support claim rather than weaken architectural truth.
- August 31 is a hard feature freeze once final validation begins.
- September 1 is for release verification, not rescue engineering.

## Operating model

- **Chief of Staff:** owns sequencing, schedule, blockers, scope protection, and daily state.
- **Execution / Codex:** implements bounded work packages.
- **Vibes:** operates local tooling/build/deployment surfaces when needed.
- **Trust Issues:** runs independent verification at milestone gates.
- **DevNotes:** receives durable decisions/reconciliation once stable.
- **User:** remains authority only for genuine unresolved product decisions; the system should not bounce already-decided canonical questions back to the user.

## Milestone gates

| Gate | Deadline | Pass condition |
|---|---|---|
| G0 Topology | Aug 23 | one target topology; root app builds |
| G1 Domain Library | Aug 27 | nine Ontologies reconciled; Simples inventory truthful |
| G2 Definition | Aug 28 | Anthimeria emits dependency-closed Virgule |
| G3 Generation | Aug 29 | supported Ontologies materialize Arrangements |
| G4 Product | Aug 30 | website/docs coherently expose canonical system |
| G5 Release Candidate | Aug 31 | full validation green or blockers explicitly scoped |
| G6 Birthday | Sep 1 | local v0.1 archive + smoke verified |

## First execution package

The first package should **not** be “build Codependent Coding.” It should be:

> **Reconcile the consolidated repository into one canonical physical topology and produce a green runnable baseline without changing product behavior.**

Its output is the stable substrate on which every later work package depends.
