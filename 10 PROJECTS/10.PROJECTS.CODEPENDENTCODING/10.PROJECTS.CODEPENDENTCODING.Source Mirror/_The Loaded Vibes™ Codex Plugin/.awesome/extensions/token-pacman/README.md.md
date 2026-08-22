---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\token-pacman\README.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\token-pacman\README.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.extensions.token-pacman.readme.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\token-pacman\README.md'
source_file: 'README.md'
source_sha256: '14a92f81eaac76a0054c61c872c98c13cde36419e41effedab058bfc1ce4a2d2'
generated: true
---

# `README.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\extensions\token-pacman\README.md`
> SHA-256: `14a92f81eaac76a0054c61c872c98c13cde36419e41effedab058bfc1ce4a2d2`

````markdown
# Token Pac-Man

A GitHub Copilot canvas that visualizes live session AI-credit usage as a Pac-Man board. Pac-Man eats pellets as credits are consumed, ghosts chase him, fruit milestones appear, and the game ends when the configured session credit limit is exceeded.

## Files

- `extension.mjs` - canvas declaration, loopback server, live usage/quota syncing, and agent actions.
- `assets/preview.png` - gallery preview image required by the Awesome Copilot canvas catalog.
- `assets/token-pacman.jpg` - source screenshot included for the gallery.
- `copilot-extension.json` - Copilot extension name/version metadata for gist installs.
- `canvas.json` - Awesome Copilot gallery metadata.
- `package.json` - extension metadata used by the generated website catalog.

## Install

Ask Copilot to install the committed extension URL:

```text
Install this extension: https://github.com/github/awesome-copilot/tree/main/extensions/token-pacman
```

The shared gist version is also available at:

```text
https://gist.github.com/jamesmontemagno/75d701d25f49c94ba332529fb8ec1346
```

## Agent actions

- `sync_usage` - refresh the canvas from the active session's accumulated AI-credit usage and plan entitlement.
- `set_limit { limit }` - set the AI-credit limit that triggers game over and resync the pellet board.
- `reset_run` - clear the visible fruit streak and start a fresh chase without changing the live session credit total.

````