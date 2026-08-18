---
title: 'The Hipster Stack™ Technology Stack\template\app\not-found.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\not-found.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.not-found.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\not-found.tsx'
source_file: 'not-found.tsx'
source_sha256: 'c21a3649af2af7529958a62fea8464aed63c172080f81f6c649dee138dc2be54'
generated: true
---

# `not-found.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\not-found.tsx`
> SHA-256: `c21a3649af2af7529958a62fea8464aed63c172080f81f6c649dee138dc2be54`

```tsx
import Link from "next/link"

import { Button } from "@/components/ui/button"

export default function NotFound() {
  return (
    <main className="grid min-h-dvh place-items-center px-6">
      <div className="max-w-xl space-y-5 border bg-card p-8">
        <p className="eyebrow text-primary">404</p>
        <h1>Route not found.</h1>
        <p className="text-muted-foreground">This surface is not part of the starter route map.</p>
        <Button asChild>
          <Link href="/">Return home</Link>
        </Button>
      </div>
    </main>
  )
}

```