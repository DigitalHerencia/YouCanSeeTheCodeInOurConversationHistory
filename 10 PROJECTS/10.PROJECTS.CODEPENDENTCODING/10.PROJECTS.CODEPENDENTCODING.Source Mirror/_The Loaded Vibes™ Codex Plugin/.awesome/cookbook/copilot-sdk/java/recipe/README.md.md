---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\README.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\README.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.java.recipe.readme.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\README.md'
source_file: 'README.md'
source_sha256: '2ddc26b00d67466a836f3c815d85d84759cd855dcc498c7cbd844d41a06589cd'
generated: true
---

# `README.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\README.md`
> SHA-256: `2ddc26b00d67466a836f3c815d85d84759cd855dcc498c7cbd844d41a06589cd`

````markdown
# Runnable Recipe Examples

This folder contains standalone, executable Java examples for each cookbook recipe. Each file can be run directly with [JBang](https://www.jbang.dev/) — no project setup required.

## Prerequisites

- Java 17 or later
- JBang installed:

```bash
# macOS (using Homebrew)
brew install jbangdev/tap/jbang

# Linux/macOS (using curl)
curl -Ls https://sh.jbang.dev | bash -s - app setup

# Windows (using Scoop)
scoop install jbang
```

For other installation methods, see the [JBang installation guide](https://www.jbang.dev/download/).

## Running Examples

Each `.java` file is a complete, runnable program. Simply use:

```bash
jbang <FileName>.java
```

### Available Recipes

| Recipe               | Command                              | Description                                |
| -------------------- | ------------------------------------ | ------------------------------------------ |
| Error Handling       | `jbang ErrorHandling.java`           | Demonstrates error handling patterns       |
| Multiple Sessions    | `jbang MultipleSessions.java`        | Manages multiple independent conversations |
| Managing Local Files | `jbang ManagingLocalFiles.java`      | Organizes files using AI grouping          |
| PR Visualization     | `jbang PRVisualization.java`         | Generates PR age charts                    |
| Persisting Sessions  | `jbang PersistingSessions.java`      | Save and resume sessions across restarts   |
| Ralph Loop           | `jbang RalphLoop.java`              | Autonomous AI task loop                    |
| Accessibility Report | `jbang AccessibilityReport.java`     | WCAG accessibility report generator        |

### Examples with Arguments

**PR Visualization with specific repo:**

```bash
jbang PRVisualization.java github/copilot-sdk
```

**Managing Local Files with specific folder:**

```bash
jbang ManagingLocalFiles.java /path/to/your/folder
```

**Ralph Loop with a custom prompt file:**

```bash
jbang RalphLoop.java PROMPT_build.md 20
```

## Why JBang?

JBang lets you run Java files as scripts — no `pom.xml`, no `build.gradle`, no project scaffolding. Dependencies are declared inline with `//DEPS` comments and resolved automatically.

## Learning Resources

- [JBang Documentation](https://www.jbang.dev/documentation/guide/latest/)
- [GitHub Copilot SDK for Java](https://github.com/github/copilot-sdk-java)
- [Parent Cookbook](../README.md)

````