# Chapter 05: Ontology Contract

**The Book of Implementation™**

## Placement

```text
context/
  Ontologies.Canonical-Catalog.md   # the entity/relationship catalog itself, codebase-aligned
  docs/
    architecture.md
    prd.md
```

## Golden pattern — codebase-first, self-correcting catalog

```markdown
---
title: The Ontology™ Normalized Defaults — Canonical Catalog
type: architecture-catalog
alignment: codebase-first
implementation_root: template/
---

This catalog records the normalized ontology inventory that is
**actually implemented** in `template/` on `main`.

The implementation is the baseline for this document. This catalog
does not prescribe a different architecture, create missing files,
preserve obsolete stubs, or require the codebase to conform to an
older ontology model.

## Catalog rules

- Only files and routes observed in the current codebase are
  canonical inventory entries.
- A missing file is not represented as `[STUB — BUILD]`.
- `components/blocks/` contains reusable presentation compositions.
  It is not a second business-logic namespace.
- Business/application orchestration lives under `lib/workflows/`.
- Authorization is centralized under `lib/authz/`; this catalog
  does not invent per-domain authz files.

## Implemented relationship model

Route → server Feature → domain Template → shared presentation Block/UI
Route → client Form → UI primitives
Feature → Workflow / Fetcher
Workflow → Fetcher / Action
Action / Fetcher → DB selects / DTOs / transactions
```

## Anatomy

- **`alignment: codebase-first` is a declared property of the document, not an implicit assumption** — the catalog states up front that it describes what exists, and explicitly disclaims prescribing a different architecture or inventing stubs for things that don't exist yet.
- **"A missing file is not represented as `[STUB — BUILD]`"** — this is a specific, hard-won rule: an ontology document that lists aspirational files alongside real ones becomes untrustworthy the moment someone can't tell which is which. This catalog refuses that ambiguity by only ever recording what's observed.
- **The relationship model is written as a small set of arrows, not prose** — `Feature → Workflow / Fetcher` is unambiguous and fast to scan, which matters because this document's job is to be checked against quickly, not read start to finish.
- **Explicit negative statements** ("blocks is not a second business-logic namespace," "this catalog does not invent per-domain authz files") — these exist specifically to close off the exact misreadings that would otherwise happen, which is a sign the author had already seen those misreadings happen once.

## Forbidden variants (enforced, not just documented)

- **No ontology document describing an aspirational architecture that doesn't match `main`.** If the catalog and the codebase disagree, the codebase wins and the catalog gets updated — never the reverse.
- **No entity introduced with a near-duplicate name of an existing one** (a new "Workspace" alongside "Organization") without an explicit decision recorded about whether they're the same concept, an alias, or genuinely distinct.
- **No renaming a core reference noun (e.g., Organization) without a documented, deliberate decision** — this is architecture-level, not a casual find-and-replace.

## Checklist

- [ ] Every core entity mentioned in code has a corresponding entry in the ontology catalog
- [ ] The catalog is checked/updated whenever an entity's shape or relationships materially change
- [ ] No entity exists in the catalog that isn't observed in the actual codebase
- [ ] Any near-duplicate or renamed noun has an explicit, recorded decision behind it
