---
title: 'The Hipster Stack™ Technology Stack\template\components\ui\textarea.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\ui\textarea.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.ui.textarea.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\ui\textarea.tsx'
source_file: 'textarea.tsx'
source_sha256: '4a76bbe38cbe75dc8f98cf74f9556c51b30b20dfb3fedeb9fc2c3e111f703bc6'
generated: true
---

# `textarea.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\ui\textarea.tsx`
> SHA-256: `4a76bbe38cbe75dc8f98cf74f9556c51b30b20dfb3fedeb9fc2c3e111f703bc6`

```tsx
import * as React from "react"

import { cn } from "@/lib/utils"

export const Textarea = React.forwardRef<HTMLTextAreaElement, React.ComponentProps<"textarea">>(
  ({ className, ...props }, ref) => (
    <textarea
      ref={ref}
      className={cn(
        "flex min-h-24 w-full border border-border bg-background px-3 py-2 text-sm disabled:opacity-50",
        className
      )}
      {...props}
    />
  )
)
Textarea.displayName = "Textarea"

```