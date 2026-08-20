---
title: 'The Hipster Stack™ Technology Stack\template\features\admin\admin-billing-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\admin\admin-billing-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.admin.admin-billing-feature.tsx'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\features\admin\admin-billing-feature.tsx'
source_file: 'admin-billing-feature.tsx'
source_sha256: '2c4da3d76b7c76e844556e50849a3ef5aa88ad7a770f62271ff02e3adbd65c70'
generated: true
---

# `admin-billing-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\admin\admin-billing-feature.tsx`
> SHA-256: `2c4da3d76b7c76e844556e50849a3ef5aa88ad7a770f62271ff02e3adbd65c70`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { getAdminBilling } from "@/lib/fetchers/adminFetchers"

export async function AdminBillingFeature() {
  const subscriptions = await getAdminBilling()
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Application administration"
        title="Billing"
        description="Synchronized subscription state from the application database; provider secrets remain outside this surface."
      />
      <div className="grid gap-3">
        {subscriptions.map((subscription) => (
          <article key={subscription.id} className="grid gap-1 border bg-card p-4 md:grid-cols-3">
            <div>
              <p className="font-medium">{subscription.organizationName}</p>
              <p className="text-sm text-muted-foreground">{subscription.organizationSlug}</p>
            </div>
            <p className="text-sm">Status: {subscription.status}</p>
            <p className="text-sm">
              {subscription.cancelAtPeriodEnd ? "Cancels at period end" : "Renews"}
            </p>
          </article>
        ))}
        {subscriptions.length === 0 ? (
          <p className="text-muted-foreground">No subscriptions recorded.</p>
        ) : null}
      </div>
    </div>
  )
}

```