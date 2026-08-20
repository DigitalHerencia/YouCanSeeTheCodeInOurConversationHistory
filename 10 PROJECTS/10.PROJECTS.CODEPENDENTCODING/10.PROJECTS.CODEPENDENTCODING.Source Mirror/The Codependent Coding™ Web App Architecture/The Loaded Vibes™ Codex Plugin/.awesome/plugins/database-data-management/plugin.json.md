---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\database-data-management\plugin.json'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\database-data-management\plugin.json'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.plugins.database-data-management.plugin.json'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\plugins\database-data-management\plugin.json'
source_file: 'plugin.json'
source_sha256: '3e3832116653f9a4b9da4e777aa519e7b647750dc197afe00d36e75886b44019'
generated: true
---

# `plugin.json`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\plugins\database-data-management\plugin.json`
> SHA-256: `3e3832116653f9a4b9da4e777aa519e7b647750dc197afe00d36e75886b44019`

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "database-data-management",
  "description": "Database administration, SQL optimization, and data management tools for PostgreSQL, SQL Server, and general database development best practices.",
  "version": "1.0.0",
  "author": {
    "name": "Awesome Copilot Community"
  },
  "repository": "https://github.com/github/awesome-copilot",
  "license": "MIT",
  "keywords": [
    "database",
    "sql",
    "postgresql",
    "sql-server",
    "dba",
    "optimization",
    "queries",
    "data-management"
  ],
  "extensions": {
    "com.github.awesome-copilot": {
      "agents": [
        "./agents/ms-sql-dba.md",
        "./agents/postgresql-dba.md"
      ],
      "skills": [
        "./skills/postgresql-code-review/",
        "./skills/postgresql-optimization/",
        "./skills/sql-code-review/",
        "./skills/sql-optimization/"
      ]
    }
  }
}

```