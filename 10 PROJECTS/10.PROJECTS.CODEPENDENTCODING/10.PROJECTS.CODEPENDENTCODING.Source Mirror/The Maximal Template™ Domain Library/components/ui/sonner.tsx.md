---
title: 'The Maximal Template™ Domain Library\components\ui\sonner.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\sonner.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.sonner.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\sonner.tsx'
source_file: 'sonner.tsx'
source_sha256: 'c04b5993a8db5134c9f377568583856290f6f2da6ef012863070c235f9e7c02f'
generated: true
---

# `sonner.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\sonner.tsx`
> SHA-256: `c04b5993a8db5134c9f377568583856290f6f2da6ef012863070c235f9e7c02f`

```tsx
"use client";

import { useTheme } from "@/hooks/use-theme";
import { Toaster as Sonner } from "sonner";

type ToasterProps = React.ComponentProps<typeof Sonner>;

const Toaster = ({ ...props }: ToasterProps) => {
  const { resolvedTheme } = useTheme();

  return (
    <Sonner
      theme={resolvedTheme as ToasterProps["theme"]}
      className="toaster group"
      toastOptions={{
        classNames: {
          toast:
            "group toast group-[.toaster]:bg-background group-[.toaster]:text-foreground group-[.toaster]:border-3 group-[.toaster]:border-foreground group-[.toaster]:shadow-[4px_4px_0px_hsl(var(--shadow-color))] group-[.toaster]:rounded-none group-[.toaster]:font-bold",
          title:
            "group-[.toast]:font-black group-[.toast]:uppercase group-[.toast]:tracking-wide",
          description:
            "group-[.toast]:text-muted-foreground group-[.toast]:font-medium",
          actionButton:
            "group-[.toast]:bg-primary group-[.toast]:text-primary-foreground group-[.toast]:border-2 group-[.toast]:border-foreground group-[.toast]:font-bold group-[.toast]:uppercase group-[.toast]:rounded-none group-[.toast]:shadow-[2px_2px_0px_hsl(var(--foreground))] group-[.toast]:hover:translate-x-[2px] group-[.toast]:hover:translate-y-[2px] group-[.toast]:hover:shadow-none group-[.toast]:transition",
          cancelButton:
            "group-[.toast]:bg-muted group-[.toast]:text-muted-foreground group-[.toast]:border-2 group-[.toast]:border-foreground group-[.toast]:font-bold group-[.toast]:uppercase group-[.toast]:rounded-none",
          success:
            "group-[.toaster]:bg-success group-[.toaster]:text-success-foreground group-[.toaster]:border-foreground",
          error:
            "group-[.toaster]:bg-destructive group-[.toaster]:text-destructive-foreground group-[.toaster]:border-foreground",
          warning:
            "group-[.toaster]:bg-warning group-[.toaster]:text-warning-foreground group-[.toaster]:border-foreground",
          info: "group-[.toaster]:bg-info group-[.toaster]:text-info-foreground group-[.toaster]:border-foreground",
          closeButton:
            "group-[.toast]:border-2 group-[.toast]:border-foreground group-[.toast]:bg-background group-[.toast]:text-foreground group-[.toast]:hover:bg-muted group-[.toast]:rounded-none",
        },
      }}
      {...props}
    />
  );
};

export { Toaster };

```