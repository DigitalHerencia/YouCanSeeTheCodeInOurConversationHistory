---
title: 'The Hipster Stack™ Technology Stack\template\next.config.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\next.config.ts'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.next.config.ts'
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
source_path: 'The Hipster Stack™ Technology Stack\template\next.config.ts'
source_file: 'next.config.ts'
source_sha256: 'cf83c285140255245f314d22ce69a4e84a1f5bebe7a893125af0e08a61111c1c'
generated: true
---

# `next.config.ts`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\next.config.ts`
> SHA-256: `cf83c285140255245f314d22ce69a4e84a1f5bebe7a893125af0e08a61111c1c`

```ts
import type { NextConfig } from "next"

const securityHeaders = [
  {
    key: "X-DNS-Prefetch-Control",
    value: "on",
  },
  {
    key: "X-Frame-Options",
    value: "DENY",
  },
  {
    key: "X-Content-Type-Options",
    value: "nosniff",
  },
  {
    key: "Referrer-Policy",
    value: "strict-origin-when-cross-origin",
  },
]

const nextConfig: NextConfig = {
  typedRoutes: true,
  reactCompiler: true,
  poweredByHeader: false,
  compress: true,
  allowedDevOrigins: ["127.0.0.1", "localhost"],

  typescript: {
    ignoreBuildErrors: false,
    tsconfigPath: "tsconfig.json",
  },

  images: {
    localPatterns: [
      {
        pathname: "/**",
        search: "",
      },
    ],
    remotePatterns: [],
  },

  async headers() {
    return [
      {
        source: "/:path*",
        headers: securityHeaders,
      },
    ]
  },
}

export default nextConfig

```