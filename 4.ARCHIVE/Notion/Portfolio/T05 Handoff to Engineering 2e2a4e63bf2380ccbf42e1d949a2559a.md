# T05 Handoff to Engineering

Meetings: Design Meeting @January 7, 2026  (../Meetings/Design%20Meeting%20@January%207,%202026%202e1a4e63bf2381b1a3d0dd433a213ddf.md)
Parent item: DES-M1-P1.1-UXARCH – UX Architecture  (DES-M1-P1%201-UXARCH%20%E2%80%93%20UX%20Architecture%202e2a4e63bf23804a97a8d04404f1a5ee.md)
Projects: DES-M1-P1.1-UXARCH – UX Architecture  (../Projects/DES-M1-P1%201-UXARCH%20%E2%80%93%20UX%20Architecture%202dba4e63bf2380248131e5d5013a6474.md)
Status: Not started
Tasks: T05 Handoff to Engineering  (../Tasks/T05%20Handoff%20to%20Engineering%202e2a4e63bf23800a99e4c7b5c9df23f4.md)
Teams: Design Team (../Teams/Design%20Team%202d5a4e63bf238097bffedd7bde5a3f69.md)

**From:** Design Team

**To:** Engineering Team

**Phase:** M1 / P1.1 → P1.2

**Date:** January 8, 2026

---

### **OVERVIEW: WHAT YOU'RE RECEIVING**

The Design System Foundation comprises 4 locked artifacts that define the product's structural constraints, navigation model, and competitive positioning. These are **not suggestions**—they are architectural decisions that flow into your component library, routing structure, and data layer design.

---

### **ARTIFACT 1: NAVIGATION ARCHITECTURE (T01)**

**What it defines:** Primary navigation structure (static, role-gated)

**For Engineering:**

| Section | Purpose | Who Sees | Implementation Note |
| --- | --- | --- | --- |
| **Dashboard** | Launch page; operator summary | All | Home route; role-filtered widgets |
| **Daily** | Today's operational tasks | Manager+ | Daily context; time-bounded queries |
| **Sales** | Revenue & transaction metrics | Manager+ | Real-time aggregation required |
| **Products** | Inventory, menu, assortment | Manager+ | Product catalog + competitor data |
| **Customers** | Buyer behavior, loyalty | Owner+ | Customer segmentation; RBAC enforced |
| **Market** | Competitive landscape, pricing | Viewer+ | Read-only competitor benchmarking |
| **Performance** | KPI dashboards, trends | Manager+ | Historical aggregation; rolling windows |
| **Admin** | User management, settings | Admin only | Gated by role; audit trail required |

**Technical Requirements:**

1. **Static left-rail navigation** – No dropdown nesting on first load. Sections expand inline or route to detail pages.
2. **Role-based visibility** – Nav sections hidden/shown by RBAC role (Viewer, Manager, Owner, Admin).
3. **No "Explore" or discovery modes** – Users move deterministically: intent → section → outcome.
4. **URL structure** – `/dashboard`, `/daily`, `/sales`, `/products`, `/customers`, `/market`, `/performance`, `/admin`

---

### **ARTIFACT 2: DESIGN SYSTEM PILLARS (T03)**

**What it defines:** Business logic embedded in design decisions

**For Engineering – Translate These Into Code:**

### **Pillar 1: Competitive Framing (Core Differentiator)**

**Design Decision:** Competitor data is **structurally embedded**, not bolted-on.

**Engineering Translation:**

- Menu Comparison screen requires a `competitors` data model (not optional, not future work).
- Map view includes competitor store locations + pricing as layers.
- Products section shows side-by-side menu/pricing with adjacent competitors.
- **Constraint:** All competitive data must be anonymized; no vendor branding without legal review.

**Implementation:**

- Schema: `competitors { id, storeId, territory, productsOffered, pricingTier, lastUpdated }`
- Competitor data ingestion pipeline must run daily (not batch).
- API endpoint: `GET /api/competitors?territory=<regionId>&updated_since=<timestamp>`

---

### **Pillar 2: Speed-to-Value (Sub-5-Minute Insight)**

**Design Decision:** Operators must answer their primary question in under 5 minutes.

**Engineering Translation:**

- Dashboard must load in <2 seconds (critical path: yesterday's revenue, today's tasks, inventory alerts).
- Daily page caches recent transactions; refresh rate <30 seconds.
- No multi-step workflows to access core metrics.
- **Constraint:** Every page load starts with cached data; live updates happen asynchronously.

**Implementation:**

- Client-side caching strategy: session cache + local storage for dashboard metrics.
- Server-side caching: Redis for aggregated KPIs (5-minute TTL).
- API response size: Dashboard payload <200KB; Daily payload <150KB.
- Lazy-load secondary charts; prioritize primary question metric.

---

### **Pillar 3: Operational Clarity (Verb-Object Decision Frames)**

**Design Decision:** Every page asks one question and suggests one action.

**Engineering Translation:**

- No pages with 5+ unrelated metrics or actions.
- Each page has a **primary metric** (bold, larger) and 2–3 supporting metrics.
- CTAs are verb-based: "Adjust Price," "Add Promotion," "Review Inventory," not "Edit," "Manage," "View."
- **Constraint:** Modal dialogs are forbidden; all actions route to dedicated pages or inline editors.

**Implementation:**

- Button text: `<Verb> <Object>` (e.g., `Adjust Price`, `Add Promotion`).
- Page layout: Primary metric in hero section; supporting metrics below.
- Navigation UX: Actions route to `/products/{id}/pricing` not `/modals/pricing/{id}`.

---

### **Pillar 4: RBAC-by-Design (Role-Based Access Control)**

**Design Decision:** Roles shape what users see **and what they can do**.

**Engineering Translation:**

- Three roles: Viewer, Manager, Owner, Admin.
- **Viewer:** Read-only access (Dashboard, Market, Performance). Cannot drill into transaction details.
- **Manager:** Read-write for daily operations (Dashboard → Daily → Sales → Products → Performance). Cannot access Admin or Customers.
- **Owner:** All Manager permissions + Customers section + Admin settings. Can assign roles.
- **Admin:** Full system access + audit logs.

**Implementation:**

- RBAC middleware: Check role on every API request (not just UI).
- Scope data at query layer: `SELECT * FROM sales WHERE dispensaryId IN (role.dispensaryIds)`.
- Audit trail: Log role changes, bulk updates, and admin actions.
- Nav visibility: Hide sections server-side during initial render.

---

### **Pillar 5: Data Integrity (Source of Truth)**

**Design Decision:** Competitor and operational data must never conflict.

**Engineering Translation:**

- Single source of truth for product IDs, pricing, inventory.
- Competitor data is read-only in UI; updates require manual data entry or API ingestion (no merging).
- Reconciliation pipeline: Flag discrepancies between internal inventory and competitor pricing.
- **Constraint:** UI never allows editing competitor data.

**Implementation:**

- Database schema: `products` (internal), `competitorProducts` (external). No foreign key relationship.
- Conflict detection: Daily job runs `products` vs. `competitorProducts` pricing diff; alerts on >10% variance.
- API design: Separate endpoints for internal writes (`PATCH /api/products/{id}`) and competitor reads (`GET /api/competitors/{id}/products`).

---

### **ARTIFACT 3: WIREFRAME SCREENS (T04)**

**What it defines:** Major UI layouts and component placement

**For Engineering – Build These Routes:**

| Route | Wireframe | Purpose | Key Components | RBAC Gate |
| --- | --- | --- | --- | --- |
| `/dashboard` | Homepage | Launch; summary | Revenue card, alerts, quick-action buttons, nav preview | Viewer+ |
| `/daily` | Daily | Today's tasks | Task list, context panel, inline actions | Manager+ |
| `/sales` | Sales | Revenue metrics | Time-series chart, transaction list, drill-down | Manager+ |
| `/products` | Products + Menu Comparison | Inventory + competitor benchmarking | Product grid, menu comparison table, pricing overlay | Manager+ |
| `/regions` | Regions | Multi-location oversight | Map or region selector, store list, aggregated KPIs | Owner+ |
| `/market` | Map | Spatial competitive context | Map component, competitor markers, territory shading | Viewer+ |
| `/performance` | Performance | KPI dashboards | Trend charts, targets vs. actual, rankings | Manager+ |
| `/admin` | Admin | User/system management | Role management table, audit log, settings | Admin only |

**Technical Requirements:**

1. **Responsive layout:** Desktop-first (operators use desktop). Tablet support for on-site quick checks. Mobile not in scope for M1.
2. **Component reuse:** All screens use the same card, chart, and table components (defined in design tokens).
3. **Data binding:** Routes are bound to Redux/Zustand selectors; component props are typed (no `any`).
4. **Loading states:** Skeleton screens for initial load; spinner for < 200ms updates; toast notifications for errors.

---

### **ARTIFACT 4: RBAC MODEL (T03 Applied)**

**What it defines:** Role permissions matrix

**For Engineering – Implement This:**

| Feature | Viewer | Manager | Owner | Admin |
| --- | --- | --- | --- | --- |
| View Dashboard | ✓ | ✓ | ✓ | ✓ |
| View Daily | ✗ | ✓ | ✓ | ✓ |
| View Sales | ✗ | ✓ | ✓ | ✓ |
| View/Edit Products | ✗ | ✓ | ✓ | ✓ |
| View Customers | ✗ | ✗ | ✓ | ✓ |
| View Market (Competitors) | ✓ | ✓ | ✓ | ✓ |
| View Performance | ✓ | ✓ | ✓ | ✓ |
| Access Admin | ✗ | ✗ | ✓ | ✓ |
| Manage Users | ✗ | ✗ | ✓ | ✓ |
| Audit Logs | ✗ | ✗ | ✗ | ✓ |

**Implementation:**

```tsx
// Example: RBAC gate in middleware
if (route === '/admin' && !['Owner', 'Admin'].includes(user.role)) {
  redirect('/dashboard');
}

// Example: Scoped data query
const sales = await db.sales.find({
  dispensaryId: { $in: user.dispensaryIds }
});

```

---

### **CRITICAL CONSTRAINTS FOR P1.2**

1. **Navigation is locked.** Do not add sections. Do not rename. If you need a new section, that's a design change (Phase P1.3+).
2. **RBAC roles are immutable.** Do not add a "Supervisor" role or mix permissions. If roles need adjustment, loop back to Design.
3. **Competitor data is read-only in UI.** Operators cannot edit competitor pricing/products. Competitor data flows from external sources only.
4. **No modals for primary workflows.** All CTAs route to dedicated pages (e.g., `/products/{id}/pricing`, not a modal).
5. **Performance targets:** Dashboard <2s, any page <3s. If you can't hit this, flag it in the design review.

---

### **DEPENDENCIES & HANDOFF CHECKLIST**

**Before you start P1.2 component library work:**

- [ ]  Confirm RBAC roles with Product team (3 roles locked: Viewer, Manager, Owner, Admin).
- [ ]  Establish data model for competitors (schema TBD by Data team).
- [ ]  Design Redux/Zustand store structure (aligned with 8 sections + RBAC).
- [ ]  Define design token system (colors, typography, spacing for component library).
- [ ]  Agree on cache strategy (Redis, client-side, CDN).

**By end of P1.2:**

- [ ]  Component library scaffolded (buttons, cards, charts, tables).
- [ ]  Routing structure in place (`/dashboard`, `/daily`, etc.).
- [ ]  RBAC middleware implemented (nav visibility + API scoping).
- [ ]  Design system tokens documented (colors, typography, spacing, shadows).

**By P1.3:**

- [ ]  All 8 primary pages built with placeholder data.
- [ ]  Live data integration (Sales, Daily, Products connected to backend).
- [ ]  Competitor data ingestion pipeline running.

---

### **SIGN-OFF & QUESTIONS**

**Design artifacts are approved for engineering implementation.**

If you have clarifying questions:

- **Navigation:** Can sections be reordered? No. Can you add nested menus? No.
- **RBAC:** Can roles have custom permissions? No. Can you add a role? Not in M1.
- **Competitor data:** How is it ingested? (TBD with Data team). Can operators edit it? No.
- **Performance:** What's your caching strategy? (Engineer to decide, must hit <2s dashboard).

**Ready to proceed to P1.2 – Core Infrastructure Setup.**

*—Design Team*

---

This T05 is a **working contract** between Design and Engineering, not a retrospective. It operationalizes each design decision into technical requirements, constraints, and implementation checkpoints.

Would you like me to adjust any sections or create similar handoff documents for other team projects?