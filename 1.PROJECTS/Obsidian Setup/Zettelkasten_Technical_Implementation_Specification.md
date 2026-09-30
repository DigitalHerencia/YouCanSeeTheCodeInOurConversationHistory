# Zettelkasten Technical Implementation Specification

## Purpose

The Zettelkasten is the vault's knowledge-ingestion and note-processing system.

It is the controlled path between capture and durable knowledge/resource storage.

```text
Capture
  ↓
Zettelkasten ingest
  ↓
Processing
  ↓
Fleeting / Literature / durable notes
  ↓
3.RESOURCES when appropriate
```

## Inbound Folders

All inbound material enters through:

```text
2.AREAS/ZETTLECASTEN/Inbox
2.AREAS/ZETTLECASTEN/AI Threads
2.AREAS/ZETTLECASTEN/Clippings
```

Inbox is general capture.

AI Threads contains exported AI conversations.

Clippings contains saved web material.

## Processing

Processing uses the existing tools:

- Templater
- QuickAdd
- Note Refactor
- Convertor
- Callout Studio
- Linter
- Iconic

The tools perform transformations; the Zettelkasten model defines the flow.

## Outbound Folders

Processed material may move to:

```text
Fleeting
Literature
Attachments
```

Durable resources may be promoted into the appropriate category under:

```text
3.RESOURCES/
```

## AI Threads

An AI thread export is retained as a Markdown record.

Processing may extract:

- decisions;
- technical knowledge;
- reusable patterns;
- references;
- project information;
- learning material.

The archive of the original thread remains distinct from extracted notes.

## Web Clippings

The official Obsidian Web Clipper is the capture mechanism for saved web material.

Clippings are processed as source material rather than treated as finished notes.

## Inbox Processing Contract

```text
Inbox item
    ↓
inspect
    ↓
apply appropriate template
    ↓
refactor / clean
    ↓
classify
    ↓
link
    ↓
move or retain
```

The system must not silently delete source material.

## Relationship to Library

Zettelkasten processes information.

Library provides navigation and rediscovery.

```text
Zettelkasten → processing
Library → discovery
```

## Relationship to Resources

Resources are durable external/internal reference material.

Zettelkasten may produce or enrich resource records, but not every Zettelkasten note becomes a resource.

## Rules

1. Inbox is for material that still needs processing.
2. AI Threads preserve conversation provenance.
3. Clippings preserve source context.
4. Fleeting notes may remain temporary.
5. Literature notes capture source-derived understanding.
6. Attachments follow the vault's attachment policy.
7. Processing should create links rather than orphaning notes.
8. Do not use Zettelkasten as a generic project folder.
9. Do not treat raw captures as durable knowledge without processing.
10. Do not create duplicate records merely to move content between stages.

## Validation

The ingest system is implemented when each inbound source has a defined destination path, each processing tool has a bounded role, and a captured item can be traced through processing to its final destination.
