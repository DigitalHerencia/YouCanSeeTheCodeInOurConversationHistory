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
created:
updated: 2026-08-08
---
# Obsidian Contract Property Schema

## Required Properties for Durable Notes

```
---
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
created:
updated:
---
```

Properties must remain present even when their values are empty.

## Property Meanings

|Property|Meaning|
|---|---|
|`title`|Human-readable note title.|
|`type`|Broad note class.|
|`scope`|Boundary governed or described by the note.|
|`project`|Owning project when applicable.|
|`domain`|Topic, rule boundary, or functional area.|
|`artifact`|Specific subject inside the domain.|
|`kind`|Specific document shape.|
|`namespace`|Stable dot-notation semantic identity.|
|`status`|Current lifecycle state.|
|`authority`|How the note should be treated as a source.|
|`parent`|Primary parent map or note.|
|`depends_on`|Notes required to understand or apply this note.|
|`supersedes`|Older notes replaced by this note.|
|`tags`|Search and filtering labels.|
|`created`|Original creation date when known.|
|`updated`|Date of the last meaningful change.|

## Standard Type and Kind Values

```
contract
map
workflow
reference
research
writing
execution
template
dashboard
standard
legacy
capture
source-document
work-package
handoff
checklist
schema
```

The `type` property identifies the broad note class.

The `kind` property identifies the specific document shape. It may match `type`.

## Standard Scope Values

```
vault
project
domain
feature
module
operation
reference
```

## Standard Status Values

```
draft
active
review
deprecated
superseded
archived
legacy
```

## Standard Authority Values

```
source-of-truth
working-note
reference
derived
legacy
archive
```

## Example

```
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
created:
updated:
---
```

## Rule

Every durable note should be discoverable through its:

- folder
- namespace
- project or scope
- domain
- type
- kind
- status
- authority