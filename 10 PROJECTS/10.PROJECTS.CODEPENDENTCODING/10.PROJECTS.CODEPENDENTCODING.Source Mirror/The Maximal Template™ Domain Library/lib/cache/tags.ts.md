---
title: 'The Maximal Template™ Domain Library\lib\cache\tags.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\cache\tags.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.cache.tags.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\cache\tags.ts'
source_file: 'tags.ts'
source_sha256: '34a153cc27b715379c75daf6b0f2b489119262987db99226c87efc55cbb00d3f'
generated: true
---

# `tags.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\cache\tags.ts`
> SHA-256: `34a153cc27b715379c75daf6b0f2b489119262987db99226c87efc55cbb00d3f`

```ts
const separator = ":";

function joinTag(...parts: Array<string | number>) {
  return parts.join(separator);
}

export const cacheTags = {
  organization: (organizationId: string) =>
    joinTag("organization", organizationId),
  collection: (organizationId: string, resource: string) =>
    joinTag("organization", organizationId, resource),
  record: (organizationId: string, resource: string, recordId: string) =>
    joinTag("organization", organizationId, resource, recordId),
  user: (userId: string) => joinTag("user", userId),
} as const;

```