---
title: 'The Hipster Stack™ Technology Stack\template\app\(billing)\layout.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(billing)\layout.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-billing-.layout.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(billing)\layout.tsx'
source_file: 'layout.tsx'
source_sha256: '439e174652d90e528ee881f4b8c346b21d84d8d19bdbfe66177513ae40c76f48'
generated: true
---

# `layout.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(billing)\layout.tsx`
> SHA-256: `439e174652d90e528ee881f4b8c346b21d84d8d19bdbfe66177513ae40c76f48`

```tsx
import { notFound } from "next/navigation"
import type { ReactNode } from "react"

import { TenantShell } from "@/components/shells/tenant-shell"
import { loadedVibesCapabilities } from "@/content/loadedvibes"

export default function BillingLayout({ children }: { children: ReactNode }) {
  if (!loadedVibesCapabilities.billing) notFound()
  return <TenantShell>{children}</TenantShell>
}

```