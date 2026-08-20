---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\pr-artifact-explorer\constants.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\pr-artifact-explorer\constants.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.extensions.pr-artifact-explorer.constants.mjs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\pr-artifact-explorer\constants.mjs'
source_file: 'constants.mjs'
source_sha256: 'c5c6eb9e1293e928715aa5b0cbf2d7880b2d2c3ffa49a4bbf79c8ae0afd20809'
generated: true
---

# `constants.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\extensions\pr-artifact-explorer\constants.mjs`
> SHA-256: `c5c6eb9e1293e928715aa5b0cbf2d7880b2d2c3ffa49a4bbf79c8ae0afd20809`

```javascript
import { homedir } from "node:os";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

export const EXTENSION_ROOT = dirname(fileURLToPath(import.meta.url));
export const ASSET_ROOT = join(EXTENSION_ROOT, "assets");

const copilotHome = process.env.COPILOT_HOME || join(homedir(), ".copilot");
export const DATA_ROOT = join(copilotHome, "extensions", "pr-artifact-explorer", "artifacts");
export const CACHE_ROOT = join(DATA_ROOT, "cache");
export const PREFS_FILE = join(DATA_ROOT, "preferences.json");

export const GITHUB_API = "https://api.github.com";
export const USER_AGENT = "github-copilot-pr-artifact-explorer";

// The indexer supports standard ZIP archives up to the ZIP32 boundary.
export const MAX_ARCHIVE_BYTES = (4 * 1024 * 1024 * 1024) - 2;
export const MIN_CACHE_FREE_BYTES = 512 * 1024 * 1024;
export const ARTIFACT_DOWNLOAD_IDLE_TIMEOUT_MS = 60_000;
export const MAX_CENTRAL_DIRECTORY_BYTES = 64 * 1024 * 1024;
export const MAX_ZIP_ENTRIES = 50_000;
export const MAX_INLINE_PREVIEW_BYTES = 4 * 1024 * 1024;
export const MAX_TRX_PREVIEW_BYTES = 32 * 1024 * 1024;
export const MAX_STREAMED_ENTRY_BYTES = 512 * 1024 * 1024;

```