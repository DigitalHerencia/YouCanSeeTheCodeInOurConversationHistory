---
title: 'The Maximal Template™ Domain Library\components\blocks\error-states.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\blocks\error-states.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.blocks.error-states.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\blocks\error-states.tsx'
source_file: 'error-states.tsx'
source_sha256: 'a748f073f4c970ac7c88d86dfc22587aec5975efa252d880711040e188adcea6'
generated: true
---

# `error-states.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\blocks\error-states.tsx`
> SHA-256: `a748f073f4c970ac7c88d86dfc22587aec5975efa252d880711040e188adcea6`

```tsx
"use client";

import Link from "next/link";

import { Button } from "@/components/ui/button";

export function ErrorBlock({
  title,
  description = "The requested surface is unavailable.",
  onRetry,
}: {
  title: string;
  description?: string;
  onRetry?: () => void;
}) {
  return (
    <main className="grid min-h-dvh place-items-center px-6 py-12">
      <section className="w-full max-w-lg space-y-5 border-3 border-foreground bg-card p-8 text-center shadow-[8px_8px_0px_hsl(var(--shadow-color))]">
        <p className="text-sm font-bold uppercase tracking-widest text-primary">
          Request boundary
        </p>
        <h1 className="text-3xl font-black uppercase">{title}</h1>
        <p className="text-muted-foreground">{description}</p>
        <div className="flex flex-wrap justify-center gap-3">
          {onRetry ? <Button onClick={onRetry}>Try again</Button> : null}
          <Button asChild variant="outline">
            <Link href="/">Return home</Link>
          </Button>
        </div>
      </section>
    </main>
  );
}

```