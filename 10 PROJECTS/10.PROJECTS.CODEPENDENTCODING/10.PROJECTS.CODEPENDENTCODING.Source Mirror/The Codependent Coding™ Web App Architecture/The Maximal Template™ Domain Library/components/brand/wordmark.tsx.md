---
title: 'The Maximal Template™ Domain Library\components\brand\wordmark.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\brand\wordmark.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.brand.wordmark.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\brand\wordmark.tsx'
source_file: 'wordmark.tsx'
source_sha256: '5ba69b707a52ce680c93e4f4d29d83557bdd66f82b96d519353a6dfd75ffb8d0'
generated: true
---

# `wordmark.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\brand\wordmark.tsx`
> SHA-256: `5ba69b707a52ce680c93e4f4d29d83557bdd66f82b96d519353a6dfd75ffb8d0`

```tsx
import Link from "next/link";

import { site } from "@/content/site";

export function Wordmark() {
  const mark = site.name.trim().charAt(0).toUpperCase();

  return (
    <Link href="/" className="flex items-center gap-3 no-underline">
      <span className="grid size-8 place-items-center border border-primary bg-primary text-sm font-black text-primary-foreground">
        {mark}
      </span>
      <span className="font-display text-2xl leading-none uppercase">
        {site.name}
      </span>
    </Link>
  );
}

```