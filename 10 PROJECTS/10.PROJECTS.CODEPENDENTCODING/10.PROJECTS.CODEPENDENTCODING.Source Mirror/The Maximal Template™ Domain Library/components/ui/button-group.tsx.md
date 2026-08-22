---
title: 'The Maximal Template™ Domain Library\components\ui\button-group.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\button-group.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.button-group.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\button-group.tsx'
source_file: 'button-group.tsx'
source_sha256: 'f2784d7aab1489dbdcc7684da5a100513262b72f5ab1b882ddd8889b879d96f1'
generated: true
---

# `button-group.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\button-group.tsx`
> SHA-256: `f2784d7aab1489dbdcc7684da5a100513262b72f5ab1b882ddd8889b879d96f1`

```tsx
import * as React from "react";
import { cn } from "@/lib/utils";

export interface ButtonGroupProps extends React.HTMLAttributes<HTMLDivElement> {
  orientation?: "horizontal" | "vertical";
}

/**
 * Visually joins a row (or column) of Buttons into a single bordered unit:
 * shared borders collapse, individual shadows/press animations are neutralized,
 * and the group carries one hard neubrutalism shadow.
 */
const ButtonGroup = React.forwardRef<HTMLDivElement, ButtonGroupProps>(
  ({ className, orientation = "horizontal", ...props }, ref) => (
    <div
      ref={ref}
      role="group"
      className={cn(
        "inline-flex shadow-[4px_4px_0px_hsl(var(--shadow-color))]",
        // neutralize each child's own shadow + press-translate so the group reads as one block
        "[&>*]:shadow-none [&>*]:hover:translate-x-0 [&>*]:hover:translate-y-0 [&>*]:active:translate-x-0 [&>*]:active:translate-y-0",
        orientation === "horizontal"
          ? "[&>*:not(:first-child)]:ml-[-3px]"
          : "flex-col [&>*:not(:first-child)]:mt-[-3px]",
        className,
      )}
      {...props}
    />
  ),
);
ButtonGroup.displayName = "ButtonGroup";

export { ButtonGroup };

```