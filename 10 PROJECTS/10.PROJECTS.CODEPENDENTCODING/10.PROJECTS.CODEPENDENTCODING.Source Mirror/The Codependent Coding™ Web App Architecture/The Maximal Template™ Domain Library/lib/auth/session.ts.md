---
title: 'The Maximal Template™ Domain Library\lib\auth\session.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\auth\session.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.auth.session.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\auth\session.ts'
source_file: 'session.ts'
source_sha256: 'e40fd5d78f129d29e60fd9947b0c423e22ab2913919984d61c2627eb37e3fd9d'
generated: true
---

# `session.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\auth\session.ts`
> SHA-256: `e40fd5d78f129d29e60fd9947b0c423e22ab2913919984d61c2627eb37e3fd9d`

```ts
import "server-only";

import { auth } from "@clerk/nextjs/server";

export interface CurrentSessionContext {
  isAuthenticated: boolean;
  clerkUserId: string | null;
  clerkSessionId: string | null;
}

export async function getCurrentSession(): Promise<CurrentSessionContext> {
  const session = await auth();

  return {
    isAuthenticated: session.isAuthenticated,
    clerkUserId: session.userId ?? null,
    clerkSessionId: session.sessionId ?? null,
  };
}

```