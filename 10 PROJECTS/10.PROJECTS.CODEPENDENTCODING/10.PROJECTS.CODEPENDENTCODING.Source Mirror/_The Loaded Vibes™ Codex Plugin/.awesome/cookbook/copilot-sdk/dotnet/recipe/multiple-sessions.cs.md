---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\multiple-sessions.cs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\multiple-sessions.cs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.dotnet.recipe.multiple-sessions.cs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\multiple-sessions.cs'
source_file: 'multiple-sessions.cs'
source_sha256: '41f48c982e38463f8ff949e52d3f211550e21051d537ace4065119749f4c8b7e'
generated: true
---

# `multiple-sessions.cs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\multiple-sessions.cs`
> SHA-256: `41f48c982e38463f8ff949e52d3f211550e21051d537ace4065119749f4c8b7e`

```csharp
#:package GitHub.Copilot.SDK@*
#:property PublishAot=false

// The GitHub.Copilot.SDK package exposes the GitHub.Copilot namespace.
using GitHub.Copilot;

await using var client = new CopilotClient();
await client.StartAsync();

// Create multiple independent sessions
var session1 = await client.CreateSessionAsync(new SessionConfig
{
    Model = "gpt-5",
    OnPermissionRequest = PermissionHandler.ApproveAll
});
var session2 = await client.CreateSessionAsync(new SessionConfig
{
    Model = "gpt-5",
    OnPermissionRequest = PermissionHandler.ApproveAll
});
var session3 = await client.CreateSessionAsync(new SessionConfig
{
    Model = "claude-sonnet-4.5",
    OnPermissionRequest = PermissionHandler.ApproveAll
});

Console.WriteLine("Created 3 independent sessions");

// Each session maintains its own conversation history
await session1.SendAsync(new MessageOptions { Prompt = "You are helping with a Python project" });
await session2.SendAsync(new MessageOptions { Prompt = "You are helping with a TypeScript project" });
await session3.SendAsync(new MessageOptions { Prompt = "You are helping with a Go project" });

Console.WriteLine("Sent initial context to all sessions");

// Follow-up messages stay in their respective contexts
await session1.SendAsync(new MessageOptions { Prompt = "How do I create a virtual environment?" });
await session2.SendAsync(new MessageOptions { Prompt = "How do I set up tsconfig?" });
await session3.SendAsync(new MessageOptions { Prompt = "How do I initialize a module?" });

Console.WriteLine("Sent follow-up questions to each session");

// Clean up all sessions
await session1.DisposeAsync();
await session2.DisposeAsync();
await session3.DisposeAsync();

Console.WriteLine("All sessions destroyed successfully");

```