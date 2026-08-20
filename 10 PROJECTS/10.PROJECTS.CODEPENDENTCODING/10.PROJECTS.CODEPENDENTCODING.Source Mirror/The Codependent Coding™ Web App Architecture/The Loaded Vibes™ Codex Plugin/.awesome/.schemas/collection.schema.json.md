---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\.schemas\collection.schema.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\.schemas\collection.schema.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.schemas.collection.schema.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\.schemas\collection.schema.json'
source_file: 'collection.schema.json'
source_sha256: '61c06e825e9fcd6f4d2a7470ea92606a7f22e0cbde41707622d0ee8e558479eb'
generated: true
---

# `collection.schema.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\.schemas\collection.schema.json`
> SHA-256: `61c06e825e9fcd6f4d2a7470ea92606a7f22e0cbde41707622d0ee8e558479eb`

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "Collection Manifest",
  "description": "Schema for awesome-copilot collection manifest files",
  "type": "object",
  "required": ["id", "name", "description", "items"],
  "additionalProperties": false,
  "properties": {
    "id": {
      "type": "string",
      "description": "Unique identifier for the collection",
      "pattern": "^[a-z0-9-]+$",
      "minLength": 1,
      "maxLength": 50
    },
    "name": {
      "type": "string",
      "description": "Display name for the collection",
      "minLength": 1,
      "maxLength": 100
    },
    "description": {
      "type": "string",
      "description": "Description of what this collection contains",
      "minLength": 1,
      "maxLength": 500
    },
    "tags": {
      "type": "array",
      "description": "Optional tags for discovery",
      "items": {
        "type": "string",
        "pattern": "^[a-z0-9-]+$",
        "minLength": 1,
        "maxLength": 30
      },
      "uniqueItems": true,
      "maxItems": 10
    },
    "items": {
      "type": "array",
      "description": "List of items in this collection",
      "minItems": 1,
      "maxItems": 50,
      "items": {
        "type": "object",
        "required": ["path", "kind"],
        "additionalProperties": false,
        "properties": {
          "path": {
            "type": "string",
            "description": "Relative path from repository root to the item file",
            "pattern": "^(?:skills/[^/]+/SKILL\\.md|(prompts|instructions|agents)/[^/]+\\.(prompt|instructions|agent)\\.md)$",
            "minLength": 1
          },
          "kind": {
            "type": "string",
            "description": "Type of the item",
            "enum": ["prompt", "instruction", "agent", "skill"]
          },
          "usage": {
            "type": "string",
            "description": "Optional usage context for the item"
          }
        }
      },
      "uniqueItems": true
    },
    "display": {
      "type": "object",
      "description": "Optional display settings for the collection",
      "additionalProperties": false,
      "properties": {
        "ordering": {
          "type": "string",
          "description": "How to order items in the collection",
          "enum": ["manual", "alpha"],
          "default": "alpha"
        },
        "show_badge": {
          "type": "boolean",
          "description": "Whether to show collection badge on items",
          "default": false
        },
        "featured": {
          "type": "boolean",
          "description": "Whether this collection is featured on the main page",
          "default": false
        }
      }
    }
  }
}

```