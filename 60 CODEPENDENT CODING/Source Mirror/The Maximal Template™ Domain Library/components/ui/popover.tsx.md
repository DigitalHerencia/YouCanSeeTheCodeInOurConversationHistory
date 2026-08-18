---
title: 'The Maximal Template™ Domain Library\components\ui\popover.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\popover.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.popover.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\popover.tsx'
source_file: 'popover.tsx'
source_sha256: '8ea8bd09b0c310e6358bea6e91f7eaf6d18e1fb3279cd2a15b5c221fd7834db7'
generated: true
---

# `popover.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\popover.tsx`
> SHA-256: `8ea8bd09b0c310e6358bea6e91f7eaf6d18e1fb3279cd2a15b5c221fd7834db7`

```tsx
import * as React from "react";
import * as PopoverPrimitive from "@radix-ui/react-popover";
import { cn } from "@/lib/utils";

const Popover = PopoverPrimitive.Root;

const PopoverTrigger = PopoverPrimitive.Trigger;

const PopoverAnchor = PopoverPrimitive.Anchor;

const PopoverContent = React.forwardRef<
  React.ElementRef<typeof PopoverPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof PopoverPrimitive.Content>
>(({ className, align = "center", sideOffset = 4, ...props }, ref) => (
  <PopoverPrimitive.Portal>
    <PopoverPrimitive.Content
      ref={ref}
      align={align}
      sideOffset={sideOffset}
      className={cn(
        "z-50 w-72 border-3 border-foreground bg-popover p-4 text-popover-foreground shadow-[4px_4px_0px_hsl(var(--shadow-color))] outline-none ease-out origin-[var(--radix-popper-content-transform-origin)] data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2",
        className,
      )}
      {...props}
    />
  </PopoverPrimitive.Portal>
));
PopoverContent.displayName = PopoverPrimitive.Content.displayName;

export { Popover, PopoverTrigger, PopoverContent, PopoverAnchor };

```