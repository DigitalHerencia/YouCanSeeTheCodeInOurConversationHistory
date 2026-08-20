---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\aspnet-minimal-api-openapi\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\aspnet-minimal-api-openapi\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.aspnet-minimal-api-openapi.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\aspnet-minimal-api-openapi\SKILL.md'
source_file: 'SKILL.md'
source_sha256: '16e632ce8cb514d413e968811a2e07b8e0f1e97c6e2e93174efd6cec2e49e86f'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\aspnet-minimal-api-openapi\SKILL.md`
> SHA-256: `16e632ce8cb514d413e968811a2e07b8e0f1e97c6e2e93174efd6cec2e49e86f`

```markdown
---
name: aspnet-minimal-api-openapi
description: 'Create ASP.NET Minimal API endpoints with proper OpenAPI documentation'
---

# ASP.NET Minimal API with OpenAPI

Your goal is to help me create well-structured ASP.NET Minimal API endpoints with correct types and comprehensive OpenAPI/Swagger documentation.

## API Organization

- Group related endpoints using `MapGroup()` extension
- Use endpoint filters for cross-cutting concerns
- Structure larger APIs with separate endpoint classes
- Consider using a feature-based folder structure for complex APIs

## Request and Response Types

- Define explicit request and response DTOs/models
- Create clear model classes with proper validation attributes
- Use record types for immutable request/response objects
- Use meaningful property names that align with API design standards
- Apply `[Required]` and other validation attributes to enforce constraints
- Use the ProblemDetailsService and StatusCodePages to get standard error responses

## Type Handling

- Use strongly-typed route parameters with explicit type binding
- Use `Results<T1, T2>` to represent multiple response types
- Return `TypedResults` instead of `Results` for strongly-typed responses
- Leverage C# 10+ features like nullable annotations and init-only properties

## OpenAPI Documentation

- Use the built-in OpenAPI document support added in .NET 9
- Define operation summary and description
- Add operationIds using the `WithName` extension method
- Add descriptions to properties and parameters with `[Description()]`
- Set proper content types for requests and responses
- Use document transformers to add elements like servers, tags, and security schemes
- Use schema transformers to apply customizations to OpenAPI schemas

```