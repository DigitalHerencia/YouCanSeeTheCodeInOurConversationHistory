---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\managing-local-files.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\managing-local-files.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.nodejs.recipe.managing-local-files.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\managing-local-files.ts'
source_file: 'managing-local-files.ts'
source_sha256: 'c9c61e0a2da157e53f361af58d6612824e9095dcedd6746d4cd308a52e410bab'
generated: true
---

# `managing-local-files.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\managing-local-files.ts`
> SHA-256: `c9c61e0a2da157e53f361af58d6612824e9095dcedd6746d4cd308a52e410bab`

```ts
import { CopilotClient, approveAll } from "@github/copilot-sdk";
import * as os from "node:os";
import * as path from "node:path";

// Create and start client
const client = new CopilotClient();
await client.start();

// Create session
const session = await client.createSession({
    onPermissionRequest: approveAll,
    model: "gpt-5",
});

// Event handler
session.on((event) => {
    switch (event.type) {
        case "assistant.message":
            console.log(`\nCopilot: ${event.data.content}`);
            break;
        case "tool.execution_start":
            console.log(`  → Running: ${event.data.toolName} ${event.data.toolCallId}`);
            break;
        case "tool.execution_complete":
            console.log(`  ✓ Completed: ${event.data.toolCallId}`);
            break;
    }
});

// Ask Copilot to organize files
// Change this to your target folder
const targetFolder = path.join(os.homedir(), "Downloads");

await session.sendAndWait({
    prompt: `
Analyze the files in "${targetFolder}" and organize them into subfolders.

1. First, list all files and their metadata
2. Preview grouping by file extension
3. Create appropriate subfolders (e.g., "images", "documents", "videos")
4. Move each file to its appropriate subfolder

Please confirm before moving any files.
`,
});

await session.destroy();
await client.stop();

```