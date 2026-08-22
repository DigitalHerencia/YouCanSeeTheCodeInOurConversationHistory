---
title: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\create-prompt.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\create-prompt.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.scripts.create-prompt.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\create-prompt.ts'
source_file: 'create-prompt.ts'
source_sha256: '055cc64e9e7c1da561353e74ab388e0ada154530576d01974a70fca5a98c9413'
generated: true
---

# `create-prompt.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\scripts\create-prompt.ts`
> SHA-256: `055cc64e9e7c1da561353e74ab388e0ada154530576d01974a70fca5a98c9413`

```ts
#!/usr/bin/env npx tsx

import fs from "fs";
import path from "path";
import readline from "readline";
import {
  PROMPTS_DIR,
  PROMPT_FILE_SUFFIX,
  LOWER_HYPHEN_NAME_RE,
} from "./constants.js";

interface ParsedArgs {
  name?: string;
  description?: string;
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
  const out: ParsedArgs = { name: undefined, description: undefined };

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
    } else if (!a.startsWith("-") && !out.name) {
      out.name = a;
    }
  }

  return out;
}

function yamlSingleQuote(value: string): string {
  return `'${value.replace(/'/g, "''")}'`;
}

async function createPrompt(): Promise<void> {
  try {
    console.log("🎯 Prompt Creator");
    console.log("This tool will scaffold a new prompt file.\n");

    const parsed = parseArgs();

    let baseName = parsed.name;
    if (!baseName) {
      baseName = await prompt("Prompt file name (lowercase, hyphens only): ");
    }

    if (!baseName) {
      console.error("❌ Prompt name is required");
      process.exit(1);
    }

    if (!LOWER_HYPHEN_NAME_RE.test(baseName)) {
      console.error("❌ Name must contain only lowercase letters, numbers, and hyphens");
      process.exit(1);
    }

    if (!fs.existsSync(PROMPTS_DIR)) {
      fs.mkdirSync(PROMPTS_DIR, { recursive: true });
    }

    const fileName = `${baseName}${PROMPT_FILE_SUFFIX}`;
    const filePath = path.join(PROMPTS_DIR, fileName);

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

    const defaultTitle = baseName
      .split("-")
      .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
      .join(" ");

    const content = `---
description: ${yamlSingleQuote(description.trim())}
name: ${yamlSingleQuote(defaultTitle)}
agent: 'agent'
---

# Prompt Body

Provide specific instructions for what the prompt should do.
Include:
- expected user inputs
- constraints
- expected output format
- references to relevant repo files via relative Markdown links
`;

    fs.writeFileSync(filePath, content, "utf8");

    console.log(`\n✅ Created prompt: ${filePath}`);
    console.log("\n📝 Next steps:");
    console.log("1. Edit prompt content");
    console.log("2. Run 'npm run prompt:validate'");
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error(`❌ Error creating prompt: ${message}`);
    process.exit(1);
  } finally {
    rl.close();
  }
}

createPrompt();
```