---
title: 'The Hipster Stack™ Technology Stack\template\scripts\validate-contracts.mjs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\scripts\validate-contracts.mjs'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.scripts.validate-contracts.mjs'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\template\scripts\validate-contracts.mjs'
source_file: 'validate-contracts.mjs'
source_sha256: 'f14b073b9c7d0d53a59c075eb092b574a32f9a43eb1e545839777954ccb35717'
generated: true
---

# `validate-contracts.mjs`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\scripts\validate-contracts.mjs`
> SHA-256: `f14b073b9c7d0d53a59c075eb092b574a32f9a43eb1e545839777954ccb35717`

```javascript
import { readFile } from "node:fs/promises"
import { dirname, join } from "node:path"
import { fileURLToPath } from "node:url"
import YAML from "yaml"

const root = dirname(dirname(fileURLToPath(import.meta.url)))

const contractFiles = [
  ".agents/contracts/architecture-boundaries.yml",
  ".agents/contracts/database-security.yaml",
  ".agents/contracts/domain-model.yaml",
  ".agents/contracts/integrations.yaml",
  ".agents/contracts/product.yaml",
  ".agents/contracts/quality-gates.yaml",
  ".agents/contracts/routes.yaml",
  ".agents/contracts/server-operations.yaml",
]

for (const file of contractFiles) {
  const body = await readFile(join(root, file), "utf8")
  const parsed = YAML.parse(body)

  if (!parsed || typeof parsed !== "object") {
    throw new Error(`${file} did not parse to an object`)
  }
}

console.log(`Validated ${contractFiles.length} agent contract files.`)

```