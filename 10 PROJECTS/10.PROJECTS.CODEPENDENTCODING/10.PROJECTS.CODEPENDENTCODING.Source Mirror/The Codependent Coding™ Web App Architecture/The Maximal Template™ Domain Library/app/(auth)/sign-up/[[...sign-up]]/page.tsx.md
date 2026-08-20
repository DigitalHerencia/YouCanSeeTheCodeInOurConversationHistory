---
title: 'The Hipster Stack™ Technology Stack\template\app\(auth)\sign-up\[[...sign-up]]\page.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\(auth)\sign-up\[[...sign-up]]\page.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.-auth-.sign-up.-.sign-up-.page.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\(auth)\sign-up\[[...sign-up]]\page.tsx'
source_file: 'page.tsx'
source_sha256: 'f45bd58e0c49175a9753d98aaf9e704c01d3ee50be3d9403a70845093db7aa01'
generated: true
---

# `page.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\(auth)\sign-up\[[...sign-up]]\page.tsx`
> SHA-256: `f45bd58e0c49175a9753d98aaf9e704c01d3ee50be3d9403a70845093db7aa01`

```tsx
import { SignUp } from "@clerk/nextjs"

export default function SignUpPage() {
  return (
    <SignUp
      routing="path"
      path="/sign-up"
      signInUrl="/sign-in"
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