---
title: 'The Maximal Template™ Domain Library\components\nav\public-footer.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\nav\public-footer.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.nav.public-footer.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\nav\public-footer.tsx'
source_file: 'public-footer.tsx'
source_sha256: '9e0f4891217932b6d197486247f8dbe2f982bd315f58628f82313d198e3af7c4'
generated: true
---

# `public-footer.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\nav\public-footer.tsx`
> SHA-256: `9e0f4891217932b6d197486247f8dbe2f982bd315f58628f82313d198e3af7c4`

```tsx
import Link from "next/link";

import { Button } from "@/components/ui/button";
import {
  applicationCapabilities,
  applicationProduct,
} from "@/content/application";

export interface PublicFooterLink {
  label: string;
  href: string;
}

export interface PublicFooterProps {
  links?: readonly PublicFooterLink[] | undefined;
}

export const defaultPublicFooterLinks = [
  ...(applicationCapabilities.marketing
    ? [
        { label: "Pricing", href: "/pricing" },
        { label: "FAQ", href: "/faq" },
      ]
    : []),
  { label: "Terms", href: "/terms" },
  { label: "Privacy", href: "/privacy" },
] satisfies readonly PublicFooterLink[];

export function PublicFooter({
  links = defaultPublicFooterLinks,
}: PublicFooterProps) {
  return (
    <footer className="w-full border-t border-neutral-400 bg-black">
      <div className="mx-auto flex w-full max-w-7xl flex-col gap-6 px-6 py-7 sm:px-10 lg:flex-row lg:items-center lg:justify-between lg:px-12">
        <p className="font-mono text-sm leading-none text-neutral-400 sm:text-base lg:text-lg">
          © {new Date().getFullYear()} {applicationProduct.name}. All rights
          reserved.
        </p>

        <nav className="flex flex-wrap gap-x-4 gap-y-4 sm:gap-x-4">
          {links.map((item) => (
            <Button key={item.href} variant="link" size="default" asChild>
              <Link href={item.href}>{item.label}</Link>
            </Button>
          ))}
        </nav>
      </div>
    </footer>
  );
}

```