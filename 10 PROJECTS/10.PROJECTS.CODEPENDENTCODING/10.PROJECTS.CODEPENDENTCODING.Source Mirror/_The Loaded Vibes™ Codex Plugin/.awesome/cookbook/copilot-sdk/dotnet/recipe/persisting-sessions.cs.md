---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\persisting-sessions.cs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\persisting-sessions.cs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.dotnet.recipe.persisting-sessions.cs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\persisting-sessions.cs'
source_file: 'persisting-sessions.cs'
source_sha256: 'ad03998a288a0ddcee8d1a664b82c98e3e952c851255aca98e63ffb56c899867'
generated: true
---

# `persisting-sessions.cs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\persisting-sessions.cs`
> SHA-256: `ad03998a288a0ddcee8d1a664b82c98e3e952c851255aca98e63ffb56c899867`

```csharp
#:package GitHub.Copilot.SDK@*
#:property PublishAot=false

// The GitHub.Copilot.SDK package exposes the GitHub.Copilot namespace.
using GitHub.Copilot;

await using var client = new CopilotClient();
await client.StartAsync();

// Create session with a memorable ID
var session = await client.CreateSessionAsync(new SessionConfig
{
    SessionId = "user-123-conversation",
    Model = "gpt-5",
    OnPermissionRequest = PermissionHandler.ApproveAll
});

await session.SendAsync(new MessageOptions { Prompt = "Let's discuss TypeScript generics" });
Console.WriteLine($"Session created: {session.SessionId}");

// Destroy session but keep data on disk
await session.DisposeAsync();
Console.WriteLine("Session destroyed (state persisted)");

// Resume the previous session
var resumed = await client.ResumeSessionAsync("user-123-conversation", new ResumeSessionConfig { OnPermissionRequest = PermissionHandler.ApproveAll });
Console.WriteLine($"Resumed: {resumed.SessionId}");

await resumed.SendAsync(new MessageOptions { Prompt = "What were we discussing?" });

// List sessions
var sessions = await client.ListSessionsAsync();
Console.WriteLine("Sessions: " + string.Join(", ", sessions.Select(s => s.SessionId)));

// Delete session permanently
await client.DeleteSessionAsync("user-123-conversation");
Console.WriteLine("Session deleted");

await resumed.DisposeAsync();
await client.StopAsync();

```