---
title: 'The Maximal Template™ Domain Library\components\ui\chart\empty.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\chart\empty.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.chart.empty.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\chart\empty.tsx'
source_file: 'empty.tsx'
source_sha256: '6c225e093b66417e5d312ec512d0d4750ff8771c173cffcab3011d5742301fa3'
generated: true
---

# `empty.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\chart\empty.tsx`
> SHA-256: `6c225e093b66417e5d312ec512d0d4750ff8771c173cffcab3011d5742301fa3`

```tsx
import * as React from "react";
import { cn } from "@/lib/utils";

export interface ChartEmptyProps extends React.HTMLAttributes<HTMLDivElement> {
  message?: React.ReactNode;
}

const ChartEmpty = React.forwardRef<HTMLDivElement, ChartEmptyProps>(
  ({ message = "No data", className, ...props }, ref) => {
    return (
      <div
        ref={ref}
        role="status"
        aria-live="polite"
        className={cn(
          "flex min-h-[120px] w-full items-center justify-center border-3 border-dashed border-foreground/40 bg-muted/20 p-6 text-xs font-bold uppercase tracking-wide text-muted-foreground",
          className,
        )}
        {...props}
      >
        {message}
      </div>
    );
  },
);
ChartEmpty.displayName = "ChartEmpty";

export { ChartEmpty };

```