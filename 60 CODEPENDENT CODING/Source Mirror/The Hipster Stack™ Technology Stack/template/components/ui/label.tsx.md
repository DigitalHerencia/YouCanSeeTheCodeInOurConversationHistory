---
title: 'The Hipster Stack™ Technology Stack\template\components\ui\label.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\ui\label.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.ui.label.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\ui\label.tsx'
source_file: 'label.tsx'
source_sha256: '43d7c0620911c91cba5b01596a1c10abf31fbeb63457cf543bc0ab3e2b35a1ff'
generated: true
---

# `label.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\ui\label.tsx`
> SHA-256: `43d7c0620911c91cba5b01596a1c10abf31fbeb63457cf543bc0ab3e2b35a1ff`

```tsx
import * as React from "react"
import * as LabelPrimitive from "@radix-ui/react-label"

import { cn } from "@/lib/utils"

export const Label = React.forwardRef<
  React.ElementRef<typeof LabelPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof LabelPrimitive.Root>
>(({ className, ...props }, ref) => (
  <LabelPrimitive.Root
    ref={ref}
    className={cn("text-xs font-medium text-muted-foreground", className)}
    {...props}
  />
))
Label.displayName = LabelPrimitive.Root.displayName

```