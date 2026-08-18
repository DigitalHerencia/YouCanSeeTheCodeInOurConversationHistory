---
title: 'The Hipster Stack™ Technology Stack\template\app\(auth)\sign-in\[[...sign-in]]\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(auth)\sign-in\[[...sign-in]]\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-auth-.sign-in.-.sign-in-.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(auth)\sign-in\[[...sign-in]]\page.tsx'
source_file: 'page.tsx'
source_sha256: '3dbb0c14785be1985d68f584d593f9af323e5e743be08ab1cda0894a136b6608'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(auth)\sign-in\[[...sign-in]]\page.tsx`
> SHA-256: `3dbb0c14785be1985d68f584d593f9af323e5e743be08ab1cda0894a136b6608`

```tsx
import { SignIn } from "@clerk/nextjs"

export default function SignInPage() {
  return (
    <SignIn
      routing="path"
      path="/sign-in"
      signUpUrl="/sign-up"
      appearance={{
        elements: {
          rootBox: "w-full max-w-md",
          cardBox: "w-full",
        },
      }}
    />
  )
}

```