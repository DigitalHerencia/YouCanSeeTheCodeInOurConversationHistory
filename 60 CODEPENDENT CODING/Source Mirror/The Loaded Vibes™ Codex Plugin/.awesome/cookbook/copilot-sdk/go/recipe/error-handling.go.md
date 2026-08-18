---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\recipe\error-handling.go'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\recipe\error-handling.go'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.go.recipe.error-handling.go'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\recipe\error-handling.go'
source_file: 'error-handling.go'
source_sha256: 'bd35442e187ab6726669c7e8162518c30261aac83285cbe00b115af8d04269f6'
generated: true
---

# `error-handling.go`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\recipe\error-handling.go`
> SHA-256: `bd35442e187ab6726669c7e8162518c30261aac83285cbe00b115af8d04269f6`

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
		log.Fatalf("Failed to start client: %v", err)
	}
	defer client.Stop()

	session, err := client.CreateSession(ctx, &copilot.SessionConfig{
		OnPermissionRequest: copilot.PermissionHandler.ApproveAll,
		Model:               "gpt-5.4",
	})
	if err != nil {
		log.Fatalf("Failed to create session: %v", err)
	}
	defer session.Disconnect()

	result, err := session.SendAndWait(ctx, copilot.MessageOptions{Prompt: "Hello!"})
	if err != nil {
		log.Printf("Failed to send message: %v", err)
		return
	}

	if result != nil {
		if d, ok := result.Data.(*copilot.AssistantMessageData); ok {
			fmt.Println(d.Content)
		}
	}
}

```