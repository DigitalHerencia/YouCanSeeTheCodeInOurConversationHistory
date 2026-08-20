---
title: 'The Maximal Template™ Domain Library\components\ui\chart\utils.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\chart\utils.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.chart.utils.ts'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\chart\utils.ts'
source_file: 'utils.ts'
source_sha256: '74e9dcc8e11b3f1f8816f8a0c7b65b280acd1e418f5acf35f82180dbf87a2246'
generated: true
---

# `utils.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\chart\utils.ts`
> SHA-256: `74e9dcc8e11b3f1f8816f8a0c7b65b280acd1e418f5acf35f82180dbf87a2246`

```ts
import type { ChartConfig } from "./types";

// Helper to extract item config from a payload.
export function getPayloadConfigFromPayload(
  config: ChartConfig,
  payload: unknown,
  key: string,
) {
  if (typeof payload !== "object" || payload === null) {
    return undefined;
  }

  const payloadPayload =
    "payload" in payload &&
    typeof payload.payload === "object" &&
    payload.payload !== null
      ? payload.payload
      : undefined;

  let configLabelKey: string = key;

  if (
    key in payload &&
    typeof payload[key as keyof typeof payload] === "string"
  ) {
    configLabelKey = payload[key as keyof typeof payload] as string;
  } else if (
    payloadPayload &&
    key in payloadPayload &&
    typeof payloadPayload[key as keyof typeof payloadPayload] === "string"
  ) {
    configLabelKey = payloadPayload[
      key as keyof typeof payloadPayload
    ] as string;
  }

  return configLabelKey in config
    ? config[configLabelKey]
    : config[key as keyof typeof config];
}

```