---
title: Codependent Coding™ Governance
type: governance
project: Codependent Coding
status: active
authority: canonical
updated: 2026-08-20
role: devnotes
system: codependent-coding
workspace: codependent-coding
tags: []
---

# Codependent Coding™ Governance

Keep this system coherent without turning it into process for its own sake.

## Authority order

When current materials conflict, use this order:

1. Newest explicit user decision.
2. [[CODEPENDENTCODING.TERMINOLOGY]] for current branded product names.
3. Explicit canonical corrections, including the Workflow Constitution Correction.
4. The active master Web App Architecture where not superseded above.
5. Later Maximal Template demo/hardening doctrine that intentionally refines implementation behavior.
6. Current repository-local instructions and real source for observed implementation state.
7. Active Simple records and live Code Space evidence.
8. Durable role-owned Codependent Coding doctrine where compatible.
9. Historical/archive/planning material.

A newer filename, a `canonical` label, or a TODO does not by itself override this order.

## Normative architecture vs implementation evidence

- Architecture says what a conforming system is supposed to mean.
- Actual repositories say what currently exists.
- Live Code Space files show current source content; because the mounted root is not a Git checkout, they do **not** establish repository provenance.
- Never convert “specified”, “expected”, “configured”, or “should pass” into “implemented” or “verified”.

## Architecture classifier

> **Routes own URL and HTTP boundaries. Features orchestrate application capabilities. Components render. Fetchers read persisted data. Actions own ordinary CRUD mutation boundaries. Schemas validate runtime input. Workflows constitute reusable application logic from server operations and helpers. Transactions preserve atomic database invariants. Authentication establishes identity. Authorization decides access. Integrations own provider mechanics. Webhooks own provider HTTP request lifecycles.**

Workflow constituents retain their original ownership. A fetcher inside a workflow remains a fetcher; an action remains an action; a transaction remains a transaction. Trivial CRUD does not require workflow ceremony.

## Simple governance

- `Ontologies.md` is the master supported application inventory used to drive Simple coverage.
- A Simple must be backed by a real supported source unit or explicitly marked as an implementation gap/stub.
- Keep real TypeScript/TSX/SQL/config source as real source. Metadata describes ownership, relationships, constraints, variants, and generation behavior; it does not replace source code.
- Preserve Public Demo and Hardened implementation differences explicitly.
- Security invariants such as authentication, tenant isolation, authorization, and RLS are not user-facing optional toggles merely because they are modeled.
- Dependency closure must be deterministic before a selectable surface is generation-ready.

## Repository governance

- `DigitalHerencia/CodependentCoding` is the target umbrella implementation repository.
- One root Next.js application, one root `app/`, no `src/`, no permanent `apps/web` wrapper.
- Keep package boundaries only for genuine shared/distributed ownership; do not flatten or preserve workspace packages mechanically.
- The existing Hipster Stack website is migration foundation, not disposable scaffolding.
- Keep source repositories intact until the consolidated target is verified.
- The Maximal Template remains real application source, not a serialized template blob.

## Agent/Codex rules

- Inspect actual repository state and local instructions before changing code.
- Use the smallest complete change that satisfies the current work package.
- Do not redesign unrelated architecture during migration or bug fixing.
- Do not invent unsupported Simples, generator choices, security claims, or completion evidence.
- Run the real engineering gates appropriate to the repository before claiming success.
- Stop at the work-package boundary and leave an evidence-backed handoff.
