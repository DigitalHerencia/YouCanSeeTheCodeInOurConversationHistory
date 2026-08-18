---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\multiple-sessions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\multiple-sessions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.nodejs.recipe.multiple-sessions.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\multiple-sessions.ts'
source_file: 'multiple-sessions.ts'
source_sha256: '54daea07e8a9afb8ac71cd992250b8c3ea9cad205cec571d26271f65217c82f4'
generated: true
---

# `multiple-sessions.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\multiple-sessions.ts`
> SHA-256: `54daea07e8a9afb8ac71cd992250b8c3ea9cad205cec571d26271f65217c82f4`

```ts
import { CopilotClient, approveAll } from "@github/copilot-sdk";

const client = new CopilotClient();
await client.start();

// Create multiple independent sessions
const session1 = await client.createSession({
    onPermissionRequest: approveAll,
    model: "gpt-5",
});
const session2 = await client.createSession({
    onPermissionRequest: approveAll,
    model: "gpt-5",
});
const session3 = await client.createSession({
    onPermissionRequest: approveAll,
    model: "claude-sonnet-4.5",
});

console.log("Created 3 independent sessions");

// Each session maintains its own conversation history
await session1.sendAndWait({ prompt: "You are helping with a Python project" });
await session2.sendAndWait({ prompt: "You are helping with a TypeScript project" });
await session3.sendAndWait({ prompt: "You are helping with a Go project" });

console.log("Sent initial context to all sessions");

// Follow-up messages stay in their respective contexts
await session1.sendAndWait({ prompt: "How do I create a virtual environment?" });
await session2.sendAndWait({ prompt: "How do I set up tsconfig?" });
await session3.sendAndWait({ prompt: "How do I initialize a module?" });

console.log("Sent follow-up questions to each session");

// Clean up all sessions
await session1.destroy();
await session2.destroy();
await session3.destroy();
await client.stop();

console.log("All sessions destroyed successfully");

```