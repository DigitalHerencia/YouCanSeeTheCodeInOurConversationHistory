---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\release-notes-showcase\extension.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\release-notes-showcase\extension.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.extensions.release-notes-showcase.extension.mjs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\release-notes-showcase\extension.mjs'
source_file: 'extension.mjs'
source_sha256: '8eb88336e023190083c7ee67ffcea3dd5c45dd9b4d0869c97d8d7e48a0f5fefd'
generated: true
---

# `extension.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\extensions\release-notes-showcase\extension.mjs`
> SHA-256: `8eb88336e023190083c7ee67ffcea3dd5c45dd9b4d0869c97d8d7e48a0f5fefd`

```javascript
import { joinSession } from "@github/copilot-sdk/extension";

import { releaseNotesShowcaseCanvas } from "./releaseNotesShowcase.mjs";

await joinSession({
    canvases: [releaseNotesShowcaseCanvas],
});

```