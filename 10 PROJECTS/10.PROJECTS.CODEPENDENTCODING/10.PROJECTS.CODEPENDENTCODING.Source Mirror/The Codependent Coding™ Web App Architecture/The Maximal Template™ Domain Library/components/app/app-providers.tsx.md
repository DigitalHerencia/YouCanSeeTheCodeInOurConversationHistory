---
title: 'The Hipster Stack™ Technology Stack\template\components\app\app-providers.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\app\app-providers.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.app.app-providers.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\app\app-providers.tsx'
source_file: 'app-providers.tsx'
source_sha256: 'f6e5e46fad3e7a1e927115d4bff1bbec5027e5cb0c08f41ccaba0fd40a33402c'
generated: true
---

# `app-providers.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\app\app-providers.tsx`
> SHA-256: `f6e5e46fad3e7a1e927115d4bff1bbec5027e5cb0c08f41ccaba0fd40a33402c`

```tsx
"use client"

import { ClerkProvider } from "@clerk/nextjs"
import type { ReactNode } from "react"

type AppProvidersProps = Readonly<{
  children: ReactNode
}>

export function AppProviders({ children }: AppProvidersProps) {
  return <ClerkProvider>{children}</ClerkProvider>
}

```