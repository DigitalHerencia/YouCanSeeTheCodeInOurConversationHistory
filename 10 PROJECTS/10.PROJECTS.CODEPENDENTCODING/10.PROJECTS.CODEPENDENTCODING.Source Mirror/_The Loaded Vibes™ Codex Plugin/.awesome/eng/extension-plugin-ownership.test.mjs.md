---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\extension-plugin-ownership.test.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\extension-plugin-ownership.test.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.eng.extension-plugin-ownership.test.mjs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\extension-plugin-ownership.test.mjs'
source_file: 'extension-plugin-ownership.test.mjs'
source_sha256: '9446b4a6f71e7081783854c9aaef39ed08bc400a6aa747ec9ae0dbad49729d0d'
generated: true
---

# `extension-plugin-ownership.test.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\eng\extension-plugin-ownership.test.mjs`
> SHA-256: `9446b4a6f71e7081783854c9aaef39ed08bc400a6aa747ec9ae0dbad49729d0d`

```javascript
import assert from "node:assert/strict";
import { test } from "node:test";
import {
  buildExtensionPluginOwners,
  resolveExtensionPluginName,
} from "./extension-plugin-ownership.mjs";

const namespace = "com.github.awesome-copilot";

test("resolves an extension bundled only by its parent plugin", () => {
  const owners = buildExtensionPluginOwners([
    {
      directoryName: "ember",
      manifest: {
        name: "ember",
        extensions: {
          [namespace]: {
            extensions: ["./extensions/daily-focus-board"],
          },
        },
      },
    },
  ]);

  assert.equal(
    resolveExtensionPluginName("daily-focus-board", owners),
    "ember"
  );
});

test("prefers a same-named standalone plugin over another owner", () => {
  const owners = buildExtensionPluginOwners([
    {
      directoryName: "parent-plugin",
      manifest: {
        name: "parent-plugin",
        extensions: {
          [namespace]: {
            extensions: ["./extensions/daily-focus-board/"],
          },
        },
      },
    },
    {
      directoryName: "daily-focus-board",
      manifest: { name: "daily-focus-board" },
    },
  ]);

  assert.equal(
    resolveExtensionPluginName("daily-focus-board", owners),
    "daily-focus-board"
  );
});

test("preserves the extension name when no plugin owns it", () => {
  assert.equal(
    resolveExtensionPluginName("daily-focus-board", new Map()),
    "daily-focus-board"
  );
});

```