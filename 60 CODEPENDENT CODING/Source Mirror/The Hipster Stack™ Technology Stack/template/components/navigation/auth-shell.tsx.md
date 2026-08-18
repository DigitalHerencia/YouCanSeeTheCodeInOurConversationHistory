---
title: 'The Hipster Stack™ Technology Stack\template\components\navigation\auth-shell.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\navigation\auth-shell.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.navigation.auth-shell.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\navigation\auth-shell.tsx'
source_file: 'auth-shell.tsx'
source_sha256: '6374460de3ae7b362f8b112beea42969b65b3b1ffd937755619b8f10835cb716'
generated: true
---

# `auth-shell.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\navigation\auth-shell.tsx`
> SHA-256: `6374460de3ae7b362f8b112beea42969b65b3b1ffd937755619b8f10835cb716`

```tsx
import type { ReactNode } from "react"

import { AuthFooter } from "@/components/navigation/auth-footer"
import { AuthHeader } from "@/components/navigation/auth-header"

export interface AuthShellProps {
  children: ReactNode
}

export function AuthShell({ children }: AuthShellProps) {
  return (
    <div className="relative h-dvh overflow-hidden">
      <div className="h-full min-h-0 w-full overflow-hidden">{children}</div>

      <div className="pointer-events-none absolute inset-x-0 top-0 z-10 grid grid-cols-1 md:grid-cols-2">
        <div className="hidden md:block" />
        <div className="pointer-events-auto">
          <AuthHeader />
        </div>
      </div>

      <div className="pointer-events-none absolute inset-x-0 bottom-0 z-10 grid grid-cols-1 md:grid-cols-2">
        <div className="pointer-events-auto">
          <AuthFooter />
        </div>
        <div className="hidden md:block" />
      </div>
    </div>
  )
}

```