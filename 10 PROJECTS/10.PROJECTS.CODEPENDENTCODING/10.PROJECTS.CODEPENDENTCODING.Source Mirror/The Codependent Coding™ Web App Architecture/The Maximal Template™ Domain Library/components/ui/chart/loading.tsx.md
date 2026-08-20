---
title: 'The Maximal Template™ Domain Library\components\ui\chart\loading.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\chart\loading.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.chart.loading.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\chart\loading.tsx'
source_file: 'loading.tsx'
source_sha256: 'faecfbe876932669ef8a9e81063f26a720293fe77f120c5f83d953d226641869'
generated: true
---

# `loading.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\chart\loading.tsx`
> SHA-256: `faecfbe876932669ef8a9e81063f26a720293fe77f120c5f83d953d226641869`

```tsx
import * as React from "react";
import { cn } from "@/lib/utils";

/** Static silhouette — a chart-shaped placeholder, not real data. */
const BAR_HEIGHTS = ["45%", "70%", "35%", "85%", "55%", "75%", "40%"];

export interface ChartLoadingProps extends React.HTMLAttributes<HTMLDivElement> {
  /** Announced to screen readers while the chart is pending. */
  label?: string;
  /** Number of placeholder bars. Defaults to 7. */
  bars?: number;
}

const ChartLoading = React.forwardRef<HTMLDivElement, ChartLoadingProps>(
  (
    { label = "Loading chart", bars = BAR_HEIGHTS.length, className, ...props },
    ref,
  ) => {
    return (
      <div
        ref={ref}
        role="status"
        aria-live="polite"
        aria-busy="true"
        className={cn(
          "flex min-h-[120px] w-full items-end justify-center gap-2 p-6",
          className,
        )}
        {...props}
      >
        <span className="sr-only">{label}</span>
        {Array.from({ length: bars }, (_, i) => (
          <div
            key={i}
            aria-hidden="true"
            className="bk-skeleton-stamp w-full max-w-10 border-2 border-foreground/20 bg-muted"
            style={{
              height: BAR_HEIGHTS[i % BAR_HEIGHTS.length],
              animationDelay: `${i * 90}ms`,
            }}
          />
        ))}
      </div>
    );
  },
);
ChartLoading.displayName = "ChartLoading";

export { ChartLoading };

```