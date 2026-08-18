---
title: 'The Hipster Stack™ Technology Stack\template\app\(auth)\(presentation)\layout.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(auth)\(presentation)\layout.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-auth-.-presentation-.layout.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(auth)\(presentation)\layout.tsx'
source_file: 'layout.tsx'
source_sha256: '8572edbc2169173bc192fb6c6d30137216679e6879dab325b53b4ab5f1d2b18c'
generated: true
---

# `layout.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(auth)\(presentation)\layout.tsx`
> SHA-256: `8572edbc2169173bc192fb6c6d30137216679e6879dab325b53b4ab5f1d2b18c`

```tsx
import type { Metadata } from "next"
import { notFound } from "next/navigation"

import { isPresentationCatalogEnabled } from "@/lib/presentation/catalogAccess"

export const metadata: Metadata = {
  robots: { index: false, follow: false },
}

export default function AuthReferenceLayout({ children }: { children: React.ReactNode }) {
  if (!isPresentationCatalogEnabled()) notFound()
  return children
}

```