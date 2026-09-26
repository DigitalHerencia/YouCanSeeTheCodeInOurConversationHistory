# Copilot Instructions for Competitive Advantage Platform

---

This document operationalizes AI-assisted development for the Competitive Advantage platform using GitHub Copilot Chat within VS Code. It ensures consistent, secure, and compliant code generation aligned with the PRD and Technical Requirements.

---

## **1. Project Overview**

**Competitive Advantage** is a **multi-tenant B2B SaaS analytics platform** for cannabis retail operators (with extensibility to other regulated verticals).

**Tech Stack:**

- Frontend: Next.js 15 (App Router, RSC) + React 19 + Tailwind + shadcn/ui
- Backend: PostgreSQL (Neon) + Prisma 6 + Clerk 6 + Node.js workers
- Hosting: Vercel (serverless)
- Deployment: Git-push automated via GitHub Actions

**Key Constraints:**

- Server-first architecture (maximize RSC usage)
- Type-safe end-to-end (TypeScript strict mode)
- Multi-tenant by default (all queries tenant-scoped)
- Spec-driven features (EARS notation requirements)
- OWASP + security-first coding

---

## **2. Core Workflow: Spec → Design → Implement**

### **2.1 Phase 1: Specification (User Requirement)**

When a user requests a feature, Copilot **MUST** ask clarifying questions:

**Template Questions:**

- "Which user persona benefits from this feature?" (Owner, Manager, Analyst, Viewer, Admin)
- "What is the success metric?" (e.g., "Users adopt feature within 7 days")
- "Where in the UI does this live?" (e.g., "Dashboard tile")
- "What data dependencies exist?" (e.g., "Requires sales_snapshots table")
- "Is this multi-tenant aware?" (Always yes)

**Copilot Actions:**

1. Gather requirements into a spec document
2. Write requirements in **EARS notation**:
    - `WHEN [event] THE SYSTEM SHALL [behavior]`
    - `IF [error condition] THEN THE SYSTEM SHALL [response]`
    - Include acceptance criteria
3. Reference PRD sections and success metrics
4. Ask for approval before coding

### **2.2 Phase 2: Design (Technical Plan)**

Once spec is approved, Copilot designs the implementation:

**Design Checklist:**

- [ ]  **Data Model**: Schema changes needed (Prisma)?
- [ ]  **API Surface**: Server Actions, API routes, or middleware?
- [ ]  **UI Components**: New components or reuse from shadcn/ui?
- [ ]  **State Management**: Server component? Client component? Server Actions?
- [ ]  **Error Handling**: Validation errors, business logic errors, system errors?
- [ ]  **Testing Strategy**: Unit tests, E2E tests, critical paths?
- [ ]  **Security**: Input validation, authorization checks, multi-tenancy enforcement?

**Copilot Output:**

- Create `/specs/domains/[feature].md` with spec + design
- Diagram data flow (Mermaid)
- List files to create/modify
- Identify risks and mitigations

### **2.3 Phase 3: Implementation (Code)**

Code generation follows strict patterns:

**Pre-Code Checklist:**

- [ ]  Design approved and documented
- [ ]  Schema migrations prepared (if needed)
- [ ]  All files identified
- [ ]  Test cases identified

**Code Generation Rules:**

1. Always use TypeScript (`strict: true`)
2. Follow component/utility patterns from this guide
3. Add comments explaining "why," not "what"
4. Validate all user inputs with zod
5. Handle errors gracefully
6. Enforce multi-tenancy (tenant_id checks)
7. Write tests as you go (TDD approach)

---

## **3. Frontend Patterns (React Server Components)**

### **3.1 Server Component Pattern (Default)**

**When to use:** Fetching data, heavy logic, secrets, database queries.

```tsx
// app/dashboard/sales/page.tsx
import { getSalesData } from '@/lib/server/sales';
import SalesClient from './sales-client';

export const revalidate = 3600; // ISR: revalidate every hour

export default async function SalesPage() {
  // Server-side data fetch (no API call needed)
  const data = await getSalesData();

  return <SalesClient initialData={data} />;
}

```

### **3.2 Client Component Pattern (Interactivity)**

**When to use:** State, event handlers, hooks, browser APIs only.

```tsx
// app/dashboard/sales/sales-client.tsx
'use client';

import { useState } from 'react';
import { SalesChart } from '@/components/sales-chart';
import { useRouter } from 'next/navigation';

interface SalesClientProps {
  initialData: SalesSnapshot[];
}

export default function SalesClient({ initialData }: SalesClientProps) {
  const [filters, setFilters] = useState({ period: '30d' });
  const router = useRouter();

  const handleFilterChange = (newFilters: typeof filters) => {
    setFilters(newFilters);
    // Update URL for bookmarking
    router.push(`?period=${newFilters.period}`);
  };

  return (
    <div>
      <SalesChart data={initialData} filters={filters} />
      {/* Interactivity here */}
    </div>
  );
}

```

### **3.3 Server Action Pattern (Mutations)**

**When to use:** Form submissions, data mutations, side effects.

```tsx
// app/actions/sales.ts
'use server';

import { revalidatePath } from 'next/cache';
import { createSalesRecord } from '@/lib/server/sales';
import { getUserTenant } from '@/lib/server/auth';
import { z } from 'zod';

const CreateSalesSchema = z.object({
  dispensaryId: z.string().uuid(),
  amount: z.number().positive(),
  date: z.date(),
});

export async function createSales(formData: unknown) {
  // Validate input
  const result = CreateSalesSchema.safeParse(formData);
  if (!result.success) {
    return { error: result.error.flatten() };
  }

  try {
    // Enforce multi-tenancy
    const tenant = await getUserTenant();
    const sale = await createSalesRecord(tenant.id, result.data);

    // Revalidate cache
    revalidatePath('/dashboard/sales');

    return { success: true, data: sale };
  } catch (error) {
    return { error: 'Failed to create sales record' };
  }
}

```

### **3.4 Component Composition**

**File Structure:**

```
components/
├── dashboard/
│   ├── DashboardShell.tsx       # Server component (layout)
│   ├── dashboard-client.tsx     # Client wrapper
│   └── KPITile.tsx              # Reusable client component
├── ui/
│   ├── card.tsx                 # shadcn component
│   ├── button.tsx
│   └── ...
└── shared/
    ├── DataTable.tsx            # Reusable across features
    └── ErrorBoundary.tsx

```

### **3.5 Form Handling**

```tsx
// components/sales-form.tsx
'use client';

import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { createSales } from '@/app/actions/sales';
import { Button } from '@/components/ui/button';
import { useTransition } from 'react';

export function SalesForm() {
  const [isPending, startTransition] = useTransition();
  const { register, handleSubmit, formState: { errors } } = useForm({
    resolver: zodResolver(CreateSalesSchema),
  });

  const onSubmit = (data: unknown) => {
    startTransition(async () => {
      const result = await createSales(data);
      if (result.error) {
        // Show error toast
      }
    });
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <input {...register('amount')} type="number" />
      {errors.amount && <span>{errors.amount.message}</span>}
      <Button disabled={isPending}>Submit</Button>
    </form>
  );
}

```

---

## **4. Backend Patterns (Server Actions & API Routes)**

### **4.1 Server Action Pattern**

All mutations prefer Server Actions (simpler, type-safe, no HTTP overhead).

```tsx
// lib/server/user.ts
'use server';

import { getCurrentUser } from '@/lib/server/auth';
import { db } from '@/lib/db';

export async function updateUserPreferences(
  preferences: { theme: 'light' | 'dark'; emailAlerts: boolean }
) {
  const user = await getCurrentUser();
  if (!user) throw new Error('Unauthorized');

  return await db.user.update({
    where: { id: user.id },
    data: { preferences },
  });
}

```

### **4.2 API Route Pattern (When Needed)**

Use API Routes for webhooks, third-party integrations, or public endpoints.

```tsx
// app/api/webhooks/clerk/route.ts
import { Webhook } from 'svix';
import { headers } from 'next/headers';
import { syncUserToDatabase } from '@/lib/server/user';

export async function POST(req: Request) {
  const payload = await req.json();
  const headersList = await headers();
  const svix_id = headersList.get('svix-id');
  const svix_timestamp = headersList.get('svix-timestamp');
  const svix_signature = headersList.get('svix-signature');

  // Verify webhook signature
  const wh = new Webhook(process.env.CLERK_WEBHOOK_SECRET || '');
  let evt;
  try {
    evt = wh.verify(payload, {
      'svix-id': svix_id!,
      'svix-timestamp': svix_timestamp!,
      'svix-signature': svix_signature!,
    });
  } catch (error) {
    return new Response('Unauthorized', { status: 401 });
  }

  // Handle event
  if (evt.type === 'user.created') {
    await syncUserToDatabase(evt.data);
  }

  return new Response('OK', { status: 200 });
}

```

### **4.3 Database Access (Prisma)**

```tsx
// lib/server/sales.ts
import { getCurrentUserTenant } from '@/lib/server/auth';
import { db } from '@/lib/db';

export async function getDailyMetrics(dispensaryId: string) {
  const tenant = await getCurrentUserTenant();

  // Always enforce tenant scoping
  return await db.salesSnapshot.findFirst({
    where: {
      dispensaryId,
      dispensary: { tenantId: tenant.id }, // Multi-tenancy check
    },
  });
}

export async function aggregateSalesData() {
  // Batch operation with proper error handling
  const results = await db.transaction(async (tx) => {
    const snapshots = await tx.sales.groupBy({
      by: ['dispensaryId', 'date'],
      _sum: { amount: true },
    });

    return await Promise.all(
      snapshots.map((s) =>
        tx.salesSnapshot.upsert({
          where: { dispensaryId_date: { dispensaryId: s.dispensaryId, date: s.date } },
          update: { totalAmount: s._sum.amount || 0 },
          create: {
            dispensaryId: s.dispensaryId,
            date: s.date,
            totalAmount: s._sum.amount || 0,
          },
        })
      )
    );
  });

  return results;
}

```

### **4.4 Error Handling Pattern**

```tsx
// lib/server/errors.ts
export class AppError extends Error {
  constructor(
    public code: string,
    public statusCode: number,
    message: string,
    public details?: unknown
  ) {
    super(message);
  }
}

export async function handleServerError(error: unknown) {
  if (error instanceof AppError) {
    return {
      error: error.code,
      message: error.message,
      status: error.statusCode,
    };
  }

  console.error('Unexpected error:', error);
  return {
    error: 'INTERNAL_ERROR',
    message: 'An unexpected error occurred',
    status: 500,
  };
}

```

---

## **5. Data Validation (zod)**

**All user input must be validated with zod schemas.**

```tsx
// lib/schemas/sales.ts
import { z } from 'zod';

export const CreateSalesSchema = z.object({
  dispensaryId: z.string().uuid('Invalid dispensary ID'),
  amount: z.number().positive('Amount must be positive'),
  date: z.coerce.date().max(new Date(), 'Date cannot be in future'),
  notes: z.string().optional().max(500),
});

export type CreateSalesInput = z.infer<typeof CreateSalesSchema>;

// In server action
export async function createSales(input: unknown) {
  const validated = CreateSalesSchema.parse(input); // Throws on invalid
  // Safe to use validated data
}

```

---

## **6. Multi-Tenancy Enforcement**

**Every data access MUST enforce tenant scoping.**

### **6.1 Middleware Pattern**

```tsx
// lib/server/auth.ts
export async function getCurrentUserTenant() {
  const { userId } = await auth();
  if (!userId) throw new Error('Unauthorized');

  const user = await db.user.findUnique({
    where: { clerkId: userId },
    select: { tenantId: true },
  });

  if (!user?.tenantId) throw new Error('No tenant assigned');
  return { tenantId: user.tenantId };
}

// In any server action/route
const tenant = await getCurrentUserTenant(); // Always first line
const data = await db.sales.findMany({
  where: { dispensary: { tenantId: tenant.tenantId } },
});

```

### **6.2 Database-Level Enforcement (RLS)**

```sql
-- postgres/migrations/add_rls.sql
ALTER TABLE sales ENABLE ROW LEVEL SECURITY;

CREATE POLICY sales_tenant_isolation ON sales
  USING (dispensary.tenant_id = current_setting('app.tenant_id')::uuid);

```

---

## **7. Testing Patterns**

### **7.1 Unit Tests (Vitest)**

```tsx
// lib/server/__tests__/sales.test.ts
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { getDailyMetrics } from '../sales';
import * as auth from '../auth';

describe('getDailyMetrics', () => {
  beforeEach(() => {
    vi.mock('../auth');
  });

  it('should return metrics for a dispensary', async () => {
    vi.mocked(auth.getCurrentUserTenant).mockResolvedValue({
      tenantId: 'org_test',
    });

    const result = await getDailyMetrics('disp_123');
    expect(result).toBeDefined();
  });

  it('should throw on unauthorized tenant access', async () => {
    vi.mocked(auth.getCurrentUserTenant).mockResolvedValue({
      tenantId: 'org_other',
    });

    await expect(getDailyMetrics('disp_wrong')).rejects.toThrow();
  });
});

```

### **7.2 Integration Tests (Playwright)**

```tsx
// e2e/dashboard.spec.ts
import { test, expect } from '@playwright/test';

test.describe('Dashboard Page', () => {
  test.beforeEach(async ({ page }) => {
    // Login via Clerk test mode
    await page.goto('/');
    await page.getByRole('button', { name: /sign in/i }).click();
  });

  test('should display KPI tiles', async ({ page }) => {
    await page.goto('/dashboard');

    const kpis = await page.locator('[data-testid="kpi-tile"]').all();
    expect(kpis.length).toBeGreaterThan(0);
  });

  test('should load sales data on chart', async ({ page }) => {
    await page.goto('/dashboard/sales');

    // Wait for chart to render
    await expect(page.locator('svg')).toBeVisible();
  });
});

```

---

## **8. Security Checklist**

**Before submitting any PR, verify:**

- [ ]  No hardcoded secrets (all in env vars)
- [ ]  All inputs validated with zod
- [ ]  Database queries enforce `tenantId` scoping
- [ ]  Error messages don't leak sensitive info
- [ ]  Sensitive data logged is redacted
- [ ]  HTTPS enforced in production
- [ ]  CSRF tokens present (Next.js automatic)
- [ ]  SQL injection impossible (Prisma parameterization)
- [ ]  XSS prevention (React escaping + DOMPurify if needed)
- [ ]  Rate limiting on sensitive endpoints
- [ ]  Authorization checks before mutations

---

## **9. Naming Conventions**

### **9.1 Files & Directories**

```
components/
  ├── [Feature]/
  │   ├── [Component].tsx      # PascalCase
  │   └── index.ts
  └── ui/
      └── button.tsx

lib/
  ├── server/
  │   └── auth.ts              # camelCase for modules
  └── utils.ts

app/
  ├── (routes)/
  │   └── dashboard/
  │       ├── page.tsx         # lowercase
  │       └── layout.tsx

types/
  └── index.ts                 # Type definitions only

```

### **9.2 Code Naming**

```tsx
// Components: PascalCase
const SalesChart = () => {};

// Functions: camelCase
const calculateMetrics = () => {};

// Constants: UPPER_SNAKE_CASE
const MAX_RETRIES = 3;
const DEFAULT_CACHE_TTL = 3600;

// Interfaces: PascalCase with `I` prefix (optional)
interface ISalesMetrics {
  totalAmount: number;
  count: number;
}

// Enums: PascalCase
enum UserRole {
  Owner = 'owner',
  Manager = 'manager',
  Analyst = 'analyst',
}

```

---

## **10. Code Quality Standards**

### **10.1 TypeScript**

```tsx
// ✅ Good: Explicit types
function updateUserSettings(
  userId: string,
  settings: UserSettings
): Promise<User> {
  // ...
}

// ❌ Bad: Implicit any
function updateUserSettings(userId: any, settings: any) {
  // ...
}

// ✅ Good: Strict null checks
const user = await db.user.findUnique({ where: { id: userId } });
if (!user) throw new Error('User not found');
const email = user.email; // No type guards needed

```

### **10.2 Comments**

```tsx
// ✅ Good: Explain WHY
// We cache tenant data for 1 hour because most settings change infrequently
// and sub-second lookups are critical for auth middleware
const cacheTtl = 3600;

// ❌ Bad: Explains WHAT (code already does that)
// Increment counter by one
counter++;

```

### **10.3 Error Handling**

```tsx
// ✅ Good: Specific error types
try {
  await updateSales(data);
} catch (error) {
  if (error instanceof ValidationError) {
    return { error: 'Invalid input', status: 400 };
  } else if (error instanceof UnauthorizedError) {
    return { error: 'Access denied', status: 403 };
  }
  throw error; // Let higher-level handler deal with it
}

// ❌ Bad: Silent failures
try {
  await updateSales(data);
} catch (error) {
  console.log('oops');
  // Continues execution with undefined state
}

```

---

## **11. Git & PR Workflow**

### **11.1 Branch Naming**

```
feature/sales-dashboard-kpis
bugfix/COMP-123-null-pointer
docs/architecture-overview
chore/update-dependencies

```

### **11.2 Commit Messages**

```
feat(dashboard): add revenue vs competitors chart

- Integrate Recharts for real-time comparison
- Add multi-period selector (30d, 90d, 1y)
- Enforce tenant scoping in aggregation query
- Add unit tests for chart calculations

Fixes #COMP-456

```

### **11.3 PR Checklist**

Before opening PR:

- [ ]  Feature spec documented in `/specs/domains/`
- [ ]  All tests passing (`npm run test`)
- [ ]  No console.log() calls (except in lib/logger)
- [ ]  No commented-out code
- [ ]  [CHANGELOG.md](http://changelog.md/) updated
- [ ]  README updated if needed
- [ ]  No hardcoded secrets

---

## **12. Common Workflows**

### **12.1 Adding a New Feature**

1. **Spec** (30 min)
    
    ```bash
    touch specs/domains/[feature].md
    # Write EARS requirements + acceptance criteria
    
    ```
    
2. **Schema** (if needed)
    
    ```bash
    npx prisma migrate dev --name add_[table]
    # Create migration, test on Neon branch
    
    ```
    
3. **Backend**
    
    ```bash
    touch app/actions/[feature].ts
    touch lib/server/[feature].ts
    touch lib/server/__tests__/[feature].test.ts
    # Implement with tests
    
    ```
    
4. **Frontend**
    
    ```bash
    touch components/[Feature]/[Feature].tsx
    touch components/[Feature]/[feature]-client.tsx
    # Implement components
    
    ```
    
5. **E2E Test**
    
    ```bash
    touch e2e/[feature].spec.ts
    # Write critical path tests
    
    ```
    
6. **PR**
    
    ```bash
    git push feature/[feature-name]
    # Open PR with checklist
    
    ```
    

### **12.2 Fixing a Bug**

1. **Reproduce** (create test that fails)
2. **Fix** (minimal change)
3. **Verify** (test passes + no regressions)
4. **PR** (with "Fixes #ISSUE" in description)

### **12.3 Updating Documentation**

1. Edit relevant `.md` file
2. No code review needed if docs-only
3. Auto-merge or quick review

---

## **13. Debugging & Troubleshooting**

### **13.1 Common Issues**

| **Issue** | **Solution** |
| --- | --- |
| "Unauthorized" on mutation | Verify `getCurrentUserTenant()` is called first |
| Stale cache after update | Add `revalidatePath()` in Server Action |
| Type errors in client component | Ensure no `'use server'` in client imports |
| Multi-tenant data leak | Audit all `findMany()` queries for tenant filter |
| Slow dashboard load | Check ISR settings, consider Suspense boundaries |

### **13.2 Performance Profiling**

```tsx
// lib/server/profiler.ts
export async function measurePerformance<T>(
  label: string,
  fn: () => Promise<T>
): Promise<T> {
  const start = performance.now();
  const result = await fn();
  const duration = performance.now() - start;

  if (duration > 1000) {
    console.warn(`[PERF]${label} took${duration.toFixed(0)}ms`);
  }

  return result;
}

// Usage
const data = await measurePerformance('load-sales-data', () =>
  getDailyMetrics(dispensaryId)
);

```

---

## **14. Deployment & Release**

### **14.1 Pre-Deployment Checklist**

- [ ]  All tests passing
- [ ]  Code reviewed and approved
- [ ]  [CHANGELOG.md](http://changelog.md/) updated
- [ ]  No console.log in production code
- [ ]  Secrets are environment variables
- [ ]  Database migrations tested on Neon branch
- [ ]  Performance acceptable (Core Web Vitals green)

### **14.2 Deploy Process**

```bash
# 1. Merge to main (via PR)
# 2. GitHub Actions runs tests
# 3. Vercel auto-deploys on push to main
# 4. Production URL: https://competitive-advantage.vercel.app

```

### **14.3 Rollback**

```bash
# If production breaks:
git revert <commit-hash>
git push
# Vercel re-deploys previous version

```

---

## **15. Copilot Do's & Don'ts**

### **15.1 DO**

- ✅ Ask clarifying questions before coding
- ✅ Write specs before implementation
- ✅ Include type safety in all code
- ✅ Enforce multi-tenancy at every layer
- ✅ Test critical paths (unit + E2E)
- ✅ Document "why" in comments
- ✅ Handle all error cases explicitly
- ✅ Validate all inputs with zod
- ✅ Log errors with context
- ✅ Follow established patterns

### **15.2 DON'T**

- ❌ Generate code without a spec
- ❌ Use `any` type
- ❌ Skip input validation
- ❌ Hardcode secrets
- ❌ Leave console.log in production
- ❌ Forget tenant scoping
- ❌ Over-comment obvious code
- ❌ Ship without tests
- ❌ Use `//@ts-ignore` pragmatically
- ❌ Modify DB directly (always via migrations)

---

## **16. References**

- [**PRD.md**](http://prd.md/): Product vision & features
- [**TECH-REQUIREMENTS.md**](http://tech-requirements.md/): Detailed architecture & patterns
- [**CONTRIBUTING.md**](http://contributing.md/): Contribution guidelines
- **Spec Examples**: `/specs/domains/*.md`
- **Component Library**: `components/ui/` (shadcn/ui)

---

End of Copilot Instructions