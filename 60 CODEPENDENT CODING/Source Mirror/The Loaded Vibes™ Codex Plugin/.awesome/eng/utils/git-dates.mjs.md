---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\utils\git-dates.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\utils\git-dates.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.eng.utils.git-dates.mjs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\eng\utils\git-dates.mjs'
source_file: 'git-dates.mjs'
source_sha256: 'e437628f55a4367ce4eac4ad18fa23ea4595efd5bbc66310079731d905eecdc9'
generated: true
---

# `git-dates.mjs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\eng\utils\git-dates.mjs`
> SHA-256: `e437628f55a4367ce4eac4ad18fa23ea4595efd5bbc66310079731d905eecdc9`

```javascript
#!/usr/bin/env node

/**
 * Utility to extract last modification dates from git history.
 * Uses a single git log command for efficiency.
 */

import { execSync } from "child_process";
import path from "path";

/**
 * Get the last modification date for all tracked files in specified directories.
 * Returns a Map of file path -> ISO date string.
 *
 * @param {string[]} directories - Array of directory paths to scan
 * @param {string} rootDir - Root directory for relative paths
 * @returns {Map<string, string>} Map of relative file path to ISO date string
 */
export function getGitFileDates(directories, rootDir) {
  const fileDates = new Map();

  try {
    // Get git log with file names for all specified directories
    // Format: ISO date, then file names that were modified in that commit
    const gitArgs = [
      "--no-pager",
      "log",
      "--format=%aI", // Author date in ISO 8601 format
      "--name-only",
      "--diff-filter=ACMR", // Added, Copied, Modified, Renamed
      "--",
      ...directories,
    ];

    const output = execSync(`git ${gitArgs.join(" ")}`, {
      encoding: "utf8",
      cwd: rootDir,
      stdio: ["pipe", "pipe", "pipe"],
    });

    // Parse the output: alternating date lines and file name lines
    // Format is:
    // 2026-01-15T10:30:00+00:00
    //
    // file1.md
    // file2.md
    //
    // 2026-01-14T09:00:00+00:00
    // ...

    let currentDate = null;
    const lines = output.split("\n");

    for (const line of lines) {
      const trimmed = line.trim();

      if (!trimmed) {
        continue;
      }

      // Check if this is a date line (ISO 8601 format)
      if (/^\d{4}-\d{2}-\d{2}T/.test(trimmed)) {
        currentDate = trimmed;
      } else if (currentDate && trimmed) {
        // This is a file path - only set if we haven't seen this file yet
        // (first occurrence is the most recent modification)
        if (!fileDates.has(trimmed)) {
          fileDates.set(trimmed, currentDate);
        }
      }
    }
  } catch (error) {
    // Git command failed - might not be a git repo or no history
    console.warn("Warning: Could not get git dates:", error.message);
  }

  return fileDates;
}

/**
 * Get the last modification date for a single file.
 *
 * @param {string} filePath - Path to the file (relative to git root)
 * @param {string} rootDir - Root directory
 * @returns {string|null} ISO date string or null if not found
 */
export function getGitFileDate(filePath, rootDir) {
  try {
    const output = execSync(
      `git --no-pager log -1 --format="%aI" -- "${filePath}"`,
      {
        encoding: "utf8",
        cwd: rootDir,
        stdio: ["pipe", "pipe", "pipe"],
      }
    );

    const date = output.trim();
    return date || null;
  } catch (error) {
    return null;
  }
}

```