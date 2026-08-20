---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\recipe\multiple-sessions.go'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\recipe\multiple-sessions.go'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.go.recipe.multiple-sessions.go'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\recipe\multiple-sessions.go'
source_file: 'multiple-sessions.go'
source_sha256: '1f86133cd5e92362a39cb6cb3f6cf544bdd0acf8280d627f4621309f0ccdffbc'
generated: true
---

# `multiple-sessions.go`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\go\recipe\multiple-sessions.go`
> SHA-256: `1f86133cd5e92362a39cb6cb3f6cf544bdd0acf8280d627f4621309f0ccdffbc`

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

	// Create multiple independent sessions
	session1, err := client.CreateSession(ctx, &copilot.SessionConfig{
		OnPermissionRequest: copilot.PermissionHandler.ApproveAll,
		Model:               "gpt-5.4",
	})
	if err != nil {
		log.Fatal(err)
	}
	defer session1.Disconnect()

	session2, err := client.CreateSession(ctx, &copilot.SessionConfig{
		OnPermissionRequest: copilot.PermissionHandler.ApproveAll,
		Model:               "gpt-5.4",
	})
	if err != nil {
		log.Fatal(err)
	}
	defer session2.Disconnect()

	session3, err := client.CreateSession(ctx, &copilot.SessionConfig{
		OnPermissionRequest: copilot.PermissionHandler.ApproveAll,
		Model:               "claude-sonnet-4.6",
	})
	if err != nil {
		log.Fatal(err)
	}
	defer session3.Disconnect()

	fmt.Println("Created 3 independent sessions")

	// Each session maintains its own conversation history
	session1.Send(ctx, copilot.MessageOptions{Prompt: "You are helping with a Python project"})
	session2.Send(ctx, copilot.MessageOptions{Prompt: "You are helping with a TypeScript project"})
	session3.Send(ctx, copilot.MessageOptions{Prompt: "You are helping with a Go project"})

	fmt.Println("Sent initial context to all sessions")

	// Follow-up messages stay in their respective contexts
	session1.Send(ctx, copilot.MessageOptions{Prompt: "How do I create a virtual environment?"})
	session2.Send(ctx, copilot.MessageOptions{Prompt: "How do I set up tsconfig?"})
	session3.Send(ctx, copilot.MessageOptions{Prompt: "How do I initialize a module?"})

	fmt.Println("Sent follow-up questions to each session")
	fmt.Println("All sessions will be disconnected on exit")
}

```