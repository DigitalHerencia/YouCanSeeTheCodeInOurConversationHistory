---
title: 'The Hipster Stack™ Technology Stack\template\components\navigation\public-header.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\navigation\public-header.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.navigation.public-header.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\navigation\public-header.tsx'
source_file: 'public-header.tsx'
source_sha256: 'e280b24568ae431db0a655a65a234d6be5eb72844677247e5d411d4db2634e9e'
generated: true
---

# `public-header.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\navigation\public-header.tsx`
> SHA-256: `e280b24568ae431db0a655a65a234d6be5eb72844677247e5d411d4db2634e9e`

```tsx
// components/navigation/public-header.tsx

import type { ReactNode } from "react"
import Link from "next/link"

import { LogoLockup } from "@/components/brand/logo-lockup"
import { Button } from "@/components/ui/button"
import { loadedVibesCapabilities, loadedVibesProduct } from "@/content/loadedvibes"

export interface PublicHeaderNavItem {
  label: string
  href: string
}

export interface PublicHeaderProps {
  logo?: ReactNode | undefined
  navItems?: readonly PublicHeaderNavItem[] | undefined
}

export const defaultPublicNavItems = [
  ...(loadedVibesCapabilities.marketing
    ? [
        { label: "Pricing", href: "/pricing" },
        { label: "FAQ", href: "/faq" },
      ]
    : []),
  { label: "Terms", href: "/terms" },
  { label: "Privacy", href: "/privacy" },
] satisfies readonly PublicHeaderNavItem[]

export function PublicHeader({
  logo = <LogoLockup />,
  navItems = defaultPublicNavItems,
}: PublicHeaderProps) {
  return (
    <header className="sticky top-0 z-50 h-21 w-full border-b border-neutral-400 bg-black">
      <div className="mx-auto hidden h-full w-full max-w-7xl items-center justify-between px-6 sm:px-10 md:flex lg:px-12">
        <Link
          href="/"
          aria-label={`${loadedVibesProduct.name} home`}
          className="flex shrink-0 items-center"
        >
          {logo}
        </Link>

        <nav className="flex items-center gap-8 lg:gap-12">
          {navItems.map((item) => (
            <Button key={item.href} variant="nav" size="nav" asChild>
              <Link href={item.href}>{item.label}</Link>
            </Button>
          ))}
        </nav>

        <div className="flex items-center gap-4 lg:gap-5">
          <Button variant="secondary" size="lg" asChild>
            <Link href="/sign-in">Sign in</Link>
          </Button>

          <Button variant="primary" size="lg" className="min-w-40 sm:min-w-44 lg:min-w-48" asChild>
            <Link href="/sign-up?return_to=/dashboard">Get started</Link>
          </Button>
        </div>
      </div>

      <div className="flex h-full items-center justify-center px-6 md:hidden">
        <Link
          href="/"
          aria-label={`${loadedVibesProduct.name} home`}
          className="inline-flex items-center"
        >
          <LogoLockup />
        </Link>
      </div>
    </header>
  )
}

```