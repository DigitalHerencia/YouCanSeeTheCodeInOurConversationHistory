---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\recipe\persisting-sessions.go'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\recipe\persisting-sessions.go'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.go.recipe.persisting-sessions.go'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\recipe\persisting-sessions.go'
source_file: 'persisting-sessions.go'
source_sha256: '4c558a05c9f6f5336c5dd77bc7953030e5b5b3241e1a179b5b3bdcb30d9929c9'
generated: true
---

# `persisting-sessions.go`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\recipe\persisting-sessions.go`
> SHA-256: `4c558a05c9f6f5336c5dd77bc7953030e5b5b3241e1a179b5b3bdcb30d9929c9`

```go
package main

import (
	"context"
	"fmt"
	"log"

	copilot "github.com/github/copilot-sdk/go"
)

func main() {
	ctx := context.Background()
	client := copilot.NewClient(nil)
	if err := client.Start(ctx); err != nil {
		log.Fatal(err)
	}
	defer client.Stop()

	// Create session with a memorable ID
	session, err := client.CreateSession(ctx, &copilot.SessionConfig{
		OnPermissionRequest: copilot.PermissionHandler.ApproveAll,
		SessionID:           "user-123-conversation",
		Model:               "gpt-5.4",
	})
	if err != nil {
		log.Fatal(err)
	}

	_, err = session.SendAndWait(ctx, copilot.MessageOptions{Prompt: "Let's discuss TypeScript generics"})
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("Session created: %s\n", session.SessionID)

	// Disconnect session but keep data on disk
	session.Disconnect()
	fmt.Println("Session disconnected (state persisted)")

	// Resume the previous session
	resumed, err := client.ResumeSession(ctx, "user-123-conversation", &copilot.ResumeSessionConfig{OnPermissionRequest: copilot.PermissionHandler.ApproveAll})
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("Resumed: %s\n", resumed.SessionID)

	_, err = resumed.SendAndWait(ctx, copilot.MessageOptions{Prompt: "What were we discussing?"})
	if err != nil {
		log.Fatal(err)
	}

	// List sessions
	sessions, err := client.ListSessions(ctx, nil)
	if err != nil {
		log.Fatal(err)
	}
	ids := make([]string, 0, len(sessions))
	for _, s := range sessions {
		ids = append(ids, s.SessionID)
	}
	fmt.Printf("Sessions: %v\n", ids)

	// Delete session permanently
	if err := client.DeleteSession(ctx, "user-123-conversation"); err != nil {
		log.Fatal(err)
	}
	fmt.Println("Session deleted")

	resumed.Disconnect()
}

```