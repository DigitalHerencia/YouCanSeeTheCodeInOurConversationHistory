---
title: 'The Maximal Template™ Domain Library\proxy.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\proxy.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.proxy.ts'
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
source_path: 'The Maximal Template™ Domain Library\proxy.ts'
source_file: 'proxy.ts'
source_sha256: 'a3d1333360ba681ea2fb0038b57a659f184dc4debb1e24135a8350a72de63a4d'
generated: true
---

# `proxy.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\proxy.ts`
> SHA-256: `a3d1333360ba681ea2fb0038b57a659f184dc4debb1e24135a8350a72de63a4d`

```ts
import { clerkMiddleware } from "@clerk/nextjs/server";

export default clerkMiddleware();

export const config = {
  matcher: [
    "/((?!_next|[^?]*\\.(?:html?|css|js(?!on)|jpe?g|webp|png|gif|svg|ttf|woff2?|ico|csv|docx?|xlsx?|zip|webmanifest)).*)",
    "/(api|trpc)(.*)",
    "/__clerk/(.*)",
  ],
};

```