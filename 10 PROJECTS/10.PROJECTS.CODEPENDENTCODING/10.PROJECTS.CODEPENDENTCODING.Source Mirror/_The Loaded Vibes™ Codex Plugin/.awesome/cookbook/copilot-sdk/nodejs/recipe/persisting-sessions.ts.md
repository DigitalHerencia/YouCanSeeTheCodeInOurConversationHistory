---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\persisting-sessions.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\persisting-sessions.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.nodejs.recipe.persisting-sessions.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\persisting-sessions.ts'
source_file: 'persisting-sessions.ts'
source_sha256: '7e8816ee2b6b30bdc6b9cc58a160f98c1327d832ab1a92544275460223da64aa'
generated: true
---

# `persisting-sessions.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\persisting-sessions.ts`
> SHA-256: `7e8816ee2b6b30bdc6b9cc58a160f98c1327d832ab1a92544275460223da64aa`

```ts
import { CopilotClient, approveAll } from "@github/copilot-sdk";

const client = new CopilotClient();
await client.start();

// Create a session with a memorable ID
const session = await client.createSession({
    onPermissionRequest: approveAll,
    sessionId: "user-123-conversation",
    model: "gpt-5",
});

await session.sendAndWait({ prompt: "Let's discuss TypeScript generics" });
console.log(`Session created: ${session.sessionId}`);

// Destroy session but keep data on disk
await session.destroy();
console.log("Session destroyed (state persisted)");

// Resume the previous session
const resumed = await client.resumeSession("user-123-conversation", { onPermissionRequest: approveAll });
console.log(`Resumed: ${resumed.sessionId}`);

await resumed.sendAndWait({ prompt: "What were we discussing?" });

// List sessions
const sessions = await client.listSessions();
console.log(
    "Sessions:",
    sessions.map((s) => s.sessionId)
);

// Delete session permanently
await client.deleteSession("user-123-conversation");
console.log("Session deleted");

await resumed.destroy();
await client.stop();

```