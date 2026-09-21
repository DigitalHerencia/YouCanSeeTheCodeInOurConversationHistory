# No-Delete Migration Plan

## 0 — Snapshot and inventory
Read-only inventory. No moves/deletes.

## 1 — Overlay
Create the eight role roots plus `.system`, `_obsidian`, `_ops`, `_mounts`, `_assets`. Legacy roots remain.

## 2 — Dual-schema compatibility
Add new Bases and controls. Keep legacy properties readable. Do not mass-convert authority/status.

## 3 — ChatGPT Project alignment
Update Project sources/instructions only after the role registry and shared contract are accepted.

## 4 — Workspace pilot
Use Codependent Coding as the first end-to-end workspace without moving everything.

## 5 — Role-by-role classification
For each note: determine authority, role owner, workspace/system facets, path-sensitive references, then move only if useful.

## 6 — Code Space pilot
Mount one repository. Compare live embeds against the Source Mirror. Produce keep/promote/replace/delete-candidate inventory.

## 7 — Legacy-root retirement
Retire a root only when every surviving artifact is classified and links/queries are verified.

## 8 — Explicit deletion gate
Delete only after separate explicit approval.

Completion is epistemic/retrieval completeness, not a pretty empty legacy tree.
