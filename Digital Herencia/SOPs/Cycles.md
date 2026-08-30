---
title: Cycles
entity: sop
document_id: Software Studio Delivery Framework
version: 2025-12-29
source_status: Canonical
source: Notion
source_url: https://app.notion.com/2d8a4e63bf23800a8dbeff4b4ae1cd19
tags:
  - digital-herencia/sop
  - delivery
---

# Software Studio Delivery Framework

**Enterprise SaaS Product Execution Reference**

## Operating model

The source defines strict functional ownership:

| Team | Scope boundary |
|---|---|
| Operations | Business, finance, legal, customers, revenue, CRM, OKRs |
| Product | Product truth, scope, roadmap, requirements |
| Design | UX/UI systems, accessibility, interaction design |
| Engineering | Architecture, code, security, performance |
| Marketing | Positioning, messaging, demand, narrative |

Anything not clearly Design, Engineering, or Marketing defaults to Operations in this SOP.

## Delivery structure

```text
Portfolio
 └── Milestone
     └── Phase (2 weeks)
         └── Project
             └── Task (daily execution unit)
```

## Milestones in this source

### M1 — Foundation & Pre-Production

- Phase P1.1: Initialization & Scaffolding
- Duration: Weeks 1–2

### M2 — MVP Launch

- Phase P2.1: MVP Build & Launch
- Duration: Weeks 3–4

### M3 — Expansion & Hardening

- Phase P3.1: Advanced Features, Security, Patching
- Duration: Weeks 5–6

## Project properties

- `project_id`: stable identifier
- `team`: owning team
- `milestone`: M1, M2, M3
- `phase`: P1.1, P2.1, P3.1 in this compressed framework
- `inputs`: artifacts/dependencies
- `outputs`: produced artifacts
- `downstream_consumers`: teams/systems depending on output

## Task properties

- `task_id`
- `project_id`
- `owner_role`
- `execution_type`: daily execution
- `dependency`
- `deliverable`

## Team execution plans

### Operations

M1 examples: LLC & Governance Initialization; OKRs & Business Constraints. M2: Revenue & Customer Operations. M3: Risk, Compliance & Scale.

### Product

M1: Problem Definition & PRDs. M2: MVP Scope Enforcement. M3: Advanced Feature Roadmap.

### Design

M1: UX Architecture & Design System Alignment. M2: MVP Interface Delivery. M3: Advanced UX & Design Debt.

### Engineering

M1: Architecture & Scaffolding. M2: MVP Feature Implementation. M3: Advanced Features & Security.

### Marketing

M1: Positioning & Narrative. M2: MVP Launch Campaign. M3: Growth & Retention Campaigns.

## Closing assertion

The framework is intended to enforce single ownership per decision, traceable artifacts, explicit dependency chains, and clear responsibility boundaries.

> [!warning] Source-model variance
> `Cycles` uses a compressed one-phase-per-milestone presentation. `Ticketing` and `Procedures` contain the fuller P1.1–P3.3 catalog used by the live Projects database. This difference is preserved rather than silently rewritten.
