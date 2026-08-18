---
title: 'The Loaded Vibes™ Codex Plugin\.notion\skills\webview-testing\scripts\webview\runFixtureTest.js'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\skills\webview-testing\scripts\webview\runFixtureTest.js'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.skills.webview-testing.scripts.webview.runfixturetest.js'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\skills\webview-testing\scripts\webview\runFixtureTest.js'
source_file: 'runFixtureTest.js'
source_sha256: 'bf80930af988d7963560501c0660e5fce87090905b2467d786cb4e7346cf933b'
generated: true
---

# `runFixtureTest.js`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\skills\webview-testing\scripts\webview\runFixtureTest.js`
> SHA-256: `bf80930af988d7963560501c0660e5fce87090905b2467d786cb4e7346cf933b`

```javascript
#!/usr/bin/env node
'use strict';
// Simple Playwright fixture runner (stub)
const { chromium } = require('playwright');
const fs = require('fs');
const argv = require('minimist')(process.argv.slice(2));
const fixture = argv.fixture || argv.f;
if (!fixture) {
  console.error('Usage: node runFixtureTest.js --fixture=path/to/fixture.html');
  process.exit(2);
}
(async () => {
  const browser = await chromium.launch();
  const page = await browser.newPage();
  await page.goto('file://' + require('path').resolve(fixture));
  // Basic smoke: check title
  const title = await page.title();
  console.log('Fixture title:', title);
  await browser.close();
})();

```