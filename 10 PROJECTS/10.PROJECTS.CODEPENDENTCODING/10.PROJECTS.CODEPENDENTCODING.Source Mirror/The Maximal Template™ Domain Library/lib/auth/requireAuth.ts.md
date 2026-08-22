---
title: 'The Maximal Template™ Domain Library\lib\auth\requireAuth.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\auth\requireAuth.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.auth.requireauth.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\auth\requireAuth.ts'
source_file: 'requireAuth.ts'
source_sha256: '4aad1bd0c72ac5de8d7ec10cdf54402e2ef846d43372970ad28c9a3f6d9eb227'
generated: true
---

# `requireAuth.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\auth\requireAuth.ts`
> SHA-256: `4aad1bd0c72ac5de8d7ec10cdf54402e2ef846d43372970ad28c9a3f6d9eb227`

```ts
import "server-only";

import { auth } from "@clerk/nextjs/server";

import { AuthenticationRequiredError } from "./identity";

export interface AuthenticatedSession {
  clerkUserId: string;
  clerkSessionId: string;
}

export async function requireAuthenticatedSession(): Promise<AuthenticatedSession> {
  const { isAuthenticated, userId, sessionId } = await auth();

  if (!isAuthenticated || !userId || !sessionId) {
    throw new AuthenticationRequiredError();
  }

  return {
    clerkUserId: userId,
    clerkSessionId: sessionId,
  };
}

```