---
title: 'The Hipster Stack™ Technology Stack\template\app\(public)\(presentation)\layout.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(public)\(presentation)\layout.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-public-.-presentation-.layout.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(public)\(presentation)\layout.tsx'
source_file: 'layout.tsx'
source_sha256: '473a7544399ee370bf39137b20bbf4d1465e37aa87cd6770e6ce296e941b7aa3'
generated: true
---

# `layout.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(public)\(presentation)\layout.tsx`
> SHA-256: `473a7544399ee370bf39137b20bbf4d1465e37aa87cd6770e6ce296e941b7aa3`

```tsx
import type { Metadata } from "next"
import { notFound } from "next/navigation"

import { isPresentationCatalogEnabled } from "@/lib/presentation/catalogAccess"

export const metadata: Metadata = {
  robots: { index: false, follow: false },
}

export default function PublicReferenceLayout({ children }: { children: React.ReactNode }) {
  if (!isPresentationCatalogEnabled()) notFound()
  return children
}

```