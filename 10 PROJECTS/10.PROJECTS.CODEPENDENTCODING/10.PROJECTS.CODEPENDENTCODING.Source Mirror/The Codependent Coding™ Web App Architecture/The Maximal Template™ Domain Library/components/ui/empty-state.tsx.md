---
title: 'The Hipster Stack™ Technology Stack\template\components\ui\empty-state.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\ui\empty-state.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.ui.empty-state.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\ui\empty-state.tsx'
source_file: 'empty-state.tsx'
source_sha256: 'ce55b5cca6002f1272fa1b3cca896aa9140ce4517e00e515a5eab585631a49ea'
generated: true
---

# `empty-state.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\ui\empty-state.tsx`
> SHA-256: `ce55b5cca6002f1272fa1b3cca896aa9140ce4517e00e515a5eab585631a49ea`

```tsx
import * as React from "react"

import { cn } from "@/lib/utils"

const presets = {
  "no-data": { title: "No data available", description: "There is nothing to display yet." },
  offline: { title: "You are offline", description: "Check your connection and try again." },
} as const

export interface EmptyStatePresetProps extends React.ComponentPropsWithoutRef<"div"> {
  preset: keyof typeof presets
  customTitle?: string
  customDescription?: string
  action?: React.ReactNode
  variant?: "default" | "filled" | "card"
  size?: "compact" | "sm" | "md" | "lg"
}

export const EmptyStatePreset = React.forwardRef<HTMLDivElement, EmptyStatePresetProps>(
  ({ preset, customTitle, customDescription, action, className, variant, size, ...props }, ref) => {
    const content = presets[preset]
    return (
      <div
        ref={ref}
        data-variant={variant}
        data-size={size}
        className={cn("flex flex-col items-center gap-3 p-6 text-center", className)}
        {...props}
      >
        <h3 className="font-semibold">{customTitle ?? content.title}</h3>
        <p className="text-sm text-muted-foreground">{customDescription ?? content.description}</p>
        {action}
      </div>
    )
  }
)
EmptyStatePreset.displayName = "EmptyStatePreset"

```