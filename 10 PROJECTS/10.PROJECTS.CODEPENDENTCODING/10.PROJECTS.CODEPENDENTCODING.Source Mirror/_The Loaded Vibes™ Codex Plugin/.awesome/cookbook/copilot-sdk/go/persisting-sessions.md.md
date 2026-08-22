---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\persisting-sessions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\persisting-sessions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.go.persisting-sessions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\persisting-sessions.md'
source_file: 'persisting-sessions.md'
source_sha256: 'b60388adc1e9f7f5c026de56b4b1aef838caee849304e3c91c66b771c7134ed8'
generated: true
---

# `persisting-sessions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\persisting-sessions.md`
> SHA-256: `b60388adc1e9f7f5c026de56b4b1aef838caee849304e3c91c66b771c7134ed8`

````markdown
# Session Persistence and Resumption

Save and restore conversation sessions across application restarts.

## Example scenario

You want users to be able to continue a conversation even after closing and reopening your application.

> **Runnable example:** [recipe/persisting-sessions.go](recipe/persisting-sessions.go)
>
> ```bash
> cd recipe
> go run persisting-sessions.go
> ```

### Creating a session with a custom ID

```go
package main

import (
    "context"
    "fmt"
    copilot "github.com/github/copilot-sdk/go"
)

func main() {
    ctx := context.Background()
    client := copilot.NewClient(nil)
    client.Start(ctx)
    defer client.Stop()

    // Create session with a memorable ID
    session, _ := client.CreateSession(ctx, &copilot.SessionConfig{
    	OnPermissionRequest: copilot.PermissionHandler.ApproveAll,
        SessionID: "user-123-conversation",
        Model:     "gpt-5.4",
    })

    session.SendAndWait(ctx, copilot.MessageOptions{Prompt: "Let's discuss TypeScript generics"})

    // Session ID is preserved
    fmt.Println(session.SessionID)

    // Disconnect session but keep data on disk
    session.Disconnect()
}
```

### Resuming a session

```go
ctx := context.Background()
client := copilot.NewClient(nil)
client.Start(ctx)
defer client.Stop()

// Resume the previous session
session, _ := client.ResumeSession(ctx, "user-123-conversation", &copilot.ResumeSessionConfig{OnPermissionRequest: copilot.PermissionHandler.ApproveAll})

// Previous context is restored
session.SendAndWait(ctx, copilot.MessageOptions{Prompt: "What were we discussing?"})

session.Disconnect()
```

### Listing available sessions

```go
sessions, _ := client.ListSessions(ctx, nil)
for _, s := range sessions {
    fmt.Println("Session:", s.SessionID)
}
```

### Deleting a session permanently

```go
// Remove session and all its data from disk
client.DeleteSession(ctx, "user-123-conversation")
```

### Getting session history

```go
messages, _ := session.GetMessages(ctx)
for _, msg := range messages {
    if d, ok := msg.Data.(*copilot.AssistantMessageData); ok {
        fmt.Printf("[assistant.message] %s\n", d.Content)
    }
}
```

## Best practices

1. **Use meaningful session IDs**: Include user ID or context in the session ID
2. **Handle missing sessions**: Check if a session exists before resuming
3. **Clean up old sessions**: Periodically delete sessions that are no longer needed

````