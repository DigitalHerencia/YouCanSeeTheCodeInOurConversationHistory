---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\repo-actions-hub\README.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\repo-actions-hub\README.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.extensions.repo-actions-hub.readme.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\extensions\repo-actions-hub\README.md'
source_file: 'README.md'
source_sha256: '24a42ce9063996b8d0fd89dfe14aab904b7f74dbf608725599912ceaee26d2c1'
generated: true
---

# `README.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\extensions\repo-actions-hub\README.md`
> SHA-256: `24a42ce9063996b8d0fd89dfe14aab904b7f74dbf608725599912ceaee26d2c1`

````markdown
# Repo Actions Hub

A GitHub Copilot canvas for browsing repository GitHub Actions workflows, reviewing recent runs, opening rich workflow/run details in a modal, and triggering manual `workflow_dispatch` runs.

## Files

- `extension.mjs` - canvas server, GitHub Actions data loading, modal details UI, and workflow run actions.
- `assets/preview.png` - gallery preview image for the extension catalog.
- `copilot-extension.json` - Copilot extension name/version metadata.
- `package.json` - extension metadata for cataloging and packaging.
- `.github/plugin/plugin.json` - plugin metadata used by the extension marketplace and website.

## Install

Ask Copilot to install the committed extension URL:

```text
Install this extension: https://github.com/github/awesome-copilot/tree/main/extensions/repo-actions-hub
```

You can also copy the folder into one of these locations:

- `~/.copilot/extensions/repo-actions-hub/` - user scope
- `.github/extensions/repo-actions-hub/` - project scope

Reload extensions in the app, then open the `repo-actions-hub` canvas.

## Agent actions

- `get_state` - return the current workflow and recent-run state for the active repository.
- `refresh` - reload workflows and recent runs from GitHub Actions.
- `get_workflow_details { workflowId }` - inspect a workflow, its dispatch support, inputs, YAML, and recent runs.
- `run_workflow { workflowId, ref?, inputs? }` - trigger a `workflow_dispatch` run for a workflow.

````