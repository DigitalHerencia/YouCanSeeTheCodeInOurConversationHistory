---
title: 'The Maximal Template™ Domain Library\components\ui\separator.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\separator.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.separator.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\separator.tsx'
source_file: 'separator.tsx'
source_sha256: '2dc20fbeea4de7961f8ad68004fbab4600a3b58a4a6e64cf03e727c156032a86'
generated: true
---

# `separator.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\separator.tsx`
> SHA-256: `2dc20fbeea4de7961f8ad68004fbab4600a3b58a4a6e64cf03e727c156032a86`

```tsx
import * as React from "react";
import * as SeparatorPrimitive from "@radix-ui/react-separator";
import { cn } from "@/lib/utils";

const Separator = React.forwardRef<
  React.ElementRef<typeof SeparatorPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof SeparatorPrimitive.Root>
>(
  (
    { className, orientation = "horizontal", decorative = true, ...props },
    ref,
  ) => (
    <SeparatorPrimitive.Root
      ref={ref}
      decorative={decorative}
      orientation={orientation}
      className={cn(
        "shrink-0 bg-foreground",
        orientation === "horizontal" ? "h-[3px] w-full" : "h-full w-[3px]",
        className,
      )}
      {...props}
    />
  ),
);
Separator.displayName = SeparatorPrimitive.Root.displayName;

export { Separator };

```