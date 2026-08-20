---
title: 'The Maximal Template™ Domain Library\lib\auth\clerkWebhook.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\auth\clerkWebhook.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.auth.clerkwebhook.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\auth\clerkWebhook.ts'
source_file: 'clerkWebhook.ts'
source_sha256: 'd127e9191e2ce676c0b0653d9f37d34d3f63a457b305cd4d303ed6b3574cb26d'
generated: true
---

# `clerkWebhook.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\auth\clerkWebhook.ts`
> SHA-256: `d127e9191e2ce676c0b0653d9f37d34d3f63a457b305cd4d303ed6b3574cb26d`

```ts
import type { WebhookEvent } from "@clerk/nextjs/server";

export interface ClerkUserProjection {
  clerkUserId: string;
  email: string | null;
  displayName: string | null;
  imageUrl: string | null;
  username: string | null;
}

export function projectClerkUser(
  data: Extract<
    WebhookEvent,
    { type: "user.created" | "user.updated" }
  >["data"],
): ClerkUserProjection {
  const email =
    data.email_addresses.find(
      (address) => address.id === data.primary_email_address_id,
    )?.email_address ?? null;
  return {
    clerkUserId: data.id,
    email,
    displayName:
      [data.first_name, data.last_name].filter(Boolean).join(" ") ||
      data.username ||
      null,
    imageUrl: data.image_url,
    username: data.username,
  };
}

```