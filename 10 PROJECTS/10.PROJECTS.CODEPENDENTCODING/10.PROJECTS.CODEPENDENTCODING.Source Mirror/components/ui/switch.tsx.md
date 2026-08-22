---
title: 'The Hipster Stack™ Technology Stack\apps\web\components\ui\switch.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\apps\web\components\ui\switch.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.apps.web.components.ui.switch.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\apps\web\components\ui\switch.tsx'
source_file: 'switch.tsx'
source_sha256: '92c65437138a8f04d9bc3ec7b8e8c2680c096176705d7a5e70b7ef8442a2c3bc'
generated: true
---

# `switch.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\apps\web\components\ui\switch.tsx`
> SHA-256: `92c65437138a8f04d9bc3ec7b8e8c2680c096176705d7a5e70b7ef8442a2c3bc`

```tsx
'use client';

import * as React from 'react';
import * as SwitchPrimitive from '@radix-ui/react-switch';
import { cn } from '@/lib/utils';

const Switch = React.forwardRef<
  React.ElementRef<typeof SwitchPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof SwitchPrimitive.Root>
>(({ className, ...props }, ref) => (
  <SwitchPrimitive.Root
    ref={ref}
    className={cn(
      'peer inline-flex h-5 w-9 shrink-0 cursor-pointer items-center border border-signal-border bg-background-strong outline-none transition-[background-color,border-color,box-shadow] duration-150 focus-visible:border-signal focus-visible:shadow-[0_0_0_1px_var(--signal),0_0_0.9rem_var(--signal-soft)] disabled:cursor-not-allowed disabled:opacity-45 data-[state=checked]:border-signal data-[state=checked]:bg-signal',
      className,
    )}
    {...props}
  >
    <SwitchPrimitive.Thumb className="pointer-events-none block size-3.5 translate-x-0.5 bg-foreground transition-transform duration-150 data-[state=checked]:translate-x-[1.125rem]" />
  </SwitchPrimitive.Root>
));
Switch.displayName = SwitchPrimitive.Root.displayName;

export { Switch };

```