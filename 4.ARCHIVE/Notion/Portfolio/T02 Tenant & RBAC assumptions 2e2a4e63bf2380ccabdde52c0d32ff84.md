# T02 Tenant & RBAC assumptions

Meetings: Daily Standup @January 2, 2026  (../Meetings/Daily%20Standup%20@January%202,%202026%202dca4e63bf23818cbda4cd99d90eaba6.md)
Parent item: PROD-M1-P1.1-PRD – Problem Definition  (PROD-M1-P1%201-PRD%20%E2%80%93%20Problem%20Definition%202e2a4e63bf2380e2bdbdf780accbb3dd.md)
Projects: PROD-M1-P1.1-PRD – Problem Definition  (../Projects/PROD-M1-P1%201-PRD%20%E2%80%93%20Problem%20Definition%202dba4e63bf2380289bf7ff2b34b540bf.md)
Status: Not started
Tasks: T02 Tenant & RBAC assumptions  (../Tasks/T02%20Tenant%20&%20RBAC%20assumptions%202dca4e63bf23800dad5bdfb13d26ae01.md)
Teams: Product Team (../Teams/Product%20Team%202d5a4e63bf23818da26bc86434571d4a.md)

## **Tenant & RBAC Assumptions**

---

**Artifact:** Access Control & Multi-Tenancy Definition

**Title:** Tenant Model and Role-Based Access Control Assumptions

**Date:** January 2, 2026

**Owner:** Ivan P. Roman

**Team:** Engineering / Product

**Milestone:** M1 – Market Narrative

**Project:** P2 – Access Model Definition

**Artifact Type:** Product Architecture & Governance

---

## 1. Purpose

This document defines the **non-negotiable assumptions** governing:

- Multi-tenant data isolation
- Role-based and attribute-based access control
- User authority boundaries
- Feature visibility and action permissions

These assumptions are foundational.

All schema design, API behavior, UI affordances, and pricing tiers **must conform** to this model.

If a feature conflicts with this document, the feature is wrong.

---

## 2. Core Tenant Model

### 2.1 Definition of a Tenant

A **tenant** represents a **single operating entity** with competitive intent.

In the initial vertical, a tenant is:

> One cannabis dispensary or operating group, regardless of user count.
> 

All data is scoped to a tenant unless explicitly marked as **system-level**.

---

### 2.2 Tenant Isolation Guarantees

- Every record is associated with exactly **one tenant**
- No cross-tenant reads or writes are permitted
- Tenant isolation is enforced at the **database layer**, not just application logic
- UI filtering is considered cosmetic, not security

This is not optional.

“Oops” is not an acceptable failure mode.

---

### 2.3 Multi-Location Reality

- A tenant **may** operate multiple locations
- Locations are treated as **attributes**, not tenants
- Competitive comparisons are **always external**, never cross-tenant

A tenant never competes with itself.

The platform will not invent internal rivalries.

---

## 3. User Model Assumptions

### 3.1 Users Belong to Tenants

- Every user belongs to **exactly one tenant**
- Users cannot span multiple tenants simultaneously
- Consultants and analysts must be explicitly invited per tenant

No global “super analyst” nonsense.

---

### 3.2 Authentication vs Authorization

- **Authentication** answers: “Who is this?”
- **Authorization** answers: “What are they allowed to do?”

Clerk handles identity.

Competitive Advantage handles power.

---

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

---

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

---

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

---

## 6. Feature Gating Assumptions

### 6.1 Subscription Tier Enforcement

- Features are gated server-side
- UI hiding does not equal access control
- Downgrades revoke access immediately

If someone can still hit an endpoint, the system failed.

---

### 6.2 Competitive Sensitivity Rules

Certain data types are **always restricted**:

- Competitor raw identifiers
- Rank movement history
- Predictive outputs

These are **never exposed** to Viewer roles.

Competitive intelligence is a privilege, not a right.

---

## 7. Auditability & Accountability

### 7.1 Required Logging

The system must log:

- Role changes
- Competitor configuration changes
- Export actions
- Admin access events

Logs are immutable.

If it’s not logged, it didn’t happen.

---

### 7.2 Blame Is a Feature

Every meaningful action must be traceable to:

- A user
- A role
- A tenant
- A timestamp

Anonymous power breeds bad behavior.

---

## 8. Non-Goals (Explicit)

This system will **not**:

- Support shared tenants
- Support cross-tenant dashboards
- Allow “temporary admin” hacks
- Trust client-side enforcement
- Assume good faith

The platform is adversarial by design because the market is.

---

## 9. Summary (Read This Before Building Anything)

- Tenants are isolated, always
- Roles define authority, not UI
- Attributes refine scope
- Competitive data is sensitive by default
- Access control is product behavior

If someone asks “can we just—”

the answer is no unless this document says yes.

---

If you want, next logical T03 is **Data Visibility & Competitive Boundaries**, which formalizes *what* data can be seen about *which* competitors *under what conditions*. That’s where most analytics products accidentally commit crimes.