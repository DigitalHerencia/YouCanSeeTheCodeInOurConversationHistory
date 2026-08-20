---
title: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-agents.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-agents.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.scripts.validate-agents.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-agents.ts'
source_file: 'validate-agents.ts'
source_sha256: 'd1d93260bf9772d8cb4d7ba56c02163e7ef706344f69c2fa8b173a4ef253b4f8'
generated: true
---

# `validate-agents.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-agents.ts`
> SHA-256: `d1d93260bf9772d8cb4d7ba56c02163e7ef706344f69c2fa8b173a4ef253b4f8`

```ts
#!/usr/bin/env npx tsx

import fs from "fs";
import path from "path";
import {
  AGENTS_DIR,
  AGENT_FILE_SUFFIX,
  LOWER_HYPHEN_NAME_RE,
} from "./constants.js";
import { parseFrontmatter } from "./yaml-parser.js";

function listAgentFiles(): string[] {
  if (!fs.existsSync(AGENTS_DIR)) return [];
  return fs
    .readdirSync(AGENTS_DIR)
    .filter((f) => f.endsWith(AGENT_FILE_SUFFIX))
    .sort();
}

function extractYamlFrontmatterBlock(raw: string): string | null {
  // Minimal: only supports leading frontmatter `---` block.
  if (!raw.startsWith("---")) return null;
  const end = raw.indexOf("\n---", 3);
  if (end === -1) return null;
  return raw.slice(0, end + "\n---".length);
}

function warnIfDescriptionNotSingleQuoted(filePath: string): void {
  // WARNING-only: style guidance from AGENTS.md; do not fail builds.
  const raw = fs.readFileSync(filePath, "utf8");
  const fm = extractYamlFrontmatterBlock(raw);
  if (!fm) return;

  const match = fm.match(/^\s*description\s*:\s*(.+)\s*$/m);
  if (!match) return;

  const rhs = match[1].trim();
  const isSingleQuoted = rhs.startsWith("'") && rhs.endsWith("'");
  if (!isSingleQuoted) {
    console.warn(
      `⚠️  ${path.relative(process.cwd(), filePath)}: description should be wrapped in single quotes per AGENTS.md`
    );
  }
}

function validateAgentFileName(fileName: string): string[] {
  const errors: string[] = [];
  const base = fileName.slice(0, -AGENT_FILE_SUFFIX.length);
  if (!LOWER_HYPHEN_NAME_RE.test(base)) {
    errors.push(
      `File name must be lowercase-with-hyphens: "${fileName}" (base: "${base}")`
    );
  }
  return errors;
}

function validateAgentFrontmatter(filePath: string): string[] {
  const errors: string[] = [];
  const fm = parseFrontmatter(filePath);

  if (!fm) {
    errors.push("Failed to parse YAML frontmatter");
    return errors;
  }

  // Spec requirement: description must exist and be non-empty.
  if (typeof fm.description !== "string" || fm.description.trim().length === 0) {
    errors.push("Frontmatter must include non-empty `description`");
  }

  // Optional shape checks (do not enforce beyond type sanity)
  if (fm.tools !== undefined && !Array.isArray(fm.tools)) {
    errors.push("`tools` must be an array if present");
  }

  return errors;
}

function validateAgents(): boolean {
  if (!fs.existsSync(AGENTS_DIR)) {
    console.log("No agents directory found - validation skipped");
    return true;
  }

  const files = listAgentFiles();
  if (files.length === 0) {
    console.log("No agent files found - validation skipped");
    return true;
  }

  console.log(`Validating ${files.length} agent file(s)...`);

  let hasErrors = false;

  for (const file of files) {
    const filePath = path.join(AGENTS_DIR, file);
    console.log(`\nValidating ${file}...`);

    const errors = [
      ...validateAgentFileName(file),
      ...validateAgentFrontmatter(filePath),
    ];

    // WARNING-only style check
    warnIfDescriptionNotSingleQuoted(filePath);

    if (errors.length > 0) {
      console.error(`❌ Validation errors in ${file}:`);
      errors.forEach((e) => console.error(`   - ${e}`));
      hasErrors = true;
    } else {
      console.log(`✅ ${file} is valid`);
    }
  }

  if (!hasErrors) {
    console.log(`\n✅ All ${files.length} agents are valid`);
  }

  return !hasErrors;
}

try {
  const isValid = validateAgents();
  if (!isValid) {
    console.error("\n❌ Agent validation failed");
    process.exit(1);
  }
  console.log("\n🎉 Agent validation passed");
} catch (error) {
  const message = error instanceof Error ? error.message : String(error);
  console.error(`Error during validation: ${message}`);
  if (error instanceof Error) console.error(error.stack);
  process.exit(1);
}
```