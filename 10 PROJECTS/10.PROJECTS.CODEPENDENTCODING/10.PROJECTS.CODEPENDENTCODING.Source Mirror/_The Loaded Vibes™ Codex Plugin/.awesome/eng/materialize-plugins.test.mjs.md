---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\materialize-plugins.test.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\materialize-plugins.test.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.eng.materialize-plugins.test.mjs'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\materialize-plugins.test.mjs'
source_file: 'materialize-plugins.test.mjs'
source_sha256: '9e88a487106d559420b281189b36b7ee0e8a9e603e6a7ec9ce97739bcdc7639d'
generated: true
---

# `materialize-plugins.test.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\eng\materialize-plugins.test.mjs`
> SHA-256: `9e88a487106d559420b281189b36b7ee0e8a9e603e6a7ec9ce97739bcdc7639d`

```javascript
import assert from "node:assert/strict";
import { test } from "node:test";
import { materializePlugins } from "./materialize-plugins.mjs";
import { generateMarketplace } from "./generate-marketplace.mjs";

test("build scripts expose callable APIs without running on import", () => {
  assert.equal(typeof materializePlugins, "function");
  assert.equal(typeof generateMarketplace, "function");
});

```