---
title: 'The Maximal Template™ Domain Library\components\ui\chart\legend.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\chart\legend.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.chart.legend.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\chart\legend.tsx'
source_file: 'legend.tsx'
source_sha256: 'f10a9646a4bc10be13e9ee3185d0bca33b2181b9b12cca8b92b3f4295e50bd03'
generated: true
---

# `legend.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\chart\legend.tsx`
> SHA-256: `f10a9646a4bc10be13e9ee3185d0bca33b2181b9b12cca8b92b3f4295e50bd03`

```tsx
import * as React from "react";
import * as RechartsPrimitive from "recharts";
import { cn } from "@/lib/utils";
import { useChart } from "./types";
import { getPayloadConfigFromPayload } from "./utils";

export const ChartLegend = RechartsPrimitive.Legend;

export interface ChartLegendContentProps extends React.ComponentProps<"div"> {
  payload?: Array<{
    value?: string;
    dataKey?: string;
    color?: string;
  }>;
  verticalAlign?: "top" | "bottom";
  hideIcon?: boolean;
  nameKey?: string;
}

export function ChartLegendContent({
  className,
  hideIcon = false,
  payload,
  verticalAlign = "bottom",
  nameKey,
}: ChartLegendContentProps) {
  const { config } = useChart();

  if (!payload?.length) {
    return null;
  }

  return (
    <div
      className={cn(
        "flex items-center justify-center gap-4 font-bold uppercase tracking-wide",
        verticalAlign === "top" ? "pb-3" : "pt-3",
        className,
      )}
    >
      {payload.map((item, index) => {
        const key = `${nameKey || item.dataKey || "value"}`;
        const itemConfig = getPayloadConfigFromPayload(config, item, key);

        return (
          <div
            key={item.dataKey ?? item.value ?? index}
            className={cn(
              "flex items-center gap-1.5 [&>svg]:h-3 [&>svg]:w-3 [&>svg]:text-foreground",
            )}
          >
            {itemConfig?.icon && !hideIcon ? (
              <itemConfig.icon />
            ) : (
              <div
                className="h-3 w-3 shrink-0 border-2 border-foreground"
                style={{
                  backgroundColor: item.color,
                }}
              />
            )}
            <span className="text-sm">{itemConfig?.label}</span>
          </div>
        );
      })}
    </div>
  );
}

```