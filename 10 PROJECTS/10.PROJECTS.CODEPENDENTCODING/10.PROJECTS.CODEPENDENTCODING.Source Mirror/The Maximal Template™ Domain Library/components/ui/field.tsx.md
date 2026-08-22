---
title: 'The Maximal Template™ Domain Library\components\ui\field.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\field.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.field.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\field.tsx'
source_file: 'field.tsx'
source_sha256: '57c1309d5124fc461a80ee5950465c0560a3019035bc647549b1df54bc9deb54'
generated: true
---

# `field.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\field.tsx`
> SHA-256: `57c1309d5124fc461a80ee5950465c0560a3019035bc647549b1df54bc9deb54`

```tsx
import * as React from "react";
import { cn } from "@/lib/utils";
import { Label } from "@/components/ui/label";

/** A vertical stack of related fields. */
const FieldGroup = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div ref={ref} className={cn("flex flex-col gap-5", className)} {...props} />
));
FieldGroup.displayName = "FieldGroup";

/** A single form field: groups a label, control, description and error. */
const Field = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={cn("flex flex-col gap-1.5", className)}
    {...props}
  />
));
Field.displayName = "Field";

const FieldLabel = React.forwardRef<
  React.ElementRef<typeof Label>,
  React.ComponentPropsWithoutRef<typeof Label>
>(({ className, ...props }, ref) => (
  <Label ref={ref} className={cn("text-xs", className)} {...props} />
));
FieldLabel.displayName = "FieldLabel";

const FieldDescription = React.forwardRef<
  HTMLParagraphElement,
  React.HTMLAttributes<HTMLParagraphElement>
>(({ className, ...props }, ref) => (
  <p
    ref={ref}
    className={cn("text-xs font-medium text-muted-foreground", className)}
    {...props}
  />
));
FieldDescription.displayName = "FieldDescription";

const FieldError = React.forwardRef<
  HTMLParagraphElement,
  React.HTMLAttributes<HTMLParagraphElement>
>(({ className, children, ...props }, ref) => {
  if (!children) return null;
  return (
    <p
      ref={ref}
      role="alert"
      className={cn(
        "text-xs font-bold uppercase tracking-wide text-destructive",
        className,
      )}
      {...props}
    >
      {children}
    </p>
  );
});
FieldError.displayName = "FieldError";

export { Field, FieldGroup, FieldLabel, FieldDescription, FieldError };

```