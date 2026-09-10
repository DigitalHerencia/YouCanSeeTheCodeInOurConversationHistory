# Digital Herencia — Obsidian Vault

This branch is a clean rebuild of the vault around one durable filing model and a small set of explicit workflows.

## Filing model

Durable notes belong in PARA:

- `1.PROJECTS/` — finite outcomes with milestones, phases, and tasks.
- `2.AREAS/` — ongoing responsibilities and standards.
- `3.RESOURCES/` — reusable knowledge, modules, prompts, study material, and references.
- `4.ARCHIVE/` — inactive PARA material. Archive state is controlled by the `archive` lifecycle property.

Operational subsystems sit beside PARA instead of competing with it:

- `AMOEBA/` — scratch capture and decomposition before promotion.
- `DAILY/` — daily Scrum cadence.
- `HABITS/` — accountability and progress tracking.
- `HEARTH/` — dashboard source notes.
- `SYSTEM/` — templates, Bases, scripts, taxonomy, and configuration documentation.
- `ZETTLECASTEN/` — preserved collection; new clippings and AI thread transcripts enter through dedicated templates.
- `CIGARETTES, REGRETS, & NEURAL NETS/` — preserved creative-writing collection.
- `assets/` — preserved visual assets.

## Metadata contract

Properties are operational: lifecycle, status, progress, dates, cadence, priority, or configuration. They are not a taxonomy.

Tags classify and retrieve content. Use hierarchical tags such as `type/project`, `domain/typescript`, `topic/react`, `stack/nextjs`, and `source/ai-thread`.

## Workflows

Projects use Kanban for flow, TaskNotes for task records, milestones and phases for planning, and Meta Bind controls for lifecycle state. Daily notes provide Scrum cadence. Habits are recorded in the daily note and summarized in `HABITS/`. QuickAdd routes capture into Amoeba, Zettelkasten, projects, tasks, and stack-syntax drills. Templater owns folder-aware creation and dynamic project context.

The default visual stack is the installed Minimal community theme plus `reform-core`, `callouts`, and one switchable mode snippet. Seven modes are supplied: retro, terminal, dark, vaporwave, neo-modern, hyper-maximal, and minimalist.
