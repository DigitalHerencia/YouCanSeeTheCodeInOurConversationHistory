---
title: 'The Maximal Template™ Domain Library\components\nav\auth-header.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\nav\auth-header.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.nav.auth-header.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\nav\auth-header.tsx'
source_file: 'auth-header.tsx'
source_sha256: '32bd2cf46804fab785adccec29dc8d41316c727c300cee3018581406bbcb820c'
generated: true
---

# `auth-header.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\nav\auth-header.tsx`
> SHA-256: `32bd2cf46804fab785adccec29dc8d41316c727c300cee3018581406bbcb820c`

```tsx
// components/auth/auth-header.tsx

import Link from "next/link";

import { LogoLockup } from "@/components/brand/logo-lockup";
import { authHeaderContent } from "@/content/auth";

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
  );
}

```