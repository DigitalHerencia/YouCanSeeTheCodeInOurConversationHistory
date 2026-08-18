---
title: 'The Maximal Template™ Domain Library\lib\auth\user.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\auth\user.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.auth.user.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\auth\user.ts'
source_file: 'user.ts'
source_sha256: '158c2c3ec83a81597f3c2c34a8eb6e6a5b69355d817063fd51dd6b5950d744f9'
generated: true
---

# `user.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\auth\user.ts`
> SHA-256: `158c2c3ec83a81597f3c2c34a8eb6e6a5b69355d817063fd51dd6b5950d744f9`

```ts
import "server-only";

import { currentUser } from "@clerk/nextjs/server";

import { AuthenticationRequiredError } from "./identity";

export interface CurrentUserProfile {
  clerkUserId: string;
  displayName: string | null;
  primaryEmailAddress: string | null;
  imageUrl: string;
}

export async function getCurrentUser(): Promise<CurrentUserProfile | null> {
  const user = await currentUser();

  if (!user) {
    return null;
  }

  const displayName =
    [user.firstName, user.lastName].filter(Boolean).join(" ") ||
    user.username ||
    null;

  return {
    clerkUserId: user.id,
    displayName,
    primaryEmailAddress: user.primaryEmailAddress?.emailAddress ?? null,
    imageUrl: user.imageUrl,
  };
}

export async function requireCurrentUser(): Promise<CurrentUserProfile> {
  const user = await getCurrentUser();

  if (!user) {
    throw new AuthenticationRequiredError();
  }

  return user;
}

```