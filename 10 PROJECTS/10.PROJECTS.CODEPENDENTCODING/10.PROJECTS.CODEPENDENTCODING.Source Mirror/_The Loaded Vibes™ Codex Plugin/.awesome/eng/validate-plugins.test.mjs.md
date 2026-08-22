---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\validate-plugins.test.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\validate-plugins.test.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.eng.validate-plugins.test.mjs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\validate-plugins.test.mjs'
source_file: 'validate-plugins.test.mjs'
source_sha256: '96db9855333754fed3b4cf2596f89e26a7495d22ce96b9b4314545d8f22849c0'
generated: true
---

# `validate-plugins.test.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\eng\validate-plugins.test.mjs`
> SHA-256: `96db9855333754fed3b4cf2596f89e26a7495d22ce96b9b4314545d8f22849c0`

```javascript
import assert from "node:assert/strict";
import { test } from "node:test";
import { isReusableExtensionRegistered } from "./validate-plugins.mjs";

test("accepts a reusable extension bundled only by a parent plugin", () => {
  assert.equal(
    isReusableExtensionRegistered(
      "daily-focus-board",
      new Set(["ember"]),
      new Set(["daily-focus-board"])
    ),
    true
  );
});

test("accepts a same-named standalone extension plugin", () => {
  assert.equal(
    isReusableExtensionRegistered(
      "daily-focus-board",
      new Set(["daily-focus-board"]),
      new Set()
    ),
    true
  );
});

test("rejects an orphaned reusable extension", () => {
  assert.equal(
    isReusableExtensionRegistered(
      "daily-focus-board",
      new Set(["ember"]),
      new Set()
    ),
    false
  );
});

```