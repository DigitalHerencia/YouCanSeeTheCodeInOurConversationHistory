---
title: 'The Hipster Stack™ Technology Stack\template\content\navigation.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\content\navigation.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.content.navigation.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\content\navigation.ts'
source_file: 'navigation.ts'
source_sha256: 'f551730da69e217f792831128d778d97e6a41d16d8ed7fd5d45258df15d23839'
generated: true
---

# `navigation.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\content\navigation.ts`
> SHA-256: `f551730da69e217f792831128d778d97e6a41d16d8ed7fd5d45258df15d23839`

```ts
import { loadedVibesCapabilities } from '@/content/loadedvibes';

export const publicNavigation = [
  ...(loadedVibesCapabilities.marketing
    ? [
        { href: '/pricing', label: 'Pricing' },
        { href: '/faq', label: 'FAQ' },
      ]
    : []),
  { href: '/contact', label: 'Contact' },
] as const;

export const applicationNavigation = [
  { href: '/dashboard', label: 'Dashboard' },
  ...(loadedVibesCapabilities.sampleDomain
    ? [{ href: '/projects', label: 'Projects' }]
    : []),
  ...(loadedVibesCapabilities.invitations
    ? [{ href: '/team', label: 'Team' }]
    : []),
  ...(loadedVibesCapabilities.uploads
    ? [{ href: '/uploads', label: 'Media' }]
    : []),
  ...(loadedVibesCapabilities.maps ? [{ href: '/maps', label: 'Maps' }] : []),
  ...(loadedVibesCapabilities.ai ? [{ href: '/ai', label: 'AI' }] : []),
  { href: '/settings', label: 'Settings' },
] as const;

```