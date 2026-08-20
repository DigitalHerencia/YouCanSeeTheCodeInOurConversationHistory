---
title: 'The Maximal Template™ Domain Library\components\ui\kbd.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\kbd.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.kbd.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\kbd.tsx'
source_file: 'kbd.tsx'
source_sha256: 'b8370710bf5eb7ae955dede7def3e0314f62cb2f879541c22f4dd857e3962e73'
generated: true
---

# `kbd.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\kbd.tsx`
> SHA-256: `b8370710bf5eb7ae955dede7def3e0314f62cb2f879541c22f4dd857e3962e73`

```tsx
/* eslint-disable react-refresh/only-export-components */
import * as React from "react";
import { cva, type VariantProps } from "class-variance-authority";
import { cn } from "@/lib/utils";

const kbdVariants = cva(
  "inline-flex items-center justify-center font-mono font-bold uppercase border-3 border-foreground",
  {
    variants: {
      variant: {
        default: "bg-muted shadow-[2px_2px_0px_hsl(var(--shadow-color))]",
        outline: "bg-background",
        ghost: "bg-transparent border-transparent text-muted-foreground",
      },
      size: {
        sm: "min-w-5 h-5 px-1 text-[10px]",
        md: "min-w-6 h-6 px-1.5 text-xs",
        lg: "min-w-8 h-8 px-2 text-sm",
      },
    },
    defaultVariants: {
      variant: "default",
      size: "md",
    },
  },
);

export interface KbdProps
  extends React.HTMLAttributes<HTMLElement>, VariantProps<typeof kbdVariants> {}

const Kbd = React.forwardRef<HTMLElement, KbdProps>(
  ({ className, variant, size, ...props }, ref) => {
    return (
      <kbd
        ref={ref}
        className={cn(kbdVariants({ variant, size, className }))}
        {...props}
      />
    );
  },
);
Kbd.displayName = "Kbd";

export interface KbdComboProps extends Omit<KbdProps, "children"> {
  keys: string[];
  separator?: React.ReactNode;
}

const KbdCombo = React.forwardRef<HTMLDivElement, KbdComboProps>(
  ({ keys, separator = "+", variant, size, className, ...props }, ref) => {
    return (
      <div
        ref={ref}
        className={cn("inline-flex items-center gap-1", className)}
        {...props}
      >
        {keys.map((key, index) => (
          <React.Fragment key={`kbd-${index}-${key}`}>
            {index > 0 && (
              <span className="text-muted-foreground text-xs font-bold">
                {separator}
              </span>
            )}
            <Kbd variant={variant} size={size}>
              {key}
            </Kbd>
          </React.Fragment>
        ))}
      </div>
    );
  },
);
KbdCombo.displayName = "KbdCombo";

export { Kbd, KbdCombo, kbdVariants };

```