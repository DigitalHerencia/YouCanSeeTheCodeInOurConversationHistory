---
title: 'The Hipster Stack™ Technology Stack\template\app\(admin)\layout.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(admin)\layout.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-admin-.layout.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(admin)\layout.tsx'
source_file: 'layout.tsx'
source_sha256: 'f281ce49a96e8c04a92df438d947a3259347589a69350603954b63d5a818ea06'
generated: true
---

# `layout.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(admin)\layout.tsx`
> SHA-256: `f281ce49a96e8c04a92df438d947a3259347589a69350603954b63d5a818ea06`

```tsx
import type { ReactNode } from "react"
import { notFound } from "next/navigation"
import { TenantShell } from "@/components/shells/tenant-shell"
import { loadedVibesCapabilities } from "@/content/loadedvibes"

export default function AdminLayout({ children }: { children: ReactNode }) {
  if (!loadedVibesCapabilities.admin) notFound()
  return <TenantShell>{children}</TenantShell>
}

```