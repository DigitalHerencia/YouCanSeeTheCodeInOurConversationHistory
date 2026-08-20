---
title: 'The Hipster Stack™ Technology Stack\template\app\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\page.tsx'
source_file: 'page.tsx'
source_sha256: 'c234412547bc168edbc95e70fef118489b8df3d4218fddb6d91ad24e0547c59b'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\page.tsx`
> SHA-256: `c234412547bc168edbc95e70fef118489b8df3d4218fddb6d91ad24e0547c59b`

```tsx
import Link from "next/link"

import { PageHero } from "@/components/blocks/page-hero"
import { ProcessPanel } from "@/components/blocks/process-panel"
import { StatGrid } from "@/components/blocks/stat-grid"
import { Button } from "@/components/ui/button"
import { loadedVibesCapabilities } from "@/content/loadedvibes"
import { site } from "@/content/site"

export default function HomePage() {
  return (
    <div className="grid gap-10">
      <PageHero eyebrow="Generic SaaS starter" title={site.name} description={site.description} />
      <div className="flex flex-wrap gap-3">
        <Button asChild>
          <Link href="/sign-up">Start the app</Link>
        </Button>
        {loadedVibesCapabilities.marketing ? (
          <Button asChild variant="outline">
            <Link href="/pricing">View pricing</Link>
          </Button>
        ) : null}
      </div>
      <StatGrid
        stats={[
          { label: "Runtime", value: "RSC" },
          { label: "Writes", value: "Actions" },
          { label: "Authz", value: "Rows" },
        ]}
      />
      <ProcessPanel
        title="How the stack works"
        steps={[
          {
            title: "Identify",
            description: "Clerk owns identity and session lifecycle without organizations.",
          },
          {
            title: "Authorize",
            description: "Local Prisma rows decide whether a user can read or write a resource.",
          },
          {
            title: "Persist",
            description:
              "Server Actions validate inputs and transactions write deterministic state.",
          },
        ]}
      />
    </div>
  )
}

```