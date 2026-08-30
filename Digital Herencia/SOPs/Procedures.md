---
title: Procedures
entity: sop
document_id: SOP-PROD-DELIVERY-001
version: 1.0
source_status: Canonical
owner: Operations
effective_date: 2025-12-29
source: Notion
source_url: https://app.notion.com/2d8a4e63bf2380e8b0eddb294b2bc6f8
tags:
  - digital-herencia/sop
  - milestones
  - phases
---

# SaaS Product Delivery: Milestones & Phases Framework

## Purpose

This SOP defines the standard milestone and phase structure used to plan, execute, and govern SaaS product development. It is intended to align business, product, design, engineering, and marketing; establish predictable checkpoints; ensure auditability/accountability; and reduce execution risk and scope ambiguity.

## Definitions

### Milestone

A business-significant delivery checkpoint representing a validated state of the product. Milestones are outcome-driven, not activity-driven.

### Phase

A bounded execution period within a milestone, typically aligned to two-week sprints, used to organize work types, sequence risk reduction, and structure reviews/handoffs.

### Relationship

```text
Milestone = Why we are building
Phase     = How we progress toward it
Sprint    = How teams execute day-to-day
```

## M1 — Foundation & Architecture

Goal: validate product direction and technical foundation before full-scale development. Risk reduction is the priority.

### P1.1 — Product Discovery & Definition

Primary owners: Product, Operations. Supporting: Design, Marketing.

Key activities include market/customer synthesis, ICP/persona definition, pricing/packaging hypotheses, risk/compliance identification, and success criteria.

Primary outputs: PRD, initial roadmap, feature-gating assumptions, business constraints.

### P1.2 — Platform Scaffolding & Systems Setup

Primary owners: Engineering, Operations. Supporting: Design.

Activities: repository and CI/CD setup, authentication/tenant scaffolding, database baseline, design-system alignment, operational tooling.

Outputs: running development environment, core integrations, design primitives, operational-readiness baseline.

### P1.3 — Internal Alpha Validation

Primary owner: Engineering. Supporting: Product, Design, Operations.

Activities: internal deployment, integration testing, security validation, UX flow validation, observability baseline.

Outputs: internal alpha environment, known-risk register, Go/No-Go recommendation.

## M2 — MVP Build & Launch

Goal: deliver a publicly usable, sellable MVP, begin revenue where applicable, and collect real-user feedback.

### P2.1 — Core Feature Implementation

Primary owners: Engineering, Product. Supporting: Design.

Outputs include feature-complete MVP, deployment-ready builds, and release notes.

### P2.2 — Quality Assurance & Launch Readiness

Primary owners: Engineering, Operations. Supporting: Product, Design.

Activities include regression, performance/load validation, billing edge cases, accessibility checks, and incident-response readiness.

Outputs: launch approval, rollback plan, monitoring dashboards.

### P2.3 — Soft Launch & Feedback Loop

Primary owners: Marketing, Product. Supporting: Operations, Engineering.

Activities: controlled public release, onboarding, CRM feedback capture, usage analytics, rapid blocker iteration.

Outputs: user-feedback reports, conversion metrics, MVP-validation assessment.

## M3 — Expansion & Hardening

Goal: transition from MVP to a stable, scalable, commercially credible platform.

### P3.1 — Feature Expansion

Primary owners: Product, Engineering. Supporting: Design.

Outputs: expanded feature set, updated documentation, upsell-ready capabilities.

### P3.2 — Platform Hardening

Primary owners: Engineering, Operations.

Activities: performance optimization, security patching, permission audits, observability improvements, cost optimization.

Outputs: hardened platform, security/performance reports, reduced operational risk.

### P3.3 — Growth Enablement

Primary owners: Marketing, Operations. Supporting: Product.

Activities: marketing automation, sales enablement, customer-lifecycle optimization, retention/expansion.

Outputs: growth campaigns, refined positioning, scalable operating model.

## Governance & review cadence

| Event | Timing | Participants |
|---|---|---|
| Milestone Kickoff | Start of milestone | Operations, Product, Engineering |
| Phase Review | End of each phase | All teams |
| Milestone Review | End of milestone | Leadership |
| Retrospective | Post-milestone | All teams |

## Compliance

Deviation requires written approval from Operations, documented rationale, and an updated risk assessment.
