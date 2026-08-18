---
title: 'The Hipster Stack™ Technology Stack\template\components\ui\input.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\ui\input.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.ui.input.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\ui\input.tsx'
source_file: 'input.tsx'
source_sha256: '6d88bb378e2b7ca9c5368c970d8f29f1671f02a8d97a79739b31ce6ab8241d6f'
generated: true
---

# `input.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\ui\input.tsx`
> SHA-256: `6d88bb378e2b7ca9c5368c970d8f29f1671f02a8d97a79739b31ce6ab8241d6f`

```tsx
import * as React from "react"

import { cn } from "@/lib/utils"

export const Input = React.forwardRef<
  HTMLInputElement,
  React.InputHTMLAttributes<HTMLInputElement>
>(({ className, ...props }, ref) => (
  <input
    ref={ref}
    className={cn(
      "h-11 w-full border border-input bg-background px-3 py-2 text-sm text-foreground outline-none placeholder:text-muted-foreground focus-visible:ring-2 focus-visible:ring-ring",
      className
    )}
    {...props}
  />
))
Input.displayName = "Input"

```