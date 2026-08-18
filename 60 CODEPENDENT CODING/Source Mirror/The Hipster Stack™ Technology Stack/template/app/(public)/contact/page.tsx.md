---
title: 'The Hipster Stack™ Technology Stack\template\app\(public)\contact\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(public)\contact\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-public-.contact.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(public)\contact\page.tsx'
source_file: 'page.tsx'
source_sha256: '1ed9e42f6ddd33f3608cd3f780f3eb4f7056d8d995d295ff153b192b2c8660de'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(public)\contact\page.tsx`
> SHA-256: `1ed9e42f6ddd33f3608cd3f780f3eb4f7056d8d995d295ff153b192b2c8660de`

```tsx
import { PageHero } from "@/components/blocks/page-hero"
import { marketingContent } from "@/content/marketing"

export default function ContactPage() {
  return (
    <PageHero
      eyebrow="Contact"
      title="Talk with our team."
      description={`Reach us at ${marketingContent.contactEmail}.`}
    />
  )
}

```