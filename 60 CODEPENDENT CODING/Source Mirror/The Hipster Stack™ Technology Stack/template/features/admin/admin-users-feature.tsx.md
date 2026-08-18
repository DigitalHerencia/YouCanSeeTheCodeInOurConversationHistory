---
title: 'The Hipster Stack™ Technology Stack\template\features\admin\admin-users-feature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\features\admin\admin-users-feature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.features.admin.admin-users-feature.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\features\admin\admin-users-feature.tsx'
source_file: 'admin-users-feature.tsx'
source_sha256: 'c53ec09a99401b976cc8b03bbb8ae2911c9469f402aba802e80520ddf601228e'
generated: true
---

# `admin-users-feature.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\features\admin\admin-users-feature.tsx`
> SHA-256: `c53ec09a99401b976cc8b03bbb8ae2911c9469f402aba802e80520ddf601228e`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { getAdminUsers } from "@/lib/fetchers/adminFetchers"

export async function AdminUsersFeature() {
  const users = await getAdminUsers()
  return (
    <div className="grid gap-8">
      <PageHero
        eyebrow="Application administration"
        title="Users"
        description="Application-owned user status and administrator access, read through a self-securing admin fetcher."
      />
      <div className="grid gap-3">
        {users.map((user) => (
          <article key={user.id} className="grid gap-1 border bg-card p-4 md:grid-cols-3">
            <div>
              <p className="font-medium">{user.displayName}</p>
              <p className="text-sm text-muted-foreground">{user.email ?? "No email"}</p>
            </div>
            <p className="text-sm">Status: {user.status}</p>
            <p className="text-sm">
              {user.isApplicationAdmin ? "Application admin" : "Standard user"}
            </p>
          </article>
        ))}
        {users.length === 0 ? <p className="text-muted-foreground">No users recorded.</p> : null}
      </div>
    </div>
  )
}

```