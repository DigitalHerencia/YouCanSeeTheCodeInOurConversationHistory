---
title: 'The Maximal Template™ Domain Library\components\ErrorBoundary.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ErrorBoundary.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.errorboundary.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ErrorBoundary.tsx'
source_file: 'ErrorBoundary.tsx'
source_sha256: '34b7f45fb0fb8362d7fd23b7fc8c81e38e38ad7815bf41aaf25ba4cccb9a591c'
generated: true
---

# `ErrorBoundary.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ErrorBoundary.tsx`
> SHA-256: `34b7f45fb0fb8362d7fd23b7fc8c81e38e38ad7815bf41aaf25ba4cccb9a591c`

```tsx
"use client";

import type { ErrorInfo, ReactNode } from "react";
import { Component } from "react";

interface ErrorBoundaryProps {
  children: ReactNode;
  fallback?: ReactNode;
}

interface ErrorBoundaryState {
  failed: boolean;
}

export class ErrorBoundary extends Component<
  ErrorBoundaryProps,
  ErrorBoundaryState
> {
  state: ErrorBoundaryState = { failed: false };

  static getDerivedStateFromError(): ErrorBoundaryState {
    return { failed: true };
  }

  componentDidCatch(error: Error, info: ErrorInfo): void {
    console.error("Presentation boundary failed", error, info);
  }

  render() {
    if (this.state.failed) {
      return this.props.fallback ?? null;
    }

    return this.props.children;
  }
}

```