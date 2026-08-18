---
title: 'The Maximal Template™ Domain Library\components\shells\public-shell.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\shells\public-shell.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.shells.public-shell.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\shells\public-shell.tsx'
source_file: 'public-shell.tsx'
source_sha256: '3d39c3a04c4995878655143ee3f1394a3aabd6388bb603ed1c89de1a732bae10'
generated: true
---

# `public-shell.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\shells\public-shell.tsx`
> SHA-256: `3d39c3a04c4995878655143ee3f1394a3aabd6388bb603ed1c89de1a732bae10`

```tsx
import Link from "next/link";
import type { ReactNode } from "react";

import { Wordmark } from "@/components/brand/wordmark";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";

type PublicShellProps = {
  children: ReactNode;
  className?: string;
};

export function PublicShell({ children, className }: PublicShellProps) {
  return (
    <div className={cn("min-h-dvh", className)}>
      <header className="border-b bg-background/80 backdrop-blur">
        <div className="mx-auto flex h-16 w-full max-w-7xl items-center justify-between px-6 sm:px-10 lg:px-12">
          <Wordmark />
          <nav className="hidden items-center gap-5 text-sm text-muted-foreground md:flex">
            <Link href="/features">Capabilities</Link>
            <Link href="/components">Components</Link>
            <Link href="/integrations">Integrations</Link>
            <Link href="/architecture">Architecture</Link>
          </nav>
          <div className="flex items-center gap-2">
            <Button asChild variant="ghost" size="sm">
              <Link href="/sign-in">Sign in</Link>
            </Button>
            <Button asChild size="sm">
              <Link href="/explore">Explore</Link>
            </Button>
          </div>
        </div>
      </header>
      <main className="mx-auto w-full max-w-7xl px-6 py-12 sm:px-10 lg:px-12 lg:py-16">
        {children}
      </main>
    </div>
  );
}

```