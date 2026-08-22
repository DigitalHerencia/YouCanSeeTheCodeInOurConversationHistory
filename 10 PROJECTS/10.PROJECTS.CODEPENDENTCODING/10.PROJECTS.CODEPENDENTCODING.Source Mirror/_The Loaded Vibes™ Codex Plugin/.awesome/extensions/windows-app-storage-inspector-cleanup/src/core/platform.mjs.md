---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\core\platform.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\core\platform.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.extensions.windows-app-storage-inspector-cleanup.src.core.platform.mjs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\core\platform.mjs'
source_file: 'platform.mjs'
source_sha256: 'c5e498b45ba509cab30f26496fee9e586f19787a2a79a6d35258cf1229db4404'
generated: true
---

# `platform.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\core\platform.mjs`
> SHA-256: `c5e498b45ba509cab30f26496fee9e586f19787a2a79a6d35258cf1229db4404`

```javascript
export const WINDOWS_ONLY_MESSAGE = "Windows App Storage Inspector & Cleanup is only available on Windows.";

export function isWindowsPlatform(platform = process.platform) {
    return platform === "win32";
}

export function createWindowsOnlyError() {
    const error = new Error(WINDOWS_ONLY_MESSAGE);
    error.code = "windows_only";
    error.statusCode = 501;
    return error;
}

export function assertWindowsPlatform(platform = process.platform) {
    if (!isWindowsPlatform(platform)) {
        throw createWindowsOnlyError();
    }
}

```