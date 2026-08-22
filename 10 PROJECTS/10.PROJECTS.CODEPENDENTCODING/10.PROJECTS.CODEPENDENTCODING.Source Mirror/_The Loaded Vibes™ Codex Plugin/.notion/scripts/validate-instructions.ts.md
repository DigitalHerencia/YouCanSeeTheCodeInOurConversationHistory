---
title: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-instructions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-instructions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.scripts.validate-instructions.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-instructions.ts'
source_file: 'validate-instructions.ts'
source_sha256: 'b1472a1fb42ca599e8976f860c030369dbcf3802e99f09d6f2e8e575dfdb26b2'
generated: true
---

# `validate-instructions.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-instructions.ts`
> SHA-256: `b1472a1fb42ca599e8976f860c030369dbcf3802e99f09d6f2e8e575dfdb26b2`

```ts
#!/usr/bin/env npx tsx

import fs from "fs";
import path from "path";
import {
  INSTRUCTIONS_DIR,
  INSTRUCTIONS_FILE_SUFFIX,
  LOWER_HYPHEN_NAME_RE,
} from "./constants.js";
import { parseFrontmatter } from "./yaml-parser.js";

function listInstructionFiles(): string[] {
  if (!fs.existsSync(INSTRUCTIONS_DIR)) return [];
  return fs
    .readdirSync(INSTRUCTIONS_DIR)
    .filter((f) => f.endsWith(INSTRUCTIONS_FILE_SUFFIX))
    .sort();
}

function extractYamlFrontmatterBlock(raw: string): string | null {
  if (!raw.startsWith("---")) return null;
  const end = raw.indexOf("\n---", 3);
  if (end === -1) return null;
  return raw.slice(0, end + "\n---".length);
}

function warnIfDescriptionNotSingleQuoted(filePath: string): void {
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

function validateInstructionFileName(fileName: string): string[] {
  const errors: string[] = [];
  const base = fileName.slice(0, -INSTRUCTIONS_FILE_SUFFIX.length);
  if (!LOWER_HYPHEN_NAME_RE.test(base)) {
    errors.push(
      `File name must be lowercase-with-hyphens: "${fileName}" (base: "${base}")`
    );
  }
  return errors;
}

function validateInstructionFrontmatter(filePath: string): string[] {
  const errors: string[] = [];
  const fm = parseFrontmatter(filePath);

  if (!fm) {
    errors.push("Failed to parse YAML frontmatter");
    return errors;
  }

  if (typeof fm.description !== "string" || fm.description.trim().length === 0) {
    errors.push("Frontmatter must include non-empty `description`");
  }

  const applyTo = (fm as any).applyTo;
  if (typeof applyTo !== "string" || applyTo.trim().length === 0) {
    errors.push("Frontmatter must include non-empty `applyTo`");
  }

  return errors;
}

function validateInstructions(): boolean {
  if (!fs.existsSync(INSTRUCTIONS_DIR)) {
    console.log("No instructions directory found - validation skipped");
    return true;
  }

  const files = listInstructionFiles();
  if (files.length === 0) {
    console.log("No instruction files found - validation skipped");
    return true;
  }

  console.log(`Validating ${files.length} instruction file(s)...`);

  let hasErrors = false;

  for (const file of files) {
    const filePath = path.join(INSTRUCTIONS_DIR, file);
    console.log(`\nValidating ${file}...`);

    const errors = [
      ...validateInstructionFileName(file),
      ...validateInstructionFrontmatter(filePath),
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
    console.log(`\n✅ All ${files.length} instructions are valid`);
  }

  return !hasErrors;
}

try {
  const isValid = validateInstructions();
  if (!isValid) {
    console.error("\n❌ Instructions validation failed");
    process.exit(1);
  }
  console.log("\n🎉 Instructions validation passed");
} catch (error) {
  const message = error instanceof Error ? error.message : String(error);
  console.error(`Error during validation: ${message}`);
  if (error instanceof Error) console.error(error.stack);
  process.exit(1);
}
```