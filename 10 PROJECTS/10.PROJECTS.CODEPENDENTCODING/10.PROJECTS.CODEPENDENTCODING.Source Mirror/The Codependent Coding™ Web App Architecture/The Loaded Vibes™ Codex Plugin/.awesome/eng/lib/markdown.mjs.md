---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\lib\markdown.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\lib\markdown.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.eng.lib.markdown.mjs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\lib\markdown.mjs'
source_file: 'markdown.mjs'
source_sha256: 'f00541a6aba7e3d645ee34aa85febb47f961f8c995269e54d10c076273e48e40'
generated: true
---

# `markdown.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\eng\lib\markdown.mjs`
> SHA-256: `f00541a6aba7e3d645ee34aa85febb47f961f8c995269e54d10c076273e48e40`

```javascript
export function inlineCode(value) {
  const collapsed = String(value).replace(/\s+/g, " ").trim();
  const content = collapsed.length > 80 ? `${collapsed.slice(0, 77)}...` : collapsed;
  const longestBacktickRun = Math.max(0, ...Array.from(content.matchAll(/`+/g), (match) => match[0].length));
  const fence = "`".repeat(longestBacktickRun + 1);
  const pad = content.length === 0 || content.startsWith("`") || content.endsWith("`") ? " " : "";

  // These values are rendered verbatim into Markdown bot comments; using a fence
  // longer than any backtick run in the content prevents closing the code span.
  return `${fence}${pad}${content}${pad}${fence}`;
}

```