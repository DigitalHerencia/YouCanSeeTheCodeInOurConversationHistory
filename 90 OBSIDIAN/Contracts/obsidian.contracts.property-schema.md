---
title: Obsidian Contract Property Schema
type: standard
scope: vault
project:
domain: obsidian
artifact: properties
kind: schema
namespace: obsidian.contracts.property-schema
status: active
authority: source-of-truth
parent: "[[obsidian.contracts.naming-standard]]"
depends_on:
  - "[[obsidian.contracts.naming-standard]]"
supersedes: []
tags:
  - obsidian/contracts
  - obsidian/properties
  - status/active
---

# Obsidian Contract Property Schema

## Required Properties for Durable Notes

    title:
    type:
    scope:
    project:
    domain:
    artifact:
    kind:
    namespace:
    status:
    authority:
    parent:
    depends_on:
    supersedes:
    tags:

## Property Meanings

| Property | Meaning |
|---|---|
| title | Human-readable title. |
| type | Broad note class: contract, map, workflow, reference, research, writing, execution. |
| scope | Boundary: vault, project, domain, feature, module, operation, reference. |
| project | Owning project when applicable. |
| domain | Rule boundary or topic area. |
| artifact | Specific thing inside the domain. |
| kind | Specific note kind. |
| namespace | Dot-notation semantic address. |
| status | Lifecycle state. |
| authority | Whether the note is source-of-truth, reference, draft, legacy, etc. |
| parent | Primary parent note or map. |
| depends_on | Notes this note relies on. |
| supersedes | Older notes replaced by this note. |
| tags | Search and filter labels. |

## Example

    ---
    title: RateLtd Commands Registry Contract
    type: contract
    scope: project
    project: RateLtd
    domain: commands
    artifact: registry
    kind: contract
    namespace: rateltd.commands.registry.contract
    status: active
    authority: source-of-truth
    parent: "[[rateltd.project.map]]"
    depends_on:
      - "[[rateltd.product.vision]]"
    supersedes: []
    tags:
      - projects/rateltd
      - contracts/commands
      - status/active
    ---

## Rule

Every serious note should be findable by:

- folder
- namespace
- project
- domain
- kind
- status
- authority
