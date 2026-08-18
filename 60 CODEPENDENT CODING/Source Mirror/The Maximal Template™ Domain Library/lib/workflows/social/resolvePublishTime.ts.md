---
title: 'The Maximal Template™ Domain Library\lib\workflows\social\resolvePublishTime.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\social\resolvePublishTime.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.social.resolvepublishtime.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\social\resolvePublishTime.ts'
source_file: 'resolvePublishTime.ts'
source_sha256: 'd781fce3007e42c1322dfe0242d39a221a13557d9fe5cf0c2e2c9bdd1d123371'
generated: true
---

# `resolvePublishTime.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\social\resolvePublishTime.ts`
> SHA-256: `d781fce3007e42c1322dfe0242d39a221a13557d9fe5cf0c2e2c9bdd1d123371`

```ts
const DEFAULT_MINIMUM_LEAD_TIME_MS = 60_000;

export function resolvePublishTime(
  requestedAt: Date,
  now = new Date(),
  minimumLeadTimeMs = DEFAULT_MINIMUM_LEAD_TIME_MS,
): Date {
  if (!Number.isFinite(requestedAt.getTime())) {
    throw new Error("The publication time is invalid.");
  }

  if (requestedAt.getTime() < now.getTime() + minimumLeadTimeMs) {
    throw new Error(
      "The publication time must be at least one minute in the future.",
    );
  }

  return requestedAt;
}

```