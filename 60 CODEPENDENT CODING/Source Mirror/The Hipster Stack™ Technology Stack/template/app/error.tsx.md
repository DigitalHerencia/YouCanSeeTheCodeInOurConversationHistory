---
title: 'The Hipster Stack™ Technology Stack\template\app\error.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\error.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.error.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\error.tsx'
source_file: 'error.tsx'
source_sha256: '7039780d7d11c6f30ef51bbac9a0c73f00769730d89589cf906f78df035dbe5f'
generated: true
---

# `error.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\error.tsx`
> SHA-256: `7039780d7d11c6f30ef51bbac9a0c73f00769730d89589cf906f78df035dbe5f`

```tsx
"use client"

import { Button } from "@/components/ui/button"

export default function ErrorPage({
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  return (
    <main className="mx-auto grid min-h-dvh max-w-xl place-content-center gap-4 px-6 text-center">
      <h1 className="text-4xl">Something went wrong.</h1>
      <p className="text-muted-foreground">The request could not be completed safely.</p>
      <Button onClick={reset}>Try again</Button>
    </main>
  )
}

```