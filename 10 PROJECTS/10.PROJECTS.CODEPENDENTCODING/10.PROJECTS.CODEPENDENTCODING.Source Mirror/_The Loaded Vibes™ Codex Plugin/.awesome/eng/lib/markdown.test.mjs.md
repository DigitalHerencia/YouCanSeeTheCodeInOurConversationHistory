---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\lib\markdown.test.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\lib\markdown.test.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.eng.lib.markdown.test.mjs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\lib\markdown.test.mjs'
source_file: 'markdown.test.mjs'
source_sha256: '13dd1b6e86d59bacc3bd50d1b042fbb50dff971cc31697c8b4ef9670f1a378f9'
generated: true
---

# `markdown.test.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\eng\lib\markdown.test.mjs`
> SHA-256: `13dd1b6e86d59bacc3bd50d1b042fbb50dff971cc31697c8b4ef9670f1a378f9`

````javascript
import assert from "node:assert/strict";
import { test } from "node:test";
import { inlineCode } from "./markdown.mjs";

test("inlineCode wraps plain values in a single-backtick code span", () => {
  assert.equal(inlineCode("plain value"), "`plain value`");
});

test("inlineCode uses a fence longer than the longest backtick run", () => {
  assert.equal(inlineCode("a `` b"), "```a `` b```");
});

test("inlineCode pads values starting or ending with a backtick", () => {
  assert.equal(inlineCode("`leading"), "`` `leading ``");
  assert.equal(inlineCode("trailing`"), "`` trailing` ``");
});

test("inlineCode collapses whitespace and pads empty values", () => {
  assert.equal(inlineCode("a\n\t b"), "`a b`");
  assert.equal(inlineCode(" \n\t "), "`  `");
});

test("inlineCode truncates values to 80 characters", () => {
  assert.equal(inlineCode("x".repeat(81)), `\`${"x".repeat(77)}...\``);
});

````