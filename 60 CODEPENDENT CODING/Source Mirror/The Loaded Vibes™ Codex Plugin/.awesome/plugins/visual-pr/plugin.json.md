---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\visual-pr\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\visual-pr\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.visual-pr.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\visual-pr\plugin.json'
source_file: 'plugin.json'
source_sha256: 'c623cf67628380b5a53bb1903e5f43ed3c6cd20992470ee57d25ff4d078422b6'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\visual-pr\plugin.json`
> SHA-256: `c623cf67628380b5a53bb1903e5f43ed3c6cd20992470ee57d25ff4d078422b6`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "visual-pr",
  "description": "Capture, annotate, and embed screenshots and animated GIF demos in pull request descriptions. Includes Playwright-based UI capture, PIL image annotations, PR embedding workflows for GitHub and Azure DevOps, and screen recording with variable timing.",
  "version": "1.0.0",
  "keywords": [
    "screenshots",
    "pull-request",
    "before-after",
    "annotations",
    "playwright",
    "gif",
    "screen-recording",
    "visual"
  ],
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "extensions": {
    "com.github.awesome-copilot": {
      "skills": [
        "./skills/image-annotations/",
        "./skills/pr-screenshots/",
        "./skills/screen-recording/",
        "./skills/ui-screenshots/"
      ]
    }
  }
}

```