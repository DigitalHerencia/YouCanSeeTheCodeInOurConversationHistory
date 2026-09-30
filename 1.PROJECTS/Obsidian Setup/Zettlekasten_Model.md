# Zettelkasten Model

The Zettelkasten is the vault's knowledge-ingestion and note-processing system.

It provides a controlled path for bringing external material, AI conversations, saved web content, temporary thoughts, and supporting files into the vault, processing that material into useful notes, and moving durable material into the appropriate resource destination.

The Zettelkasten is not the final home for every piece of knowledge. It is the processing layer between capture and durable storage.

## Purpose

The Zettelkasten exists to:

- capture information from multiple sources without requiring immediate organization
    
- separate inbound material from processed material
    
- transform raw material into structured Markdown notes
    
- extract useful information from AI conversations
    
- process web clippings
    
- create temporary fleeting notes when material is not yet ready for permanent storage
    
- prepare literature for movement into `3.RESOURCES`
    
- stage attachments until they can be moved to their final destination
    
- preserve traceability between source material and processed notes
    
- prevent the main vault from becoming an unprocessed collection of captures

## Architecture

```text
                         INBOUND
                            │
        ┌───────────────────┼───────────────────┐
        │                   │                   │
      inbox             ai threads          clippings
        │                   │                   │
        └───────────────────┼───────────────────┘
                            │
                            ▼
                     PROCESSING LAYER
                            │
       ┌────────────────────┼────────────────────┐
       │                    │                    │
   Templater             QuickAdd           Note Refactor
       │                    │                    │
       ├─────────────── Convertor ───────────────┤
       │                    │                    │
       ├──────────── Callout Studio ─────────────┤
       │                    │                    │
       ├──────────────── Linter ─────────────────┤
       │                    │                    │
       └──────────────── Iconic ─────────────────┘
                            │
                            ▼
                         OUTBOUND
                            │
              ┌─────────────┼─────────────┐
              │             │             │
           fleeting         lit       attachments
              │             │             │
              │             ▼             ▼
              │       3.RESOURCES     Final destination
              │
              ▼
       Temporary knowledge
```

## Inbound Layer

The inbound layer consists of three folders.

### Inbox

`inbox` contains anything captured into the vault that can be processed through Note Refactor and a suitable template.

The inbox is intentionally broad. Its purpose is capture rather than classification.

Typical workflow:

```text
Capture
  ↓
Inbox
  ↓
Apply template
  ↓
Refactor / extract / combine
  ↓
Processed destination
```

Inbox material should not be treated as finished knowledge.

### AI Threads

`ai threads` contains Markdown exports of AI conversations.

AI conversations frequently contain multiple useful artifacts inside a single conversation. Processing therefore focuses on extracting useful material rather than preserving the conversation as one monolithic note.

Examples of material that may be extracted include:

- code
    
- implementation plans
    
- technical explanations
    
- decisions
    
- quotations
    
- passages
    
- research findings
    
- reusable knowledge
    
- project-related information

Typical workflow:

```text
AI conversation
      ↓
Markdown thread export
      ↓
AI Threads
      ↓
Identify useful sections
      ↓
Note Refactor / extraction
      ↓
Structured notes
      ↓
Appropriate destination
```

The exported conversation is source material. The resulting notes are the useful artifacts extracted from it.

### Clippings

`clippings` contains material captured through the official Obsidian Web Clipper.

Clippings provide source material for subsequent processing into notes, references, literature, or other appropriate destinations.

```text
Web source
   ↓
Obsidian Web Clipper
   ↓
Clippings
   ↓
Process
   ↓
Structured note / resource
```

## Processing Layer

The processing layer transforms inbound material into usable vault content.

### Templater

Templater applies the appropriate note template during processing.

It provides consistent structure for notes without requiring every note to be manually formatted.

### QuickAdd

QuickAdd handles rapid creation and insertion workflows.

Within the Zettelkasten it is used to:

- add inbound material to an existing note
    
- create notes from processed material
    
- orchestrate repeatable capture actions
    
- connect captured material to existing vault content

### Note Refactor

Note Refactor is the primary extraction and restructuring mechanism.

It is used to:

- split large notes
    
- combine notes
    
- extract useful sections
    
- turn captured material into atomic notes
    
- process AI conversation exports

### Convertor

Convertor changes material between supported formats when required by the processing workflow.

### Callout Studio

Callout Studio adds structured visual and traceability information to processed notes.

It is used where source context or additional visual distinction needs to remain visible in the resulting note.

### Linter

Linter normalizes Markdown style and keeps processed notes consistent with the vault's formatting conventions.

### Iconic

Iconic provides visual organization for notes and relevant navigation elements without relying on emoji as the vault's visual system.

## Outbound Layer

Processed material moves into one of three Zettelkasten outbound folders.

### Fleeting

`fleeting` contains temporary notes.

These notes represent useful information that has been captured or processed but does not yet warrant permanent placement elsewhere.

Fleeting notes are therefore intentionally lightweight and temporary.

```text
Captured thought
      ↓
Fleeting
      ↓
Use / develop / integrate
      ↓
Permanent destination or discard
```

### Lit

`lit` contains processed literature that is ready to become part of the Resources system.

It acts as a staging area between Zettelkasten processing and durable resource storage.

```text
Source material
      ↓
Processing
      ↓
Lit
      ↓
3.RESOURCES
```

### Attachments

`attachments` contains processed supporting files that are waiting to be moved to their final destination.

The Zettelkasten therefore handles the processing state of an attachment without becoming its permanent storage location.

```text
Captured attachment
       ↓
Attachments
       ↓
Determine final destination
       ↓
Move to destination
```

## Zettelkasten Lifecycle

The complete lifecycle is:

```text
CAPTURE
  │
  ├── Inbox
  ├── AI Threads
  └── Clippings
       │
       ▼
PROCESS
  │
  ├── Template
  ├── Extract
  ├── Refactor
  ├── Convert
  ├── Add traceability
  ├── Normalize
  └── Organize
       │
       ▼
CLASSIFY
  │
  ├── Fleeting
  ├── Literature
  └── Attachment
       │
       ▼
DESTINATION
  │
  ├── Permanent note
  ├── 3.RESOURCES
  └── Final attachment location
```

## Core Rules

1. Inbound folders are capture locations, not permanent knowledge locations.
    
2. AI thread exports are source material that should be extracted into useful notes.
    
3. Clippings are processed rather than treated as finished resources.
    
4. `fleeting` is temporary.
    
5. `lit` is staging for `3.RESOURCES`.
    
6. `attachments` is staging for final attachment destinations.
    
7. Templates provide structure; processing determines the appropriate final destination.
    
8. Processing should preserve source context and traceability.
    
9. The Zettelkasten is a pipeline, not a dumping ground.

## Relationship to Other Vault Systems

|System|Relationship|
|---|---|
|Library|Provides navigation, relationship discovery, metadata management, and knowledge visualization|
|Resources|Receives durable literature and reference material from Zettelkasten processing|
|Projects|May consume processed knowledge and source material|
|Code Lab|May consume technical knowledge, documentation, repositories, and extracted implementation material|
|Blog|May consume processed research and knowledge|
|Social|May consume processed research and source material|
|Archive|May ultimately receive inactive material after its useful lifecycle|

## Result

The Zettelkasten converts uncontrolled inbound information into structured, traceable vault material.

Its fundamental flow is:

**Capture → Process → Classify → Connect → Move to destination.**