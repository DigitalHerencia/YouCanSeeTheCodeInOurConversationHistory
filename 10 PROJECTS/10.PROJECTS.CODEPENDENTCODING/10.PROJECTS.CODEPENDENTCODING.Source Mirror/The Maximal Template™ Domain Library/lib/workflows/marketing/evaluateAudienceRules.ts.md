---
title: 'The Maximal Template™ Domain Library\lib\workflows\marketing\evaluateAudienceRules.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\workflows\marketing\evaluateAudienceRules.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.workflows.marketing.evaluateaudiencerules.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\workflows\marketing\evaluateAudienceRules.ts'
source_file: 'evaluateAudienceRules.ts'
source_sha256: '605cd5c8b6cc26e018a25e3650cd0d2364b3b55e415fde1ae29764f1f4cc98b9'
generated: true
---

# `evaluateAudienceRules.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\workflows\marketing\evaluateAudienceRules.ts`
> SHA-256: `605cd5c8b6cc26e018a25e3650cd0d2364b3b55e415fde1ae29764f1f4cc98b9`

```ts
export type AudienceRule = {
  field: string;
  operator: "equals" | "not_equals" | "contains";
  value: string | number | boolean;
};

export function evaluateAudienceRules(
  record: Record<string, unknown>,
  rules: AudienceRule[],
) {
  return rules.every((rule) => {
    const actual = record[rule.field];
    if (rule.operator === "equals") return actual === rule.value;
    if (rule.operator === "not_equals") return actual !== rule.value;
    return typeof actual === "string" && actual.includes(String(rule.value));
  });
}

```