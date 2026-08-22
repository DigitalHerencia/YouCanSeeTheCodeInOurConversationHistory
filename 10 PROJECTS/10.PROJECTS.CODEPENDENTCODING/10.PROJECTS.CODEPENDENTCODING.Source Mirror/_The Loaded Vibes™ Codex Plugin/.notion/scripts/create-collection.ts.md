---
title: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\create-collection.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\create-collection.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.scripts.create-collection.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\create-collection.ts'
source_file: 'create-collection.ts'
source_sha256: '5ba5c76b88489ef5c51f788cc0b2dad651a306297e13a7250ac704dc0b3953c7'
generated: true
---

# `create-collection.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\scripts\create-collection.ts`
> SHA-256: `5ba5c76b88489ef5c51f788cc0b2dad651a306297e13a7250ac704dc0b3953c7`

```ts
#!/usr/bin/env npx tsx

import fs from "fs";
import path from "path";
import readline from "readline";
import { COLLECTIONS_DIR } from "./constants.js";

interface ParsedArgs {
  id?: string;
  tags?: string;
}

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

function prompt(question: string): Promise<string> {
  return new Promise((resolve) => {
    rl.question(question, resolve);
  });
}

function parseArgs(): ParsedArgs {
  const args = process.argv.slice(2);
  const out: ParsedArgs = { id: undefined, tags: undefined };

  // simple long/short option parsing
  for (let i = 0; i < args.length; i++) {
    const a = args[i];
    if (a === "--id" || a === "-i") {
      out.id = args[i + 1];
      i++;
    } else if (a.startsWith("--id=")) {
      out.id = a.split("=")[1];
    } else if (a === "--tags" || a === "-t") {
      out.tags = args[i + 1];
      i++;
    } else if (a.startsWith("--tags=")) {
      out.tags = a.split("=")[1];
    } else if (!a.startsWith("-") && !out.id) {
      // first positional -> id
      out.id = a;
    } else if (!a.startsWith("-") && out.id && !out.tags) {
      // second positional -> tags
      out.tags = a;
    }
  }

  return out;
}

async function createCollectionTemplate(): Promise<void> {
  try {
    console.log("🎯 Collection Creator");
    console.log("This tool will help you create a new collection manifest.\n");

    // Parse CLI args and fall back to interactive prompts when missing
    const parsed = parseArgs();
    // Get collection ID
    let collectionId = parsed.id;
    if (!collectionId) {
      collectionId = await prompt("Collection ID (lowercase, hyphens only): ");
    }

    // Validate collection ID format
    if (!collectionId) {
      console.error("❌ Collection ID is required");
      process.exit(1);
    }

    if (!/^[a-z0-9-]+$/.test(collectionId)) {
      console.error(
        "❌ Collection ID must contain only lowercase letters, numbers, and hyphens"
      );
      process.exit(1);
    }

    const filePath = path.join(
      COLLECTIONS_DIR,
      `${collectionId}.collection.yml`
    );

    // Check if file already exists
    if (fs.existsSync(filePath)) {
      console.log(
        `⚠️  Collection ${collectionId} already exists at ${filePath}`
      );
      console.log("💡 Please edit that file instead or choose a different ID.");
      process.exit(1);
    }

    // Ensure collections directory exists
    if (!fs.existsSync(COLLECTIONS_DIR)) {
      fs.mkdirSync(COLLECTIONS_DIR, { recursive: true });
    }

    // Get collection name
    const defaultName = collectionId
      .split("-")
      .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
      .join(" ");

    let collectionName = await prompt(
      `Collection name (default: ${defaultName}): `
    );
    if (!collectionName.trim()) {
      collectionName = defaultName;
    }

    // Get description
    const defaultDescription = `A collection of related prompts, instructions, and agents for ${collectionName.toLowerCase()}.`;
    let description = await prompt(
      `Description (default: ${defaultDescription}): `
    );
    if (!description.trim()) {
      description = defaultDescription;
    }

    // Get tags (from CLI or prompt)
    let tags: string[] = [];
    let tagInput = parsed.tags;
    if (!tagInput) {
      tagInput = await prompt(
        "Tags (comma-separated, or press Enter for defaults): "
      );
    }

    if (tagInput && tagInput.toString().trim()) {
      tags = tagInput
        .toString()
        .split(",")
        .map((tag) => tag.trim())
        .filter((tag) => tag);
    } else {
      // Generate some default tags from the collection ID
      tags = collectionId.split("-").slice(0, 3);
    }

    // Template content
    const template = `id: ${collectionId}
name: ${collectionName}
description: ${description}
tags: [${tags.join(", ")}]
items:
  # Add your collection items here
  # Example:
  # - path: prompts/example.prompt.md
  #   kind: prompt
  # - path: instructions/example.instructions.md
  #   kind: instruction
  # - path: agents/example.agent.md
  #   kind: agent
    # - path: agents/example.agent.md
    #   kind: agent
    #   usage: |
    #     This agent requires the example MCP server to be installed.
    #     Configure any required environment variables (e.g., EXAMPLE_API_KEY).
display:
  ordering: alpha # or "manual" to preserve the order above
  show_badge: false # set to true to show collection badge on items
`;

    fs.writeFileSync(filePath, template);
    console.log(`✅ Created collection template: ${filePath}`);
    console.log("\n📝 Next steps:");
    console.log("1. Edit the collection manifest to add your items");
    console.log("2. Update the name, description, and tags as needed");
    console.log("3. Run 'npm run collection:validate' to validate");
    console.log("4. Run 'npm start' to generate documentation");
    console.log("\n📄 Collection template contents:");
    console.log(template);
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error(`❌ Error creating collection template: ${message}`);
    process.exit(1);
  } finally {
    rl.close();
  }
}

// Run the interactive creation process
createCollectionTemplate();

```