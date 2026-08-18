---
title: 'The Maximal Template™ Domain Library\features\auth\signInFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\auth\signInFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.auth.signinfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\auth\signInFeature.tsx'
source_file: 'signInFeature.tsx'
source_sha256: 'a24cea9d4b5588fd1c39329899e60ba2f8f1ec70799a0501392552771d88f238'
generated: true
---

# `signInFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\auth\signInFeature.tsx`
> SHA-256: `a24cea9d4b5588fd1c39329899e60ba2f8f1ec70799a0501392552771d88f238`

```tsx
import { SignIn } from "@clerk/nextjs";

export function SignInFeature() {
  return (
    <SignIn
      path="/sign-in"
      routing="path"
      signUpUrl="/sign-up"
      fallbackRedirectUrl="/dashboard"
    />
  );
}

```