---
title: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\create-instructions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\create-instructions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.scripts.create-instructions.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\create-instructions.ts'
source_file: 'create-instructions.ts'
source_sha256: 'd9b120183cc1b51cf49bce9d021d833ba0a8a7912e1c17afb24d34c825b7c06b'
generated: true
---

# `create-instructions.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\scripts\create-instructions.ts`
> SHA-256: `d9b120183cc1b51cf49bce9d021d833ba0a8a7912e1c17afb24d34c825b7c06b`

```ts
#!/usr/bin/env npx tsx

import fs from "fs";
import path from "path";
import readline from "readline";
import { INSTRUCTIONS_DIR } from "./constants.js";

// Fallback/default suffix for instruction files. If a different suffix is
// desired, export INSTRUCTIONS_FILE_SUFFIX from ./constants.js and remove
// this local default.
const INSTRUCTIONS_FILE_SUFFIX = ".md";

interface ParsedArgs {
  name?: string;
  description?: string;
  applyTo?: string;
}

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

function prompt(question: string): Promise<string> {
  return new Promise((resolve) => rl.question(question, resolve));
}

function parseArgs(): ParsedArgs {
  const args = process.argv.slice(2);
  const out: ParsedArgs = {
    name: undefined,
    description: undefined,
    applyTo: undefined,
  };

  for (let i = 0; i < args.length; i++) {
    const a = args[i];
    if (a === "--name" || a === "-n") {
      out.name = args[i + 1];
      i++;
    } else if (a.startsWith("--name=")) {
      out.name = a.split("=")[1];
    } else if (a === "--description" || a === "-d") {
      out.description = args[i + 1];
      i++;
    } else if (a.startsWith("--description=")) {
      out.description = a.split("=")[1];
    } else if (a === "--applyTo" || a === "--applyto" || a === "-a") {
      out.applyTo = args[i + 1];
      i++;
    } else if (a.startsWith("--applyTo=") || a.startsWith("--applyto=")) {
      out.applyTo = a.split("=")[1];
    } else if (!a.startsWith("-") && !out.name) {
      out.name = a;
    }
  }

  return out;
}

function yamlSingleQuote(value: string): string {
  return `'${value.replace(/'/g, "''")}'`;
}

// Regex for names with lowercase letters, numbers, and hyphens (no leading/trailing hyphen)
const LOWER_HYPHEN_NAME_RE = /^[a-z0-9]+(?:-[a-z0-9]+)*$/;

async function createInstructions(): Promise<void> {
  try {
    console.log("🎯 Instructions Creator");
    console.log("This tool will scaffold a new instructions file.\n");

    const parsed = parseArgs();

    let baseName = parsed.name;
    if (!baseName) {
      baseName = await prompt(
        "Instructions file name (lowercase, hyphens only): "
      );
    }

    if (!baseName) {
      console.error("❌ Instructions name is required");
      process.exit(1);
    }

    if (!LOWER_HYPHEN_NAME_RE.test(baseName)) {
      console.error(
        "❌ Name must contain only lowercase letters, numbers, and hyphens"
      );
      process.exit(1);
    }

    if (!fs.existsSync(INSTRUCTIONS_DIR)) {
      fs.mkdirSync(INSTRUCTIONS_DIR, { recursive: true });
    }

    const fileName = `${baseName}${INSTRUCTIONS_FILE_SUFFIX}`;
    const filePath = path.join(INSTRUCTIONS_DIR, fileName);

    if (fs.existsSync(filePath)) {
      console.error(`❌ File already exists: ${filePath}`);
      process.exit(1);
    }

    let description = parsed.description;
    if (!description) {
      description = await prompt("Description (short): ");
    }
    if (!description || description.trim().length === 0) {
      console.error("❌ Description is required");
      process.exit(1);
    }

    let applyTo = parsed.applyTo;
    if (!applyTo) {
      applyTo = await prompt(
        "applyTo glob (default: **/*.{ts,tsx,js,jsx,md}): "
      );
    }
    if (!applyTo || !applyTo.trim()) applyTo = "**/*.{ts,tsx,js,jsx,md}";

    const defaultTitle = baseName
      .split("-")
      .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
      .join(" ");

    const content = `---
description: ${yamlSingleQuote(description.trim())}
name: ${yamlSingleQuote(defaultTitle)}
applyTo: ${yamlSingleQuote(applyTo.trim())}
---

# Instructions Body

Write clear, specific rules that should be applied when these instructions are active.
- Prefer “do/dont” bullets
- Include 1 to 3 minimal examples
- Keep the scope tight to the applyTo pattern
`;

    fs.writeFileSync(filePath, content, "utf8");

    console.log(`\n✅ Created instructions: ${filePath}`);
    console.log("\n📝 Next steps:");
    console.log("1. Edit instructions content");
    console.log("2. Run 'npm run instructions:validate'");
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error(`❌ Error creating instructions: ${message}`);
    process.exit(1);
  } finally {
    rl.close();
  }
}

createInstructions();

```