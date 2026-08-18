---
title: 'The Hipster Stack™ Technology Stack\template\prettier.config.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\prettier.config.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.prettier.config.mjs'
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
source_path: 'The Hipster Stack™ Technology Stack\template\prettier.config.mjs'
source_file: 'prettier.config.mjs'
source_sha256: '9a0e94d13dca8dd33448ffe826297394ea54efc01d8f0d1512ae0a5ddebafa95'
generated: true
---

# `prettier.config.mjs`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\prettier.config.mjs`
> SHA-256: `9a0e94d13dca8dd33448ffe826297394ea54efc01d8f0d1512ae0a5ddebafa95`

```javascript
/** @type {import("prettier").Config & import("prettier-plugin-tailwindcss").PluginOptions} */
const config = {
  semi: false,
  singleQuote: false,
  trailingComma: "es5",
  printWidth: 100,
  tabWidth: 2,
  useTabs: false,
  bracketSpacing: true,
  arrowParens: "always",
  endOfLine: "lf",

  plugins: ["prettier-plugin-tailwindcss"],

  tailwindStylesheet: "./app/globals.css",
  tailwindFunctions: ["cn", "cva", "clsx"],
}

export default config

```