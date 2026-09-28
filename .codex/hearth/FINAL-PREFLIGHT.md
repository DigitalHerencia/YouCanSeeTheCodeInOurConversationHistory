# Hearth Final Preflight v0.5

Date: 2026-09-25

## Verified

- The vault repository contains the Notion export under `3.RESOURCES/Digital Herencia/`.
- The vault repository contains the Maximal Template implementation under `3.RESOURCES/template/`.
- The vault repository contains both TypeScripture books.
- The Codex control plane is committed at the repository root and `.codex/hearth/`.
- The task store is fixed at `2.AREAS/SYSTEM/_Tasks`.
- Cadence is fixed under `2.AREAS/DAILY` and is generated on demand.
- Zettelkasten is the active workbench; durable processed resources live under `3.RESOURCES`.
- Project hierarchy is Project → Milestone → Phase → Task.
- Milestones are project-board cards; phases remain inside milestones; TaskNotes remains execution truth.
- Meta Bind is the human control surface; derived properties are machine-managed.
- All 11 exported projects and 40 exported tasks are in scope.
- The six verified relationless tasks remain repair-only.
- The nine Maximal Template ontologies are Code Lab modules.
- DevCycles are Code Lab lessons and real implementation is the applied drill.

## Corrected before handoff

- Added the complete missing canonical template families required by the engineering specification: Document, Requirement, Evidence, Domain, Weekly Review, Cycle, Sprint, Task Bridge, Phase Review, Milestone Review, Postmortem, SOP, Verification Report, Deployment Plan, Runbook, RFC, UX Design, Design Contract, Literature, Clipping, Evergreen, MOC, Applied Drill, Lesson Test, Module Assessment, Learning Journal, and Code Lab Test.
- Strengthened meeting templates and Pattern template so they contain operational prompts, evidence, decisions, and follow-up structures rather than skeletal headings.
- Preserved the v0.4 specification plus the v0.5 handoff addendum as governing contract.

## Launch rule

Codex should implement from this package without asking the owner to choose architecture, schema, ontology, cadence, property, migration, or template structure.

The only permitted runtime decision is how to realize a locked contract using the capabilities actually available in the installed plugins and repository.

Exact filename aliases were added so every required template name in the specification resolves directly to a package file. Codex does not need to invent filename mappings.

No stale TypeScripture source path remains in the handoff after this correction.
