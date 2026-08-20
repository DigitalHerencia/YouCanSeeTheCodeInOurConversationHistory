---
title: 'The Hipster Stack™ Technology Stack\template\components\navigation\user-menu.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\navigation\user-menu.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.navigation.user-menu.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\navigation\user-menu.tsx'
source_file: 'user-menu.tsx'
source_sha256: '958e9edd7a4fff93cd1b6620e03f3eb3f7765f726e6266343ed2ae39526b1aa4'
generated: true
---

# `user-menu.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\navigation\user-menu.tsx`
> SHA-256: `958e9edd7a4fff93cd1b6620e03f3eb3f7765f726e6266343ed2ae39526b1aa4`

```tsx
// components/auth/user-menu.tsx

"use client"

import { UserButton } from "@clerk/nextjs"

export type UserMenuProps = Readonly<{
  size?: "default" | "compact"
}>

export function UserMenu({ size = "default" }: UserMenuProps) {
  const isCompact = size === "compact"
  const triggerSize = isCompact ? "size-9" : "size-11"
  const avatarSize = isCompact ? "size-8" : "size-10"

  return (
    <UserButton
      appearance={{
        elements: {
          userButtonTrigger: [
            triggerSize,
            "grid place-items-center rounded-none border border-neutral-400 bg-black",
            "transition-colors hover:border-blue-600 hover:bg-black",
            "focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-600",
          ].join(" "),
          userButtonAvatarBox: [
            avatarSize,
            "rounded-none border border-neutral-400 bg-blue-600",
          ].join(" "),
          avatarBox: [avatarSize, "rounded-none border border-neutral-400 bg-blue-600"].join(" "),
          userButtonPopoverCard:
            "rounded-none border border-neutral-400 bg-black text-white shadow-[8px_8px_0_0_oklch(54.6% 0.245 262.881 / 0.24)]",
          userPreviewMainIdentifier:
            "font-(family-name:--font-display) text-sm tracking-[0.06em] uppercase text-white",
          userPreviewSecondaryIdentifier: "font-mono text-xs text-neutral-400",
          userButtonPopoverActionButton:
            "rounded-none text-white hover:bg-blue-600 hover:text-white",
          userButtonPopoverActionButtonText:
            "font-(family-name:--font-display) text-[13px] tracking-[0.06em] uppercase",
          userButtonPopoverFooter: "hidden",
        },
      }}
    />
  )
}

```