---
title: 'The Maximal Template™ Domain Library\lib\auth\client.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\auth\client.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.auth.client.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\auth\client.ts'
source_file: 'client.ts'
source_sha256: '4b826d3ec02b203c8b12072fbec8099e6048c2f5280295647cb21fc9a2bd42ba'
generated: true
---

# `client.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\auth\client.ts`
> SHA-256: `4b826d3ec02b203c8b12072fbec8099e6048c2f5280295647cb21fc9a2bd42ba`

```ts
"use client";

import { useAuth } from "@clerk/nextjs";

export function useActiveIdentity() {
  const { isLoaded, isSignedIn, userId } = useAuth();

  return {
    isLoaded,
    isSignedIn: isSignedIn === true,
    clerkUserId: userId ?? null,
  };
}

```