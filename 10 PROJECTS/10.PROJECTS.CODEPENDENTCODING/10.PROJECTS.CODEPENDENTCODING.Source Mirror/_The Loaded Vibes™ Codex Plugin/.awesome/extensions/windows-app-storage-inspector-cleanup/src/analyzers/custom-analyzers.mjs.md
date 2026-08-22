---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\analyzers\custom-analyzers.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\analyzers\custom-analyzers.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.extensions.windows-app-storage-inspector-cleanup.src.analyzers.custom-analyzers.mjs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\analyzers\custom-analyzers.mjs'
source_file: 'custom-analyzers.mjs'
source_sha256: '5d4c55330eedd54580aa632e03bf9d2518b832ffef8a20a6cce59ecfd3e1e586'
generated: true
---

# `custom-analyzers.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\analyzers\custom-analyzers.mjs`
> SHA-256: `5d4c55330eedd54580aa632e03bf9d2518b832ffef8a20a6cce59ecfd3e1e586`

```javascript
import { analyzeDockerImages } from "./docker-images.mjs";
import { analyzeMicrosoftScout } from "./microsoft-scout.mjs";
import { analyzeNpmCache, discoverNpmCachePath } from "./npm-cache.mjs";
import { analyzeUvCache, discoverUvCachePaths } from "./uv-cache.mjs";
import { analyzeVsCodeInsiders } from "./vscode-insiders.mjs";

export const CUSTOM_ANALYZERS = [
    {
        id: "vscode-insiders",
        name: "VS Code Insiders",
        description: "Inspect accumulated application versions and identify inactive installations.",
        analyze: analyzeVsCodeInsiders,
    },
    {
        id: "microsoft-scout",
        name: "Microsoft Scout",
        description: "Separate installed application files from user data and regenerable caches.",
        analyze: analyzeMicrosoftScout,
    },
    {
        id: "docker-images",
        name: "Docker images",
        description: "Inspect Docker image usage and managed storage without directly deleting Docker data files.",
        analyze: analyzeDockerImages,
    },
    {
        id: "npm-cache",
        name: "npm cache",
        description: "Inspect npm-managed package cache storage and use supported npm maintenance commands.",
        analyze: analyzeNpmCache,
    },
    {
        id: "uv-cache",
        name: "uv cache",
        description: "Inspect uv-managed Python package cache storage and use supported uv cache commands.",
        analyze: analyzeUvCache,
    },
];

export function listCustomAnalyzers() {
    return CUSTOM_ANALYZERS.map(({ id, name, description }) => ({ id, name, description }));
}

export async function discoverAnalyzerManagedPaths() {
    const [npmCache, uvPaths] = await Promise.all([
        discoverNpmCachePath(),
        discoverUvCachePaths(),
    ]);
    return [
        {
            path: npmCache.path,
            analyzerId: "npm-cache",
            name: "npm cache",
            description: "npm-managed package cache. Use npm cache commands instead of direct file cleanup.",
        },
        ...uvPaths.map((uvPath) => ({
            path: uvPath,
            analyzerId: "uv-cache",
            name: "uv cache",
            description: "uv-managed Python package cache. Use uv cache commands instead of direct file cleanup.",
        })),
    ];
}

export async function runCustomAnalyzer(id, result) {
    const analyzer = CUSTOM_ANALYZERS.find((item) => item.id === id);
    if (!analyzer) {
        const error = new Error(`Unknown custom analyzer: ${id}`);
        error.code = "analyzer_unknown";
        throw error;
    }
    const analysis = await analyzer.analyze(result);
    return { ...analysis, id: analyzer.id, name: analyzer.name };
}

```