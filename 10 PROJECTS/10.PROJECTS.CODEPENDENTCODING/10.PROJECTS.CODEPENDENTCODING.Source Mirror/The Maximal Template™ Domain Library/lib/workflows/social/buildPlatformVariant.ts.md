---
title: 'The Maximal Template™ Domain Library\lib\workflows\social\buildPlatformVariant.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\social\buildPlatformVariant.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.social.buildplatformvariant.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\social\buildPlatformVariant.ts'
source_file: 'buildPlatformVariant.ts'
source_sha256: 'f58b61da3f62339647eb753512cf5d0f46972e9fc1e9d0284fc68bb5e9ad6781'
generated: true
---

# `buildPlatformVariant.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\social\buildPlatformVariant.ts`
> SHA-256: `f58b61da3f62339647eb753512cf5d0f46972e9fc1e9d0284fc68bb5e9ad6781`

```ts
import type { SocialProvider } from "../../../generated/prisma/client";

const characterLimits: Record<SocialProvider, number> = {
  LINKEDIN: 3_000,
  X: 280,
  FACEBOOK: 63_206,
  INSTAGRAM: 2_200,
  OTHER: 100_000,
};

export function buildPlatformVariant(
  provider: SocialProvider,
  content: string,
) {
  const normalized = content.trim();
  if (!normalized) {
    throw new Error("Social content cannot be empty.");
  }

  const limit = characterLimits[provider];
  if (normalized.length > limit) {
    throw new Error(
      `${provider} content exceeds its ${limit}-character limit.`,
    );
  }

  return normalized;
}

```