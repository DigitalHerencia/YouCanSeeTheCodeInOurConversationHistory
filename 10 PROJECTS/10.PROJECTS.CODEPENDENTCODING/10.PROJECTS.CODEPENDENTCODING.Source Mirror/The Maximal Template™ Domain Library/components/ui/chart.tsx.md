---
title: 'The Maximal Template™ Domain Library\components\ui\chart.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\chart.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.chart.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\chart.tsx'
source_file: 'chart.tsx'
source_sha256: 'b098f111719e41055c4a33894efd6b9535ee6163c7618242cb8046343e1b625c'
generated: true
---

# `chart.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\chart.tsx`
> SHA-256: `b098f111719e41055c4a33894efd6b9535ee6163c7618242cb8046343e1b625c`

```tsx
/* eslint-disable react-refresh/only-export-components */
// Re-export all chart components from the chart directory
// This maintains backward compatibility with existing imports

export {
  // Types and context
  ChartContext,
  useChart,
  THEMES,
  // Palettes and color helpers
  CHART_PALETTES,
  getChartColor,
  createChartConfig,
  // Container components
  ChartContainer,
  ChartStyle,
  chartContainerVariants,
  // Tooltip components
  ChartTooltip,
  ChartTooltipContent,
  // Legend components
  ChartLegend,
  ChartLegendContent,
  // Utility functions
  getPayloadConfigFromPayload,
  // Sparkline chart
  Sparkline,
  // Donut chart
  DonutChart,
  DonutChartCenter,
  // Radial bar chart
  RadialBarChart,
  // Radar chart
  RadarChart,
  // Gauge chart
  GaugeChart,
  gaugeChartVariants,
  // Advanced charts (v3.0)
  FunnelChart,
  TreemapChart,
  HeatmapChart,
  SankeyChart,
  // Annotations (reference lines, callouts, arrows)
  referenceLineElement,
  calloutElement,
  arrowElements,
  renderChartAnnotations,
} from "./chart/index";

export type {
  ChartAnnotation,
  ChartReferenceLineSpec,
  ChartCalloutSpec,
  ChartArrowSpec,
  ChartConfig,
  ChartContextProps,
  ChartPalette,
  ChartContainerProps,
  ChartTooltipContentProps,
  ChartLegendContentProps,
  // Sparkline types
  SparklineProps,
  // Donut chart types
  DonutChartProps,
  DonutChartData,
  DonutChartCenterProps,
  // Radial bar chart types
  RadialBarChartProps,
  RadialBarChartData,
  // Radar chart types
  RadarChartProps,
  RadarChartData,
  // Gauge chart types
  GaugeChartProps,
  GaugeChartZone,
  // Advanced chart types (v3.0)
  FunnelChartProps,
  FunnelChartData,
  TreemapChartProps,
  TreemapChartData,
  HeatmapChartProps,
  HeatmapCellData,
  SankeyChartProps,
  SankeyNode,
  SankeyLink,
} from "./chart/index";

```