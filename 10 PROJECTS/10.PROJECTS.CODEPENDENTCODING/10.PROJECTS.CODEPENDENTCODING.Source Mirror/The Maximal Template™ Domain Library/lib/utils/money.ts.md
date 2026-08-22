---
title: 'The Maximal Template™ Domain Library\lib\utils\money.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\utils\money.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.utils.money.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\utils\money.ts'
source_file: 'money.ts'
source_sha256: 'db3a00d432c2abd3e059d9c5ff28441cbdd504e7cc035f3245bae767de8f64df'
generated: true
---

# `money.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\utils\money.ts`
> SHA-256: `db3a00d432c2abd3e059d9c5ff28441cbdd504e7cc035f3245bae767de8f64df`

```ts
export function roundCurrency(value: number) {
  return Math.round((value + Number.EPSILON) * 100) / 100;
}

export function formatMoney(
  amount: number | string,
  currency: string,
  locale = "en",
) {
  return new Intl.NumberFormat(locale, {
    style: "currency",
    currency,
  }).format(Number(amount));
}

export function assertSameCurrency(left: string, right: string) {
  if (left !== right) {
    throw new Error(
      `Currency mismatch: ${left} cannot be combined with ${right}.`,
    );
  }
}

```