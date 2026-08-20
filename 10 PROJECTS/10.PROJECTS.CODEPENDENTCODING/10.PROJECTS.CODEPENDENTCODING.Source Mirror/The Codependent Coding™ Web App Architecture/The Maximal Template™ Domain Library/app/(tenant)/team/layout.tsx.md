---
title: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\team\layout.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\team\layout.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-tenant-.team.layout.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(tenant)\team\layout.tsx'
source_file: 'layout.tsx'
source_sha256: 'aa5192847226acf2f2fcd507f5022fa2c2b243b7c9c6d6bed44daca0ed3e4125'
generated: true
---

# `layout.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(tenant)\team\layout.tsx`
> SHA-256: `aa5192847226acf2f2fcd507f5022fa2c2b243b7c9c6d6bed44daca0ed3e4125`

```tsx
import { notFound } from "next/navigation"
import type { ReactNode } from "react"

import { loadedVibesCapabilities } from "@/content/loadedvibes"

export default function TeamLayout({ children }: { children: ReactNode }) {
  if (!loadedVibesCapabilities.invitations) notFound()
  return children
}

```