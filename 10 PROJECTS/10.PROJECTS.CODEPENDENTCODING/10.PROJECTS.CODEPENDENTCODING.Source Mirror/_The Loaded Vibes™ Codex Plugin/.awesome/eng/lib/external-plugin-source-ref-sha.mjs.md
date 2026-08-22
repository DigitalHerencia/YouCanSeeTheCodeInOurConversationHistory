---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\lib\external-plugin-source-ref-sha.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\lib\external-plugin-source-ref-sha.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.eng.lib.external-plugin-source-ref-sha.mjs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\lib\external-plugin-source-ref-sha.mjs'
source_file: 'external-plugin-source-ref-sha.mjs'
source_sha256: '0a6cbd56fe927abfe7a77562d56f2d98783975ab50a63f143270079aec68bd3c'
generated: true
---

# `external-plugin-source-ref-sha.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\eng\lib\external-plugin-source-ref-sha.mjs`
> SHA-256: `0a6cbd56fe927abfe7a77562d56f2d98783975ab50a63f143270079aec68bd3c`

```javascript
export function normalizeCommitSha(value) {
  if (typeof value !== "string") {
    return undefined;
  }

  const normalized = value.trim().toLowerCase();
  return /^[0-9a-f]{40}$/.test(normalized) ? normalized : undefined;
}

export function evaluateRefShaConsistency({ ref, sha, resolvedRefCommitSha }) {
  const normalizedSha = normalizeCommitSha(sha);
  const normalizedRefCommitSha = normalizeCommitSha(resolvedRefCommitSha);

  if (!normalizedSha || !normalizedRefCommitSha) {
    return {
      comparable: false,
      matches: true,
      normalizedSha,
      normalizedRefCommitSha,
    };
  }

  return {
    comparable: true,
    matches: normalizedSha === normalizedRefCommitSha,
    normalizedSha,
    normalizedRefCommitSha,
    ref: typeof ref === "string" ? ref.trim() : "",
    sha: typeof sha === "string" ? sha.trim() : "",
  };
}

```