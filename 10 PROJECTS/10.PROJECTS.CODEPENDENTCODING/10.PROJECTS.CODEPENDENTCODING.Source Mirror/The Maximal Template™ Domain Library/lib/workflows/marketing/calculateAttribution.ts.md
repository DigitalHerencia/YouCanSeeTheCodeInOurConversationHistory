---
title: 'The Maximal Template™ Domain Library\lib\workflows\marketing\calculateAttribution.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\marketing\calculateAttribution.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.marketing.calculateattribution.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\marketing\calculateAttribution.ts'
source_file: 'calculateAttribution.ts'
source_sha256: 'e85c77f3a7ed550e7109cfc687ac3bd7627d266b4ce927e535090e05eb8b2aa6'
generated: true
---

# `calculateAttribution.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\marketing\calculateAttribution.ts`
> SHA-256: `e85c77f3a7ed550e7109cfc687ac3bd7627d266b4ce927e535090e05eb8b2aa6`

```ts
export function calculateAttribution(
  touchpointIds: string[],
  model: "first-touch" | "last-touch" | "linear",
) {
  if (!touchpointIds.length) return [];
  if (model === "first-touch")
    return touchpointIds.map((id, index) => ({
      id,
      credit: index === 0 ? 1 : 0,
    }));
  if (model === "last-touch")
    return touchpointIds.map((id, index) => ({
      id,
      credit: index === touchpointIds.length - 1 ? 1 : 0,
    }));
  const credit = 1 / touchpointIds.length;
  return touchpointIds.map((id) => ({ id, credit }));
}

```