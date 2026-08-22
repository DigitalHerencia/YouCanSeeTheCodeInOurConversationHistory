---
title: 'The Maximal Template™ Domain Library\components\nav\user-menu.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\nav\user-menu.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.nav.user-menu.tsx'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\components\nav\user-menu.tsx'
source_file: 'user-menu.tsx'
source_sha256: '087d7e15c58f4946510541aced3c7c5485d70b671c8ec456c18087578f8a5e7c'
generated: true
---

# `user-menu.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\nav\user-menu.tsx`
> SHA-256: `087d7e15c58f4946510541aced3c7c5485d70b671c8ec456c18087578f8a5e7c`

```tsx
// components/auth/user-menu.tsx

"use client";

import { UserButton } from "@clerk/nextjs";

export type UserMenuProps = Readonly<{
  size?: "default" | "compact";
}>;

export function UserMenu({ size = "default" }: UserMenuProps) {
  const isCompact = size === "compact";
  const triggerSize = isCompact ? "size-9" : "size-11";
  const avatarSize = isCompact ? "size-8" : "size-10";

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
          avatarBox: [
            avatarSize,
            "rounded-none border border-neutral-400 bg-blue-600",
          ].join(" "),
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
  );
}

```