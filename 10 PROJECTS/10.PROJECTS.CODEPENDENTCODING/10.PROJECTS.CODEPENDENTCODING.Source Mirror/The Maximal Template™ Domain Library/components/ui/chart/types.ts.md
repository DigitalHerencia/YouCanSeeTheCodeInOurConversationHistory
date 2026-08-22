---
title: 'The Maximal Template™ Domain Library\components\ui\chart\types.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\chart\types.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.chart.types.ts'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\chart\types.ts'
source_file: 'types.ts'
source_sha256: 'f172c2b5de86a8ecc6e38a07bf13347d8572f52dca2e1a55669328f0414d609c'
generated: true
---

# `types.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\chart\types.ts`
> SHA-256: `f172c2b5de86a8ecc6e38a07bf13347d8572f52dca2e1a55669328f0414d609c`

```ts
import * as React from "react";

// ---------------------------------------------------------------------------
// Chart annotation vocabulary (shared, unified across React/Recharts and
// Vue/echarts — identical shape so the same annotation objects author in both).
// ---------------------------------------------------------------------------

export interface ChartReferenceLineSpec {
  axis: "x" | "y";
  value: number | string;
  label?: string;
  color?: string;
  dash?: boolean;
}

export interface ChartCalloutSpec {
  x: number | string;
  y: number;
  text: string;
  placement?: "top" | "right" | "bottom" | "left";
}

export interface ChartArrowSpec {
  from: { x: number | string; y: number };
  to: { x: number | string; y: number };
  label?: string;
}

export type ChartAnnotation =
  | ({ kind: "referenceLine" } & ChartReferenceLineSpec)
  | ({ kind: "callout" } & ChartCalloutSpec)
  | ({ kind: "arrow" } & ChartArrowSpec);

// Format: { THEME_NAME: CSS_SELECTOR }
export const THEMES = { dark: "" } as const;

export type ChartConfig = {
  [k in string]: {
    label?: React.ReactNode;
    icon?: React.ComponentType;
  } & (
    | { color?: string; theme?: never }
    | { color?: never; theme: Record<keyof typeof THEMES, string> }
  );
};

export type ChartContextProps = {
  config: ChartConfig;
};

export const ChartContext = React.createContext<ChartContextProps | null>(null);

export function useChart() {
  const context = React.useContext(ChartContext);

  if (!context) {
    throw new Error("useChart must be used within a <ChartContainer />");
  }

  return context;
}

```