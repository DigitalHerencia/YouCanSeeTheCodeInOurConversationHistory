---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\error-handling.cs'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\error-handling.cs'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.dotnet.recipe.error-handling.cs'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\error-handling.cs'
source_file: 'error-handling.cs'
source_sha256: 'a7c90aa0344d674dba9ed916ba1c373add5ade63ca763ab5ee6463a179a3cb08'
generated: true
---

# `error-handling.cs`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\dotnet\recipe\error-handling.cs`
> SHA-256: `a7c90aa0344d674dba9ed916ba1c373add5ade63ca763ab5ee6463a179a3cb08`

```csharp
#:package GitHub.Copilot.SDK@*
#:property PublishAot=false

// The GitHub.Copilot.SDK package exposes the GitHub.Copilot namespace.
using GitHub.Copilot;

var client = new CopilotClient();

try
{
    await client.StartAsync();
    var session = await client.CreateSessionAsync(new SessionConfig
    {
        Model = "gpt-5",
        OnPermissionRequest = PermissionHandler.ApproveAll
    });

    var done = new TaskCompletionSource<string>();
    session.On(evt =>
    {
        if (evt is AssistantMessageEvent msg)
        {
            done.SetResult(msg.Data.Content);
        }
    });

    await session.SendAsync(new MessageOptions { Prompt = "Hello!" });
    var response = await done.Task;
    Console.WriteLine(response);

    await session.DisposeAsync();
}
catch (Exception ex)
{
    Console.WriteLine($"Error: {ex.Message}");
}
finally
{
    await client.StopAsync();
}

```