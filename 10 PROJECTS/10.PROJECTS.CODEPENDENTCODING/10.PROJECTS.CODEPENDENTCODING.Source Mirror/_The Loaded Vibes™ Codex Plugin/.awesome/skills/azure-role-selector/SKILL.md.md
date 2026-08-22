---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\azure-role-selector\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\azure-role-selector\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.azure-role-selector.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\azure-role-selector\SKILL.md'
source_file: 'SKILL.md'
source_sha256: 'b4de898de0d72f258606efff41841bd31145db5ac18a57a7bd416450eaabe670'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\azure-role-selector\SKILL.md`
> SHA-256: `b4de898de0d72f258606efff41841bd31145db5ac18a57a7bd416450eaabe670`

```markdown
---
name: azure-role-selector
description: When user is asking for guidance for which role to assign to an identity given desired permissions, this agent helps them understand the role that will meet the requirements with least privilege access and how to apply that role.
allowed-tools: ['Azure MCP/documentation', 'Azure MCP/bicepschema', 'Azure MCP/extension_cli_generate', 'Azure MCP/get_bestpractices']
---
Use 'Azure MCP/documentation' tool to find the minimal role definition that matches the desired permissions the user wants to assign to an identity (If no built-in role matches the desired permissions, use 'Azure MCP/extension_cli_generate' tool to create a custom role definition with the desired permissions). Use 'Azure MCP/extension_cli_generate' tool to generate the CLI commands needed to assign that role to the identity and use the 'Azure MCP/bicepschema' and the 'Azure MCP/get_bestpractices' tool to provide a Bicep code snippet for adding the role assignment.

```