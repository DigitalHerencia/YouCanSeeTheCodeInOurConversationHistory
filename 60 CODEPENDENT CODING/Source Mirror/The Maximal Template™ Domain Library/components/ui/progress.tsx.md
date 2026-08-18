---
title: 'The Maximal Template™ Domain Library\components\ui\progress.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\progress.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.progress.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\progress.tsx'
source_file: 'progress.tsx'
source_sha256: 'c9b282eadc892c0fc95e974666c3522f992659757b3a8adc6cc526b22283cae4'
generated: true
---

# `progress.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\progress.tsx`
> SHA-256: `c9b282eadc892c0fc95e974666c3522f992659757b3a8adc6cc526b22283cae4`

```tsx
import * as React from "react";
import * as ProgressPrimitive from "@radix-ui/react-progress";
import { cn } from "@/lib/utils";

type ProgressVariant =
  /** Continuous fill. The pre-v3.5 default. */
  | "smooth"
  /** Fill snaps forward in ten discrete notches. */
  | "stepped"
  /** Indeterminate — a block travelling the track. Ignores `value`. */
  | "marquee";

export interface ProgressProps extends React.ComponentPropsWithoutRef<
  typeof ProgressPrimitive.Root
> {
  variant?: ProgressVariant;
}

const Progress = React.forwardRef<
  React.ElementRef<typeof ProgressPrimitive.Root>,
  ProgressProps
>(({ className, value, variant = "smooth", max = 100, ...props }, ref) => {
  const indeterminate = variant === "marquee";
  // Clamp against `max`, not a hard 100 — otherwise a max of 200 renders a full
  // bar while aria-valuenow reports half. Percent drives the fill; the raw
  // clamped value is what Radix exposes to AT.
  const safeMax = max > 0 ? max : 100;
  const clampedValue = Math.max(0, Math.min(safeMax, value ?? 0));
  const percent = (clampedValue / safeMax) * 100;
  // Radix reads null as indeterminate and drops aria-valuenow. Pass the clamped
  // value so an out-of-range `value` can't trip Radix's range warning, and keep
  // an omitted value indeterminate the way it was before v3.5.
  const ariaValue = indeterminate || value == null ? null : clampedValue;
  return (
    <ProgressPrimitive.Root
      ref={ref}
      value={ariaValue}
      max={safeMax}
      className={cn(
        "relative h-5 w-full overflow-hidden border-3 border-foreground bg-muted shadow-[4px_4px_0px_hsl(var(--shadow-color))]",
        className,
      )}
      {...props}
    >
      <ProgressPrimitive.Indicator
        className={cn(
          "h-full w-full flex-1 bg-primary transition duration-500 ease-out",
          variant === "stepped" && "bk-progress-stepped",
          indeterminate && "bk-progress-marquee",
        )}
        style={
          indeterminate
            ? undefined
            : { transform: `translateX(-${100 - percent}%)` }
        }
      />
    </ProgressPrimitive.Root>
  );
});
Progress.displayName = ProgressPrimitive.Root.displayName;

export { Progress };
export type { ProgressVariant };

```