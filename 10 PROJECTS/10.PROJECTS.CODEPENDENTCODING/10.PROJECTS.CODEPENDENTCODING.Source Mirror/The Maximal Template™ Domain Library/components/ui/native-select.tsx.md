---
title: 'The Maximal Template™ Domain Library\components\ui\native-select.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\native-select.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.native-select.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\native-select.tsx'
source_file: 'native-select.tsx'
source_sha256: '30d8c553bffd9c1e1d15e465e46d25cb90cb928c99feae27adc45d805dae5370'
generated: true
---

# `native-select.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\native-select.tsx`
> SHA-256: `30d8c553bffd9c1e1d15e465e46d25cb90cb928c99feae27adc45d805dae5370`

```tsx
import * as React from "react";
import { ChevronDown } from "lucide-react";
import { cn } from "@/lib/utils";

/**
 * A styled wrapper around the native <select> element — lightweight and
 * a11y-first, for simple option lists that don't need a custom popover.
 */
const NativeSelect = React.forwardRef<
  HTMLSelectElement,
  React.SelectHTMLAttributes<HTMLSelectElement>
>(({ className, children, ...props }, ref) => (
  <div className="relative inline-flex w-full">
    <select
      ref={ref}
      className={cn(
        "h-11 w-full appearance-none border-3 border-foreground bg-background px-3 pr-10 text-sm font-bold uppercase tracking-wide shadow-[4px_4px_0px_hsl(var(--shadow-color))] outline-none transition focus-visible:translate-x-[2px] focus-visible:translate-y-[2px] focus-visible:shadow-none disabled:cursor-not-allowed disabled:opacity-50",
        className,
      )}
      {...props}
    >
      {children}
    </select>
    <ChevronDown className="pointer-events-none absolute right-3 top-1/2 h-4 w-4 -translate-y-1/2 stroke-[3]" />
  </div>
));
NativeSelect.displayName = "NativeSelect";

export { NativeSelect };

```