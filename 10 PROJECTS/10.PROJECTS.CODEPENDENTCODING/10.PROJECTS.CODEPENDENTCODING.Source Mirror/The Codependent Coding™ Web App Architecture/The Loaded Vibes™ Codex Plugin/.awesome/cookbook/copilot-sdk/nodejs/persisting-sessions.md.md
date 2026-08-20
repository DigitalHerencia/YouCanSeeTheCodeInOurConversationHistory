---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\persisting-sessions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\persisting-sessions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.nodejs.persisting-sessions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\persisting-sessions.md'
source_file: 'persisting-sessions.md'
source_sha256: '45aa1a19c62da3526666cd8a95123fb6456c4389f4e82b6071b250d22fd1b859'
generated: true
---

# `persisting-sessions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\persisting-sessions.md`
> SHA-256: `45aa1a19c62da3526666cd8a95123fb6456c4389f4e82b6071b250d22fd1b859`

````markdown
# Session Persistence and Resumption

Save and restore conversation sessions across application restarts.

## Example scenario

You want users to be able to continue a conversation even after closing and reopening your application.

> **Runnable example:** [recipe/persisting-sessions.ts](recipe/persisting-sessions.ts)
>
> ```bash
> cd recipe && npm install
> npx tsx persisting-sessions.ts
> # or: npm run persisting-sessions
> ```

### Creating a session with a custom ID

```typescript
import { CopilotClient, approveAll } from "@github/copilot-sdk";

const client = new CopilotClient();
await client.start();

// Create session with a memorable ID
const session = await client.createSession({
    onPermissionRequest: approveAll,
    sessionId: "user-123-conversation",
    model: "gpt-5",
});

await session.sendAndWait({ prompt: "Let's discuss TypeScript generics" });

// Session ID is preserved
console.log(session.sessionId); // "user-123-conversation"

// Destroy session but keep data on disk
await session.destroy();
await client.stop();
```

### Resuming a session

```typescript
const client = new CopilotClient();
await client.start();

// Resume the previous session
const session = await client.resumeSession("user-123-conversation", { onPermissionRequest: approveAll });

// Previous context is restored
await session.sendAndWait({ prompt: "What were we discussing?" });
// AI remembers the TypeScript generics discussion

await session.destroy();
await client.stop();
```

### Listing available sessions

```typescript
const sessions = await client.listSessions();
console.log(sessions);
// [
//   { sessionId: "user-123-conversation", ... },
//   { sessionId: "user-456-conversation", ... },
// ]
```

### Deleting a session permanently

```typescript
// Remove session and all its data from disk
await client.deleteSession("user-123-conversation");
```

## Getting session history

Retrieve all messages from a session:

```typescript
const messages = await session.getMessages();
for (const msg of messages) {
    console.log(`[${msg.type}]`, msg.data);
}
```

## Best practices

1. **Use meaningful session IDs**: Include user ID or context in the session ID
2. **Handle missing sessions**: Check if a session exists before resuming
3. **Clean up old sessions**: Periodically delete sessions that are no longer needed

````