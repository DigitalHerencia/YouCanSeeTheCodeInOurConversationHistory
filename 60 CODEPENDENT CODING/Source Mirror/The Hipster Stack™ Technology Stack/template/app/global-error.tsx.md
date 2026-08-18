---
title: 'The Hipster Stack™ Technology Stack\template\app\global-error.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\global-error.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.global-error.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\global-error.tsx'
source_file: 'global-error.tsx'
source_sha256: '739eb469073cf221021f7a799b1490d45a051c5d05a9f7a3bdf53288c1d732c7'
generated: true
---

# `global-error.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\global-error.tsx`
> SHA-256: `739eb469073cf221021f7a799b1490d45a051c5d05a9f7a3bdf53288c1d732c7`

```tsx
"use client"

import { Button } from "@/components/ui/button"

export default function GlobalError({ reset }: { error: Error; reset: () => void }) {
  return (
    <html lang="en">
      <body>
        <main className="grid min-h-dvh place-items-center px-6">
          <div className="max-w-xl space-y-5 border bg-card p-8">
            <p className="eyebrow text-primary">Error</p>
            <h1>Something failed.</h1>
            <p className="text-muted-foreground">
              The app can retry this render without changing state.
            </p>
            <Button type="button" onClick={reset}>
              Retry
            </Button>
          </div>
        </main>
      </body>
    </html>
  )
}

```