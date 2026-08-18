---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\webapp-testing\assets\test-helper.js'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\webapp-testing\assets\test-helper.js'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.webapp-testing.assets.test-helper.js'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\webapp-testing\assets\test-helper.js'
source_file: 'test-helper.js'
source_sha256: '4a9b5c0f27cfe63ad5b4c781d4c96d7149870d8ac3d5ef32fd51b0f90f78766f'
generated: true
---

# `test-helper.js`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\webapp-testing\assets\test-helper.js`
> SHA-256: `4a9b5c0f27cfe63ad5b4c781d4c96d7149870d8ac3d5ef32fd51b0f90f78766f`

```javascript
/**
 * Helper utilities for web application testing with Playwright
 */

/**
 * Wait for a condition to be true with timeout
 * @param {Function} condition - Function that returns boolean
 * @param {number} timeout - Timeout in milliseconds
 * @param {number} interval - Check interval in milliseconds
 */
async function waitForCondition(condition, timeout = 5000, interval = 100) {
  const startTime = Date.now();
  while (Date.now() - startTime < timeout) {
    if (await condition()) {
      return true;
    }
    await new Promise(resolve => setTimeout(resolve, interval));
  }
  throw new Error('Condition not met within timeout');
}

/**
 * Capture browser console logs
 * @param {Page} page - Playwright page object
 * @returns {Array} Array of console messages
 */
function captureConsoleLogs(page) {
  const logs = [];
  page.on('console', msg => {
    logs.push({
      type: msg.type(),
      text: msg.text(),
      timestamp: new Date().toISOString()
    });
  });
  return logs;
}

/**
 * Take screenshot with automatic naming
 * @param {Page} page - Playwright page object
 * @param {string} name - Base name for screenshot
 */
async function captureScreenshot(page, name) {
  const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
  const filename = `${name}-${timestamp}.png`;
  await page.screenshot({ path: filename, fullPage: true });
  console.log(`Screenshot saved: ${filename}`);
  return filename;
}

module.exports = {
  waitForCondition,
  captureConsoleLogs,
  captureScreenshot
};

```