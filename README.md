# DevNotes

DevNotes is a private, Git-backed Obsidian knowledge and project-management vault.

## Open here

- `devnotes.home.md` — durable vault home
- Hearth **Unified Workbench** — visual command center
- `Chief of Staff/Workspaces/Codependent Coding/Project Management/codependent-coding.project-management.dashboard.md` — tasks, Kanban, agenda, and calendar

## Structure

```text
Chief of Staff/   objectives, projects, tasks, schedules, handoffs
Trust Issues/     research, validation, evidence
Execution/        specifications, implementation, work packages
Vibes/            architecture, repositories, environments
DevNotes/         inbox, knowledge maps, references, archive
Schemes/          models, schemas, ontology
Prömpter/         prompts, terminology, writing
Fuck You Pay Me/  customers, payments, obligations, external business truth

.system/          machine-readable contracts and registries
_obsidian/        Bases, templates, controls, canvases, and interface assets
_ops/             focused maintenance and verification evidence
_mounts/          local-only Code Space mounts
_assets/          shared media
```

The numbered legacy roots and generated code mirror have been retired. Existing knowledge was moved into its responsibility-owned role and project workspace. Stable wikilinks and properties remain the retrieval layer.

## Daily use

- Create tasks with **TaskNotes: Create new task**.
- Move work through the TaskNotes Kanban.
- Schedule work in the TaskNotes calendar or agenda.
- Use the Daily Note for today’s focus, notes, decisions, and rollover.
- Use QuickAdd for captures, specifications, decisions, research, work packages, handoffs, verification, prompts, models, and business operations.
- Use the context toolbar for commands relevant to the current role or project-management view.
- Use Meta Bind controls to change status, priority, health, progress, and dates without editing YAML.
- Use backlinks, tags, Bases, and the local graph to recover related context.

## Live code

Code Space exposes exactly one local source directory:

```text
_mounts/CodependentCoding → D:\TheCodependentCodingWebAppArchitecture
```

The mount is ignored by Git. The source directory is not a Git checkout, so DevNotes does not infer repository provenance for it.

## Synchronization

`DigitalHerencia/DevNotes` is the remote source of truth. Obsidian Git or normal Git synchronization keeps the local vault aligned with `origin/master`.
