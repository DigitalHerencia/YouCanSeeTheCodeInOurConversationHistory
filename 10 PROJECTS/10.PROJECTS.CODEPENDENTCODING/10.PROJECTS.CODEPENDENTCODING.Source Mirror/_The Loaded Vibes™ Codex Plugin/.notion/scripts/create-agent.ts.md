---
title: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\create-agent.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\create-agent.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.scripts.create-agent.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\create-agent.ts'
source_file: 'create-agent.ts'
source_sha256: 'bb7debd352177dc4054c9ddc869cc95a3bfbad3efbfc6ae93a771a8d06ac5c24'
generated: true
---

# `create-agent.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\scripts\create-agent.ts`
> SHA-256: `bb7debd352177dc4054c9ddc869cc95a3bfbad3efbfc6ae93a771a8d06ac5c24`

```ts
#!/usr/bin/env npx tsx

import fs from "fs";
import path from "path";
import readline from "readline";
import {
  AGENTS_DIR,
  AGENT_FILE_SUFFIX,
  LOWER_HYPHEN_NAME_RE,
} from "./constants.js";

interface ParsedArgs {
  name?: string; // file base name (lowercase-hyphens)
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
  // YAML single-quote escaping: ' -> ''
  return `'${value.replace(/'/g, "''")}'`;
}

async function createAgent(): Promise<void> {
  try {
    console.log("🎯 Agent Creator");
    console.log("This tool will scaffold a new custom agent file.\n");

    const parsed = parseArgs();

    let baseName = parsed.name;
    if (!baseName) {
      baseName = await prompt("Agent file name (lowercase, hyphens only): ");
    }

    if (!baseName) {
      console.error("❌ Agent name is required");
      process.exit(1);
    }

    if (!LOWER_HYPHEN_NAME_RE.test(baseName)) {
      console.error("❌ Name must contain only lowercase letters, numbers, and hyphens");
      process.exit(1);
    }

    if (!fs.existsSync(AGENTS_DIR)) {
      fs.mkdirSync(AGENTS_DIR, { recursive: true });
    }

    const fileName = `${baseName}${AGENT_FILE_SUFFIX}`;
    const filePath = path.join(AGENTS_DIR, fileName);

    if (fs.existsSync(filePath)) {
      console.error(`❌ File already exists: ${filePath}`);
      process.exit(1);
    }

    let description = parsed.description;
    if (!description) {
      description = await prompt("Description (shown in chat input placeholder): ");
    }
    if (!description || description.trim().length === 0) {
      console.error("❌ Description is required");
      process.exit(1);
    }

    const defaultTitle = baseName
      .split("-")
      .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
      .join(" ");

    let displayName = await prompt(`Agent display name (default: ${defaultTitle}): `);
    if (!displayName.trim()) displayName = defaultTitle;

    const content = `---
description: ${yamlSingleQuote(description.trim())}
name: ${yamlSingleQuote(displayName.trim())}
infer: true
target: vscode
---

# ${displayName.trim()}

## Purpose
Describe what this agent does and when to use it.

## Operating Rules
- Keep responses short and actionable.
- Prefer reading existing workspace assets before creating new ones.

## Typical Workflow
1. Inspect relevant files.
2. Propose minimal changes.
3. Apply changes with clear diffs.
4. Validate via repo scripts (build/validate where applicable).
`;

    fs.writeFileSync(filePath, content, "utf8");

    console.log(`\n✅ Created agent: ${filePath}`);
    console.log("\n📝 Next steps:");
    console.log("1. Edit the agent body and (optionally) add tools/model/MCP settings");
    console.log("2. Run 'npm run agent:validate'");
    console.log("3. Run 'npm run build' (if your build generates README)");
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error(`❌ Error creating agent: ${message}`);
    process.exit(1);
  } finally {
    rl.close();
  }
}

createAgent();
```