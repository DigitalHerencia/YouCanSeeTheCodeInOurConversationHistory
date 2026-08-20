---
title: 'The Hipster Stack™ Technology Stack\template\components\shells\public-shell.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\shells\public-shell.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.shells.public-shell.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\shells\public-shell.tsx'
source_file: 'public-shell.tsx'
source_sha256: '6cd44aa7a7713d4ff0e597e23203b6920a7117ad9f1b3da54d4f53078ddb88ef'
generated: true
---

# `public-shell.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\shells\public-shell.tsx`
> SHA-256: `6cd44aa7a7713d4ff0e597e23203b6920a7117ad9f1b3da54d4f53078ddb88ef`

```tsx
import Link from "next/link"
import type { ReactNode } from "react"

import { Wordmark } from "@/components/brand/wordmark"
import { Button } from "@/components/ui/button"
import { loadedVibesCapabilities } from "@/content/loadedvibes"
import { cn } from "@/lib/utils"

type PublicShellProps = {
  children: ReactNode
  className?: string
}

export function PublicShell({ children, className }: PublicShellProps) {
  return (
    <div className={cn("min-h-dvh", className)}>
      <header className="border-b bg-background/80 backdrop-blur">
        <div className="mx-auto flex h-16 w-full max-w-7xl items-center justify-between px-6 sm:px-10 lg:px-12">
          <Wordmark />
          {loadedVibesCapabilities.marketing ? (
            <nav className="hidden items-center gap-5 text-sm text-muted-foreground md:flex">
              <Link href="/pricing">Pricing</Link>
              <Link href="/faq">FAQ</Link>
            </nav>
          ) : null}
          <div className="flex items-center gap-2">
            <Button asChild variant="ghost" size="sm">
              <Link href="/sign-in">Sign in</Link>
            </Button>
            <Button asChild size="sm">
              <Link href="/sign-up">Start</Link>
            </Button>
          </div>
        </div>
      </header>
      <main className="mx-auto w-full max-w-7xl px-6 py-12 sm:px-10 lg:px-12 lg:py-16">
        {children}
      </main>
    </div>
  )
}

```