---
title: 'The Hipster Stack™ Technology Stack\template\components\navigation\public-shell.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\navigation\public-shell.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.navigation.public-shell.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\navigation\public-shell.tsx'
source_file: 'public-shell.tsx'
source_sha256: '64ba42a14826aaafcfafb06d5d4b6bc54c7ea3fd955d20401a99ac1952d57b16'
generated: true
---

# `public-shell.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\navigation\public-shell.tsx`
> SHA-256: `64ba42a14826aaafcfafb06d5d4b6bc54c7ea3fd955d20401a99ac1952d57b16`

```tsx
// components/navigation/public-shell.tsx

import type { ReactNode } from "react"

import { PublicMobileBottomNav } from "@/components/navigation/mobile-bottom-nav"
import { PublicFooter } from "@/components/navigation/public-footer"
import { PublicHeader } from "@/components/navigation/public-header"

export interface PublicShellProps {
  children: ReactNode
  withMobileBottomNav?: boolean | undefined
}

export function PublicShell({ children, withMobileBottomNav = true }: PublicShellProps) {
  return (
    <div className="min-h-dvh">
      <PublicHeader />
      <main
        className={
          withMobileBottomNav ? "mx-auto w-full max-w-7xl" : "mx-auto w-full max-w-7xl pb-0"
        }
      >
        {children}
      </main>
      <PublicFooter />
      {withMobileBottomNav ? <PublicMobileBottomNav /> : null}
    </div>
  )
}

```