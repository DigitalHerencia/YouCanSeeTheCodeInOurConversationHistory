---
title: 'The Hipster Stack™ Technology Stack\package.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\package.json'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.package.json'
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
source_path: 'The Hipster Stack™ Technology Stack\package.json'
source_file: 'package.json'
source_sha256: '28117605a4f1c9fdeda87eab6163d6e9225b50207bdbdf2eb9dc91bafab25121'
generated: true
---

# `package.json`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\package.json`
> SHA-256: `28117605a4f1c9fdeda87eab6163d6e9225b50207bdbdf2eb9dc91bafab25121`

```json
{
  "name": "hipster-stack",
  "version": "0.1.0",
  "description": "Generate a complete white-label application from the Hipster Stack master template.",
  "type": "module",
  "license": "MIT",
  "repository": {
    "type": "git",
    "url": "git+https://github.com/DigitalHerencia/TheHipsterStack.git"
  },
  "bugs": {
    "url": "https://github.com/DigitalHerencia/TheHipsterStack/issues"
  },
  "homepage": "https://github.com/DigitalHerencia/TheHipsterStack#readme",
  "keywords": [
    "saas",
    "generator",
    "nextjs",
    "clerk",
    "prisma"
  ],
  "packageManager": "pnpm@11.1.1",
  "engines": {
    "node": "24.x"
  },
  "bin": {
    "hipster-stack": "dist/cli.mjs"
  },
  "files": [
    "dist",
    "template",
    "docs",
    "README.md",
    "LICENSE"
  ],
  "scripts": {
    "build": "tsdown",
    "dev": "tsx packages/cli/src/cli.ts",
    "format": "prettier --write apps packages tests scripts context docs .agents package.json tsconfig.json pnpm-workspace.yaml README.md SECURITY.md CONTRIBUTING.md eslint.config.mjs prettier.config.mjs tsdown.config.ts vitest.config.ts vercel.json",
    "format:check": "prettier --check apps packages tests scripts context docs .agents package.json tsconfig.json pnpm-workspace.yaml README.md SECURITY.md CONTRIBUTING.md eslint.config.mjs prettier.config.mjs tsdown.config.ts vitest.config.ts vercel.json",
    "lint": "eslint .",
    "typecheck": "tsc --noEmit",
    "test": "vitest run tests/unit tests/integration",
    "test:generated": "pnpm build && vitest run tests/generated",
    "pack:check": "rimraf .artifacts && node -e \"require('node:fs').mkdirSync('.artifacts')\" && pnpm build && pnpm pack --pack-destination .artifacts && node scripts/inspect-pack.mjs",
    "release:check": "pnpm pack:check && node scripts/smoke-packed-cli.mjs",
    "web:build": "pnpm --dir apps/web build",
    "validate": "pnpm format:check && pnpm lint && pnpm typecheck && pnpm test && pnpm test:generated && pnpm build && pnpm web:build"
  },
  "dependencies": {
    "@clack/prompts": "1.0.0-alpha.5",
    "commander": "14.0.3",
    "execa": "9.6.1",
    "validate-npm-package-name": "7.0.2",
    "zod": "4.4.3"
  },
  "devDependencies": {
    "@hipster-stack/core": "workspace:*",
    "@eslint/js": "10.0.1",
    "@types/node": "25.7.0",
    "@types/validate-npm-package-name": "4.0.2",
    "eslint": "10.3.0",
    "next": "16.2.6",
    "prettier": "3.8.3",
    "rimraf": "6.1.3",
    "tsdown": "0.21.6",
    "tsx": "4.21.0",
    "typescript": "6.0.3",
    "typescript-eslint": "8.57.1",
    "vitest": "4.1.6"
  },
  "publishConfig": {
    "access": "public"
  }
}

```