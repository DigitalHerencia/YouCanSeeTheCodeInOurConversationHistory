---
title: 'The Maximal Template™ Domain Library\app\global-error.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\global-error.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.global-error.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\global-error.tsx'
source_file: 'global-error.tsx'
source_sha256: 'f42dbb9468f1d4e59d098c68d75771f3d65441f79359e7a92e2ce217f1cea85f'
generated: true
---

# `global-error.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\global-error.tsx`
> SHA-256: `f42dbb9468f1d4e59d098c68d75771f3d65441f79359e7a92e2ce217f1cea85f`

```tsx
"use client";
import { ErrorBlock } from "@/components/blocks/error-states";

// Fatal route errors require a client boundary; recovery presentation remains a block.
export default function GlobalError({
  reset,
}: Readonly<{ error: Error & { digest?: string }; reset: () => void }>) {
  return (
    <html lang="en">
      <body>
        <ErrorBlock title="Something went wrong" onRetry={reset} />
      </body>
    </html>
  );
}

```