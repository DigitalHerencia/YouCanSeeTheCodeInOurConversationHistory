---
title: 'The Maximal Template™ Domain Library\features\auth\signUpFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\auth\signUpFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.auth.signupfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\auth\signUpFeature.tsx'
source_file: 'signUpFeature.tsx'
source_sha256: '7ff81b1272a9c950952fe88ed3997aa6bf178bb32aacb1901c008a96ad9117cc'
generated: true
---

# `signUpFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\auth\signUpFeature.tsx`
> SHA-256: `7ff81b1272a9c950952fe88ed3997aa6bf178bb32aacb1901c008a96ad9117cc`

```tsx
import { SignUp } from "@clerk/nextjs";

export function SignUpFeature() {
  return (
    <SignUp
      path="/sign-up"
      routing="path"
      signInUrl="/sign-in"
      fallbackRedirectUrl="/dashboard"
    />
  );
}

```