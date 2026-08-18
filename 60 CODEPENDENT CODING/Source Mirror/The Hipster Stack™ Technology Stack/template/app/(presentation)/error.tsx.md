---
title: 'The Hipster Stack™ Technology Stack\template\app\(presentation)\error.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(presentation)\error.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-presentation-.error.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(presentation)\error.tsx'
source_file: 'error.tsx'
source_sha256: 'e3967f14803e30510b90b9a7d00a77a9bd9e882f2ce9965b99b9a350b2539036'
generated: true
---

# `error.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(presentation)\error.tsx`
> SHA-256: `e3967f14803e30510b90b9a7d00a77a9bd9e882f2ce9965b99b9a350b2539036`

```tsx
"use client"

import { useEffect } from "react"

import { GenericErrorPage } from "@/components/blocks/error-pages"

export default function PublicError({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  useEffect(() => {
    console.error("public route error", { message: error.message, digest: error.digest })
  }, [error])

  return (
    <GenericErrorPage
      title="Public view failed"
      description="This public Vouch surface could not render. Try again or return home."
      actions={[
        { label: "Try again", onClick: reset },
        { label: "Home", href: "/", variant: "outline" },
      ]}
    />
  )
}

```