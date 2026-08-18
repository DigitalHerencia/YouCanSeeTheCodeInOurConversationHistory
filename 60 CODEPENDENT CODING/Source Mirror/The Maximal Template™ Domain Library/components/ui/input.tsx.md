---
title: 'The Maximal Template™ Domain Library\components\ui\input.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\input.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.input.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\input.tsx'
source_file: 'input.tsx'
source_sha256: '37c894d2e2fb7e66cdddea7fa3a7b0bd228dd3c9a00182be91d1e7988f96f86c'
generated: true
---

# `input.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\input.tsx`
> SHA-256: `37c894d2e2fb7e66cdddea7fa3a7b0bd228dd3c9a00182be91d1e7988f96f86c`

```tsx
import * as React from "react";
import { cn } from "@/lib/utils";

const Input = React.forwardRef<HTMLInputElement, React.ComponentProps<"input">>(
  ({ className, type, ...props }, ref) => {
    return (
      <input
        type={type}
        className={cn(
          "flex h-11 w-full border-3 border-input bg-background px-4 py-2 text-base shadow-[4px_4px_0px_hsl(var(--shadow-color))] bk-interactive file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 focus-visible:translate-x-[4px] focus-visible:translate-y-[4px] focus-visible:shadow-none disabled:cursor-not-allowed disabled:opacity-50 md:text-sm",
          className,
        )}
        ref={ref}
        {...props}
      />
    );
  },
);
Input.displayName = "Input";

export { Input };

```