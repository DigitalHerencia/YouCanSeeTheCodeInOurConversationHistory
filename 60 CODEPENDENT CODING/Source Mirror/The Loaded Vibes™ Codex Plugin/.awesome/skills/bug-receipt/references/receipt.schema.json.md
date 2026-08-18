---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\bug-receipt\references\receipt.schema.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\bug-receipt\references\receipt.schema.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.bug-receipt.references.receipt.schema.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\bug-receipt\references\receipt.schema.json'
source_file: 'receipt.schema.json'
source_sha256: 'd1ddbe5ddbeb380992ec8e15406254a598a9bffa44aa96d6f5d7be83bedd12b6'
generated: true
---

# `receipt.schema.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\bug-receipt\references\receipt.schema.json`
> SHA-256: `d1ddbe5ddbeb380992ec8e15406254a598a9bffa44aa96d6f5d7be83bedd12b6`

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "https://lmysticl.github.io/bug-receipt/receipt.schema.json",
  "title": "Bug Receipt",
  "description": "A machine-readable evidence receipt for a software bug fix.",
  "type": "object",
  "additionalProperties": false,
  "required": ["version", "status", "problem", "baseline", "rootCause", "changes", "verification", "gaps"],
  "properties": {
    "version": { "enum": [1, 2] },
    "status": { "enum": ["verified", "partial", "blocked"] },
    "evidenceSource": { "enum": ["executed-now", "supplied", "mixed"] },
    "problem": { "$ref": "#/$defs/nonEmptyString" },
    "baseline": {
      "type": "object",
      "additionalProperties": false,
      "required": ["command", "result", "evidence"],
      "properties": {
        "command": { "$ref": "#/$defs/nonEmptyString" },
        "result": { "enum": ["failed", "observed", "not-run"] },
        "evidence": { "$ref": "#/$defs/nonEmptyString" }
      }
    },
    "rootCause": {
      "type": "object",
      "additionalProperties": false,
      "required": ["summary", "evidence"],
      "properties": {
        "summary": { "$ref": "#/$defs/nonEmptyString" },
        "evidence": {
          "type": "array",
          "items": {
            "type": "object",
            "additionalProperties": false,
            "required": ["location", "observation"],
            "properties": {
              "location": { "$ref": "#/$defs/nonEmptyString" },
              "observation": { "$ref": "#/$defs/nonEmptyString" }
            }
          }
        }
      }
    },
    "changes": {
      "type": "array",
      "items": {
        "type": "object",
        "additionalProperties": false,
        "required": ["file", "summary"],
        "properties": {
          "file": { "$ref": "#/$defs/nonEmptyString" },
          "summary": { "$ref": "#/$defs/nonEmptyString" }
        }
      }
    },
    "verification": {
      "type": "array",
      "items": {
        "type": "object",
        "additionalProperties": false,
        "required": ["command", "result", "evidence"],
        "properties": {
          "command": { "$ref": "#/$defs/nonEmptyString" },
          "result": { "enum": ["passed", "failed", "not-run"] },
          "evidence": { "$ref": "#/$defs/nonEmptyString" }
        }
      }
    },
    "gaps": { "type": "array", "items": { "$ref": "#/$defs/nonEmptyString" } }
  },
  "$defs": {
    "nonEmptyString": { "type": "string", "minLength": 1, "pattern": "\\S" }
  },
  "allOf": [
    {
      "if": { "properties": { "version": { "const": 2 } }, "required": ["version"] },
      "then": {
        "properties": { "evidenceSource": { "enum": ["executed-now", "supplied", "mixed"] } },
        "required": ["evidenceSource"]
      }
    },
    {
      "if": { "properties": { "status": { "const": "verified" } }, "required": ["status"] },
      "then": {
        "properties": {
          "baseline": { "type": "object", "properties": { "result": { "enum": ["failed", "observed"] } } },
          "rootCause": { "type": "object", "properties": { "evidence": { "type": "array", "minItems": 1 } } },
          "changes": { "type": "array", "minItems": 1 },
          "verification": { "type": "array", "minItems": 1, "items": { "type": "object", "properties": { "result": { "const": "passed" } } } },
          "gaps": { "type": "array", "maxItems": 0 }
        }
      }
    },
    {
      "if": { "properties": { "status": { "enum": ["partial", "blocked"] } }, "required": ["status"] },
      "then": { "properties": { "gaps": { "type": "array", "minItems": 1 } } }
    }
  ]
}

```