---
title: 'The Hipster Stack™ Technology Stack\template\app\(public)\privacy\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(public)\privacy\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-public-.privacy.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(public)\privacy\page.tsx'
source_file: 'page.tsx'
source_sha256: 'd131ff0756837cab682f758cdfa9b9a6aa004ca3b9ec38fa0ceffa265a3a3228'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(public)\privacy\page.tsx`
> SHA-256: `d131ff0756837cab682f758cdfa9b9a6aa004ca3b9ec38fa0ceffa265a3a3228`

```tsx
import { PageHero } from "@/components/blocks/page-hero"

export default function PrivacyPage() {
  return (
    <div className="grid gap-6">
      <PageHero
        eyebrow="Legal"
        title="Privacy"
        description="Replace this white-label policy with counsel-approved product terms before launch."
      />
      <p className="text-muted-foreground">
        The application template does not make legal or compliance decisions for your product.
      </p>
    </div>
  )
}

```