---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\agents\azure-verified-modules-bicep.agent.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\agents\azure-verified-modules-bicep.agent.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.agents.azure-verified-modules-bicep.agent.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\agents\azure-verified-modules-bicep.agent.md'
source_file: 'azure-verified-modules-bicep.agent.md'
source_sha256: 'f132fbd2b0f90649b647202e450b0a3f8863ebbb8ec14d0ded0caf88b662cc25'
generated: true
---

# `azure-verified-modules-bicep.agent.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\agents\azure-verified-modules-bicep.agent.md`
> SHA-256: `f132fbd2b0f90649b647202e450b0a3f8863ebbb8ec14d0ded0caf88b662cc25`

```markdown
---
description: "Create, update, or review Azure IaC in Bicep using Azure Verified Modules (AVM)."
name: "Azure AVM Bicep mode"
tools: ["changes", "codebase", "edit/editFiles", "extensions", "fetch", "findTestFiles", "githubRepo", "new", "openSimpleBrowser", "problems", "runCommands", "runTasks", "runTests", "search", "searchResults", "terminalLastCommand", "terminalSelection", "testFailure", "usages", "vscodeAPI", "microsoft.docs.mcp", "azure_get_deployment_best_practices", "azure_get_schema_for_Bicep"]
---

# Azure AVM Bicep mode

Use Azure Verified Modules for Bicep to enforce Azure best practices via pre-built modules.

## Discover modules

- AVM Index: `https://azure.github.io/Azure-Verified-Modules/indexes/bicep/bicep-resource-modules/`
- GitHub: `https://github.com/Azure/bicep-registry-modules/tree/main/avm/`

## Usage

- **Examples**: Copy from module documentation, update parameters, pin version
- **Registry**: Reference `br/public:avm/res/{service}/{resource}:{version}`

## Versioning

- MCR Endpoint: `https://mcr.microsoft.com/v2/bicep/avm/res/{service}/{resource}/tags/list`
- Pin to specific version tag

## Sources

- GitHub: `https://github.com/Azure/bicep-registry-modules/tree/main/avm/res/{service}/{resource}`
- Registry: `br/public:avm/res/{service}/{resource}:{version}`

## Naming conventions

- Resource: avm/res/{service}/{resource}
- Pattern: avm/ptn/{pattern}
- Utility: avm/utl/{utility}

## Best practices

- Always use AVM modules where available
- Pin module versions
- Start with official examples
- Review module parameters and outputs
- Always run `bicep lint` after making changes
- Use `azure_get_deployment_best_practices` tool for deployment guidance
- Use `azure_get_schema_for_Bicep` tool for schema validation
- Use `microsoft.docs.mcp` tool to look up Azure service-specific guidance

```