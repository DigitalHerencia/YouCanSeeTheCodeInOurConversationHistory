---
title: 'The Hipster Stack™ Technology Stack\template\app\(onboarding)\onboarding\complete\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(onboarding)\onboarding\complete\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-onboarding-.onboarding.complete.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(onboarding)\onboarding\complete\page.tsx'
source_file: 'page.tsx'
source_sha256: '055cf1178de0306917f8901e149c89a336939cf8e1880c229116cee07360eef6'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(onboarding)\onboarding\complete\page.tsx`
> SHA-256: `055cf1178de0306917f8901e149c89a336939cf8e1880c229116cee07360eef6`

```tsx
import Link from "next/link"
import { PageHero } from "@/components/blocks/page-hero"
import { Button } from "@/components/ui/button"

export default function OnboardingCompletePage() {
  return (
    <div className="grid gap-6">
      <PageHero
        eyebrow="Onboarding"
        title="Workspace ready."
        description="Continue into the authenticated application."
      />
      <Button asChild>
        <Link href="/dashboard">Open dashboard</Link>
      </Button>
    </div>
  )
}

```