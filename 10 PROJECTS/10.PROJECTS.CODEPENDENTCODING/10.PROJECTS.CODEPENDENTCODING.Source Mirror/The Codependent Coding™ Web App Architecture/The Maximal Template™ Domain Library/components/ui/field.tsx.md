---
title: 'The Hipster Stack™ Technology Stack\template\components\ui\field.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\ui\field.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.ui.field.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\ui\field.tsx'
source_file: 'field.tsx'
source_sha256: '2152f6253feb29c5ad6c72c7522f503db0260240f4f2e103ad3f59791dd8eec4'
generated: true
---

# `field.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\ui\field.tsx`
> SHA-256: `2152f6253feb29c5ad6c72c7522f503db0260240f4f2e103ad3f59791dd8eec4`

```tsx
import type { ReactNode } from "react"

import { cn } from "@/lib/utils"

type FieldProps = {
  children: ReactNode
  className?: string
}

export function Field({ children, className }: FieldProps) {
  return <div className={cn("grid gap-2", className)}>{children}</div>
}

export function FieldError({ children }: { children?: ReactNode }) {
  if (!children) return null
  return <p className="text-sm text-destructive">{children}</p>
}

```