---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\code-tour\references\codetour-schema.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\code-tour\references\codetour-schema.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.code-tour.references.codetour-schema.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\code-tour\references\codetour-schema.json'
source_file: 'codetour-schema.json'
source_sha256: 'fa5756f69978ea7b702c6ff3a93634394c41c54c32e9e5a18d7169d0c4dd321a'
generated: true
---

# `codetour-schema.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\code-tour\references\codetour-schema.json`
> SHA-256: `fa5756f69978ea7b702c6ff3a93634394c41c54c32e9e5a18d7169d0c4dd321a`

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "title": "Schema for CodeTour tour files",
  "type": "object",
  "required": ["title", "steps"],
  "properties": {
    "title": {
      "type": "string",
      "description": "Specifies the title of the code tour."
    },
    "description": {
      "type": "string",
      "description": "Specifies an optional description for the code tour."
    },
    "ref": {
      "type": "string",
      "description": "Indicates the git ref (branch/commit/tag) that this tour associate with."
    },
    "isPrimary": {
      "type": "boolean",
      "description": "Specifies whether the tour represents the primary tour for this codebase."
    },
    "nextTour": {
      "type": "string",
      "description": "Specifies the title of the tour that is meant to follow this tour."
    },
    "stepMarker": {
      "type": "string",
      "description": "Specifies the marker that indicates a line of code represents a step for this tour."
    },
    "when": {
      "type": "string",
      "description": "Specifies the condition (JavaScript expression) that must be met before this tour is shown."
    },
    "steps": {
      "type": "array",
      "description": "Specifies the list of steps that are included in the code tour.",
      "default": [],
      "items": {
        "type": "object",
        "required": ["description"],
        "properties": {
          "title": {
            "type": "string",
            "description": "An optional title for the step."
          },
          "description": {
            "type": "string",
            "description": "Description of the step. Supports markdown."
          },
          "file": {
            "type": "string",
            "description": "File path (relative to the workspace root) that the step is associated with."
          },
          "directory": {
            "type": "string",
            "description": "Directory path (relative to the workspace root) that the step is associated with."
          },
          "uri": {
            "type": "string",
            "description": "Absolute URI (https://...) associated with the step. Use for PRs, issues, docs, ADRs."
          },
          "line": {
            "type": "number",
            "description": "Line number (1-based) that the step is associated with."
          },
          "pattern": {
            "type": "string",
            "description": "Regex to associate the step with a line by content instead of line number. Useful when line numbers shift frequently."
          },
          "selection": {
            "type": "object",
            "required": ["start", "end"],
            "description": "Text selection range associated with the step. Use when a block of code (not a single line) is the point.",
            "properties": {
              "start": {
                "type": "object",
                "required": ["line", "character"],
                "properties": {
                  "line": { "type": "number", "description": "Line number (1-based) where the selection starts." },
                  "character": { "type": "number", "description": "Column number (1-based) where the selection starts." }
                }
              },
              "end": {
                "type": "object",
                "required": ["line", "character"],
                "properties": {
                  "line": { "type": "number", "description": "Line number (1-based) where the selection ends." },
                  "character": { "type": "number", "description": "Column number (1-based) where the selection ends." }
                }
              }
            }
          },
          "view": {
            "type": "string",
            "description": "VS Code view ID to auto-focus when navigating to this step (e.g. 'terminal', 'explorer', 'problems', 'scm')."
          },
          "commands": {
            "type": "array",
            "description": "VS Code command URIs to execute when this step is navigated to.",
            "default": [],
            "items": { "type": "string" },
            "examples": [
              ["editor.action.goToDeclaration"],
              ["workbench.action.terminal.focus"],
              ["editor.action.showHover"],
              ["references-view.findReferences"],
              ["workbench.action.tasks.runTask"]
            ]
          }
        }
      }
    }
  }
}

```