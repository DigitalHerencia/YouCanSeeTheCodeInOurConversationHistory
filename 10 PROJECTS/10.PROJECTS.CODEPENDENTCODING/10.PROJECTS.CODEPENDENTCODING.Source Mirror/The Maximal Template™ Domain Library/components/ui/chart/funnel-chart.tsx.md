---
title: 'The Maximal Template™ Domain Library\components\ui\chart\funnel-chart.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\chart\funnel-chart.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.chart.funnel-chart.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\chart\funnel-chart.tsx'
source_file: 'funnel-chart.tsx'
source_sha256: 'd2551b538b26a24416fca22c6fe638285343e5322f3af8453e8aa94b3a3de88f'
generated: true
---

# `funnel-chart.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\chart\funnel-chart.tsx`
> SHA-256: `d2551b538b26a24416fca22c6fe638285343e5322f3af8453e8aa94b3a3de88f`

```tsx
import * as React from "react";
import { cn } from "@/lib/utils";
import {
  FunnelChart as RechartsFC,
  Funnel,
  LabelList,
  Tooltip,
  ResponsiveContainer,
} from "recharts";
import { ChartEmpty } from "./empty";

export interface FunnelChartData {
  name: string;
  value: number;
  fill?: string;
}

export interface FunnelChartProps extends React.HTMLAttributes<HTMLDivElement> {
  data: FunnelChartData[];
  showLabels?: boolean;
  showTooltip?: boolean;
  animated?: boolean;
  height?: number;
  /** Accessible label for screen readers (default: "Funnel chart") */
  ariaLabel?: string;
  emptyState?: React.ReactNode;
}

const NEUBRUTALISM_COLORS = [
  "hsl(var(--primary))",
  "hsl(var(--secondary))",
  "hsl(var(--accent))",
  "hsl(var(--success))",
  "hsl(var(--info))",
  "hsl(var(--warning))",
];

const FunnelChart = React.forwardRef<HTMLDivElement, FunnelChartProps>(
  (
    {
      data,
      showLabels = true,
      showTooltip = true,
      animated = true,
      height = 300,
      ariaLabel = "Funnel chart",
      emptyState,
      className,
      ...props
    },
    ref,
  ) => {
    if (!data || data.length === 0) {
      return (
        <ChartEmpty
          ref={ref}
          message={emptyState}
          className={className}
          {...props}
        />
      );
    }

    const coloredData = data.map((d, i) => ({
      ...d,
      fill: d.fill || NEUBRUTALISM_COLORS[i % NEUBRUTALISM_COLORS.length],
    }));

    return (
      <div
        ref={ref}
        role="img"
        aria-label={ariaLabel}
        className={cn("w-full", className)}
        style={{ height }}
        {...props}
      >
        <ResponsiveContainer width="100%" height="100%">
          <RechartsFC>
            <Funnel
              dataKey="value"
              data={coloredData}
              isAnimationActive={animated}
              animationDuration={400}
              stroke="hsl(var(--foreground))"
              strokeWidth={3}
            >
              {showLabels && (
                <LabelList
                  position="right"
                  fill="hsl(var(--foreground))"
                  stroke="none"
                  dataKey="name"
                  style={{
                    fontFamily: "'DM Mono', monospace",
                    fontSize: 11,
                    fontWeight: 700,
                  }}
                />
              )}
            </Funnel>
            {showTooltip && (
              <Tooltip
                contentStyle={{
                  border: "3px solid hsl(var(--foreground))",
                  borderRadius: 0,
                  boxShadow: "4px 4px 0px hsl(var(--foreground))",
                  background: "hsl(var(--background))",
                  color: "hsl(var(--foreground))",
                  fontFamily: "'DM Mono', monospace",
                  fontSize: 12,
                }}
                itemStyle={{ color: "hsl(var(--foreground))" }}
                labelStyle={{ color: "hsl(var(--foreground))" }}
                formatter={(value, name) => [
                  `${Number(value ?? 0).toLocaleString()}`,
                  String(name ?? ""),
                ]}
              />
            )}
          </RechartsFC>
        </ResponsiveContainer>
      </div>
    );
  },
);
FunnelChart.displayName = "FunnelChart";

export { FunnelChart };

```