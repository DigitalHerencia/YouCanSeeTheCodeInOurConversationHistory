---
title: 'The Hipster Stack™ Technology Stack\template\features\admin\admin-dashboard-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\admin\admin-dashboard-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.admin.admin-dashboard-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\admin\admin-dashboard-feature.tsx'
source_file: 'admin-dashboard-feature.tsx'
source_sha256: 'b6d4ab8c36fb13728189ed71cdf1fbb215249a6defd69e791cb4c97348c04097'
generated: true
---

# `admin-dashboard-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\admin\admin-dashboard-feature.tsx`
> SHA-256: `b6d4ab8c36fb13728189ed71cdf1fbb215249a6defd69e791cb4c97348c04097`

```tsx
import Link from "next/link"

import { PageHero } from "@/components/blocks/page-hero"
import { StatGrid } from "@/components/blocks/stat-grid"
import { Button } from "@/components/ui/button"
import { getAdminOverview } from "@/lib/fetchers/adminFetchers"

const adminSections = [
  { href: "/admin/users", label: "Users" },
  { href: "/admin/organizations", label: "Organizations" },
  { href: "/admin/billing", label: "Billing" },
  { href: "/admin/webhooks", label: "Webhooks" },
] as const

export async function AdminDashboardFeature() {
  const overview = await getAdminOverview()
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Application administration"
        title="Operate the application boundary."
        description="This surface uses an application-owned administrator flag, not identity-provider metadata."
      />
      <StatGrid
        stats={[
          { label: "Users", value: String(overview.users) },
          { label: "Tenant access", value: "Explicit" },
          { label: "Webhook attention", value: String(overview.webhooks) },
        ]}
      />
      <nav className="flex flex-wrap gap-2" aria-label="Administration sections">
        {adminSections.map((item) => (
          <Button key={item.href} asChild variant="outline" size="sm">
            <Link href={item.href}>{item.label}</Link>
          </Button>
        ))}
      </nav>
    </div>
  )
}

```