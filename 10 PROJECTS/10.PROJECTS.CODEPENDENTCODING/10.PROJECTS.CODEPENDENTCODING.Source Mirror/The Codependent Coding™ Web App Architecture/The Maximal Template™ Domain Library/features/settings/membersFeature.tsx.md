---
title: 'The Maximal Template™ Domain Library\features\settings\membersFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\settings\membersFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.settings.membersfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\settings\membersFeature.tsx'
source_file: 'membersFeature.tsx'
source_sha256: '2ad29c41d003483c7e0ae55a98b03300c952993c9c6be24f08e0ba4009a0ae2c'
generated: true
---

# `membersFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\settings\membersFeature.tsx`
> SHA-256: `2ad29c41d003483c7e0ae55a98b03300c952993c9c6be24f08e0ba4009a0ae2c`

```tsx
export function MembersFeature() {
  return (
    <section className="space-y-4 border-3 border-foreground bg-card p-6">
      <div>
        <p className="text-sm font-semibold uppercase tracking-widest">
          Application-owned access
        </p>
        <h1 className="mt-1 text-2xl font-bold">Members & roles</h1>
      </div>
      <p className="max-w-2xl text-sm text-muted-foreground">
        Membership management belongs to the application database, not Clerk
        Organizations.
      </p>
      <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
        {[
          ["Owner", "Full workspace control"],
          ["Admin", "Administrative access"],
          ["Member", "Standard product access"],
          ["Viewer", "Read-only access"],
        ].map(([role, description]) => (
          <article key={role} className="border-2 border-foreground p-4">
            <h2 className="font-semibold">{role}</h2>
            <p className="mt-1 text-sm text-muted-foreground">{description}</p>
          </article>
        ))}
      </div>
    </section>
  );
}

```