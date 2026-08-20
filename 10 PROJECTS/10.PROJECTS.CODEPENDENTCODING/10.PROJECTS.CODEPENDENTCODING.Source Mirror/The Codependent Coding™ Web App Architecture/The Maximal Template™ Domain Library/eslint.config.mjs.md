---
title: 'The Hipster Stack™ Technology Stack\template\eslint.config.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\eslint.config.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.eslint.config.mjs'
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
source_path: 'The Hipster Stack™ Technology Stack\template\eslint.config.mjs'
source_file: 'eslint.config.mjs'
source_sha256: 'aa2ed55167ed5d62a5e0561565a5a59804dfc36c02c1fc34555c8d43c1b0254f'
generated: true
---

# `eslint.config.mjs`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\eslint.config.mjs`
> SHA-256: `aa2ed55167ed5d62a5e0561565a5a59804dfc36c02c1fc34555c8d43c1b0254f`

```javascript
import { defineConfig, globalIgnores } from "eslint/config"
import nextVitals from "eslint-config-next/core-web-vitals"
import nextTypescript from "eslint-config-next/typescript"
import prettier from "eslint-config-prettier/flat"
import reactPlugin from "eslint-plugin-react"

const disabledReactPluginRules = Object.fromEntries(
  Object.keys(reactPlugin.rules).map((ruleName) => [`react/${ruleName}`, "off"])
)

const eslintConfig = defineConfig([
  ...nextVitals,
  ...nextTypescript,

  {
    rules: disabledReactPluginRules,
  },

  prettier,

  globalIgnores(
    [
      ".next/**",
      "out/**",
      "build/**",
      "dist/**",
      "coverage/**",
      "playwright-report/**",
      "test-results/**",
      "node_modules/**",
      ".agents/**",
      "mock-pages/**",
      "prisma/generated/**",
      "next-env.d.ts",
      "*.config.js",
      "*.config.cjs",
    ],
    "next-stack-template global ignores"
  ),
])

export default eslintConfig

```