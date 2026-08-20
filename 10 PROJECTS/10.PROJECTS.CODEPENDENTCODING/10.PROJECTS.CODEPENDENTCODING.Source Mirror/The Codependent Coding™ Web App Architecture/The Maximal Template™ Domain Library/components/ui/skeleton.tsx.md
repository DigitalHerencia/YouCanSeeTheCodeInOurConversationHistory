---
title: 'The Maximal Template™ Domain Library\components\ui\skeleton.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\skeleton.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.skeleton.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\skeleton.tsx'
source_file: 'skeleton.tsx'
source_sha256: '5da1611b22096a2ad66fa076851f41be600c9c3f59781c0f731d1b2fd5dd20b1'
generated: true
---

# `skeleton.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\skeleton.tsx`
> SHA-256: `5da1611b22096a2ad66fa076851f41be600c9c3f59781c0f731d1b2fd5dd20b1`

```tsx
/* eslint-disable react-refresh/only-export-components */
import * as React from "react";
import { cva, type VariantProps } from "class-variance-authority";
import { cn } from "@/lib/utils";

const skeletonVariants = cva("bg-muted border-2 border-foreground/20", {
  variants: {
    variant: {
      /** Soft opacity breathe. The pre-v3.5 default. */
      pulse: "animate-pulse",
      /** Hard on/off — no interpolated fade. */
      stamp: "bk-skeleton-stamp",
      /** Marching cells on a stepped loop. */
      blocks: "bk-skeleton-blocks",
      /** A hard bar sweeping across the block. */
      scan: "bk-skeleton-scan",
      /** No motion at all. */
      none: "",
    },
  },
  defaultVariants: {
    variant: "pulse",
  },
});

export interface SkeletonProps
  extends
    React.HTMLAttributes<HTMLDivElement>,
    VariantProps<typeof skeletonVariants> {}

function Skeleton({ className, variant, ...props }: SkeletonProps) {
  return (
    <div
      // ponytail: decorative placeholder — hidden from AT. Announce loading on
      // the container instead (aria-busy / role="status"), not per-skeleton.
      aria-hidden="true"
      className={cn(skeletonVariants({ variant }), className)}
      {...props}
    />
  );
}

export { Skeleton, skeletonVariants };

```