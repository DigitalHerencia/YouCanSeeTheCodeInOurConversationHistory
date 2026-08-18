---
title: 'The Maximal Template™ Domain Library\components\shells\auth-shell.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\shells\auth-shell.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.shells.auth-shell.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\shells\auth-shell.tsx'
source_file: 'auth-shell.tsx'
source_sha256: '6dd91ac8a686d7f34820fa5031f310cd098c777ae5dc09e80a51d62339507e34'
generated: true
---

# `auth-shell.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\shells\auth-shell.tsx`
> SHA-256: `6dd91ac8a686d7f34820fa5031f310cd098c777ae5dc09e80a51d62339507e34`

```tsx
import type { ReactNode } from "react";

import { Wordmark } from "@/components/brand/wordmark";

type AuthShellProps = {
  children: ReactNode;
};

export function AuthShell({ children }: AuthShellProps) {
  return (
    <main className="grid min-h-dvh grid-cols-1 md:grid-cols-2">
      <section className="hidden border-r bg-background p-8 md:flex md:flex-col md:justify-between">
        <Wordmark />
        <div className="max-w-xl space-y-4">
          <p className="eyebrow text-sm text-primary">
            Server-owned auth boundary
          </p>
          <h1>Access stays accountable.</h1>
          <p className="text-muted-foreground">
            Clerk identifies the user. Local tables authorize row-level reads
            and writes.
          </p>
        </div>
      </section>
      <section className="flex min-h-dvh items-center justify-center px-6 py-12">
        {children}
      </section>
    </main>
  );
}

```