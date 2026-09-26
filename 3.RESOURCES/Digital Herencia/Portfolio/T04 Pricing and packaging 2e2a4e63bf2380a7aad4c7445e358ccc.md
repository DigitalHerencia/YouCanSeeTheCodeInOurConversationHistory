# T04 Pricing and packaging

Meetings: Daily Standup @January 6, 2026  (../Meetings/Daily%20Standup%20@January%206,%202026%202e0a4e63bf2381e3bc6ef11a2cef8125.md)
Parent item: PROD-M1-P1.1-PRD – Problem Definition  (PROD-M1-P1%201-PRD%20%E2%80%93%20Problem%20Definition%202e2a4e63bf2380e2bdbdf780accbb3dd.md)
Projects: PROD-M1-P1.1-PRD – Problem Definition  (../Projects/PROD-M1-P1%201-PRD%20%E2%80%93%20Problem%20Definition%202dba4e63bf2380289bf7ff2b34b540bf.md)
Status: Not started
Tasks: T04 Pricing & packaging  (../Tasks/T04%20Pricing%20&%20packaging%202e2a4e63bf2380889703e969877da590.md)
Teams: Product Team (../Teams/Product%20Team%202d5a4e63bf23818da26bc86434571d4a.md)

### **Context**

- Goal: Define clerk-backed subscriptions with feature gating and a tiered freemium SaaS model at fair-market price points for Competitive Advantage (cannabis retail analytics; multi-tenant B2B).
- Constraints: RBAC-aware, fast time-to-value, comparison-first UX; avoid feature sprawl; prepare for scale (Seats, tenants, data retention, API/export).

<aside>

## **Proposed Tiers (Monthly USD, annual at ~15% discount)**

---

- Free: $0
- Core: $49
- Pro: $149
- Scale: $399
(Validate with 30–45 day price tests; adjust ±15–20%.)
</aside>

### **Entitlements by Tier**

- Free: 1 dispensary; 7-day history; Dashboard basic; no exports; no competitor compare; limited trending view; 2 Viewer seats.
- Core: Up to 3 dispensaries; 30-day history; basic compare (1 competitor); limited trending; Daily; 5 Viewer seats.
- Pro: Up to 10 dispensaries; 12-month history; multi-competitor compare; full trending; Event planning; exports; basic API; RBAC (Owner/Manager/Analyst + 10 Viewer seats).
- Scale: Unlimited dispensaries; 36-month history; benchmarking/projections; bulk exports/API; SSO; audit logs; Admin controls; unlimited Viewers.

### **Seat & Overage Model**

- Charge per paid role seat (Owner/Manager/Analyst). Viewers free within caps; overage billed per extra seat. Block or soft-limit unpaid overages with in-app upgrade prompts.

## **Feature Gating Mechanics (Clerk)**

---

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