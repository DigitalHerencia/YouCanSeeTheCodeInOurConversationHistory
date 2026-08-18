---
title: 'The Hipster Stack™ Technology Stack\template\components\ui\avatar.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\ui\avatar.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.ui.avatar.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\ui\avatar.tsx'
source_file: 'avatar.tsx'
source_sha256: 'ac5ffaa11f5ad3ce65d767d9f0f280b9b4a3b00db01b3e7a26a824ca15014725'
generated: true
---

# `avatar.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\ui\avatar.tsx`
> SHA-256: `ac5ffaa11f5ad3ce65d767d9f0f280b9b4a3b00db01b3e7a26a824ca15014725`

```tsx
import * as React from "react"
import * as AvatarPrimitive from "@radix-ui/react-avatar"

import { cn } from "@/lib/utils"

export const Avatar = React.forwardRef<
  React.ComponentRef<typeof AvatarPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof AvatarPrimitive.Root>
>(({ className, ...props }, ref) => (
  <AvatarPrimitive.Root
    ref={ref}
    className={cn("relative flex size-10 shrink-0 overflow-hidden rounded-full", className)}
    {...props}
  />
))
Avatar.displayName = AvatarPrimitive.Root.displayName
export const AvatarImage = React.forwardRef<
  React.ComponentRef<typeof AvatarPrimitive.Image>,
  React.ComponentPropsWithoutRef<typeof AvatarPrimitive.Image>
>(({ className, ...props }, ref) => (
  <AvatarPrimitive.Image
    ref={ref}
    className={cn("aspect-square size-full object-cover", className)}
    {...props}
  />
))
AvatarImage.displayName = AvatarPrimitive.Image.displayName
export const AvatarFallback = React.forwardRef<
  React.ComponentRef<typeof AvatarPrimitive.Fallback>,
  React.ComponentPropsWithoutRef<typeof AvatarPrimitive.Fallback>
>(({ className, ...props }, ref) => (
  <AvatarPrimitive.Fallback
    ref={ref}
    className={cn("flex size-full items-center justify-center bg-muted", className)}
    {...props}
  />
))
AvatarFallback.displayName = AvatarPrimitive.Fallback.displayName

```