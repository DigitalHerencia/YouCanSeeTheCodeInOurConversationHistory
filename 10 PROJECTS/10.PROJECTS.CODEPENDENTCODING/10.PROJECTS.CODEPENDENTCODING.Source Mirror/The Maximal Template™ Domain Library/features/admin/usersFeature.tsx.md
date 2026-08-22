---
title: 'The Maximal Template™ Domain Library\features\admin\usersFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\admin\usersFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.admin.usersfeature.tsx'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\features\admin\usersFeature.tsx'
source_file: 'usersFeature.tsx'
source_sha256: '53ba4ace9fd17cd6e1124853d5c63b0b602c9aa327864ac36e1a78e93028878d'
generated: true
---

# `usersFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\admin\usersFeature.tsx`
> SHA-256: `53ba4ace9fd17cd6e1124853d5c63b0b602c9aa327864ac36e1a78e93028878d`

```tsx
import {
  DataTableBlock,
  PageHeaderBlock,
} from "@/components/blocks/application-sections";
import { getAdminMemberships } from "@/lib/fetchers/adminFetchers";

// Features orchestrate blocks and lib helpers; they never import raw UI primitives.
export async function UsersFeature() {
  const memberships = await getAdminMemberships();
  return (
    <div className="space-y-6">
      <PageHeaderBlock
        eyebrow="Administration"
        title="Users and memberships"
        description="Membership state for the active organization; user administration requires an explicit privileged capability."
      />
      <DataTableBlock
        columns={[
          { key: "name", label: "User" },
          { key: "email", label: "Email" },
          { key: "role", label: "Role" },
          { key: "status", label: "Status" },
          { key: "joined", label: "Joined" },
        ]}
        rows={memberships.map((membership) => ({
          id: membership.id,
          cells: {
            name: membership.user.displayName,
            email: membership.user.email,
            role: membership.role,
            status: membership.status,
            joined: new Date(membership.createdAt).toLocaleDateString(),
          },
        }))}
      />
    </div>
  );
}

```