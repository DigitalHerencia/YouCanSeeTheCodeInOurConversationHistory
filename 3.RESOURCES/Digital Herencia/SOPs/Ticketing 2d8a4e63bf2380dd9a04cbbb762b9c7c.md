# Ticketing

# 📘 Standard Operating Procedure (SOP)

## Software Studio SaaS Delivery, Operations & Ticketing System

**Document ID:** SOP-STUDIO-DELIVERY-001

**Version:** 2.0

**Status:** Canonical

**Owner:** Operations

**Applies To:** All SaaS products built, marketed, sold, and operated by the studio

**Tech Context:** Modern multi-tenant SaaS using Next.js, React, Prisma, Neon Postgres, Clerk, shadcn/ui

---

## 1. Scope & Intent

This SOP defines the **end-to-end operating model** for a software studio that:

- Builds SaaS products
- Sells subscriptions
- Operates as a legally formed LLC
- Tracks billable time and cost
- Runs multiple teams with clear ownership

This document governs:

- Team structure
- Milestones and phases
- Projects and daily tasks
- Ticketing and work codes
- Time tracking and accountability

If work is not represented here, it is **out of scope**.

---

## 2. Teams, Roles & Responsibilities (Authoritative)

Only the following teams exist.

### 2.1 Operations

**Scope:** Business, finance, accounting, customers, CRM, sales, billing, legal, LLC admin, OKRs, compliance

**Core Responsibilities**

- Company governance and finance
- Customer lifecycle and revenue operations
- OKR definition and enforcement
- Risk, compliance, and policy
- Vendor and tooling oversight

---

### 2.2 Product

**Scope:** Product truth, scope, roadmap, requirements

**Core Responsibilities**

- Problem definition
- PRDs and roadmap
- Pricing and packaging logic
- Feature prioritization
- Acceptance criteria

---

### 2.3 Design

**Scope:** UX, UI, accessibility, interaction systems

**Core Responsibilities**

- User flows and IA
- Design system and components
- Prototypes and specs
- Accessibility and usability

---

### 2.4 Engineering

**Scope:** Architecture, implementation, security, performance

**Core Responsibilities**

- System design
- Code implementation
- Auth, RBAC, billing enforcement
- CI/CD, testing, observability
- Security and performance

---

### 2.5 Marketing

**Scope:** Positioning, messaging, demand, growth

**Core Responsibilities**

- Narrative and positioning
- Launch campaigns
- Content and social
- Funnel optimization
- Growth analytics

---

## 3. Delivery Model Overview

### 3.1 Canonical Structure

```
Milestone
 └── Phase
     └── Project
         └── Ticket (daily, billable unit)

```

---

## 4. Milestones & Phases (Industry-Standard Model)

### Milestone M1: Foundation & Architecture

**Goal:** Reduce product, technical, and business risk before public exposure.

**Phases**

- P1.1 Product Discovery & Business Definition
- P1.2 Platform & Operations Scaffolding
- P1.3 Internal Alpha Validation

---

### Milestone M2: MVP Build & Launch

**Goal:** Deliver a usable, sellable MVP and validate market demand.

**Phases**

- P2.1 Core Feature Implementation
- P2.2 QA & Launch Readiness
- P2.3 Soft Launch & Feedback Loop

---

### Milestone M3: Expansion & Hardening

**Goal:** Scale features, stabilize platform, and enable growth.

**Phases**

- P3.1 Feature Expansion
- P3.2 Platform Hardening & Security
- P3.3 Growth Enablement

---

## 5. Ticketing & Work Code System

### 5.1 Work Code Format

```
[TEAM]-[MILESTONE]-[PHASE]-[PROJECT]-[TICKET]

```

Example:

```
ENG-M2-P2.1-RBAC-T03

```

---

### 5.2 Ticket Rules

- One ticket = ≤ 1 workday
- Tickets are billable units
- Tickets roll up to projects
- Projects roll up to phases and milestones
- Time is logged daily

---

## 6. COMPLETE PROJECT & TICKET CATALOG

Below is the **complete, normalized set**.

All projects have **daily executable tickets**.

---

# A. OPERATIONS

---

## M1 – Foundation & Architecture

### P1.1 Product Discovery & Business Definition

**Project:** OPS-M1-P1.1-GOV – LLC & Governance

- T01 Draft operating agreement
- T02 Execute IP assignments
- T03 Set up banking & accounting
- T04 Define vendor authority
- T05 Archive legal documents

**Project:** OPS-M1-P1.1-OKR – OKRs & Constraints

- T01 Define company objectives
- T02 Define key results
- T03 Align team OKRs
- T04 Align budgets to OKRs
- T05 Publish OKRs

---

### P1.2 Platform & Operations Scaffolding

**Project:** OPS-M1-P1.2-CUSTOPS – Customer & Revenue Ops

- T01 Define customer lifecycle
- T02 Configure CRM pipelines
- T03 Define billing policies
- T04 Define refund/cancellation rules
- T05 Define support workflows

---

### P1.3 Internal Alpha Validation

**Project:** OPS-M1-P1.3-RISK – Risk & Readiness

- T01 Legal risk review
- T02 Financial exposure review
- T03 Customer policy validation
- T04 Alpha readiness sign-off
- T05 Go/No-Go recommendation

---

## M2 – MVP Build & Launch

### P2.2 QA & Launch Readiness

**Project:** OPS-M2-P2.2-LAUNCHOPS – Launch Operations

- T01 Validate billing flows
- T02 Finalize policies
- T03 Prepare support escalation
- T04 Incident response plan
- T05 Launch authorization

---

## M3 – Expansion & Hardening

### P3.2 Platform Hardening & Security

**Project:** OPS-M3-P3.2-COMPLY – Compliance & Scale

- T01 Admin access audit
- T02 Data retention review
- T03 Enterprise contracts
- T04 Financial forecast update
- T05 Executive ops report

---

# B. PRODUCT

---

## M1 – Foundation & Architecture

### P1.1 Product Discovery & Business Definition

**Project:** PROD-M1-P1.1-PRD – Problem Definition

- T01 Market synthesis
- T02 Tenant & RBAC assumptions
- T03 Draft PRDs
- T04 Pricing & packaging
- T05 Feasibility review

---

### P1.3 Internal Alpha Validation

**Project:** PROD-M1-P1.3-ALPHA – Alpha Validation

- T01 Feature review
- T02 UX flow validation
- T03 Risk register review
- T04 Scope adjustments
- T05 MVP readiness sign-off

---

## M2 – MVP Build & Launch

### P2.1 Core Feature Implementation

**Project:** PROD-M2-P2.1-MVP – MVP Scope Control

- T01 Lock MVP scope
- T02 Clarify requirements
- T03 Backlog grooming
- T04 Change control decisions
- T05 Define release criteria

---

### P2.3 Soft Launch & Feedback Loop

**Project:** PROD-M2-P2.3-FEEDBACK – Feedback Analysis

- T01 Review customer feedback
- T02 Analyze usage metrics
- T03 Analyze conversions
- T04 Validate MVP outcomes
- T05 Adjust roadmap

---

## M3 – Expansion & Hardening

### P3.1 Feature Expansion

**Project:** PROD-M3-P3.1-ADV – Advanced Planning

- T01 Prioritize features
- T02 Define enterprise needs
- T03 Non-functional specs
- T04 Update roadmap
- T05 Draft next PRDs

---

# C. DESIGN

---

## M1 – Foundation & Architecture

### P1.1 Product Discovery & Business Definition

**Project:** DES-M1-P1.1-UXARCH – UX Architecture

- T01 Core user flows
- T02 Information architecture
- T03 Design system alignment
- T04 Low-fidelity prototypes
- T05 Handoff to Engineering

---

## M2 – MVP Build & Launch

### P2.1 Core Feature Implementation

**Project:** DES-M2-P2.1-MVPUI – MVP UI

- T01 High-fidelity designs
- T02 Responsive layouts
- T03 Component specs
- T04 Accessibility review
- T05 Implementation review

---

## M3 – Expansion & Hardening

### P3.1 Feature Expansion

**Project:** DES-M3-P3.1-ADVUX – Advanced UX

- T01 Advanced dashboards
- T02 Data density optimization
- T03 Usability improvements
- T04 Mobile refinement
- T05 Design documentation

---

# D. ENGINEERING

---

## M1 – Foundation & Architecture

### P1.2 Platform & Operations Scaffolding

**Project:** ENG-M1-P1.2-SCAFF – Architecture Setup

- T01 Repo initialization
- T02 Next.js configuration
- T03 Prisma schema
- T04 Clerk integration
- T05 CI/CD setup

---

### P1.3 Internal Alpha Validation

**Project:** ENG-M1-P1.3-ALPHA – Alpha Build

- T01 Feature integration
- T02 Security baseline
- T03 Observability setup
- T04 Internal testing
- T05 Alpha deployment

---

## M2 – MVP Build & Launch

### P2.1 Core Feature Implementation

**Project:** ENG-M2-P2.1-MVP – MVP Build

- T01 Tenant isolation
- T02 RBAC enforcement
- T03 Billing webhooks
- T04 Core UI implementation
- T05 Tests & deployment

---

## M3 – Expansion & Hardening

### P3.2 Platform Hardening & Security

**Project:** ENG-M3-P3.2-HARD – Hardening

- T01 Performance optimization
- T02 Security patches
- T03 Permission audits
- T04 Bug fixes
- T05 Monitoring improvements

---

# E. MARKETING

---

## M1 – Foundation & Architecture

### P1.1 Product Discovery & Business Definition

**Project:** MKT-M1-P1.1-POS – Positioning

- T01 Positioning statement
- T02 Messaging framework
- T03 Educational content
- T04 Social signal monitoring
- T05 Product language feedback

---

## M2 – MVP Build & Launch

### P2.3 Soft Launch & Feedback Loop

**Project:** MKT-M2-P2.3-LAUNCH – Launch Campaign

- T01 Launch assets
- T02 Campaign execution
- T03 Traffic generation
- T04 Engagement monitoring
- T05 Messaging optimization

---

## M3 – Expansion & Hardening

### P3.3 Growth Enablement

**Project:** MKT-M3-P3.3-GROW – Growth

- T01 Feature promotion
- T02 Case studies
- T03 Funnel optimization
- T04 Upsell support
- T05 CAC & ROI reporting

---

## 7. Enforcement Statement

This SOP defines:

- The complete studio operating model
- The complete ticket universe
- The complete delivery lifecycle

Every hour worked must map to a ticket defined here.

Every ticket must be billable, traceable, and auditable.

If it is not here, it does not exist.

---

If you want next, the **only sensible next steps** are:

- Spreadsheet-ready export
- Jira/Linear import schema
- Cost model per ticket
- Solo-founder reduced-mode variant