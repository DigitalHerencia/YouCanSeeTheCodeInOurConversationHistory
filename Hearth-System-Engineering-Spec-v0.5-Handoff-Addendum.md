# Hearth System Engineering Specification v0.5 — Handoff Addendum

This addendum freezes implementation details that must be treated as executable contract alongside v0.4.

## Source roots

- `3.RESOURCES/Digital Herencia/`
- `3.RESOURCES/template/`
- `3.RESOURCES/TypeScripture-The-Book-of-Implementation/`
- `3.RESOURCES/TypeScripture-The-Book-of-Knowledge/`

## State ownership

Human state: Meta Bind.
Automation: Templater + QuickAdd scripts.
Execution: TaskNotes.
Projection: Bases + Hearth.
Knowledge workbench: Zettelkasten.
Durable resources: `3.RESOURCES`.
Live code: Code Space.

## Human property surface

Project: status, priority, target dates, current focus, blocker, Code Lab enabled.

Milestone: status, objective, dates, risk.

Phase: status, sprint, risk.

Task: status, priority, due, scheduled, estimate, blocker, mastery, confidence.

Resource: resource state, authority, role, review date, supersession.

Code Lab: mastery state, mastery, confidence, last attempt, next review.

## Derived state

IDs, codes, project/phase/milestone relations, progress, health, next action, counts, provenance, completion timestamps, linked outputs/evidence, archive metadata, and daily rollups are machine-managed.

## Daily

Daily Notes are generated operating snapshots with bounded focus projection. They do not become a second task database and do not overwrite human-authored regions.

## Execution hierarchy

`Project → Milestone → Phase → Task`.

Milestones are the cards on the project board. Phases are inside milestone cards. Tasks execute the phase through TaskNotes.

## Curriculum

Maximal Template ontology → Code Lab module.

DevCycle → Code Lab lesson.

Real project task → applied drill.

Successful execution/test → evidence.

## Migration

11 current project records and 40 exported task records are preserved. Six verified relationless tasks remain in repair. Seven canonical recurring meeting types are represented and generated on demand.

## Implementation rule

Do not infer absent facts. Prefer explicit source state, explicit provenance, and deterministic derivation.


## Template completeness

The handoff package materializes every template family required by the v0.4 template quality contract, including execution, cadence, engineering-document, knowledge/resource, and Code Lab families.
