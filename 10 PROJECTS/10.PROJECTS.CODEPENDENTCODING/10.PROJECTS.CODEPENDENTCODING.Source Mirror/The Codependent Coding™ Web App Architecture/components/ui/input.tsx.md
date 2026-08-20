---
title: 'The Hipster Stack™ Technology Stack\apps\web\components\ui\input.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\apps\web\components\ui\input.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.apps.web.components.ui.input.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\apps\web\components\ui\input.tsx'
source_file: 'input.tsx'
source_sha256: 'c53dc2b14a65385093e22e6b2d7ba94a8b367b95a0a0d7885f15aba922c07cbc'
generated: true
---

# `input.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\apps\web\components\ui\input.tsx`
> SHA-256: `c53dc2b14a65385093e22e6b2d7ba94a8b367b95a0a0d7885f15aba922c07cbc`

```tsx
import * as React from 'react';
import { cn } from '@/lib/utils';

const Input = React.forwardRef<HTMLInputElement, React.ComponentProps<'input'>>(
  ({ className, type, ...props }, ref) => (
    <input
      ref={ref}
      type={type}
      className={cn(
        'flex h-10 w-full border border-signal-border bg-background-strong px-3 py-2 font-body text-sm text-foreground outline-none transition-[border-color,box-shadow] duration-150 file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-foreground/45 focus-visible:border-signal focus-visible:shadow-[0_0_0_1px_var(--signal),0_0_1rem_var(--signal-soft)] disabled:cursor-not-allowed disabled:opacity-45',
        className,
      )}
      {...props}
    />
  ),
);
Input.displayName = 'Input';

export { Input };

```