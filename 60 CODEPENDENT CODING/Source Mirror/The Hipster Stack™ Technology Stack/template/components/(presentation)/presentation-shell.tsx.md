---
title: 'The Hipster Stack™ Technology Stack\template\components\(presentation)\presentation-shell.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\(presentation)\presentation-shell.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.-presentation-.presentation-shell.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\(presentation)\presentation-shell.tsx'
source_file: 'presentation-shell.tsx'
source_sha256: '1f600493e33a0118459bc9247f9b76b1938b474550f88b9af04b1306f7a066d9'
generated: true
---

# `presentation-shell.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\(presentation)\presentation-shell.tsx`
> SHA-256: `1f600493e33a0118459bc9247f9b76b1938b474550f88b9af04b1306f7a066d9`

```tsx
// components/navigation/public-shell.tsx

import type { ReactNode } from "react"

import { PublicMobileBottomNav } from "@/components/navigation/mobile-bottom-nav"
import { PublicFooter } from "@/components/navigation/public-footer"
import { PresentationHeader } from "@/components/(presentation)/presentation-header"

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