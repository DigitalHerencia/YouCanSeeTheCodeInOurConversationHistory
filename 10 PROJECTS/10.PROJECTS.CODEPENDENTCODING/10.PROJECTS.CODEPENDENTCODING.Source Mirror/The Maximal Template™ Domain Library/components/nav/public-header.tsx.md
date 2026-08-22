---
title: 'The Maximal Template™ Domain Library\components\nav\public-header.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\nav\public-header.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.nav.public-header.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\nav\public-header.tsx'
source_file: 'public-header.tsx'
source_sha256: '52f780f0a0312f69dd4b9771d6921e302a77672054c751211f5614ab3a031d16'
generated: true
---

# `public-header.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\nav\public-header.tsx`
> SHA-256: `52f780f0a0312f69dd4b9771d6921e302a77672054c751211f5614ab3a031d16`

```tsx
// components/navigation/public-header.tsx

import type { ReactNode } from "react";
import Link from "next/link";

import { LogoLockup } from "@/components/brand/logo-lockup";
import { Button } from "@/components/ui/button";
import {
  applicationCapabilities,
  applicationProduct,
} from "@/content/application";

export interface PublicHeaderNavItem {
  label: string;
  href: string;
}

export interface PublicHeaderProps {
  logo?: ReactNode | undefined;
  navItems?: readonly PublicHeaderNavItem[] | undefined;
}

export const defaultPublicNavItems = [
  ...(applicationCapabilities.marketing
    ? [
        { label: "Pricing", href: "/pricing" },
        { label: "FAQ", href: "/faq" },
      ]
    : []),
  { label: "Terms", href: "/terms" },
  { label: "Privacy", href: "/privacy" },
] satisfies readonly PublicHeaderNavItem[];

export function PublicHeader({
  logo = <LogoLockup />,
  navItems = defaultPublicNavItems,
}: PublicHeaderProps) {
  return (
    <header className="sticky top-0 z-50 h-21 w-full border-b border-neutral-400 bg-black">
      <div className="mx-auto hidden h-full w-full max-w-7xl items-center justify-between px-6 sm:px-10 md:flex lg:px-12">
        <Link
          href="/"
          aria-label={`${applicationProduct.name} home`}
          className="flex shrink-0 items-center"
        >
          {logo}
        </Link>

        <nav className="flex items-center gap-8 lg:gap-12">
          {navItems.map((item) => (
            <Button key={item.href} variant="ghost" size="sm" asChild>
              <Link href={item.href}>{item.label}</Link>
            </Button>
          ))}
        </nav>

        <div className="flex items-center gap-4 lg:gap-5">
          <Button variant="secondary" size="lg" asChild>
            <Link href="/sign-in">Sign in</Link>
          </Button>

          <Button
            variant="default"
            size="lg"
            className="min-w-40 sm:min-w-44 lg:min-w-48"
            asChild
          >
            <Link href="/sign-up?return_to=/dashboard">Get started</Link>
          </Button>
        </div>
      </div>

      <div className="flex h-full items-center justify-center px-6 md:hidden">
        <Link
          href="/"
          aria-label={`${applicationProduct.name} home`}
          className="inline-flex items-center"
        >
          <LogoLockup />
        </Link>
      </div>
    </header>
  );
}

```