# DevNotes / Digital Herencia

DevNotes is a private, Git-backed Obsidian workspace. Its active operating interface is **Digital Herencia**, rebuilt from the Digital Herencia Notion dashboard without deleting or reorganizing the existing vault.

## Active model

```text
Digital Herencia
├── Teams
├── Projects
├── Tasks
├── Meetings
├── Portfolio
├── Schedule
├── SOPs
├── Tech Stack
└── Library
```

The active dashboard is composed in Hearth. Bases provide editable views over Markdown records. Templater supports creation. Existing notes remain where they already live and are exposed through the Library base.

## Delivery hierarchy

```text
Portfolio
  ↓
Milestone
  ↓
Phase
  ↓
Project
  ↓
Task / Ticket
```

The migrated project domains are `OPS`, `PROD`, `DES`, `ENG`, `MKT`, and `RES`.

## Obsidian surfaces

- Hearth: operating dashboard
- Bases: database-like views
- Templater: record creation
- Meta Bind: mutable state controls
- Note Toolbar: context actions
- TaskNotes: task lifecycle where compatible
- Kanban: optional project/task boards
- Callout Studio: semantic callouts
- Iconic: navigation icons
- Git: version history and sync

## Migration rule

This is a **no-delete migration**.

Existing notes are not moved, renamed, or deleted merely to fit the new interface. Superseded active configuration is preserved under `Legacy/System/`. `ZETTLECASTEN/` and `CIGARETTES, REGRETS, & NEURAL NETS/` are left untouched.

See:

- `Digital Herencia/System/Operating Model.md`
- `Digital Herencia/System/Cadence.md`
- `Digital Herencia/System/Migration Manifest.md`
- `Digital Herencia.md`
