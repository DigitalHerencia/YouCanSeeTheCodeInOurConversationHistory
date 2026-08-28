---
title: Meta Bind Control Catalog
role: DevNotes
system: DevNotes
workspace:
type: reference
status: Active
authority: Reference
created: 2026-08-28
updated: 2026-08-28
tags:
  - obsidian
  - meta-bind
  - properties
  - interface
---

# Meta Bind Control Catalog

## Principle

**Meta Bind changes state. Note Toolbar performs actions.**

The control layer exposes shared mutable Properties without making plugin configuration the semantic authority.

## Core controls

| Property | Control | Values / Shape |
| --- | --- | --- |
| `status` — work | `dn-status-task` | Backlog, Ready, In Progress, Blocked, Done, Cancelled |
| `status` — knowledge | `dn-status-knowledge` | Draft, Review, Active, Superseded, Archived |
| `status` — validation evidence | `dn-status-validation` | Passed, Failed, Skipped, Blocked, Inferred |
| `authority` | `dn-authority` | Source of Truth, Working, Reference, Derived, Historical |
| `role` | `dn-role` | Eight responsibility domains |
| `workspace` | `dn-text` | free text |
| `priority` | `dn-priority` | Low, Normal, High, Critical |
| `health` | `dn-health` | On Track, At Risk, Blocked, Paused |
| `progress` | `dn-progress` | 0–100 |
| `target` | `dn-date` | date |
| `scheduled` | `dn-date` | date |
| `due` | `dn-date` | date |

## Authority rule

The discarded authority values `canonical`, `supporting`, `implementation-evidence`, `project-specific`, and `operational` are not active options and must not be regenerated.

## Ownership

The semantic definitions come from [[Role Manifest Specification]] and [[Metadata and Knowledge Graph Contract]]. This catalog only documents the configured editing surface.
