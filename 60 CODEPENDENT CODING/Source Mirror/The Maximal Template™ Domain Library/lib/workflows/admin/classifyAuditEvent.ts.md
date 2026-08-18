---
title: 'The Maximal Template™ Domain Library\lib\workflows\admin\classifyAuditEvent.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\admin\classifyAuditEvent.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.admin.classifyauditevent.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\admin\classifyAuditEvent.ts'
source_file: 'classifyAuditEvent.ts'
source_sha256: 'd9bc16adeaaa2da114a49c3a84f75c5c3fe3e109e44b13ae1309f74e49fbff1f'
generated: true
---

# `classifyAuditEvent.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\admin\classifyAuditEvent.ts`
> SHA-256: `d9bc16adeaaa2da114a49c3a84f75c5c3fe3e109e44b13ae1309f74e49fbff1f`

```ts
export type AuditRisk = "routine" | "sensitive" | "high-risk";

export function classifyAuditEvent(action: string): AuditRisk {
  const normalized = action.toLowerCase();
  if (/(delete|revoke|role|permission|bulk|export)/.test(normalized))
    return "high-risk";
  if (/(update|approve|reject|invite|publish)/.test(normalized))
    return "sensitive";
  return "routine";
}

```