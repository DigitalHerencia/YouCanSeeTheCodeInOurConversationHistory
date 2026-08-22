---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\analyzers\npm-cache.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\analyzers\npm-cache.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.extensions.windows-app-storage-inspector-cleanup.src.analyzers.npm-cache.mjs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\analyzers\npm-cache.mjs'
source_file: 'npm-cache.mjs'
source_sha256: '586b8c5bfe8a2fb76c5ef5d35a8b5a78352fb1e86fabfbd53ee264f3cdd7c622'
generated: true
---

# `npm-cache.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\extensions\windows-app-storage-inspector-cleanup\src\analyzers\npm-cache.mjs`
> SHA-256: `586b8c5bfe8a2fb76c5ef5d35a8b5a78352fb1e86fabfbd53ee264f3cdd7c622`

```javascript
import { execFile } from "node:child_process";
import { stat } from "node:fs/promises";
import path from "node:path";
import { promisify } from "node:util";
import { getAnalyzerCommands } from "../core/analyzer-commands.mjs";

const execFileAsync = promisify(execFile);
const NPM_CLI_TIMEOUT_MS = 10_000;

function normalize(filePath) {
    return path.resolve(filePath).replaceAll("/", "\\").toLowerCase();
}

function isWithin(candidatePath, parentPath) {
    const relative = path.relative(path.resolve(parentPath), path.resolve(candidatePath));
    return relative === "" || (relative !== ".." && !relative.startsWith(`..${path.sep}`) && !path.isAbsolute(relative));
}

function getDirectoryAggregate(result, directoryPath) {
    const normalizedPath = normalize(directoryPath);
    return result.directories.find((directory) => normalize(directory.path) === normalizedPath);
}

async function getConfiguredCachePath() {
    const localAppData = process.env.LOCALAPPDATA ?? path.join(process.env.USERPROFILE ?? "", "AppData", "Local");
    const defaultPath = path.resolve(localAppData, "npm-cache");
    try {
        const { stdout } = await execFileAsync("npm.cmd", ["config", "get", "cache"], {
            windowsHide: true,
            timeout: NPM_CLI_TIMEOUT_MS,
            maxBuffer: 1024 * 1024,
        });
        const configuredPath = stdout.trim();
        if (!configuredPath || configuredPath === "undefined") {
            throw new Error("npm did not return a cache path");
        }
        return { path: path.resolve(configuredPath), source: "npm config" };
    } catch (error) {
        return {
            path: defaultPath,
            source: "Windows default",
            error: error.code === "ENOENT"
                ? "npm was not found, so the standard Windows npm cache location was checked instead."
                : `npm cache configuration could not be read: ${error.message}`,
        };
    }
}

export async function discoverNpmCachePath() {
    return getConfiguredCachePath();
}

async function describeCache(result, cachePath) {
    try {
        const cacheStats = await stat(cachePath);
        if (!cacheStats.isDirectory()) {
            return undefined;
        }
        const aggregate = getDirectoryAggregate(result, cachePath);
        return {
            id: "npm-cache",
            name: "npm cache",
            path: cachePath,
            bytes: aggregate?.bytes ?? 0,
            files: aggregate?.files ?? 0,
            modifiedAt: cacheStats.mtime.toISOString(),
        };
    } catch (error) {
        if (error?.code === "ENOENT") {
            return undefined;
        }
        throw error;
    }
}

export async function analyzeNpmCache(result) {
    const configuredCache = await getConfiguredCachePath();
    const location = await describeCache(result, configuredCache.path);
    const topFiles = location
        ? result.largestFiles
            .filter((file) => isWithin(file.path, location.path))
            .sort((left, right) => right.bytes - left.bytes)
            .slice(0, 20)
        : [];

    return {
        id: "npm-cache",
        status: location ? "available" : "not-found",
        location,
        configuredPath: configuredCache.path,
        configurationSource: configuredCache.source,
        configurationError: configuredCache.error,
        topFiles,
        totalBytes: location?.bytes ?? 0,
        cleanupItems: [],
        cleanupCommands: getAnalyzerCommands("npm-cache"),
        message: location
            ? "npm owns this opaque cache. Verify it first; clear it only when you need to reclaim disk space."
            : "The configured npm cache folder was not found. npm creates it as packages are installed.",
        warning: "Do not delete files inside _cacache manually. npm verifies cache integrity on use and can rebuild the cache when packages are installed again.",
    };
}

```