---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\arch\README.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\arch\README.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.arch.readme.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\arch\README.md'
source_file: 'README.md'
source_sha256: 'ea8fcdc1f9ff27c6a77afaf2cff02dd753305b4710144458971348ecc41701bf'
generated: true
---

# `README.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\arch\README.md`
> SHA-256: `ea8fcdc1f9ff27c6a77afaf2cff02dd753305b4710144458971348ecc41701bf`

````markdown
# Arch Plugin

Architecture and modernization toolkit for locally-cloned repositories. It produces a single, cited architecture document from the code on disk, and generates a phased modernization plan that automatically runs Documentation mode first when no architecture document exists yet.

## Installation

```bash
copilot plugin install arch@awesome-copilot
```

## What's Included

### Skills

- **`doc-and-modernize`** — Two complementary workflows for a locally-cloned repository, in one skill (installed via this plugin it surfaces as `arch:doc-and-modernize`):
  - **Documentation mode** — Produce one comprehensive, verifiable architecture document for a repository you already have checked out locally. Works local-first (prefers the local checkout, treating remote/API lookups as a flagged last resort), cites every claim to a file + line, flags unverified facts, resolves contradictions, and deep-dives the most complex subsystems. Ideal for onboarding docs and system-design maps.
  - **Modernization mode** — Generate a phased modernization plan for a legacy codebase. If a current architecture document exists it builds on it; otherwise it first runs the Documentation mode workflow to produce one, then continues to the plan. Produces per-feature migration docs, tech-stack recommendations with ADRs, and an adaptive, safety-laddered phased implementation plan.

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot).

## License

MIT

````