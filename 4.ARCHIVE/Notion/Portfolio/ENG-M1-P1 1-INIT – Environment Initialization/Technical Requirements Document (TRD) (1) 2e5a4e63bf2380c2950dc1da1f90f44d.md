# Technical Requirements Document (TRD) (1)

**Competitive Advantage Platform**

---

## **1. Overview**

This document defines the technical architecture, patterns, and standards for the Competitive Advantage platform built on a modern Next.js + Neon + Clerk stack.

---

## **2. Architecture**

### **2.1 Deployment Architecture**

```
┌─────────────────────────────────────────────────┐
│             Vercel (Hosting)                     │
├─────────────────────────────────────────────────┤
│  ├─ Next.js App Router (RSC)                    │
│  ├─ Edge Middleware (Auth, Rate Limiting)       │
│  └─ Serverless Functions (API Routes)           │
└─────────────────────────────────────────────────┘
                       │
        ┌──────────────┼──────────────┐
        │              │              │
    ┌───▼──┐     ┌────▼────┐   ┌────▼────┐
    │ Neon │     │ Clerk   │   │ Upstash │
    │ (PG) │     │ (Auth)  │   │ (Cache) │
    └──────┘     └─────────┘   └─────────┘
        │
    ┌───▼─────────────┐
    │ Background Jobs │
    │ (Node Workers)  │
    └─────────────────┘

```

### **2.2 Architectural Principles**

- **Server-first**: Leverage React Server Components by default
- **Type-safe**: End-to-end TypeScript, strict mode
- **Multi-tenant**: All data queries enforced at database level (RLS)
- **Spec-driven**: Features defined before implementation
- **Testable**: Unit, integration, E2E coverage ≥80%
- **Observable**: Structured logging, error tracking, performance monitoring
- **Secure by default**: No secrets in code, validated inputs, OWASP compliance

---

## **3. Frontend Stack & Standards**

### **3.1 Core Technologies**

| **Layer** | **Technology** | **Version** | **Purpose** |
| --- | --- | --- | --- |
| **Runtime** | Node.js | 20+ | Server-side execution |
| **Framework** | Next.js | 15+ | App Router, RSC |
| **Language** | TypeScript | 5.8+ | Type safety |
| **React** | React | 19+ | Latest hooks, concurrency |
| **Styling** | Tailwind CSS | 4+ | Utility-first CSS |
| **UI Components** | shadcn/ui | Latest | Accessible, composable |
| **Forms** | react-hook-form | Latest | Minimal re-renders |
| **Validation** | zod | Latest | Runtime schema validation |
| **Tables** | @tanstack/react-table | Latest | Headless table logic |
| **Charting** | Recharts | Latest | React-native SVG charts |
| **Maps** | Mapbox GL | 3.x | Interactive geospatial |
| **Notifications** | Sonner | Latest | Toast notifications |
| **Icons** | Lucide React | Latest | SVG icon library |

### **3.2 Component Architecture**

```
components/
├── ui/                    # shadcn/ui base components
│   ├── button.tsx
│   ├── card.tsx
│   ├── dialog.tsx
│   └── ... (other primitives)
├── [Feature]/             # Feature-specific components
│   ├── components/
│   │   ├── DashboardCard.tsx
│   │   └── MetricsGrid.tsx
│   └── ...
└── shared/                # Cross-feature components
    ├── DashboardHeader.tsx
    ├── DashboardShell.tsx
    └── Navigation.tsx

```

### **3.3 Frontend Patterns**

**Pattern: Server Component by Default**

```tsx
// app/dashboard/page.tsx
import { getDashboardData } from '@/lib/server/dashboard';
import DashboardClient from './dashboard-client';

export default async function DashboardPage() {
  const data = await getDashboardData(); // Server-side fetch
  return <DashboardClient initialData={data} />;
}

```

**Pattern: Client Component for Interactivity**

```tsx
'use client'; // Only when needed (state, context, events)
import { useState } from 'react';

export function FilterBar() {
  const [filters, setFilters] = useState({});
  return <div>...</div>;
}

```

**Pattern: Server Actions for Mutations**

```tsx
'use server';
import { updateUserPreferences } from '@/lib/server/user';

export async function updatePreferences(formData: FormData) {
  const result = await updateUserPreferences(formData);
  revalidatePath('/dashboard');
  return result;
}

```

### **3.4 Performance Targets**

| **Metric** | **Target** |
| --- | --- |
| First Contentful Paint | ≤ 1.5s |
| Largest Contentful Paint | ≤ 2.5s |
| Time to Interactive | ≤ 3.0s |
| Cumulative Layout Shift | ≤ 0.1 |
| Lighthouse Score | ≥ 90 |
| Core Web Vitals | All Green |

### **3.5 Accessibility Standards**

- **WCAG 2.2 Level AA** compliance (minimum)
- Semantic HTML, proper ARIA attributes
- Keyboard navigation support (Tab, Enter, Escape)
- Screen reader compatible
- Color contrast ≥ 4.5:1 for text
- Focus indicators visible

---

## **4. Backend Stack & Standards**

### **4.1 Core Technologies**

| **Layer** | **Technology** | **Version** | **Purpose** |
| --- | --- | --- | --- |
| **Database** | PostgreSQL | 15+ | Relational data |
| **Hosting** | Neon | Latest | Serverless Postgres |
| **ORM** | Prisma | 6+ | Type-safe DB access |
| **Auth** | Clerk | 6+ | Managed authentication |
| **Cache** | Redis (Upstash) | 7+ | Session + cache layer |
| **Queue** | Upstash Qstash | Latest | Async job execution |
| **Storage** | S3-compatible | - | File uploads |
| **Email** | SendGrid | Latest | Transactional email |

### **4.2 Database Schema**

**Key Principles:**

- All tables include `tenantId` for multi-tenancy
- Timestamps: `createdAt`, `updatedAt` on all entities
- Foreign keys with cascading deletes (where appropriate)
- Indexes on frequently queried columns
- Comments on complex columns

**Core Tables:**

```
users → dispensaries → products
          → customers
          → transactions → sales_snapshots
          → competitors → competitor_products

```

### **4.3 Auth & Authorization**

**Clerk Integration:**

- Custom metadata for tenant association
- Role-based session claims
- Webhook sync to PostgreSQL
- Refresh token rotation

**Custom RBAC:**

```
Roles:
- Owner (full access)
- Manager (operational actions)
- Analyst (read-only + exports)
- Viewer (dashboard only)
- Admin (system configuration)

```

**ABAC Attributes:**

```
- tenant_id (all users)
- store_id (store-specific permissions)
- region (geographic scope)
- feature_tier (subscription level)

```

### **4.4 API Design**

**Server Actions (Preferred):**

- For mutations affecting single entities
- Automatic TypeScript validation
- Built-in error handling

**API Routes:**

- Webhooks (Clerk, payment processing)
- Third-party integrations
- Public endpoints with rate limiting

**Error Response Standard:**

```json
{
  "error": "VALIDATION_ERROR",
  "message": "Invalid input",
  "details": [
    { "field": "email", "message": "Invalid email format" }
  ]
}

```

---

## **5. Data Processing Engine**

### **5.1 Purpose**

Precompute expensive analytics and aggregations to maintain subsecond dashboard response times.

### **5.2 Architecture**

```
Data Sources
    ↓
[Ingestion Layer] → Raw Data
    ↓
[Transformation Layer] → Aggregations
    ↓
[ML Layer] → Predictions & Insights
    ↓
PostgreSQL (Materialized Views)
    ↓
API/Dashboard (cached reads)

```

### **5.3 Job Types**

| **Job** | **Frequency** | **Purpose** |
| --- | --- | --- |
| `ingest-sales` | Real-time | Process incoming transactions |
| `aggregate-daily-metrics` | 1x daily | Compute KPIs |
| `forecast-sales` | 2x daily | Run ML models |
| `detect-anomalies` | Hourly | Identify outliers |
| `generate-recommendations` | 2x daily | Create actionable insights |
| `sync-competitors` | 4x daily | Update competitor data |
| `send-alerts` | Real-time | Threshold-based notifications |

### **5.4 Execution Model**

- **Scheduler:** Cron (Upstash) + manual triggers
- **Worker:** Node.js (Vercel Functions or external)
- **State:** PostgreSQL (job_logs table)
- **Idempotency:** UUID-based deduplication
- **Monitoring:** Structured logging + Sentry

---

## **6. Security Requirements**

### **6.1 Core Principles**

- **Zero Trust:** Verify every request, no implicit trust
- **Defense in Depth:** Multiple layers of protection
- **Least Privilege:** Minimal permissions by default
- **Auditability:** Log all sensitive operations

### **6.2 Implementation**

**Authentication:**

- Clerk manages credentials (no password storage)
- Session tokens in HttpOnly cookies
- Automatic token refresh
- Multi-factor authentication (optional)

**Authorization:**

- Row-level security (Postgres RLS policies)
- Feature-level access control
- Real-time permission checks on mutations
- No client-side trust (server validates all)

**Data Protection:**

- Encryption at rest (Neon default)
- Encryption in transit (HTTPS only)
- Sensitive data (PII) encrypted in database
- PII redaction in logs

**Input Validation:**

- zod schemas for all user input
- Server-side validation (client validation for UX)
- Rate limiting on sensitive endpoints
- CSRF protection (Next.js built-in)

**Secrets Management:**

- All secrets in environment variables
- No secrets in code or git history
- Automated rotation (quarterly minimum)
- Access logs for secret retrieval

### **6.3 Compliance**

- **OWASP Top 10** mitigation
- **GDPR** readiness (data deletion, export)
- **Cannabis Regulations** (state-specific compliance)
- **SOC 2** audit readiness

---

## **7. Testing Standards**

### **7.1 Test Pyramid**

```
       ╱╲
      ╱  ╲  E2E (Playwright)
     ╱────╲ [Integration Tests]
    ╱      ╲
   ╱────────╲ Unit Tests (Vitest)
  ╱__________╲

```

**Targets:**

- Unit: ≥70% coverage
- Integration: ≥50% coverage
- E2E: Critical user flows (≥10 tests)
- Total: ≥80% combined

### **7.2 Test Structure**

**Unit Tests:**

```
src/
├── lib/
│   └── utils.test.ts
├── server/
│   └── analytics.test.ts

```

**Integration Tests:**

```
tests/
├── api/
│   └── dashboard.test.ts
├── features/
│   └── recommendations.test.ts

```

**E2E Tests:**

```
e2e/
├── dashboard.spec.ts
├── sales-analytics.spec.ts
├── competitor-comparison.spec.ts

```

### **7.3 Tools**

| **Tool** | **Purpose** |
| --- | --- |
| **Vitest** | Unit + integration testing |
| **Playwright** | E2E browser automation |
| **@testing-library/react** | Component testing |
| **Mock Service Worker** | API mocking |
| **Faker.js** | Test data generation |

---

## **8. Observability & Monitoring**

### **8.1 Logging**

**Structured Logging Format:**

```json
{
  "timestamp": "2025-01-05T14:30:00Z",
  "level": "info",
  "context": "sales_aggregation",
  "message": "Processing daily snapshot",
  "tenant_id": "org_123",
  "duration_ms": 1250,
  "metadata": {
    "record_count": 5000,
    "status": "success"
  }
}

```

**Log Levels:**

- `debug`: Development-only details
- `info`: Important business events
- `warn`: Unexpected but recoverable
- `error`: System failures requiring attention
- `fatal`: Service shutdown required

### **8.2 Error Tracking**

- **Provider:** Sentry
- **Capture:** All uncaught exceptions
- **Context:** User, session, request metadata
- **Alerts:** Critical errors → PagerDuty

### **8.3 Performance Monitoring**

- **Vercel Analytics:** Web Vitals
- **Database:** Query performance logs
- **Jobs:** Execution time + success rate
- **Cache:** Hit ratio + latency

### **8.4 Dashboards**

- **System Health:** Uptime, error rate, latency
- **Business KPIs:** Active users, feature usage
- **Data Pipeline:** Job success rate, data freshness
- **Security:** Failed auth attempts, anomalies

---

## **9. Development Workflow**

### **9.1 Feature Development Cycle**

1. **Spec Writing** (EARS notation)
    - Create `/specs/domains/[feature].md`
    - Define acceptance criteria
    - Identify data model changes
2. **Schema Migration** (if needed)
    - Update `prisma/schema.prisma`
    - Run `prisma migrate dev --name [feature]`
    - Test on Neon branch
3. **Backend Implementation**
    - Create server actions in `/app/actions`
    - Implement queries in `/lib/server`
    - Add tests in `/tests/api`
4. **Frontend Implementation**
    - Create components in `components/[Feature]`
    - Integrate server actions
    - Add client interactivity
    - Implement error states
5. **Testing**
    - Unit tests (Vitest)
    - Integration tests
    - E2E tests (Playwright)
    - Manual QA
6. **Deployment**
    - PR with linked issue
    - Automated tests pass
    - Code review approval
    - Merge to main
    - Auto-deploy to Vercel

### **9.2 Git Workflow**

**Branch Naming:**

```
feature/[feature-name]
bugfix/[issue-id]-[description]
docs/[topic]
chore/[task]

```

**Commit Convention:**

```
[type]([scope]): [message]

Types: feat, fix, docs, style, refactor, perf, test, chore

```

**PR Requirements:**

- ✅ All tests passing
- ✅ Code review approved
- ✅ Updated [CHANGELOG.md](http://changelog.md/)
- ✅ No console.log (production)
- ✅ No commented-out code

### **9.3 Environment Variables**

**Development (.env.local):**

```
NEXT_PUBLIC_APP_URL=http://localhost:3000
CLERK_SECRET_KEY=sk_test_***
DATABASE_URL=postgresql://...
REDIS_URL=redis://...

```

**Production (Vercel Settings):**

- Never commit secrets
- Use Vercel Environment Variables UI
- Separate dev/staging/prod secrets
- Rotation schedule: quarterly

---

## **10. DevCycle Integration**

This TRD aligns with the Specification-Driven Workflow. Each feature progresses through:

1. **ANALYZE**: Requirements clarification (PRD § reference)
2. **DESIGN**: Technical design with data models
3. **IMPLEMENT**: Coding per this TRD
4. **VALIDATE**: Testing and QA
5. **REFLECT**: Code review and optimization
6. **HANDOFF**: Documentation and release

---

## **11. Technology Stack Summary**

```
Frontend:
  - Next.js 15 (App Router)
  - React 19
  - TypeScript 5.8
  - Tailwind + shadcn/ui
  - Recharts + Mapbox GL

Backend:
  - Node.js 20+
  - PostgreSQL (Neon)
  - Prisma 6
  - Clerk 6
  - Redis (Upstash)

DevOps:
  - Vercel (hosting)
  - GitHub (version control)
  - GitHub Actions (CI)
  - Neon (database branching)

Testing:
  - Vitest (unit/integration)
  - Playwright (E2E)
  - Testing Library

Monitoring:
  - Vercel Analytics
  - Sentry (errors)
  - Custom logging

```

---

## **12. Migration Path (MERN → Modern Stack)**

| **Aspect** | **Old** | **New** | **Migration** |
| --- | --- | --- | --- |
| Database | MongoDB | PostgreSQL | Prisma migration scripts |
| Backend | Express | Next.js API | Server Actions primary |
| Frontend | React + Redux | React + RSC | Gradual component conversion |
| Styling | MUI | Tailwind | CSS migration tool |
| Auth | Custom | Clerk | Session sync via webhook |
| Deployment | Heroku | Vercel | Git push to deploy |

---

End of Technical Requirements Document