---
title: 'The Hipster Stack™ Technology Stack\template\app\(presentation)\layout.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(presentation)\layout.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-presentation-.layout.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(presentation)\layout.tsx'
source_file: 'layout.tsx'
source_sha256: 'cc41327f20c7a2c1abb97dbf738970732fe5e939cc799a5fe0314abecf1792f7'
generated: true
---

# `layout.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(presentation)\layout.tsx`
> SHA-256: `cc41327f20c7a2c1abb97dbf738970732fe5e939cc799a5fe0314abecf1792f7`

```tsx
import type { Metadata } from "next"
import { notFound } from "next/navigation"

import { PresentationShell } from "@/components/(presentation)/presentation-shell"
import { isPresentationCatalogEnabled } from "@/lib/presentation/catalogAccess"

export const metadata: Metadata = {
  robots: { index: false, follow: false },
}

export default function PresentationLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  if (!isPresentationCatalogEnabled()) notFound()

  return <PresentationShell>{children}</PresentationShell>
}

```