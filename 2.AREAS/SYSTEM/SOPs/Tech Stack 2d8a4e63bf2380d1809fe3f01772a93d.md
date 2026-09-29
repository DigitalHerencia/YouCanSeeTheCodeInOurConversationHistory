# Tech Stack

# Technical Reference

## **Modern Enterprise Multi-Tenant SaaS Platform (Secure, Performant)**

### **Version**

2025-12-29

### **Scope**

This document formally defines the architecture, stack, patterns, and standards for a multi-tenant enterprise SaaS platform with custom RBAC, tiered billing via Clerk, subscription sync, and advanced UI patterns using shadcn/ui.

---

## **1. Architectural Overview**

### **1.1 System Vision**

The system is a *single application* that securely serves **multiple tenants** (customers), each with distinct users, role sets, and permissions. The stack is optimized for:

dash **Security**: Authorization enforcement at all layers (app, API routes, database).

dash **Performance**: Server-first rendering + caching + optimized db connections.

dash **Maintainability**: Clear boundaries, composable modules, and version-pinned dependencies.

---

## **2. Core Framework & Runtime**

| Component | Role | Version(s) |
| --- | --- | --- |
| Next.js (App Router + RSC) | Web framework | v16.1.x |
| React | UI library | v19.2.x |
| Node.js | Runtime | v20.x |
| TypeScript | Static typing | v5.9.x |
| pnpm | Package management | v8.x–v9.x |
| Turbo | Monorepo/tasks | v1.x |

**Notes**

dash App Router + React Server Components recommended for security and performance (server-centric rendering reduces client attack surface).

dash Ensure Next.js middleware does not rely on header-based skip logic (e.g., avoid trusting `x-middleware-subrequest` for RBAC decisions without full verification). ([Clerk](https://clerk.com/articles/organizations-and-role-based-access-control-in-nextjs?utm_source=chatgpt.com))

---

## **3. Multi-Tenant Identity & RBAC**

### **3.1 Auth & Identity Provider**

| Component | Purpose |
| --- | --- |
| Clerk | Authentication, session mgmt, billing metering |
| Clerk Webhooks | Sync auth state to app DB |
| Svix | Webhook signature verification |

**Standards**

dash Use *Clerk universal components* for sign-in/sign-up UI.

dash Use **catch-all routes** for auth flows (e.g., `app/sign-in/[[...sign-in]]`).

dash Clerk session tokens are validated at the edge, but all authorization decisions must still be re-verified server-side.

---

### **3.2 Custom RBAC (No Clerk Orgs)**

Although Clerk provides an org model, this architecture uses **custom tenant + role tables** to represent multi-tenant scope and permissions. This avoids tightly coupling app business logic to an external org model that may not align with custom RBAC requirements.

**Model Concepts**

dash **Tenant**: represents a customer entity.

dash **User → Tenant relation**: users can belong to one or more tenants but must select an *active tenant* context.

dash **Role**: tenant scoped (e.g., `admin`, `member`, `manager`).

dash **Permission**: fine-grained capability flags.

dash **Role-Permission mapping**: defines allowed actions.

**Best Practice**

dash Every database entity with tenant scope includes `tenantId`.

dash Use consistent tenant resolution (from session or context).

dash Enforce boundaries in code *and optionally* with database Row Level Security (RLS) policies. RLS assures even miswritten app code cannot leak data across tenants. ([Next.js](https://nextjs.org/docs/app/guides/multi-tenant?utm_source=chatgpt.com))

---

## **4. Subscription & Billing (Clerk)**

Clerk Billing is leveraged for **feature gating and payment processing**.

Billing integration is officially Beta (subject to breaking changes), so **intentional pinning and controlled updates** are required.

**Tiers**

dash **Free**: core features only

dash **Pro**: advanced capabilities

dash **Enterprise**: SLA + support + custom feature flags

**Subscription Patterns**

dash Use Clerk Billing APIs to fetch subscription plans and feature flags.

dash Server-side checks gate actions by membership + plan.

dash Sync subscription events via Clerk webhooks to local tables for audit/reporting.

---

## **5. Database + ORM**

### **5.1 Database**

dash **Neon (PostgreSQL serverless)**

dash Schema includes tenantID as first-class field for every tenant data table.

**Connection**

dash Use pooled connection string (Neon Pooler) for performance.

dash For migrations, provide a `directUrl` if needed.

### **5.2 ORM**

dash **Prisma ORM**

dash Latest stable Prisma (tested around v7.x)

dash Required adapter and serverless driver for Neon (`@prisma/adapter-neon`, `@neondatabase/serverless`, `ws`).

---

## **6. Webhook Handler (Clerk Sync)**

**Requirements**

dash Svix signature validation

dash Event parsing via switch/case

dash Prisma transactions (upsert patterns)

dash **Idempotency**: dedupe via stored eventID

dash Audit logging of user events (sign-up, email changes, billing changes)

dash Local dev webhook tunneling via ngrok

**Patterns**

dash Verify Svix X-Signature header

dash Respond fast (200) and enqueue heavy tasks if needed

dash Track `clerkEventId` to avoid reprocessing

---

## **7. API & Middleware**

### **7.1 Middleware Guards**

dash Authenticate via Clerk middleware

dash Extract session → userID → tenant context

dash Redirect unauthorized to `/sign-in`

### **7.2 Server Actions & Endpoint Protection**

dash All server endpoints must re-validate tenant context before data operations

dash Use security utilities (e.g., `requireAuth`, `requirePermission`)

---

## **8. UI / UX**

### **8.1 Base UI System**

dash **shadcn/ui** as canonical design system

dash Always use high-level **blocks** for layout patterns

dash Data tables adopt TanStack Table patterns

### **8.2 Data Visualization**

dash Shadcn charts built on Recharts

dash Ensure charts leverage lazy loading to reduce bundle size

---

## **9. File Storage & CRUD APIs**

### **9.1 Storage Strategy**

dash Use an object store (S3 / R2 / Backblaze B2)

dash Do not persist blobs in Postgres

### **9.2 Secure CRUD Patterns**

dash Presigned URLs for upload/download

dash Server-side MIME validation

dash Metadata stored in Postgres with tenant, ownerIDs

dash Soft delete with retention policies

---

## **10. Observability & QA**

### **10.1 Logging**

dash Structured server logs (JSON)

dash Track user events & subscription changes

### **10.2 Monitoring**

dash Metric collection via platform of choice (Datadog, CloudWatch etc.)

### **10.3 Testing**

dash Vitest: unit

dash Playwright: E2E

dash Coverage verification

---

## **11. Deployment & CI**

| Tool | Purpose |
| --- | --- |
| Vercel | Deployment |
| Github Actions | CI/CD |
| pnpm | Lockfile discipline |
| ESLint/Prettier | Code standards |

**Performance Notes**

dash Limit edge runtime usage to what’s necessary; heavy processing in Node API routes.

dash Validate that middleware does not inadvertently bypass RBAC checks (e.g., header injection bypasses). ([Clerk](https://clerk.com/articles/organizations-and-role-based-access-control-in-nextjs?utm_source=chatgpt.com))

---

## **12. Glossary**

dash **Tenant**: A customer container for data/isolation

dash **Role**: Named set of permissions in a tenant

dash **Permission**: Atomic action guard (e.g., `invoice.read`)

dash **Billing Plan**: Subscription level with feature flags

dash **Webhook**: Event integration channel

dash **Svix**: Webhook delivery and signature verification

---

## **Appendices**

### **A. Tenant Resolution**

dash URL segment

dash Subdomain mapping

dash User preference

### **B. Recommended RBAC Checks**

dash Every `create`, `read`, `update`, `delete` route should:

    1. Resolve tenant

    2. Check role→permission

    3. Enforce in DB query

### **C. Database RLS Example**

```sql
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation ON projects
  FOR ALL
  USING (tenant_id = current_setting('app.current_tenant')::uuid);

```

RLS ensures even careless queries cannot leak data across tenant boundaries. ([Clerk](https://clerk.com/articles/organizations-and-role-based-access-control-in-nextjs?utm_source=chatgpt.com))

---

## **Conclusion**

This reference formalizes how to build and maintain a secure, performant, and scalable modern web SaaS platform using Next.js, Prisma/Neon, Clerk custom RBAC with billing sync, and shadcn/ui. It codifies not only the components but the standards and checks expected in an enterprise-grade environment.
