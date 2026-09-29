# T05 Feasibility review

Meetings: Daily Standup @January 7, 2026  (../Meetings/Daily%20Standup%20@January%207,%202026%202e1a4e63bf238150ac8ed72fa61c8b80.md)
Parent item: PROD-M1-P1.1-PRD – Problem Definition  (PROD-M1-P1%201-PRD%20%E2%80%93%20Problem%20Definition%202e2a4e63bf2380e2bdbdf780accbb3dd.md)
Projects: PROD-M1-P1.1-PRD – Problem Definition  (../Projects/PROD-M1-P1%201-PRD%20%E2%80%93%20Problem%20Definition%202dba4e63bf2380289bf7ff2b34b540bf.md)
Status: Not started
Tasks: T05 Feasibility review  (../Tasks/T05%20Feasibility%20review%202e2a4e63bf23807082c9caf65e5400ea.md)
Teams: Product Team (../Teams/Product%20Team%202d5a4e63bf23818da26bc86434571d4a.md)

T05 — Feasibility Review

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

- [ ] Tenant isolation enforced at database/query layer and covered by tests.
- [ ] RBAC roles implemented and validated against real operator workflows.
- [ ] Entitlements enforced server-side (no front-end-only gating).
- [ ] Ingestion pipeline has schema validation + observability + failure alerting.
- [ ] MVP dashboard supports at least 3 repeatable operator actions.
- [ ] Legal/ToS review completed for any competitive data ingestion approach.
- [ ] MVP success metrics defined (time-to-insight, retention, action adoption).

Open items / stakeholder feedback needed

- Product: confirm the exact “3 operator actions” we optimize for first.
- Engineering: confirm ingestion approach, tenant enforcement design, and isolation test strategy.
- Design: confirm v1 dashboard IA for “30-second clarity.”
- Marketing: confirm positioning language and boundary between “insight” and “recommendation.”

Traceability

- Inputs synthesized from T01 (market + data evidence), T02 (tenant/RBAC assumptions), T03 (PRD structure), and T04 (pricing/entitlements enforcement).