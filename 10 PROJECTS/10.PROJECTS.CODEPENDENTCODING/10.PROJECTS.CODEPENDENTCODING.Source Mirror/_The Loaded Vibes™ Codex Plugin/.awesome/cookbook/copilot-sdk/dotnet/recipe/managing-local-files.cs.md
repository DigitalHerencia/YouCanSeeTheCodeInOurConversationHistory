---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\managing-local-files.cs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\managing-local-files.cs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.dotnet.recipe.managing-local-files.cs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\managing-local-files.cs'
source_file: 'managing-local-files.cs'
source_sha256: '904bb18fe2bc9c3e85a1b65e4dcb415709a726607224575408f0efa17ce8dd67'
generated: true
---

# `managing-local-files.cs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\managing-local-files.cs`
> SHA-256: `904bb18fe2bc9c3e85a1b65e4dcb415709a726607224575408f0efa17ce8dd67`

```csharp
#:package GitHub.Copilot.SDK@*
#:property PublishAot=false

// The GitHub.Copilot.SDK package exposes the GitHub.Copilot namespace.
using GitHub.Copilot;

// Create and start client
await using var client = new CopilotClient();
await client.StartAsync();

// Define tools for file operations
var session = await client.CreateSessionAsync(new SessionConfig
{
    Model = "gpt-5",
    OnPermissionRequest = PermissionHandler.ApproveAll
});

// Wait for completion
var done = new TaskCompletionSource();

session.On(evt =>
{
    switch (evt)
    {
        case AssistantMessageEvent msg:
            Console.WriteLine($"\nCopilot: {msg.Data.Content}");
            break;
        case ToolExecutionStartEvent toolStart:
            Console.WriteLine($"  → Running: {toolStart.Data.ToolName} ({toolStart.Data.ToolCallId})");
            break;
        case ToolExecutionCompleteEvent toolEnd:
            Console.WriteLine($"  ✓ Completed: {toolEnd.Data.ToolCallId}");
            break;
        case SessionIdleEvent:
            done.SetResult();
            break;
    }
});

// Ask Copilot to organize files
var targetFolder = args.FirstOrDefault() ?? Environment.CurrentDirectory;

await session.SendAsync(new MessageOptions
{
    Prompt = $"""
        Analyze the files in "{targetFolder}" and organize them into subfolders.

        1. First, list all files and their metadata
        2. Preview grouping by file extension
        3. Create appropriate subfolders (e.g., "images", "documents", "videos")
        4. Move each file to its appropriate subfolder

        Please confirm before moving any files.
        """
});

await done.Task;

```