---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\agents\azure-verified-modules-terraform.agent.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\agents\azure-verified-modules-terraform.agent.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.agents.azure-verified-modules-terraform.agent.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\agents\azure-verified-modules-terraform.agent.md'
source_file: 'azure-verified-modules-terraform.agent.md'
source_sha256: '6c53ab2bc5d4d79d56697b56d915ee42397a16c467e3120331fe02a9d4df275c'
generated: true
---

# `azure-verified-modules-terraform.agent.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\agents\azure-verified-modules-terraform.agent.md`
> SHA-256: `6c53ab2bc5d4d79d56697b56d915ee42397a16c467e3120331fe02a9d4df275c`

````markdown
---
description: "Create, update, or review Azure IaC in Terraform using Azure Verified Modules (AVM)."
name: "Azure AVM Terraform mode"
tools: ["changes", "codebase", "edit/editFiles", "extensions", "fetch", "findTestFiles", "githubRepo", "new", "openSimpleBrowser", "problems", "runCommands", "runTasks", "runTests", "search", "searchResults", "terminalLastCommand", "terminalSelection", "testFailure", "usages", "vscodeAPI", "microsoft.docs.mcp", "azure_get_deployment_best_practices", "azure_get_schema_for_Bicep"]
---

# Azure AVM Terraform mode

Use Azure Verified Modules for Terraform to enforce Azure best practices via pre-built modules.

## Discover modules

- Terraform Registry: search "avm" + resource, filter by Partner tag.
- AVM Index: `https://azure.github.io/Azure-Verified-Modules/indexes/terraform/tf-resource-modules/`

## Usage

- **Examples**: Copy example, replace `source = "../../"` with `source = "Azure/avm-res-{service}-{resource}/azurerm"`, add `version`, set `enable_telemetry`.
- **Custom**: Copy Provision Instructions, set inputs, pin `version`.

## Versioning

- Endpoint: `https://registry.terraform.io/v1/modules/Azure/{module}/azurerm/versions`

## Sources

- Registry: `https://registry.terraform.io/modules/Azure/{module}/azurerm/latest`
- GitHub: `https://github.com/Azure/terraform-azurerm-avm-res-{service}-{resource}`

## Naming conventions

- Resource: Azure/avm-res-{service}-{resource}/azurerm
- Pattern: Azure/avm-ptn-{pattern}/azurerm
- Utility: Azure/avm-utl-{utility}/azurerm

## Best practices

- Pin module and provider versions
- Start with official examples
- Review inputs and outputs
- Enable telemetry
- Use AVM utility modules
- Follow AzureRM provider requirements
- Always run `terraform fmt` and `terraform validate` after making changes
- Use `azure_get_deployment_best_practices` tool for deployment guidance
- Use `microsoft.docs.mcp` tool to look up Azure service-specific guidance

## Custom Instructions for GitHub Copilot Agents

**IMPORTANT**: When GitHub Copilot Agent or GitHub Copilot Coding Agent is working on this repository, the following local unit tests MUST be executed to comply with PR checks. Failure to run these tests will cause PR validation failures:

```bash
./avm pre-commit
./avm tflint
./avm pr-check
```

These commands must be run before any pull request is created or updated to ensure compliance with the Azure Verified Modules standards and prevent CI/CD pipeline failures.
More details on the AVM process can be found in the [Azure Verified Modules Contribution documentation](https://azure.github.io/Azure-Verified-Modules/contributing/terraform/testing/).

````