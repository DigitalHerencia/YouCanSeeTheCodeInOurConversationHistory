---
title: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-prompts.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-prompts.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.scripts.validate-prompts.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-prompts.ts'
source_file: 'validate-prompts.ts'
source_sha256: '7804802a9a6185b157771b66a375ee931db8a40a1ef6bd333f0a990df927a5dd'
generated: true
---

# `validate-prompts.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-prompts.ts`
> SHA-256: `7804802a9a6185b157771b66a375ee931db8a40a1ef6bd333f0a990df927a5dd`

```ts
#!/usr/bin/env npx tsx

import fs from "fs";
import path from "path";
import {
  PROMPTS_DIR,
  PROMPT_FILE_SUFFIX,
  LOWER_HYPHEN_NAME_RE,
} from "./constants.js";
import { parseFrontmatter } from "./yaml-parser.js";

function listPromptFiles(): string[] {
  if (!fs.existsSync(PROMPTS_DIR)) return [];
  return fs
    .readdirSync(PROMPTS_DIR)
    .filter((f) => f.endsWith(PROMPT_FILE_SUFFIX))
    .sort();
}

function extractYamlFrontmatterBlock(raw: string): string | null {
  if (!raw.startsWith("---")) return null;
  const end = raw.indexOf("\n---", 3);
  if (end === -1) return null;
  return raw.slice(0, end + "\n---".length);
}

function warnIfFieldNotSingleQuoted(
  filePath: string,
  fieldName: "description" | "agent"
): void {
  const raw = fs.readFileSync(filePath, "utf8");
  const fm = extractYamlFrontmatterBlock(raw);
  if (!fm) return;

  const re = new RegExp(`^\\s*${fieldName}\\s*:\\s*(.+)\\s*$`, "m");
  const match = fm.match(re);
  if (!match) return;

  const rhs = match[1].trim();
  const isSingleQuoted = rhs.startsWith("'") && rhs.endsWith("'");
  if (!isSingleQuoted) {
    console.warn(
      `⚠️  ${path.relative(process.cwd(), filePath)}: ${fieldName} should be wrapped in single quotes per AGENTS.md`
    );
  }
}

function validatePromptFileName(fileName: string): string[] {
  const errors: string[] = [];
  const base = fileName.slice(0, -PROMPT_FILE_SUFFIX.length);
  if (!LOWER_HYPHEN_NAME_RE.test(base)) {
    errors.push(
      `File name must be lowercase-with-hyphens: "${fileName}" (base: "${base}")`
    );
  }
  return errors;
}

function validatePromptFrontmatter(filePath: string): string[] {
  const errors: string[] = [];
  const fm = parseFrontmatter(filePath);

  if (!fm) {
    errors.push("Failed to parse YAML frontmatter");
    return errors;
  }

  if (typeof fm.description !== "string" || fm.description.trim().length === 0) {
    errors.push("Frontmatter must include non-empty `description`");
  }

  // Spec + AGENTS.md: prompt must have `agent`, default should be 'agent'
  if (typeof (fm as any).agent !== "string" || (fm as any).agent.length === 0) {
    errors.push("Frontmatter must include `agent`");
  } else if ((fm as any).agent !== "agent") {
    errors.push("Frontmatter `agent` must be `agent` unless explicitly targeting another agent");
  }

  if (fm.tools !== undefined && !Array.isArray(fm.tools)) {
    errors.push("`tools` must be an array if present");
  }

  return errors;
}

function validatePrompts(): boolean {
  if (!fs.existsSync(PROMPTS_DIR)) {
    console.log("No prompts directory found - validation skipped");
    return true;
  }

  const files = listPromptFiles();
  if (files.length === 0) {
    console.log("No prompt files found - validation skipped");
    return true;
  }

  console.log(`Validating ${files.length} prompt file(s)...`);

  let hasErrors = false;

  for (const file of files) {
    const filePath = path.join(PROMPTS_DIR, file);
    console.log(`\nValidating ${file}...`);

    const errors = [
      ...validatePromptFileName(file),
      ...validatePromptFrontmatter(filePath),
    ];

    // WARNING-only style checks
    warnIfFieldNotSingleQuoted(filePath, "description");
    warnIfFieldNotSingleQuoted(filePath, "agent");

    if (errors.length > 0) {
      console.error(`❌ Validation errors in ${file}:`);
      errors.forEach((e) => console.error(`   - ${e}`));
      hasErrors = true;
    } else {
      console.log(`✅ ${file} is valid`);
    }
  }

  if (!hasErrors) {
    console.log(`\n✅ All ${files.length} prompts are valid`);
  }

  return !hasErrors;
}

try {
  const isValid = validatePrompts();
  if (!isValid) {
    console.error("\n❌ Prompt validation failed");
    process.exit(1);
  }
  console.log("\n🎉 Prompt validation passed");
} catch (error) {
  const message = error instanceof Error ? error.message : String(error);
  console.error(`Error during validation: ${message}`);
  if (error instanceof Error) console.error(error.stack);
  process.exit(1);
}
```