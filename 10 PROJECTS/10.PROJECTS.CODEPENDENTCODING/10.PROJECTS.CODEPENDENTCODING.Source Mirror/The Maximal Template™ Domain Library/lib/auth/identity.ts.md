---
title: 'The Maximal Template™ Domain Library\lib\auth\identity.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\auth\identity.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.auth.identity.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\auth\identity.ts'
source_file: 'identity.ts'
source_sha256: '9097db15d53376d64ef5dce52d3e09957e512eecdb8e518b907fa2b04e9bf720'
generated: true
---

# `identity.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\auth\identity.ts`
> SHA-256: `9097db15d53376d64ef5dce52d3e09957e512eecdb8e518b907fa2b04e9bf720`

```ts
import "server-only";

import { auth } from "@clerk/nextjs/server";

import type { AuthenticatedIdentity } from "../../types/access";

export class AuthenticationRequiredError extends Error {
  constructor() {
    super("Authentication is required.");
    this.name = "AuthenticationRequiredError";
  }
}

export async function getIdentity(): Promise<AuthenticatedIdentity | null> {
  const { isAuthenticated, userId } = await auth();

  if (!isAuthenticated || !userId) {
    return null;
  }

  return { clerkUserId: userId };
}

export async function requireIdentity(): Promise<AuthenticatedIdentity> {
  const identity = await getIdentity();

  if (!identity) {
    throw new AuthenticationRequiredError();
  }

  return identity;
}

```