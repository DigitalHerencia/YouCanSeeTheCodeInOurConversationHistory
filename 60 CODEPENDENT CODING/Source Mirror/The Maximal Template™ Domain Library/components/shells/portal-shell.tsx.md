---
title: 'The Maximal Template™ Domain Library\components\shells\portal-shell.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\shells\portal-shell.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.shells.portal-shell.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\shells\portal-shell.tsx'
source_file: 'portal-shell.tsx'
source_sha256: '0e94c1ce447b27523159e8971985042caef706dcf6f2d467e0e534d217ada95c'
generated: true
---

# `portal-shell.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\shells\portal-shell.tsx`
> SHA-256: `0e94c1ce447b27523159e8971985042caef706dcf6f2d467e0e534d217ada95c`

```tsx
import type { ReactNode } from "react";

import { Wordmark } from "@/components/brand/wordmark";

export function PortalShell({ children }: { children: ReactNode }) {
  return (
    <div className="min-h-dvh bg-muted/20">
      <header className="border-b bg-background px-6 py-4">
        <div className="mx-auto w-full max-w-6xl">
          <Wordmark />
        </div>
      </header>
      <main className="mx-auto w-full max-w-6xl px-6 py-8">{children}</main>
    </div>
  );
}

```