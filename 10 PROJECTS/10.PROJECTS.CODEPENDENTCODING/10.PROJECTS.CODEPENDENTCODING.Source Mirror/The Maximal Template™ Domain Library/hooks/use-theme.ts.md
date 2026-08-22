---
title: 'The Maximal Template™ Domain Library\hooks\use-theme.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\hooks\use-theme.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.hooks.use-theme.ts'
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
source_path: 'The Maximal Template™ Domain Library\hooks\use-theme.ts'
source_file: 'use-theme.ts'
source_sha256: '431b35c14159812f6d2edf814be44fd3290c308b629f2145a9c31e143ec9db16'
generated: true
---

# `use-theme.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\hooks\use-theme.ts`
> SHA-256: `431b35c14159812f6d2edf814be44fd3290c308b629f2145a9c31e143ec9db16`

```ts
"use client";

import { useEffect, useState } from "react";

export type Theme = "light" | "dark" | "system";

function resolveTheme(theme: Theme): "light" | "dark" {
  if (theme !== "system") return theme;
  return window.matchMedia("(prefers-color-scheme: dark)").matches
    ? "dark"
    : "light";
}

export function useTheme() {
  const [theme, setTheme] = useState<Theme>("system");
  const [resolvedTheme, setResolvedTheme] = useState<"light" | "dark">("light");

  useEffect(() => {
    const media = window.matchMedia("(prefers-color-scheme: dark)");
    const apply = () => {
      const resolved = resolveTheme(theme);
      document.documentElement.classList.toggle("dark", resolved === "dark");
      setResolvedTheme(resolved);
    };

    apply();
    media.addEventListener("change", apply);
    return () => media.removeEventListener("change", apply);
  }, [theme]);

  return { theme, resolvedTheme, setTheme };
}

```