---
title: Digital Herencia Operating Model
type: contract
entity: system
status: Active
authority: Source of Truth
source: Notion Digital Herencia
source_url: https://app.notion.com/p/Digital-Herencia-2d5a4e63bf238061b973f5ac0f3f99c6
updated: 2026-08-29
tags:
  - digital-herencia
  - operating-model
---

# Digital Herencia Operating Model

## Workspace model

The source dashboard is organized around these first-class surfaces:

1. Meetings
2. Teams
3. Portfolio
4. Schedule
5. SOPs
6. Tech Stack
7. Regrets, Cigarettes, & Neural Nets
8. Projects
9. Tasks

Projects and Tasks are the primary working collections. Teams and Meetings provide ownership and cadence. Portfolio provides hierarchy. Schedule projects work across time. SOPs define operating rules. Tech Stack and authored material provide reference/context.

## Teams

Current Notion records:

- Operations Team
- Product Team
- Design Team
- Engineering Team
- Marketing Team
- Research Team

The source SOPs formally define five studio functions: Operations, Product, Design, Engineering, and Marketing. Research is preserved as an operational team because it exists in the source database; it is not silently promoted into the five-team SOP doctrine.

## Project model

Each project may carry:

- `domain`: OPS, PROD, DES, ENG, MKT, RES
- `milestone`: M1, M2, M3
- `phase`: P1.1 through P3.3
- `status`: Backlog, Ready, In progress, Review, Done
- `work_start` and `work_end`
- `team`
- related `tasks`
- related `meetings`
- `archived`

## Task model

A task is a daily execution unit related to a project and team. The Ticketing SOP further defines a ticket as a billable, traceable unit of no more than one workday.

The source work-code grammar is:

`[TEAM]-[MILESTONE]-[PHASE]-[PROJECT]-[TICKET]`

Example: `ENG-M2-P2.1-RBAC-T03`.

## Delivery hierarchy

The source material expresses the hierarchy in two compatible forms:

```text
Milestone
  └── Phase
      └── Project
          └── Ticket / Task
```

and:

```text
Portfolio
  └── Milestone
      └── Phase
          └── Project
              └── Task
```

Milestones represent business-significant delivery checkpoints. Phases are bounded execution periods, generally aligned to two-week sprints.

## Milestones and phases

### M1 — Foundation & Architecture

- P1.1 Product Discovery & Business Definition
- P1.2 Platform & Operations Scaffolding
- P1.3 Internal Alpha Validation

### M2 — MVP Build & Launch

- P2.1 Core Feature Implementation
- P2.2 QA & Launch Readiness
- P2.3 Soft Launch & Feedback Loop

### M3 — Expansion & Hardening

- P3.1 Feature Expansion
- P3.2 Platform Hardening & Security
- P3.3 Growth Enablement

The older Cycles SOP also contains a compressed three-phase presentation. Both source documents are preserved in `Digital Herencia/SOPs/`; the more detailed Ticketing/Procedures phase catalog controls the dashboard options because it matches the live Projects database.

## Functional boundaries

Migrated SOP semantics:

- Operations: business, finance, legal, customers, revenue, CRM, OKRs, compliance
- Product: product truth, scope, roadmap, requirements
- Design: UX/UI, accessibility, interaction systems
- Engineering: architecture, code, security, performance
- Marketing: positioning, messaging, demand, growth
- Research: retained from the operational database as a specialist execution team

## Obsidian implementation

- Hearth composes the shell.
- Bases reproduces database views.
- Markdown + Properties are the durable records.
- Wikilinks reproduce relations.
- Templater supplies record shapes.
- Existing notes remain in place and are made visible through Library views.
