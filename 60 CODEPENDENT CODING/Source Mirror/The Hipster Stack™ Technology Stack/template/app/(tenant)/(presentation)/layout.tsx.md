---
title: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\layout.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\layout.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-tenant-.-presentation-.layout.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\layout.tsx'
source_file: 'layout.tsx'
source_sha256: '42c912452eaade91f4f677409b1f29057bf23ef4b2e18fb12c487b8d36e5aff1'
generated: true
---

# `layout.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(tenant)\(presentation)\layout.tsx`
> SHA-256: `42c912452eaade91f4f677409b1f29057bf23ef4b2e18fb12c487b8d36e5aff1`

```tsx
import type { Metadata } from "next"
import { notFound } from "next/navigation"

import { isPresentationCatalogEnabled } from "@/lib/presentation/catalogAccess"

export const metadata: Metadata = {
  robots: { index: false, follow: false },
}

export default function TenantReferenceLayout({ children }: { children: React.ReactNode }) {
  if (!isPresentationCatalogEnabled()) notFound()
  return children
}

```