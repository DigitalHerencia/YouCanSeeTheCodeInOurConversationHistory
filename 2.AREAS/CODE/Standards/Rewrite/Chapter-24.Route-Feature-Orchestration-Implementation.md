# Chapter 24: Route / Feature Orchestration

**The Book of Implementation™**

## Placement

```text
app/
  (tenant)/
    layout.tsx              # route-group layout — auth gate + shell
    crm/
      contacts/
        page.tsx              # thin route — Suspense + skeleton + feature
components/
  shells/
    tenant-shell.tsx           # header/nav/sidebar chrome for the (tenant) group
features/
  crm/
    crmContactsFeature.tsx      # feature orchestration
    crmContactsSkeleton.tsx     # loading fallback for this feature
```

## Golden pattern — route-group layout (auth gate + shell)

```tsx
export default async function <Group>Layout({ children }: Readonly<{ children: ReactNode }>) {
  const identity = await getIdentity();
  if (!identity) redirectToSignIn();

  if (<additional group-level gate, e.g. onboarding>) redirect("<fallback route>");

  return <<Group>Shell>{children}</<Group>Shell>;
}
```

## Golden pattern — thin page route (dynamic content)

```tsx
import { Suspense } from "react";
import { <Feature> } from "@/features/<domain>/<feature>";
import { <Feature>Skeleton } from "@/features/<domain>/<feature>Skeleton";

export default async function Page() {
  return (
    <Suspense fallback={<<Feature>Skeleton />}>
      <<Feature> />
    </Suspense>
  );
}
```

## Golden pattern — feature orchestration (pure delegation)

```tsx
import { get<X>Workflow } from "@/lib/workflows/<domain>Workflows";
import { <X>Client } from "./<feature>.client";

export async function <Feature>() {
  const data = await get<X>Workflow();
  return <<X>Client data={data} />;
}
```

## Anatomy

- **The layout resolves identity and redirects before rendering anything** — this is session/onboarding gating done once per route group, not repeated in every page beneath it.
- **The layout wraps `children` in the group's shell component** — the shared header/nav/sidebar is composed exactly once, here, never duplicated into individual pages.
- **The page's only job is the `Suspense` boundary and the fallback** — no data fetching, no business logic; everything data-related is one import away, inside the Feature.
- **The Feature is `async` and calls a Workflow, not a Fetcher directly** — matching Chapter 14's rule that composition/business-rule logic lives in the workflow layer, not scattered into the presentation layer.
- **A separate `*Skeleton` component, not an inline fallback JSX blob** — keeps the loading state reusable and testable on its own, and keeps the page route free of layout-shaped markup.

## Real worked example

Verified against the live template — the `(tenant)` route group layout and the CRM Contacts route:

```tsx
// app/(tenant)/layout.tsx
export default async function TenantLayout({ children }: Readonly<{ children: ReactNode }>) {
  const identity = await getIdentity();
  if (!identity) redirectToSignIn();

  if (!(await getOnboardingState()).completed) redirect("/onboarding");

  return <TenantShell>{children}</TenantShell>;
}
```

```tsx
// app/(tenant)/crm/contacts/page.tsx
import { Suspense } from "react";
import { CrmContactsFeature } from "@/features/crm/crmContactsFeature";
import { CrmContactsSkeleton } from "@/features/crm/crmContactsSkeleton";

export default async function Page() {
  return (
    <Suspense fallback={<CrmContactsSkeleton />}>
      <CrmContactsFeature />
    </Suspense>
  );
}
```

The page route is exactly four meaningful lines. Everything about what CRM contacts actually are, how they're fetched, and how they're rendered is entirely absent from this file by design — it lives in `CrmContactsFeature` and whatever workflow that feature calls.

## Forbidden variants (enforced, not just documented)

- **No data fetching or business logic inside a `page.tsx` file.** If a page route contains anything beyond a Suspense boundary (or a bare feature call for non-streaming content), that logic belongs in the Feature or Workflow layer instead.
- **No shared chrome (header/nav/sidebar) duplicated inside an individual page.** It belongs in the route-group layout's shell, once.
- **No inline JSX fallback replacing a purpose-built skeleton component** for genuinely dynamic content — the skeleton is a real component precisely so it can be reasoned about and reused independently of the page.
- **No Feature calling a Fetcher directly when a Workflow already exists (or should exist) for that use case** — see Chapter 14's boundary rule.
- **No `loading.tsx` used for content that's actually dynamic and specific to one feature** — that's what the per-feature Suspense + skeleton pattern is for; `loading.tsx` is reserved for genuinely static/non-dynamic routes (marketing pages, FAQ, terms).

## Checklist

- [ ] Route-group layout handles auth/onboarding gating and shell composition, once, for the whole group
- [ ] Page route contains only a Suspense boundary + skeleton fallback (or is a static route using `loading.tsx`)
- [ ] Feature is the only place calling into a Workflow; it contains no business logic itself
- [ ] A dedicated skeleton component exists for any feature with meaningfully dynamic content
- [ ] No shared chrome or gating logic duplicated below the route-group layout that owns it
