---
title: 'The Maximal Template™ Domain Library\eslint.config.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\eslint.config.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.eslint.config.mjs'
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
source_path: 'The Maximal Template™ Domain Library\eslint.config.mjs'
source_file: 'eslint.config.mjs'
source_sha256: 'e3320df5471c021a5a235581016bf76e2afc43b1e59a9446ee3de6c4e7f13a63'
generated: true
---

# `eslint.config.mjs`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\eslint.config.mjs`
> SHA-256: `e3320df5471c021a5a235581016bf76e2afc43b1e59a9446ee3de6c4e7f13a63`

```javascript
import { defineConfig, globalIgnores } from "eslint/config";
import nextVitals from "eslint-config-next/core-web-vitals";
import nextTypeScript from "eslint-config-next/typescript";
import reactRefresh from "eslint-plugin-react-refresh";

export default defineConfig([
  ...nextVitals,
  ...nextTypeScript,
  { plugins: { "react-refresh": reactRefresh } },
  globalIgnores([".next/**", "generated/prisma/**"]),
]);

```