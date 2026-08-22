---
title: 'The Hipster Stack™ Technology Stack\apps\web\app\layout.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\apps\web\app\layout.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.apps.web.app.layout.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\apps\web\app\layout.tsx'
source_file: 'layout.tsx'
source_sha256: 'b96ddc5c858a9de27b8dc9608af8fa51f99c94c6cd409860361ee1e6818b8cf1'
generated: true
---

# `layout.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\apps\web\app\layout.tsx`
> SHA-256: `b96ddc5c858a9de27b8dc9608af8fa51f99c94c6cd409860361ee1e6818b8cf1`

```tsx
import type { Metadata } from 'next';
import { Cinzel, Fira_Code, JetBrains_Mono, Oswald } from 'next/font/google';
import { SiteFooter } from '@/components/site-footer';
import { SiteHeader } from '@/components/site-header';
import './globals.css';

const heritageDisplay = Oswald({
  subsets: ['latin'],
  variable: '--font-big-shoulders-display',
});

const copperplateFallback = Cinzel({
  subsets: ['latin'],
  variable: '--font-copperplate-fallback',
});

const jetBrainsMono = JetBrains_Mono({
  subsets: ['latin'],
  variable: '--font-jetbrains-mono',
});

const firaCode = Fira_Code({
  subsets: ['latin'],
  variable: '--font-fira-code',
});

export const metadata: Metadata = {
  title: 'Hipster Stack™ — Constituted not Composable',
  description:
    'A deterministic application constitution system for production-minded TypeScript web applications.',
};

export default function RootLayout({
  children,
}: Readonly<{ children: React.ReactNode }>) {
  return (
    <html lang="en">
      <body
        className={`${heritageDisplay.variable} ${copperplateFallback.variable} ${jetBrainsMono.variable} ${firaCode.variable}`}
      >
        <SiteHeader />
        {children}
        <SiteFooter />
      </body>
    </html>
  );
}

```