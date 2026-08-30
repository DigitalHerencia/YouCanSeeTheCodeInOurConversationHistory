---
title: Ticketing
entity: sop
document_id: SOP-STUDIO-DELIVERY-001
version: 2.0
source_status: Canonical
owner: Operations
source: Notion
source_url: https://app.notion.com/2d8a4e63bf2380dd9a04cbbb762b9c7c
tags:
  - digital-herencia/sop
  - ticketing
  - delivery
---

# Standard Operating Procedure
## Software Studio SaaS Delivery, Operations & Ticketing System

## 1. Scope & intent

This SOP governs a software studio that builds SaaS products, sells subscriptions, operates as a legally formed LLC, tracks billable time/cost, and runs multiple teams with clear ownership.

It governs:

- team structure
- milestones and phases
- projects and daily tasks
- ticketing and work codes
- time tracking and accountability

The source enforcement statement is uncompromising: if work is not represented in the system, it is out of scope.

## 2. Teams

### Operations
Business, finance, accounting, customers, CRM, sales, billing, legal, LLC administration, OKRs, compliance.

### Product
Product truth, scope, roadmap, requirements.

### Design
UX, UI, accessibility, interaction systems.

### Engineering
Architecture, implementation, security, performance.

### Marketing
Positioning, messaging, demand, growth.

## 3. Delivery model

```text
Milestone
 └── Phase
     └── Project
         └── Ticket (daily, billable unit)
```

## 4. Milestones and phases

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

## 5. Ticketing & work codes

### Work-code format

```text
[TEAM]-[MILESTONE]-[PHASE]-[PROJECT]-[TICKET]
```

Example: `ENG-M2-P2.1-RBAC-T03`.

### Ticket rules

- One ticket is no more than one workday.
- Tickets are billable units.
- Tickets roll up to projects.
- Projects roll up to phases and milestones.
- Time is logged daily.

## 6. Normalized project and ticket catalog

### Operations

**OPS-M1-P1.1-GOV — LLC & Governance**
- T01 Draft operating agreement
- T02 Execute IP assignments
- T03 Set up banking & accounting
- T04 Define vendor authority
- T05 Archive legal documents

**OPS-M1-P1.1-OKR — OKRs & Constraints**
- T01 Define company objectives
- T02 Define key results
- T03 Align team OKRs
- T04 Align budgets to OKRs
- T05 Publish OKRs

**OPS-M1-P1.2-CUSTOPS — Customer & Revenue Ops**
- T01 Define customer lifecycle
- T02 Configure CRM pipelines
- T03 Define billing policies
- T04 Define refund/cancellation rules
- T05 Define support workflows

**OPS-M1-P1.3-RISK — Risk & Readiness**
- T01 Legal risk review
- T02 Financial exposure review
- T03 Customer policy validation
- T04 Alpha readiness sign-off
- T05 Go/No-Go recommendation

**OPS-M2-P2.2-LAUNCHOPS — Launch Operations**
- T01 Validate billing flows
- T02 Finalize policies
- T03 Prepare support escalation
- T04 Incident response plan
- T05 Launch authorization

**OPS-M3-P3.2-COMPLY — Compliance & Scale**
- T01 Admin access audit
- T02 Data retention review
- T03 Enterprise contracts
- T04 Financial forecast update
- T05 Executive ops report

### Product

**PROD-M1-P1.1-PRD — Problem Definition**
- T01 Market synthesis
- T02 Tenant & RBAC assumptions
- T03 Draft PRDs
- T04 Pricing & packaging
- T05 Feasibility review

**PROD-M1-P1.3-ALPHA — Alpha Validation**
- T01 Feature review
- T02 UX flow validation
- T03 Risk register review
- T04 Scope adjustments
- T05 MVP readiness sign-off

**PROD-M2-P2.1-MVP — MVP Scope Control**
- T01 Lock MVP scope
- T02 Clarify requirements
- T03 Backlog grooming
- T04 Change control decisions
- T05 Define release criteria

**PROD-M2-P2.3-FEEDBACK — Feedback Analysis**
- T01 Review customer feedback
- T02 Analyze usage metrics
- T03 Analyze conversions
- T04 Validate MVP outcomes
- T05 Adjust roadmap

**PROD-M3-P3.1-ADV — Advanced Planning**
- T01 Prioritize features
- T02 Define enterprise needs
- T03 Non-functional specs
- T04 Update roadmap
- T05 Draft next PRDs

### Design

**DES-M1-P1.1-UXARCH — UX Architecture**
- T01 Core user flows
- T02 Information architecture
- T03 Design system alignment
- T04 Low-fidelity prototypes
- T05 Handoff to Engineering

**DES-M2-P2.1-MVPUI — MVP UI**
- T01 High-fidelity designs
- T02 Responsive layouts
- T03 Component specs
- T04 Accessibility review
- T05 Implementation review

**DES-M3-P3.1-ADVUX — Advanced UX**
- T01 Advanced dashboards
- T02 Data density optimization
- T03 Usability improvements
- T04 Mobile refinement
- T05 Design documentation

### Engineering

**ENG-M1-P1.2-SCAFF — Architecture Setup**
- T01 Repo initialization
- T02 Next.js configuration
- T03 Prisma schema
- T04 Clerk integration
- T05 CI/CD setup

**ENG-M1-P1.3-ALPHA — Alpha Build**
- T01 Feature integration
- T02 Security baseline
- T03 Observability setup
- T04 Internal testing
- T05 Alpha deployment

**ENG-M2-P2.1-MVP — MVP Build**
- T01 Tenant isolation
- T02 RBAC enforcement
- T03 Billing webhooks
- T04 Core UI implementation
- T05 Tests & deployment

**ENG-M3-P3.2-HARD — Hardening**
- T01 Performance optimization
- T02 Security patches
- T03 Permission audits
- T04 Bug fixes
- T05 Monitoring improvements

### Marketing

**MKT-M1-P1.1-POS — Positioning**
- T01 Positioning statement
- T02 Messaging framework
- T03 Educational content
- T04 Social signal monitoring
- T05 Product language feedback

**MKT-M2-P2.3-LAUNCH — Launch Campaign**
- T01 Launch assets
- T02 Campaign execution
- T03 Traffic generation
- T04 Engagement monitoring
- T05 Messaging optimization

**MKT-M3-P3.3-GROW — Growth**
- T01 Feature promotion
- T02 Case studies
- T03 Funnel optimization
- T04 Upsell support
- T05 CAC & ROI reporting

## 7. Enforcement

The source defines this as the complete studio operating model, complete ticket universe, and complete delivery lifecycle. Every hour worked is expected to map to a defined ticket; tickets are expected to be billable, traceable, and auditable.
