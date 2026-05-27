---
title: "court-gesture.contract"
type: reference
scope: vault
project:
domain: inbox
artifact: court.gesture.contract
kind: source-code
namespace: inbox.source.court.gesture.contract
status: review
authority: archive
parent: "[[devnotes.zettelkasten.map]]"
depends_on: []
supersedes: []
tags:
  - inbox
  - imports/source-code
  - status/review
created: 2026-05-27
updated: 2026-05-27
source_file: "00 ZETTELKASTEN/INBOX/court-gesture.contract.yaml"
source_hash: "49A28DCFDE25D0161E7AB6B24DC5C7E68CE8DB136573D43FC8DBCD44138F0C39"
---
# court-gesture.contract

```yaml
schemaVersion: 1
name: "court-gesture"
description: "Structured-data contract for rebuilding the Court Gesture Obsidian note."
paths:
  data: "_OPS/court-gesture.data.json"
  output: "_OPS/Court Gesture.md"
  source: "_OPS/Court Gesture.source.md"
document:
  title: "Court Gesture"
  requiredFields: ["schemaVersion", "title", "sections"]
  sectionRequiredFields: ["title", "headingLevel", "bodyMarkdown"]
  allowedTopLevelSections: ["Authorities & Reference Materials", "Constitutional Authorities", "New Mexico Supreme Court Authorities", "Secondary Authorities", "Arguments", "Strategies", "Motion Matrix", "Motions", "Templates / Drafting Forms", "Templates"]
  canonicalTopLevelOrder: ["Authorities & Reference Materials", "Constitutional Authorities", "New Mexico Supreme Court Authorities", "Secondary Authorities", "Arguments", "Strategies", "Motion Matrix", "Motions", "Templates / Drafting Forms"]
  deterministicOrdering: true
assembly:
  headingStyle: "obsidian"
  preserveBodyMarkdown: true
  normalizeFinalNewline: true
  topLevelHeadingDepth: 2
validation:
  failOnMissingRequiredFields: true
  failOnUnknownTopLevelSections: true
  failOnEmptySectionTitle: true
  failOnEmptyBodyMarkdown: false

```
