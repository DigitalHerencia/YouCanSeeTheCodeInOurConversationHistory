---
title: "DevNotes-Workbench-UX-Spec"
role: devnotes
system: devnotes
workspace:
type: reference
status: active
authority: reference
created: 2026-08-24
updated: 2026-08-24
tags: []
---
# DevNotes Workbench UX Specification

The schema should disappear under the interface.

```text
Hearth        → vault/workspace shell
Bases         → dynamic retrieval/facets
Meta Bind     → routine state controls
Note Toolbar  → context commands
Callout Studio→ semantic content markers
Templater     → automatic document shape
QuickAdd      → human creation commands (recommended)
Code Space    → live implementation portal
Git           → provenance
```

## UX invariants

- No routine YAML editing for status/authority/priority.
- No giant template menu for normal work.
- Role and workspace are separate navigation axes.
- The dashboard shows current work, handoffs, evidence, and health.
- Code is linked live when possible instead of copied into stale notes.
- Automation reduces memory burden, not creates new ceremony.
