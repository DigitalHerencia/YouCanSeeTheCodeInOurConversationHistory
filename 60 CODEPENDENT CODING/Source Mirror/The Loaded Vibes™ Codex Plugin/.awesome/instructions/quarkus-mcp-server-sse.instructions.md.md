---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\quarkus-mcp-server-sse.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\quarkus-mcp-server-sse.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.quarkus-mcp-server-sse.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\quarkus-mcp-server-sse.instructions.md'
source_file: 'quarkus-mcp-server-sse.instructions.md'
source_sha256: '54bd0071354ee83a2b441a14e4b8c3f03ccfbcecd2a82e87e3b9eb16ef33133f'
generated: true
---

# `quarkus-mcp-server-sse.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\quarkus-mcp-server-sse.instructions.md`
> SHA-256: `54bd0071354ee83a2b441a14e4b8c3f03ccfbcecd2a82e87e3b9eb16ef33133f`

````markdown
---
applyTo: '*'
description: 'Quarkus and MCP Server with HTTP SSE transport development standards and instructions'
---
# Quarkus MCP Server

Build MCP servers with Java 21, Quarkus, and HTTP SSE transport.

## Stack

- Java 21 with Quarkus Framework
- MCP Server Extension: `mcp-server-sse`
- CDI for dependency injection
- MCP Endpoint: `http://localhost:8080/mcp/sse`

## Quick Start

```bash
quarkus create app --no-code -x rest-client-jackson,qute,mcp-server-sse your-domain-mcp-server
```

## Structure

- Use standard Java naming conventions (PascalCase classes, camelCase methods)
- Organize in packages: `model`, `repository`, `service`, `mcp`
- Use Record types for immutable data models
- State management for immutable data must be managed by repository layer
- Add Javadoc for public methods

## MCP Tools

- Must be public methods in `@ApplicationScoped` CDI beans
- Use `@Tool(name="tool_name", description="clear description")`
- Never return `null` - return error messages instead
- Always validate parameters and handle errors gracefully

## Architecture

- Separate concerns: MCP tools → Service layer → Repository
- Use `@Inject` for dependency injection
- Make data operations thread-safe
- Use `Optional<T>` to avoid null pointer exceptions

## Common Issues

- Don't put business logic in MCP tools (use service layer)
- Don't throw exceptions from tools (return error strings)
- Don't forget to validate input parameters
- Test with edge cases (null, empty inputs)

````