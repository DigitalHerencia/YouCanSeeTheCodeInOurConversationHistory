---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\multiple-sessions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\multiple-sessions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.nodejs.multiple-sessions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\multiple-sessions.md'
source_file: 'multiple-sessions.md'
source_sha256: '47f548cb7a14bb453a8cbdf163fa79a127174a4bbfba584644ca0a7aee80a6df'
generated: true
---

# `multiple-sessions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\multiple-sessions.md`
> SHA-256: `47f548cb7a14bb453a8cbdf163fa79a127174a4bbfba584644ca0a7aee80a6df`

````markdown
# Working with Multiple Sessions

Manage multiple independent conversations simultaneously.

> **Runnable example:** [recipe/multiple-sessions.ts](recipe/multiple-sessions.ts)
>
> ```bash
> cd recipe && npm install
> npx tsx multiple-sessions.ts
> # or: npm run multiple-sessions
> ```

## Example scenario

You need to run multiple conversations in parallel, each with its own context and history.

## Node.js

```typescript
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

// Each session maintains its own conversation history
await session1.sendAndWait({ prompt: "You are helping with a Python project" });
await session2.sendAndWait({ prompt: "You are helping with a TypeScript project" });
await session3.sendAndWait({ prompt: "You are helping with a Go project" });

// Follow-up messages stay in their respective contexts
await session1.sendAndWait({ prompt: "How do I create a virtual environment?" });
await session2.sendAndWait({ prompt: "How do I set up tsconfig?" });
await session3.sendAndWait({ prompt: "How do I initialize a module?" });

// Clean up all sessions
await session1.destroy();
await session2.destroy();
await session3.destroy();
await client.stop();
```

## Custom session IDs

Use custom IDs for easier tracking:

```typescript
const session = await client.createSession({
    onPermissionRequest: approveAll,
    sessionId: "user-123-chat",
    model: "gpt-5",
});

console.log(session.sessionId); // "user-123-chat"
```

## Listing sessions

```typescript
const sessions = await client.listSessions();
console.log(sessions);
// [{ sessionId: "user-123-chat", ... }, ...]
```

## Deleting sessions

```typescript
// Delete a specific session
await client.deleteSession("user-123-chat");
```

## Use cases

- **Multi-user applications**: One session per user
- **Multi-task workflows**: Separate sessions for different tasks
- **A/B testing**: Compare responses from different models

````