---
title: 'The Hipster Stack™ Technology Stack\template\components\navigation\presentation-header.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\navigation\presentation-header.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.navigation.presentation-header.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\navigation\presentation-header.tsx'
source_file: 'presentation-header.tsx'
source_sha256: '5b6e6b3000379c53b4794c207623e9d025cc736b468248aa9c2b83b6a0fb6ba5'
generated: true
---

# `presentation-header.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\navigation\presentation-header.tsx`
> SHA-256: `5b6e6b3000379c53b4794c207623e9d025cc736b468248aa9c2b83b6a0fb6ba5`

```tsx
// components/navigation/public-header.tsx

import type { ReactNode } from "react"
import Link from "next/link"

import { Button } from "@/components/ui/button"

export interface PresentationHeaderNavItem {
  label: string
  href: string
}

export interface PresentationHeaderProps {
  logo?: ReactNode | undefined
  navItems?: readonly PresentationHeaderNavItem[] | undefined
}

export const defaultPresentationNavItems = [
  { label: "Auth", href: "/auth-forms" },
  { label: "CTA", href: "/cta-section" },
  { label: "Error", href: "/error-pages" },
  { label: "FAQ", href: "/faq-section" },
  { label: "Feature", href: "/feature-grid" },
  { label: "Hero", href: "/hero-section" },
  { label: "Invoice", href: "/invoice" },
  { label: "Panel", href: "/process-panel" },
  { label: "On", href: "/onboarding-flow" },
  { label: "Config", href: "/configuration-page" },
  { label: "Stats", href: "/stats-section" },
] satisfies readonly PresentationHeaderNavItem[]

export function PresentationHeader({
  navItems = defaultPresentationNavItems,
}: PresentationHeaderProps) {
  return (
    <header className="sticky top-0 z-50 h-21 border-b-2 border-neutral-400 bg-black">
      <div className="mx-auto ml-24 flex h-full w-full items-center px-4 py-3">
        <nav className="flex items-center gap-4 lg:gap-8">
          {navItems.map((item) => (
            <Button key={item.href} variant="outline" size="default" asChild>
              <Link href={item.href}>{item.label}</Link>
            </Button>
          ))}
        </nav>
      </div>
    </header>
  )
}

```