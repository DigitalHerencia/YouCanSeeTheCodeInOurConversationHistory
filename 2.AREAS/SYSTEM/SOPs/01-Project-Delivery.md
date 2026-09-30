# Project Delivery SOP

## Canonical hierarchy

Project → Milestone → Phase → RoadMap → Task

## Project

A Project is a bounded body of work stored in a user-named folder under `1.PROJECTS`.

QuickAdd creates the complete initial project structure.

## Milestones

Every generated project begins with:

- M1 Foundation & Architecture
- M2 MVP Build & Launch
- M3 Expansion & Hardening

Each Milestone has its own Kanban board.

## Phases

Each Milestone contains three standard phases:

M1: P1.1 Product Discovery & Business Definition; P1.2 Platform & Operations Scaffolding; P1.3 Internal Alpha Validation.

M2: P2.1 Core Feature Implementation; P2.2 QA & Launch Readiness; P2.3 Soft Launch & Feedback Loop.

M3: P3.1 Feature Expansion; P3.2 Platform Hardening & Security; P3.3 Growth Enablement.

A Phase has Purpose, Key Activities, Primary Outputs, RoadMap, and Tasks.

## RoadMaps

A RoadMap is the implementation plan for one Project + Milestone + Phase.

RoadMap identity follows:

`[PROJECT]-[MILESTONE]-[PHASE]-[ROADMAP]`

The RoadMap carries the phase purpose, activities, outputs, dependencies, inputs, downstream consumers, and associated tasks.

## Tasks

Tickets are the prototype reference for TaskNotes. TaskNotes stores generated tasks in `2.AREAS/SYSTEM/_Tasks`.

Task identity follows the Ticketing convention with teams replaced by projects:

`[PROJECT]-[MILESTONE]-[PHASE]-[ROADMAP]-[TASK]`

Required task properties:

`task_id`, `project_id`, `project`, `status`, `dependency`, `deliverable`.

## Kanban

There is one board per Project + Milestone.

Cards represent Phases only. Tasks, artifacts, and RoadMaps do not become Kanban cards.

## Project outputs

Project folders contain:

- Project map
- Resources map
- Codebase map
- Posts map
- Artifacts
- Milestone folders
- Phase folders
- RoadMaps
- Milestone Kanban boards

Core generated artifacts include PRD and Technical Requirements.

## Traceability

Project → Milestone → Phase → RoadMap → Task → Deliverable.

Artifacts, evidence, resources, code, and posts link back to the relevant project context.
