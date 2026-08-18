---
title: 'The Hipster Stack™ Technology Stack\template\components\ui\marquee.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\components\ui\marquee.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.components.ui.marquee.tsx'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\components\ui\marquee.tsx'
source_file: 'marquee.tsx'
source_sha256: '9f72d8abf7f9820c7d2895d96fccf7af20c04c73b827e0728550a3450ca40597'
generated: true
---

# `marquee.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\components\ui\marquee.tsx`
> SHA-256: `9f72d8abf7f9820c7d2895d96fccf7af20c04c73b827e0728550a3450ca40597`

```tsx
import * as React from "react"

import { cn } from "@/lib/utils"

export interface MarqueeProps extends React.ComponentPropsWithoutRef<"div"> {
  speed?: "slow" | "normal" | "fast"
  direction?: "left" | "right"
  pauseOnHover?: boolean
  bordered?: boolean
  repeat?: number
}
export const Marquee = React.forwardRef<HTMLDivElement, MarqueeProps>(
  (
    {
      className,
      children,
      speed = "normal",
      direction = "left",
      pauseOnHover = true,
      bordered = true,
      repeat = 4,
      ...props
    },
    ref
  ) => (
    <div
      ref={ref}
      data-direction={direction}
      data-pause-on-hover={pauseOnHover}
      data-speed={speed}
      className={cn("flex overflow-hidden", bordered && "border border-border", className)}
      {...props}
    >
      {[false, true].map((duplicate) => (
        <div
          key={String(duplicate)}
          aria-hidden={duplicate || undefined}
          className="marquee-track flex shrink-0 items-center gap-8 py-3"
        >
          {Array.from({ length: repeat }, (_, index) => (
            <React.Fragment key={index}>{children}</React.Fragment>
          ))}
        </div>
      ))}
    </div>
  )
)
Marquee.displayName = "Marquee"
export const MarqueeItem = React.forwardRef<
  HTMLSpanElement,
  React.ComponentPropsWithoutRef<"span">
>(({ className, ...props }, ref) => (
  <span
    ref={ref}
    className={cn(
      "inline-flex items-center gap-2 px-4 font-bold whitespace-nowrap uppercase",
      className
    )}
    {...props}
  />
))
MarqueeItem.displayName = "MarqueeItem"
export const MarqueeSeparator = React.forwardRef<
  HTMLSpanElement,
  React.ComponentPropsWithoutRef<"span">
>(({ className, children = "/", ...props }, ref) => (
  <span ref={ref} className={cn("font-bold text-muted-foreground", className)} {...props}>
    {children}
  </span>
))
MarqueeSeparator.displayName = "MarqueeSeparator"

```