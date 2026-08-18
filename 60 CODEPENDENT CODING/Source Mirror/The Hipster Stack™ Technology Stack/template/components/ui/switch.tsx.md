---
title: 'The Hipster Stack™ Technology Stack\template\components\ui\switch.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\ui\switch.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.ui.switch.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\ui\switch.tsx'
source_file: 'switch.tsx'
source_sha256: '0895599dbdfd7a1be67845f5c784d002b23f4cc470a61d18023a9e653ddd8853'
generated: true
---

# `switch.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\ui\switch.tsx`
> SHA-256: `0895599dbdfd7a1be67845f5c784d002b23f4cc470a61d18023a9e653ddd8853`

```tsx
import * as React from "react"
import * as SwitchPrimitive from "@radix-ui/react-switch"

import { cn } from "@/lib/utils"

export const Switch = React.forwardRef<
  React.ComponentRef<typeof SwitchPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof SwitchPrimitive.Root>
>(({ className, ...props }, ref) => (
  <SwitchPrimitive.Root
    ref={ref}
    className={cn(
      "inline-flex h-6 w-11 items-center border border-border bg-muted data-[state=checked]:bg-primary",
      className
    )}
    {...props}
  >
    <SwitchPrimitive.Thumb className="block size-5 bg-background transition-transform data-[state=checked]:translate-x-5" />
  </SwitchPrimitive.Root>
))
Switch.displayName = SwitchPrimitive.Root.displayName

```