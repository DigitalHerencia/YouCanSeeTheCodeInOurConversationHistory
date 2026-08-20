---
title: 'The Hipster Stack™ Technology Stack\template\app\(public)\terms\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(public)\terms\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-public-.terms.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(public)\terms\page.tsx'
source_file: 'page.tsx'
source_sha256: 'eac72043f979f019a351130b36acdd96a47eda53bbbadb22b10e3c55cb615aab'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(public)\terms\page.tsx`
> SHA-256: `eac72043f979f019a351130b36acdd96a47eda53bbbadb22b10e3c55cb615aab`

```tsx
import { PageHero } from "@/components/blocks/page-hero"

export default function TermsPage() {
  return (
    <div className="grid gap-6">
      <PageHero
        eyebrow="Legal"
        title="Terms"
        description="Replace this white-label policy with counsel-approved product terms before launch."
      />
      <p className="text-muted-foreground">
        Provider setup and product policies remain owner-controlled.
      </p>
    </div>
  )
}

```