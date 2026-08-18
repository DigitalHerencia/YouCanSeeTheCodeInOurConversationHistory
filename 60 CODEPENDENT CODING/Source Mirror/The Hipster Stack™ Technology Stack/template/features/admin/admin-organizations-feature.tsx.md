---
title: 'The Hipster Stack™ Technology Stack\template\features\admin\admin-organizations-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\admin\admin-organizations-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.admin.admin-organizations-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\admin\admin-organizations-feature.tsx'
source_file: 'admin-organizations-feature.tsx'
source_sha256: '8d651672ea353725064f5f8680e310d8d13648f38996e3d4bf4669c840d21073'
generated: true
---

# `admin-organizations-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\admin\admin-organizations-feature.tsx`
> SHA-256: `8d651672ea353725064f5f8680e310d8d13648f38996e3d4bf4669c840d21073`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { getAdminOrganizations } from "@/lib/fetchers/adminFetchers"

export async function AdminOrganizationsFeature() {
  const organizations = await getAdminOrganizations()
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Application administration"
        title="Organizations"
        description="Tenant status and bounded usage counts without crossing organization mutation boundaries."
      />
      <div className="grid gap-3">
        {organizations.map((organization) => (
          <article key={organization.id} className="grid gap-1 border bg-card p-4 md:grid-cols-3">
            <div>
              <p className="font-medium">{organization.name}</p>
              <p className="text-sm text-muted-foreground">{organization.slug}</p>
            </div>
            <p className="text-sm">{organization.memberCount} members</p>
            <p className="text-sm">
              {organization.projectCount} projects · {organization.status}
            </p>
          </article>
        ))}
        {organizations.length === 0 ? (
          <p className="text-muted-foreground">No organizations recorded.</p>
        ) : null}
      </div>
    </div>
  )
}

```