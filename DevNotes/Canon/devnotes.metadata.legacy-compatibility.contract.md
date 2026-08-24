---
title: DevNotes Unified Metadata Legacy Compatibility Contract
namespace: devnotes.devnotes.metadata.legacy-compatibility.contract
role: devnotes
system: devnotes
workspace:
type: contract
status: active
authority: canonical
created: 2026-08-23
updated: 2026-08-23
tags:
  - devnotes/metadata
  - migration/no-delete
---

# Unified Metadata Legacy Compatibility Contract

## Unified properties

New unified notes use `title`, `namespace`, `role`, `system`, `workspace`, `type`, `status`, `authority`, `created`, `updated`, and `tags`. Useful facets and typed relationships may be added according to [[DevNotes-Unified-Knowledge-Engineering-System-Authority-Package-v0.1.0/01-authority/Metadata-and-Knowledge-Graph-Contract]].

## Legacy compatibility

Existing notes governed by [[obsidian.contracts.property-schema]] remain valid during migration. Legacy `project`, `scope`, `domain`, `artifact`, `kind`, `parent`, `depends_on`, and `supersedes` properties may coexist with unified properties.

Legacy authority and status values are not silently converted to unified values. Every semantic conversion requires inspection of the note's actual meaning and authority.

## Invariants

- No mass metadata rewrite.
- No namespace change solely because a file moves.
- No role inference may replace an inspected responsibility decision.
- Bases must tolerate both schemas during staged migration.
- Physical prefix or location never establishes epistemic authority.
