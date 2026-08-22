---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\.schemas\cookbook.schema.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\.schemas\cookbook.schema.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.schemas.cookbook.schema.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\.schemas\cookbook.schema.json'
source_file: 'cookbook.schema.json'
source_sha256: 'e3fcb437d76d8c22174abc0ff0bb6870b016588e76ebf8e2484ce1cbff4fdc1a'
generated: true
---

# `cookbook.schema.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\.schemas\cookbook.schema.json`
> SHA-256: `e3fcb437d76d8c22174abc0ff0bb6870b016588e76ebf8e2484ce1cbff4fdc1a`

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "Cookbook Manifest",
  "description": "Schema for cookbook.yml manifest defining cookbooks and recipes",
  "type": "object",
  "required": ["cookbooks"],
  "properties": {
    "cookbooks": {
      "type": "array",
      "description": "List of cookbooks",
      "items": {
        "type": "object",
        "required": ["id", "name", "description", "path", "languages", "recipes"],
        "properties": {
          "id": {
            "type": "string",
            "description": "Unique identifier for the cookbook",
            "pattern": "^[a-z0-9-]+$"
          },
          "name": {
            "type": "string",
            "description": "Display name for the cookbook"
          },
          "description": {
            "type": "string",
            "description": "Brief description of the cookbook"
          },
          "path": {
            "type": "string",
            "description": "Relative path to the cookbook folder"
          },
          "featured": {
            "type": "boolean",
            "description": "Whether this cookbook should be featured",
            "default": false
          },
          "languages": {
            "type": "array",
            "description": "Programming languages supported by this cookbook",
            "items": {
              "type": "object",
              "required": ["id", "name"],
              "properties": {
                "id": {
                  "type": "string",
                  "description": "Language identifier (folder name)",
                  "pattern": "^[a-z0-9-]+$"
                },
                "name": {
                  "type": "string",
                  "description": "Display name for the language"
                },
                "icon": {
                  "type": "string",
                  "description": "Emoji icon for the language"
                },
                "extension": {
                  "type": "string",
                  "description": "File extension for runnable examples",
                  "pattern": "^\\.[a-z]+$"
                }
              }
            }
          },
          "recipes": {
            "type": "array",
            "description": "List of recipes in this cookbook",
            "items": {
              "type": "object",
              "required": ["id", "name", "description"],
              "properties": {
                "id": {
                  "type": "string",
                  "description": "Recipe identifier (matches markdown filename without extension)",
                  "pattern": "^[a-z0-9-]+$"
                },
                "name": {
                  "type": "string",
                  "description": "Display name for the recipe"
                },
                "description": {
                  "type": "string",
                  "description": "Brief description of what the recipe covers"
                },
                "tags": {
                  "type": "array",
                  "description": "Tags for filtering and categorization",
                  "items": {
                    "type": "string"
                  }
                },
                "external": {
                  "type": "boolean",
                  "description": "Whether this recipe links to an external repository",
                  "default": false
                },
                "url": {
                  "type": "string",
                  "description": "URL to the external repository or project (required when external is true)",
                  "format": "uri"
                },
                "author": {
                  "type": "object",
                  "description": "Author information for external recipes",
                  "required": ["name"],
                  "properties": {
                    "name": {
                      "type": "string",
                      "description": "Author display name or GitHub username"
                    },
                    "url": {
                      "type": "string",
                      "description": "Author profile URL",
                      "format": "uri"
                    }
                  }
                }
              },
              "if": {
                "properties": { "external": { "const": true } },
                "required": ["external"]
              },
              "then": {
                "required": ["url"]
              }
            }
          }
        }
      }
    }
  }
}

```