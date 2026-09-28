# Hearth Plugin Capability Matrix v0.1

This is the implementation boundary. Use supported plugin capabilities; do not infer undocumented behavior.

| Capability | Use in Hearth | Implementation boundary |
|---|---|---|
| Meta Bind INPUT/VIEW | User-facing property controls and readouts | Bind to frontmatter; do not make it the reconciliation engine. |
| Meta Bind BUTTON | Context actions and controlled state changes | Use supported metadata-update, command, and Templater actions. |
| QuickAdd Template | Deterministic note creation | Use for reusable note creation. |
| QuickAdd Capture | Small append operations | Use for human capture where appropriate. |
| QuickAdd Macro | Multi-step workflow orchestration | Use scripts, conditions, nested choices, and commands. |
| QuickAdd User Script | Cross-note reconciliation and plugin orchestration | Use Obsidian APIs and installed-plugin APIs. |
| Templater user scripts | Shared deterministic generation logic | Keep reusable logic in modular scripts. |
| Templater file creation | Generate project artifacts and support files | Use `tp.file.create_new` and explicit folders. |
| Daily Notes | Create/open canonical date note | Use the existing Daily Notes plugin workflow. |
| Bases | Dynamic views/filtering/projections | Base files query actual note state; they are not storage. |
| Kanban | Project-local milestone planning board | Board placement is planning state; reconcile to milestone state. |
| TaskNotes | Task creation/storage/execution | Keep TaskNotes authoritative for executable tasks. |
| Note Toolbar | Contextual commands | Surface actions based on current note context. |
| Callout Studio | Semantic visual language | Style meaning; do not store application state in callouts. |
| Iconic | Icons | Use for navigation/action affordance. |
| Obsidian Git | Versioning/history/sync workflow | Use as repository/version control surface. |
| Code Space | Live-code access | Integrate with the existing mounted CodependentCoding repo/config; do not invent a clone/mount mechanism. |

## Known non-capabilities / assumptions forbidden

- No native assumption that Meta Bind can automatically calculate arbitrary cross-note rollups.
- No native assumption that Kanban card movement automatically updates TaskNotes properties.
- No native assumption that Bases become a write-through database.
- No claim that Code Space can automatically clone/mount a repo unless the installed configuration/API proves it.
- No claim that a plugin will generate semantic narrative that is not present in source data.
