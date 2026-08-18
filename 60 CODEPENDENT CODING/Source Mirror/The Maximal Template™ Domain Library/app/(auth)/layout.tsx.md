---
title: 'The Maximal Template™ Domain Library\app\(auth)\layout.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\app\(auth)\layout.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.app.-auth-.layout.tsx'
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
source_path: 'The Maximal Template™ Domain Library\app\(auth)\layout.tsx'
source_file: 'layout.tsx'
source_sha256: 'f05a5ade30fcc2587aac29ad2623576c35c084b35bccf4d9ffc3e11ad411e99f'
generated: true
---

# `layout.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\app\(auth)\layout.tsx`
> SHA-256: `f05a5ade30fcc2587aac29ad2623576c35c084b35bccf4d9ffc3e11ad411e99f`

```tsx
import type { ReactNode } from "react";
import { AuthShell } from "@/components/shells/auth-shell";

// Auth routes share a frame; Clerk behavior remains under lib/auth.
export default function AuthLayout({
  children,
}: Readonly<{ children: ReactNode }>) {
  return <AuthShell>{children}</AuthShell>;
}

```