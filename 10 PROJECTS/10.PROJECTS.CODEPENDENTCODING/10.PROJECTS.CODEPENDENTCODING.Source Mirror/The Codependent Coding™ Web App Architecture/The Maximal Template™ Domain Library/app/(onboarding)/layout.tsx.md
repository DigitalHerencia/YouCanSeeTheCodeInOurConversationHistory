---
title: 'The Hipster Stack™ Technology Stack\template\app\(onboarding)\layout.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(onboarding)\layout.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-onboarding-.layout.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(onboarding)\layout.tsx'
source_file: 'layout.tsx'
source_sha256: '94f03dc2b5bf5c70f4483e7ff14cf85c24f5ee45996bcd87c51b93fec24a8edb'
generated: true
---

# `layout.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(onboarding)\layout.tsx`
> SHA-256: `94f03dc2b5bf5c70f4483e7ff14cf85c24f5ee45996bcd87c51b93fec24a8edb`

```tsx
import type { ReactNode } from "react"
import { notFound } from "next/navigation"
import { TenantShell } from "@/components/shells/tenant-shell"
import { loadedVibesCapabilities } from "@/content/loadedvibes"

export default function OnboardingLayout({ children }: { children: ReactNode }) {
  if (!loadedVibesCapabilities.onboarding) notFound()
  return <TenantShell>{children}</TenantShell>
}

```