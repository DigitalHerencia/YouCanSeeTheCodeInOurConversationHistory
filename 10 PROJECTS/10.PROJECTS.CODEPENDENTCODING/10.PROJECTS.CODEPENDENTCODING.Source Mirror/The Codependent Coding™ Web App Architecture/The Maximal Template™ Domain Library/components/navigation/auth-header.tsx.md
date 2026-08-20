---
title: 'The Hipster Stack™ Technology Stack\template\components\navigation\auth-header.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\navigation\auth-header.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.navigation.auth-header.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\components\navigation\auth-header.tsx'
source_file: 'auth-header.tsx'
source_sha256: '69081c54d7df3f2e13168b20ce8254f461db9038d709498e1be2da26f7b71d9d'
generated: true
---

# `auth-header.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\navigation\auth-header.tsx`
> SHA-256: `69081c54d7df3f2e13168b20ce8254f461db9038d709498e1be2da26f7b71d9d`

```tsx
// components/auth/auth-header.tsx

import Link from "next/link"

import { LogoLockup } from "@/components/brand/logo-lockup"
import { authHeaderContent } from "@/content/auth"

export function AuthHeader() {
  return (
    <header className="flex items-center justify-between gap-4 px-6 py-6 md:px-12">
      <LogoLockup />

      <Link
        href={authHeaderContent.homeHref}
        className="text-white underline-offset-4 transition-colors hover:scale-105 hover:text-blue-600 hover:underline md:text-sm"
      >
        {authHeaderContent.homeLabel}
      </Link>
    </header>
  )
}

```