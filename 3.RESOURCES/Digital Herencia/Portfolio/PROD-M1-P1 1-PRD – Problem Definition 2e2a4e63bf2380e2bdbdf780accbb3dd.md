# PROD-M1-P1.1-PRD – Problem Definition

Meetings: Sprint Planning @January 3, 2026  (../Meetings/Sprint%20Planning%20@January%203,%202026%202dda4e63bf23819ebd3dfd911c156c9b.md)
Projects: PROD-M1-P1.1-PRD – Problem Definition  (../Projects/PROD-M1-P1%201-PRD%20%E2%80%93%20Problem%20Definition%202dba4e63bf2380289bf7ff2b34b540bf.md)
Status: Done
Sub-item: T01 Market synthesis  (T01%20Market%20synthesis%202e2a4e63bf2380bfa0f8e6423f0a0534.md), T02 Tenant & RBAC assumptions  (T02%20Tenant%20&%20RBAC%20assumptions%202e2a4e63bf2380ccabdde52c0d32ff84.md), TO3 Draft PRDs (TO3%20Draft%20PRDs%202e2a4e63bf2381aabedcecaf530bf75a.md), T04 Pricing and packaging (T04%20Pricing%20and%20packaging%202e2a4e63bf2380a7aad4c7445e358ccc.md), T05 Feasibility review  (T05%20Feasibility%20review%202e2a4e63bf2380eab272dde50503d00b.md)
Tasks: T01 Market synthesis  (../Tasks/T01%20Market%20synthesis%202dba4e63bf2380b1a6e6e85c75e8f710.md), T02 Tenant & RBAC assumptions  (../Tasks/T02%20Tenant%20&%20RBAC%20assumptions%202dca4e63bf23800dad5bdfb13d26ae01.md), T03 Draft PRDs  (../Tasks/T03%20Draft%20PRDs%202dfa4e63bf2380138fc9edd08638bfd8.md), T04 Pricing & packaging  (../Tasks/T04%20Pricing%20&%20packaging%202e2a4e63bf2380889703e969877da590.md), T05 Feasibility review  (../Tasks/T05%20Feasibility%20review%202e2a4e63bf23807082c9caf65e5400ea.md)
Teams: Product Team (../Teams/Product%20Team%202d5a4e63bf23818da26bc86434571d4a.md)

# T01 Market Synthesis — Cannabis Retail Analytics Tool

---

### **Project Context**

You intend to build a data analytics platform tailored to cannabis retail operations, starting from structured CCD data and internal sales records, evolving into a product that satisfies three core user needs:

1. **Operational insight** — daily/weekly/monthly performance tracking
2. **Strategic decision support** — identifying trends, seasonality, and conversion opportunities (adult use → medical)
3. **Competitive benchmarking** — understanding where stores perform relative to peers

## Market Problem

Cannabis retailers operate with high regulatory complexity, fragmented data sources, and an absence of tooling that meaningfully synthesizes sales and compliance data into actionable business intelligence.

Specifically:

1. **Data Fragmentation**
    - CCD (Cannabis Compliance Data) exists but isn’t structured for insight.
    - Retailers often rely on manual spreadsheets and ad-hoc dashboards.
2. **Lack of Predictive Capability**
    - Existing tools show *historical numbers* but don’t answer trends or forecasting questions.
    - No aggregate market benchmarks exist for smaller operators to compare against.
3. **Decision Paralysis**
    - Store managers and executives lack reliable tools for pricing strategy, inventory planning, or regional segmentation.
4. **Regulatory + Compliance Complexity**
    - Compliance data is rich but not built into analytic products — stores must consult separate compliance portals.

## Evidence From Your Data

### **Regional Sales Patterns**

- Albuquerque and Sunland Park show distinct trends.
- Seasonality and volatility affect performance — e.g., Sunland Park shows higher range but less predictable patterns.
- Adult-use far outweighs medical (~73% vs ~27%), indicating conversion potential for medical markets.
- Your visualizations show monthly swings that could be valuable for staffing, promotions, and inventory planning.

### **Dashboard Prototype Screens**

Your fullstack app already demonstrates:

- Daily, monthly, category breakdowns
- Customer tables
- Transaction tables
- Product listings
- Admin/Performance views
    
    This proves the feasibility of your analytic stack.
    

### **Estimated Data Volume**

From your MongoDB collections:

- `salesData`: ~852 documents — enough to prototype models
- `productData`: ~14K documents — enough to do SKU-level analytics
- `transactionData`: ~100 docs — this likely scales as you move to real CCD ingestion
- Geographic streams and features already present for market segmentation

## Competitive Landscape

No major off-the-shelf BI product is tailored for cannabis retail compliance and performance simultaneously.

Generic BI tools (Tableau, PowerBI) and spreadsheets excel at reporting but lack domain semantics:

- No compliance regulations baked in
- No retail segmentation by licensee
- No built-in forecasting model for cannabis cycles

There is no canonical cannabis retail SaaS analytics platform *yet.*

## Unique Value Proposition

Cannabis Retail Analytics Platform that:

- **Ingests CCD + POS data** directly
- **Normalizes across dispensaries** (location, segment, SKU taxonomy)
- **Synthesizes insights** into action (seasonality, demand, pricing elasticity)
- **Combines compliance + performance** in a single dashboard
- Supports **predictive modeling** (growth forecasts, demand curves)

This is not a BI wrapper — it is **domain intelligence**.

## Primary Target Segments

1. **Multi-state operators (MSOs)**
    - Need to benchmark across stores
    - Interested in seasonality and performance signals
2. **Single state chains / independents**
    - Most retailers lack BI resources
    - Better data → better inventory strategy
3. **License compliance teams**
    - Need synthesized compliance + sales signals
4. **Consultants / brokers**
    - Can leverage analytics to advise operators
5. **Investors / acquirers**
    - Early access to normalized data is high value

## Market Signals

**Regulatory data democratizing sales channels**

- CCD data is public; you can ingest and standardize it
- Compliance requirements create a *need* for analytics tooling

**Medical vs Adult-use conversion**

Your synthesis shows clear adult-use dominance but medical revenue has structural levers that operators could exploit if they understand them.

**Geographic variance**

Not all regions behave the same — your data proves this.

## Strategic Hypotheses

1. **H1: Operators will pay for predictive insights that reduce inventory waste by at least 10%.**
2. **H2: Operators will adopt the tool if it integrates compliance signals with performance.**
3. **H3: A SaaS tier with forecasting and regional benchmarking will command higher ARPU than a pure POS reporting tool.**

These hypotheses are testable with your current prototype and early adopter interviews.

## Go-to-Market Positioning

**“The first cannabis retail analytics platform that turns compliance data + sales into easy-to-act business intelligence.”**

Messaging pillars:

1. **Normalized cannabis retail analytics**
2. **Actionable insights, not dashboards**
3. **Compliance + performance in one feed**

## Early MVP Feature Set

Baseline:

- Ingest CCD + POS feeds
- Standardized city/region trends
- Monthly/Quarterly dashboards
- Store benchmarking
- SKU & product category insights
- Alerts for outlier trends

Advanced (post-MVP):

- Predictive trend forecasting
- Price elasticity modeling
- Market share indicators
- Cohort analysis & retention curves

## Success Criteria for Market Synthesis

| Criterion | Metric |
| --- | --- |
| Validate target segment demand | 5+ operator interviews aligned with problem |
| Proof of data ingestion pipeline | Clean CCD + POS mapping within 1 week |
| Early prototype utility | 80% of testers find insights actionable |
| MVP buy-in | Letters of Intent or early pilots |

## Conclusion

You already have:

- Data
- Prototype
- Product intuition
- Market interactions
- A realistic pipeline of features
- Industry context

This market synthesis unifies those into a **decision-ready product strategy**.

# **T02 Tenant & RBAC Assumptions**

---

**Artifact:** Access Control & Multi-Tenancy Definition

**Title:** Tenant Model and Role-Based Access Control Assumptions

**Date:** January 2, 2026

**Owner:** Ivan P. Roman

**Team:** Engineering / Product

**Milestone:** M1 – Market Narrative

**Project:** P2 – Access Model Definition

**Artifact Type:** Product Architecture & Governance

## 1. Purpose

This document defines the **non-negotiable assumptions** governing:

- Multi-tenant data isolation
- Role-based and attribute-based access control
- User authority boundaries
- Feature visibility and action permissions

These assumptions are foundational.

All schema design, API behavior, UI affordances, and pricing tiers **must conform** to this model.

If a feature conflicts with this document, the feature is wrong.

## 2. Core Tenant Model

### 2.1 Definition of a Tenant

A **tenant** represents a **single operating entity** with competitive intent.

In the initial vertical, a tenant is:

> One cannabis dispensary or operating group, regardless of user count.
> 

All data is scoped to a tenant unless explicitly marked as **system-level**.

### 2.2 Tenant Isolation Guarantees

- Every record is associated with exactly **one tenant**
- No cross-tenant reads or writes are permitted
- Tenant isolation is enforced at the **database layer**, not just application logic
- UI filtering is considered cosmetic, not security

This is not optional.

“Oops” is not an acceptable failure mode.

### 2.3 Multi-Location Reality

- A tenant **may** operate multiple locations
- Locations are treated as **attributes**, not tenants
- Competitive comparisons are **always external**, never cross-tenant

A tenant never competes with itself.

The platform will not invent internal rivalries.

## 3. User Model Assumptions

### 3.1 Users Belong to Tenants

- Every user belongs to **exactly one tenant**
- Users cannot span multiple tenants simultaneously
- Consultants and analysts must be explicitly invited per tenant

No global “super analyst” nonsense.

### 3.2 Authentication vs Authorization

- **Authentication** answers: “Who is this?”
- **Authorization** answers: “What are they allowed to do?”

Clerk handles identity.

Competitive Advantage handles power.

## 4. Role-Based Access Control (RBAC)

### 4.1 Canonical Roles

The platform defines the following **first-class roles**:

| Role | Description |
| --- | --- |
| **Owner** | Full authority over tenant, billing, competitors, and strategy |
| **Manager** | Operational control and daily decision-making |
| **Analyst** | Read-only analytics, exports, and reports |
| **Viewer** | Dashboard visibility only |
| **Admin** | System-level configuration (non-tenant) |

Roles are explicit.

Implicit privilege escalation is forbidden.

### 4.2 Role Authority Boundaries

### Owner

- Manage users and roles
- Configure competitors
- Access all analytics and exports
- Approve billing and subscription changes

### Manager

- View and act on analytics
- Add notes, promotions, and operational inputs
- Cannot manage users or billing

### Analyst

- Read-only access to analytics
- Export data
- No configuration or mutation privileges

### Viewer

- Dashboard visibility only
- No exports
- No mutations

### Admin (System)

- Platform health
- Audit logs
- Support tooling
- **No competitive use**

Admins do not “peek at customer data for curiosity.”

That road leads to subpoenas.

## 5. Attribute-Based Access Control (ABAC)

RBAC alone is insufficient for real operations.

Attributes refine authority.

### 5.1 Core Attributes

Each user session may include:

- `tenant_id`
- `role`
- `location_id` (optional)
- `region`
- `feature_tier`

### 5.2 Attribute Constraints

Examples:

- A Manager may act **only** within assigned locations
- Certain features require a minimum `feature_tier`
- Regional restrictions may apply to geographic analytics

RBAC decides *who*.

ABAC decides *where and how far*.

## 6. Feature Gating Assumptions

### 6.1 Subscription Tier Enforcement

- Features are gated server-side
- UI hiding does not equal access control
- Downgrades revoke access immediately

If someone can still hit an endpoint, the system failed.

### 6.2 Competitive Sensitivity Rules

Certain data types are **always restricted**:

- Competitor raw identifiers
- Rank movement history
- Predictive outputs

These are **never exposed** to Viewer roles.

Competitive intelligence is a privilege, not a right.

## 7. Auditability & Accountability

### 7.1 Required Logging

The system must log:

- Role changes
- Competitor configuration changes
- Export actions
- Admin access events

Logs are immutable.

If it’s not logged, it didn’t happen.

### 7.2 Blame Is a Feature

Every meaningful action must be traceable to:

- A user
- A role
- A tenant
- A timestamp

Anonymous power breeds bad behavior.

## 8. Non-Goals (Explicit)

This system will **not**:

- Support shared tenants
- Support cross-tenant dashboards
- Allow “temporary admin” hacks
- Trust client-side enforcement
- Assume good faith

The platform is adversarial by design because the market is.

## 9. Summary (Read This Before Building Anything)

- Tenants are isolated, always
- Roles define authority, not UI
- Attributes refine scope
- Competitive data is sensitive by default
- Access control is product behavior

If someone asks “can we just—”

the answer is no unless this document says yes.

# T03 Competitive Advantage

**Analytics, Competitive Intelligence, and Operational Decision Platform**

## 1. Product Summary

Competitive Advantage is a **multi-tenant B2B analytics and intelligence platform** designed for regulated retail operators (initially cannabis dispensaries, extensible to other verticals).

The platform aggregates **sales, customer behavior, competitor menus, geographic performance, and operational signals**, transforming them into **actionable insights, forecasts, and recommendations**.

This is **not** a BI toy. It is an **operator dashboard** optimized for:

- Competitive positioning
- Revenue optimization
- Local market intelligence
- Tactical decision-making

## 2. Goals & Non-Goals

### 2.1 Goals

- Provide **near-real-time visibility** into sales and performance
- Enable **competitor-aware decision making**
- Surface **predictive insights**, not just historical charts
- Support **daily operational actions**, not quarterly PowerPoints
- Be extensible across industries and regions

### 2.2 Non-Goals

- General-purpose BI or ad-hoc SQL playground
- Consumer-facing analytics
- Manual data entry heavy workflows
- “AI chatbot” cosplay without operational grounding

## 3. Target Users

| Persona | Description |
| --- | --- |
| Owner / Operator | Strategic oversight, benchmarking, growth planning |
| GM / Store Manager | Daily sales optimization, promotions, staffing signals |
| Analyst / Consultant | Market intelligence, reporting, forecasting |
| Admin | User management, competitor configuration, audits |

## 4. Core Feature Areas

### 4.1 Dashboard

**Purpose:** Situational awareness in under 30 seconds.

**Capabilities**

- KPI tiles (sales, growth, rank, market share)
- Configurable widgets (persisted per user)
- Quick insights (top competitors, trends, anomalies)
- Export (PDF, Excel)
- Alerts (threshold-based + trend-based)

### 4.2 Sales Analytics

**Purpose:** Understand what is selling, when, and why.

**Capabilities**

- Daily, monthly, rolling-period views
- Medical vs adult-use splits
- Time-series analysis
- Market share visualizations
- Sales velocity & momentum indicators

### 4.3 Products & Menus

**Purpose:** Optimize assortment and pricing.

**Capabilities**

- Product-level sales trends
- Category performance
- Competitor product comparisons
- Ranking and deltas
- Stock-sensitive insights (where data exists)

### 4.4 Customers

**Purpose:** Revenue leverage through understanding behavior.

**Capabilities**

- Customer segmentation (demographic + behavioral)
- Cohort analysis
- LTV estimation
- Churn risk scoring
- Customer journey visualization

### 4.5 Geography

**Purpose:** Local market dominance, not abstract maps.

**Capabilities**

- Interactive map (zoom, pan)
- Dispensary markers with sales tooltips
- City-level performance metrics
- Regional comparisons
- Market density signals

### 4.6 Performance & Benchmarking

**Purpose:** Answer “Are we winning?” objectively.

**Capabilities**

- Dispensary vs dispensary comparisons
- Industry benchmarks
- Growth projections
- Rank movement tracking
- AI-generated performance narratives

### 4.7 Daily Operations (Calendar View)

**Purpose:** Bridge analytics and action.

**Capabilities**

- Calendar-based sales visualization
- Notes per day
- Promotion suggestions
- Trend-driven recommendations
- Event correlation

### 4.8 Admin & Governance

**Purpose:** Control, safety, and auditability.

**Capabilities**

- Role-based access control
- User activity logs
- Competitor configuration
- Automated workflows
- Data ingestion monitoring

## 5. Success Metrics

- Time-to-insight < 30s
- Weekly active usage by operators
- Feature adoption of recommendations
- Retention over 90 days
- Expansion to additional verticals

# T04 Pricing and Packaging

---

### **Context**

- Goal: Define clerk-backed subscriptions with feature gating and a tiered freemium SaaS model at fair-market price points for Competitive Advantage (cannabis retail analytics; multi-tenant B2B).
- Constraints: RBAC-aware, fast time-to-value, comparison-first UX; avoid feature sprawl; prepare for scale (Seats, tenants, data retention, API/export).

<aside>

## **Proposed Tiers (Monthly USD, annual at ~15% discount)**

- Free: $0
- Core: $49
- Pro: $149
- Scale: $399
(Validate with 30–45 day price tests; adjust ±15–20%.)

### **Entitlements by Tier**

- Free: 1 dispensary; 7-day history; Dashboard basic; no exports; no competitor compare; limited trending view; 2 Viewer seats.
- Core: Up to 3 dispensaries; 30-day history; basic compare (1 competitor); limited trending; Daily; 5 Viewer seats.
- Pro: Up to 10 dispensaries; 12-month history; multi-competitor compare; full trending; Event planning; exports; basic API; RBAC (Owner/Manager/Analyst + 10 Viewer seats).
- Scale: Unlimited dispensaries; 36-month history; benchmarking/projections; bulk exports/API; SSO; audit logs; Admin controls; unlimited Viewers.

### **Seat & Overage Model**

- Charge per paid role seat (Owner/Manager/Analyst). Viewers free within caps; overage billed per extra seat. Block or soft-limit unpaid overages with in-app upgrade prompts.

## **Feature Gating Mechanics (Clerk)**

- Store plan/seat/tenant in Clerk public metadata; sync via webhooks (`subscription.*`, `user.updated`).
- Central helper: `getCurrentPlan()` + `canAccess(feature, plan, role)` (deny by default).
- Enforce gating in server actions/middleware; do not trust client flags.
- Role-based nav visibility; hide ineligible actions, show locked states with “Upgrade to {tier}”.

### **Paywall & Trials**

- 14-day Pro trial; fallback to Core if unpaid.
- Always show locked items with clear CTA to upgrade; single “Manage plan” entry point.

### **Data Retention & Limits**

- Free 7d; Core 30d; Pro 12m; Scale 36m.
- API/export rate limits per tier; cap competitors, dispensaries, and history by tier.

### **Upgrade/Downgrade Rules**

- Upgrades immediate, prorated forward.
- Downgrades next cycle; entitlements reduced immediately to prevent overuse.

### **Fair-Market Rationale**

- Anchors aligned to SMB analytics willingness-to-pay tied to margin lift and multi-location value; Pro/Scale priced for operators with competitive benchmarking needs.

### **Risk & Mitigation**

- Data leakage: enforce tenant scoping + RBAC at server boundary.
- Shadow users: seat overage detection and soft-blocks.
- Price fit: run A/B on Core ($39–59) and Pro ($129–179); monitor conversion and expansion.

## Entitlement Matrix

| IA Section / Capability | Free | Core | Pro | Scale |
| --- | --- | --- | --- | --- |
| Dashboard (situational awareness) | Viewer only; 7d data | Viewer/Manager; 30d | Owner/Manager/Analyst; 12m | All roles; 36m, audit log |
| Daily (actions, notes) | None | Manager (limited notes) | Manager/Owner (actions, notes); export | All roles; workflow API |
| Sales (time-series) | Viewer; 7d | Manager; 30d | Manager/Analyst; 12m; export | All roles; 36m; projections |
| Products (ranking, dead SKUs) | Basic view; no compare | Compare 1 competitor; 30d | Multi-competitor; 12m; pricing bands | Unlimited compare; bulk export/API |
| Customers (segments/cohorts) | Not available | Limited segments; 30d | Full segments/cohorts; 12m | Advanced cohorts; 36m; CSV/API |
| Market (geo, density) | Map snapshot | City-level | Region/state; trend signals | Full geography; density + projections |
| Performance (benchmark, rank) | Not available | Basic rank | Full benchmark, multi-peer | Advanced bench + projections |
| Admin (RBAC, audit) | Not available | Owner only: users/roles | Owner: users/roles; SSO optional | Owner: SSO, SCIM, audit logs |

Role/seat notes:

- Paid seats: Owner, Manager, Analyst. Viewers included but capped per tier (Free 2, Core 5, Pro 15, Scale unlimited).
- Data retention: Free 7d, Core 30d, Pro 12m, Scale 36m.
- Competitor compare limits: Free none, Core 1 competitor, Pro multi, Scale unlimited.
- Exports/API: Pro (basic CSV/API), Scale (bulk exports, higher rate limits).
- SSO/Audit/SCIM: Scale only; optional add-on at Pro.

# T05 Feasibility Review

---

Competitive Advantage (M1 / P1.1) — feasibility assessment synthesizing T01–T04 deliverables.

Executive summary

- Feasible to ship as an MVP if scope stays constrained to (1) ingest internal sales + CCD-derived signals, (2) deliver operator-first dashboards with a small set of actionable insights, and (3) enforce tenant isolation + RBAC/ABAC + entitlements server-side from day 1.
- Market problem is real (fragmented data + regulatory complexity + decision paralysis). Initial data evidence shows meaningful regional/segment patterns worth productizing.
- Primary feasibility risks: data reliability/coverage, tenant isolation/security correctness, and cost/complexity creep (especially if competitive scraping expands too early).
- Recommendation: GO (conditional) for MVP build, gated by the checklist in this document.

Scope assessed

In-scope MVP

- Multi-tenant analytics for regulated retail operators (initially cannabis dispensaries; extensible later).
- Core dashboard + sales analytics + limited market/competitive comparisons + export.
- Alerts (simple thresholds + trend deltas).
- RBAC/ABAC with deny-by-default enforcement at every query boundary.
- Tiered entitlements (Free/Core/Pro/Scale) enforced server-side.

Explicit non-goals (MVP)

- General-purpose BI or ad-hoc SQL playground.
- Consumer-facing analytics.
- Manual data entry heavy workflows.
- “AI chatbot” experiences without operational grounding.

Feasibility by domain

Data feasibility

- MVP-scale volume is feasible; the bigger risk is consistency/coverage rather than raw size.
- Mitigation: canonical schemas + validation, ingestion observability, and coverage metrics (stores/regions/days).

Technical feasibility (architecture)

- Tenant isolation is feasible only with database/query-layer enforcement (UI filtering is cosmetic).
- RBAC + ABAC is feasible with clear role boundaries and a single deny-by-default authorization layer.
- Entitlements are feasible via a centralized tier→capabilities mapping, enforced server-side for every request.

Security & compliance feasibility

- Primary risk: cross-tenant data leakage and improper “admin visibility.”
- Mitigation: tenant ID required for every query, server-side scoping, audit logging for sensitive access, and isolation-focused tests.

Commercial feasibility (pricing)

- Tiering is feasible with retention windows, compare limits, export/API gating, and seat-based controls.
- Mitigation: start with simple tiers, instrument usage, and validate willingness-to-pay with operator interviews.

Go / No-Go checklist (MVP gate)

- [ ]  Tenant isolation enforced at database/query layer and covered by tests.
- [ ]  RBAC roles implemented and validated against real operator workflows.
- [ ]  Entitlements enforced server-side (no front-end-only gating).
- [ ]  Ingestion pipeline has schema validation + observability + failure alerting.
- [ ]  MVP dashboard supports at least 3 repeatable operator actions.
- [ ]  Legal/ToS review completed for any competitive data ingestion approach.
- [ ]  MVP success metrics defined (time-to-insight, retention, action adoption).

Open items / stakeholder feedback needed

- Product: confirm the exact “3 operator actions” we optimize for first.
- Engineering: confirm ingestion approach, tenant enforcement design, and isolation test strategy.
- Design: confirm v1 dashboard IA for “30-second clarity.”
- Marketing: confirm positioning language and boundary between “insight” and “recommendation.”

Traceability

- Inputs synthesized from T01 (market + data evidence), T02 (tenant/RBAC assumptions), T03 (PRD structure), and T04 (pricing/entitlements enforcement).