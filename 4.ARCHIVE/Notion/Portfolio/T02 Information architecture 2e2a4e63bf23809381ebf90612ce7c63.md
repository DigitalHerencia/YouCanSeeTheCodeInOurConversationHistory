# T02 Information architecture

Meetings: Design Meeting @January 2, 2026  (../Meetings/Design%20Meeting%20@January%202,%202026%202dca4e63bf2381ff835df0fa6770c640.md)
Parent item: DES-M1-P1.1-UXARCH – UX Architecture  (DES-M1-P1%201-UXARCH%20%E2%80%93%20UX%20Architecture%202e2a4e63bf23804a97a8d04404f1a5ee.md)
Projects: DES-M1-P1.1-UXARCH – UX Architecture  (../Projects/DES-M1-P1%201-UXARCH%20%E2%80%93%20UX%20Architecture%202dba4e63bf2380248131e5d5013a6474.md)
Status: Not started
Tasks: T02 Information architecture  (../Tasks/T02%20Information%20architecture%202dca4e63bf2380c2a786e8bb473b9554.md)
Teams: Design Team (../Teams/Design%20Team%202d5a4e63bf238097bffedd7bde5a3f69.md)

**Artifact:** Product Navigation & Structural Definition

**Title:** Page and Section Hierarchy for Competitive Advantage

**Date:** January 2, 2026

**Owner:** Ivan P. Roman

**Team:** Product / Design / Engineering

**Milestone:** M1 – Market Narrative

**Project:** P2 – Product Structure

**Artifact Type:** Information Architecture

---

## 1. Purpose

This document defines the **canonical page hierarchy and naming system** for Competitive Advantage.

Its goals:

- Keep user flows aligned with **daily operational decision-making**
- Reinforce the product’s **competitive intelligence posture**
- Prevent feature sprawl and semantic drift
- Ensure RBAC and feature gating map cleanly to navigation

If a screen cannot be placed cleanly in this hierarchy, the screen is suspect.

---

## 2. Core IA Principles

These are not suggestions.

### 2.1 Operator-First, Not Analyst-First

- Pages answer **questions operators actually ask**
- No abstract “analytics layers”
- No dumping ground called “Insights”

---

### 2.2 Temporal Gravity

The IA follows **decision cadence**, not data taxonomy.

- “What’s happening right now?”
- “What should I do today?”
- “How are we performing?”
- “Who are we up against?”

---

### 2.3 Competitive Framing Is Explicit

Competition is not hidden behind filters.

If users are competing, the UI should admit it openly.

---

### 2.4 RBAC-Aware by Construction

Navigation visibility must map directly to role authority.

If a role cannot act on a page, the page should not exist for them.

---

## 3. Top-Level Navigation (Primary)

This is the **left rail / primary nav**.

Order matters.

```
Dashboard
Daily
Sales
Products
Customers
Market
Performance
Admin

```

No more. No less.

---

## 4. Section-by-Section Breakdown

### 4.1 **Dashboard**

**Purpose:** Situational awareness in under 30 seconds.

**Primary Question:**

> “What’s going on right now?”
> 

**Contents:**

- KPI tiles (sales, growth, rank, market share)
- Alerts & anomalies
- Quick competitor movement
- Snapshot trends

**Notes:**

- Zero configuration required to be useful
- Customization is additive, not mandatory
- Read-only for Viewer role

This page should feel slightly stressful. That’s the point.

---

### 4.2 **Daily**

**Purpose:** Bridge analytics and action.

**Primary Question:**

> “What should I do today?”
> 

**Subsections:**

- Calendar view (sales + events)
- Daily notes
- Promotion recommendations
- Trend flags

**Notes:**

- This is where the product earns its keep
- Mutations live here (notes, actions)
- Managers live here, Analysts mostly don’t

If someone skips this page entirely, they’re probably not your user.

---

### 4.3 **Sales**

**Purpose:** Understand revenue dynamics over time.

**Primary Question:**

> “How are we selling, and why?”
> 

**Subsections:**

- Overview (daily / monthly / rolling)
- Medical vs adult-use splits
- Velocity & momentum
- Market share views

**Notes:**

- Time-series first, tables second
- No raw exports at top level
- Designed for pattern recognition, not accounting

This is not QuickBooks cosplay.

---

### 4.4 **Products**

**Purpose:** Optimize assortment and pricing.

**Primary Question:**

> “What’s working on the shelf?”
> 

**Subsections:**

- Product performance
- Category trends
- Competitor product comparisons
- Rankings and deltas

**Notes:**

- Every product exists in a competitive context
- Dead SKUs are surfaced aggressively
- “Nice-to-know” metrics are intentionally absent

This page should make underperformers uncomfortable.

---

### 4.5 **Customers**

**Purpose:** Revenue leverage through behavior.

**Primary Question:**

> “Who’s buying, and how are they changing?”
> 

**Subsections:**

- Segmentation
- Cohorts
- LTV & churn signals
- Customer journey views

**Notes:**

- No CRM pretense
- No inbox, no tickets
- Customers are signals, not relationships

If someone asks for messaging tools here, send them elsewhere.

---

### 4.6 **Market**

**Purpose:** External competitive awareness.

**Primary Question:**

> “What does the battlefield look like?”
> 

**Subsections:**

- Geography (map-first)
- City performance
- Market density
- External trend signals

**Notes:**

- This is explicitly *not* internal performance
- Competitors are first-class citizens here
- Maps are operational, not decorative

This is where “local” stops being a buzzword.

---

### 4.7 **Performance**

**Purpose:** Objective competitive benchmarking.

**Primary Question:**

> “Are we winning?”
> 

**Subsections:**

- Dispensary vs dispensary comparisons
- Rank movement
- Benchmarks
- Growth projections

**Notes:**

- Comparison is opt-in but central
- Narrative summaries are allowed here
- This page settles arguments

If someone wants vibes, they can leave.

---

### 4.8 **Admin**

**Purpose:** Governance and control.

**Primary Question:**

> “Who has power, and how is it configured?”
> 

**Subsections:**

- Users & roles
- Competitor configuration
- Activity logs
- Automated workflows

**Notes:**

- Hidden entirely for non-authorized roles
- No analytics here
- No opinions here

Admin is boring by design. That’s a feature.

---

## 5. Secondary Navigation Rules

- Subsections must be nouns, not verbs
- No section exceeds 5 subsections without review
- If two pages answer the same question, one is wrong

---

## 6. Naming Guardrails

**Allowed**

- Direct
- Concrete
- Competitive
- Operational

**Forbidden**

- “Insights”
- “Intelligence”
- “Hub”
- “Center”
- “Solutions”

If the name sounds like a SaaS landing page headline, it’s out.

---

## 7. Alignment Check (Non-Negotiable)

Each top-level section maps cleanly to the product problem:

| Problem | Section |
| --- | --- |
| Situational awareness | Dashboard |
| Daily action | Daily |
| Revenue understanding | Sales |
| Shelf optimization | Products |
| Buyer behavior | Customers |
| External context | Market |
| Competitive truth | Performance |
| Control & safety | Admin |

No orphan pages. No philosophical drift.

---

## 8. Summary

This IA:

- Forces competitive framing
- Respects operator time
- Aligns with RBAC and tenancy
- Prevents analytics theater

If a future feature doesn’t fit, the feature is guilty until proven innocent.