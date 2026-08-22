---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\csharp-mcp-server.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\csharp-mcp-server.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.csharp-mcp-server.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\csharp-mcp-server.instructions.md'
source_file: 'csharp-mcp-server.instructions.md'
source_sha256: '02f65c83c1506a049f5da12fb31d6682c4bd67f4cb3af904183c2b7376c2e0bc'
generated: true
---

# `csharp-mcp-server.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\csharp-mcp-server.instructions.md`
> SHA-256: `02f65c83c1506a049f5da12fb31d6682c4bd67f4cb3af904183c2b7376c2e0bc`

````markdown
---
description: 'Instructions for building Model Context Protocol (MCP) servers using the C# SDK'
applyTo: '**/*.cs, **/*.csproj'
---

# C# MCP Server Development

## Instructions

- Use the **ModelContextProtocol** NuGet package (prerelease) for most projects: `dotnet add package ModelContextProtocol --prerelease`
- Use **ModelContextProtocol.AspNetCore** for HTTP-based MCP servers
- Use **ModelContextProtocol.Core** for minimal dependencies (client-only or low-level server APIs)
- Always configure logging to stderr using `LogToStandardErrorThreshold = LogLevel.Trace` to avoid interfering with stdio transport
- Use the `[McpServerToolType]` attribute on classes containing MCP tools
- Use the `[McpServerTool]` attribute on methods to expose them as tools
- Use the `[Description]` attribute from `System.ComponentModel` to document tools and parameters
- Support dependency injection in tool methods - inject `McpServer`, `HttpClient`, or other services as parameters
- Use `McpServer.AsSamplingChatClient()` to make sampling requests back to the client from within tools
- Expose prompts using `[McpServerPromptType]` on classes and `[McpServerPrompt]` on methods
- For stdio transport, use `WithStdioServerTransport()` when building the server
- Use `WithToolsFromAssembly()` to auto-discover and register all tools from the current assembly
- Tool methods can be synchronous or async (return `Task` or `Task<T>`)
- Always include comprehensive descriptions for tools and parameters to help LLMs understand their purpose
- Use `CancellationToken` parameters in async tools for proper cancellation support
- Return simple types (string, int, etc.) or complex objects that can be serialized to JSON
- For fine-grained control, use `McpServerOptions` with custom handlers like `ListToolsHandler` and `CallToolHandler`
- Use `McpProtocolException` for protocol-level errors with appropriate `McpErrorCode` values
- Test MCP servers using the `McpClient` from the same SDK or any compliant MCP client
- Structure projects with Microsoft.Extensions.Hosting for proper DI and lifecycle management

## Best Practices

- Keep tool methods focused and single-purpose
- Use meaningful tool names that clearly indicate their function
- Provide detailed descriptions that explain what the tool does, what parameters it expects, and what it returns
- Validate input parameters and throw `McpProtocolException` with `McpErrorCode.InvalidParams` for invalid inputs
- Use structured logging to help with debugging without polluting stdout
- Organize related tools into logical classes with `[McpServerToolType]`
- Consider security implications when exposing tools that access external resources
- Use the built-in DI container to manage service lifetimes and dependencies
- Implement proper error handling and return meaningful error messages
- Test tools individually before integrating with LLMs

## Common Patterns

### Basic Server Setup
```csharp
var builder = Host.CreateApplicationBuilder(args);
builder.Logging.AddConsole(options => 
    options.LogToStandardErrorThreshold = LogLevel.Trace);
builder.Services
    .AddMcpServer()
    .WithStdioServerTransport()
    .WithToolsFromAssembly();
await builder.Build().RunAsync();
```

### Simple Tool
```csharp
[McpServerToolType]
public static class MyTools
{
    [McpServerTool, Description("Description of what the tool does")]
    public static string ToolName(
        [Description("Parameter description")] string param) => 
        $"Result: {param}";
}
```

### Tool with Dependency Injection
```csharp
[McpServerTool, Description("Fetches data from a URL")]
public static async Task<string> FetchData(
    HttpClient httpClient,
    [Description("The URL to fetch")] string url,
    CancellationToken cancellationToken) =>
    await httpClient.GetStringAsync(url, cancellationToken);
```

### Tool with Sampling
```csharp
[McpServerTool, Description("Analyzes content using the client's LLM")]
public static async Task<string> Analyze(
    McpServer server,
    [Description("Content to analyze")] string content,
    CancellationToken cancellationToken)
{
    var messages = new ChatMessage[]
    {
        new(ChatRole.User, $"Analyze this: {content}")
    };
    return await server.AsSamplingChatClient()
        .GetResponseAsync(messages, cancellationToken: cancellationToken);
}
```

````