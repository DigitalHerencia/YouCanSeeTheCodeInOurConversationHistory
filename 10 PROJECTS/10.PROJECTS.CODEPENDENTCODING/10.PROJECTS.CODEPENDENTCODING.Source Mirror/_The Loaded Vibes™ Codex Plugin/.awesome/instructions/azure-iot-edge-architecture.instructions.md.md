---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\azure-iot-edge-architecture.instructions.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\azure-iot-edge-architecture.instructions.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.instructions.azure-iot-edge-architecture.instructions.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\instructions\azure-iot-edge-architecture.instructions.md'
source_file: 'azure-iot-edge-architecture.instructions.md'
source_sha256: 'dbc55eb30ab7472b0a5559af00c5d0832f986ac05806086e1d7974602c685858'
generated: true
---

# `azure-iot-edge-architecture.instructions.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\instructions\azure-iot-edge-architecture.instructions.md`
> SHA-256: `dbc55eb30ab7472b0a5559af00c5d0832f986ac05806086e1d7974602c685858`

```markdown
---
description: 'Require Azure IoT Edge documentation review before proposing edge IoT architectures or Azure implementation guidance.'
applyTo: '**/*.bicep,**/*.tf,**/*iot*.md,**/*smart-city*.md,**/*edge*.md'
---

## Azure IoT Edge Architecture Instruction

When the task includes Azure IoT, Smart City, edge processing, gateway design, or disconnected edge scenarios, do this before providing architecture recommendations:

1. Review Azure IoT Edge documentation first:
   - https://learn.microsoft.com/azure/iot-edge/
   - https://learn.microsoft.com/es-es/azure/iot-edge/
2. Confirm key constraints from the documentation:
   - Runtime architecture
   - Supported systems
   - Version/release status
   - Relevant Linux/Windows quickstart path
3. Explicitly state that you reviewed the documentation, or state that it could not be consulted.
4. If the documentation was not accessible, continue with clearly labeled assumptions.

### Response Rules

- Never jump directly to a list of services without validating edge applicability first.
- Always explain why IoT Edge is or is not required.
- Include operational implications: update strategy, observability, and support model.
- Prioritize secure defaults: managed identity, least privilege, secret management, and network isolation.

```