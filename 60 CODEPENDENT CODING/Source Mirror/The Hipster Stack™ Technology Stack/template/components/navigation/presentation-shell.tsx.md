---
title: 'The Hipster Stack™ Technology Stack\template\components\navigation\presentation-shell.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\navigation\presentation-shell.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.navigation.presentation-shell.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\navigation\presentation-shell.tsx'
source_file: 'presentation-shell.tsx'
source_sha256: '7ce0dc389557223cb540f7897a6b5335706270d624b1c2b2243852bae4ecae92'
generated: true
---

# `presentation-shell.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\navigation\presentation-shell.tsx`
> SHA-256: `7ce0dc389557223cb540f7897a6b5335706270d624b1c2b2243852bae4ecae92`

```tsx
// components/navigation/public-shell.tsx

import type { ReactNode } from "react"

import { PublicMobileBottomNav } from "@/components/navigation/mobile-bottom-nav"
import { PublicFooter } from "@/components/navigation/public-footer"
import { PresentationHeader } from "@/components/navigation/presentation-header"

export interface PresentationShellProps {
  children: ReactNode
  withMobileBottomNav?: boolean | undefined
}

export function PresentationShell({
  children,
  withMobileBottomNav = true,
}: PresentationShellProps) {
  return (
    <div className="min-h-dvh">
      <PresentationHeader />
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