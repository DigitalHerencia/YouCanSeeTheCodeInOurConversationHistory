# Resources & Archive Model

`3.RESOURCES` and `4.ARCHIVE` are the durable storage layers of the vault.

Resources contains material that remains useful as reference knowledge. Archive contains material that is no longer part of the active working environment but should be retained.

Together they provide the long-term lifecycle beyond the active Areas and Projects.

---

# Resources

## Purpose

`3.RESOURCES` contains durable reference material that the user expects to retain and reuse.

Resources are typically the final destination for material processed through the Zettelkasten.

The Resource system provides structured categories so different types of reference material can be stored consistently.

## Resource Categories

The Resource model uses the following resource types:

|Resource Type|Purpose|
|---|---|
|Articles|Published written articles and similar source material|
|Books|Books and book-related reference material|
|Documentation|Technical, product, platform, or other documentation|
|General|Reference material that does not require a more specific category|
|Knowledge|Durable knowledge extracted or developed from source material|
|Media|Durable media resources|
|Repositories|Code repositories and repository-related reference material|

These categories provide the template model used when creating resource notes.

## Resource Templates

### Articles

The Article template structures reference material originating from published articles.

It provides a consistent place for source information, relevant notes, links, and extracted knowledge.

### Books

The Book template structures references to books and associated knowledge.

Book material can contain source information, notes, quotations, and relationships to other vault knowledge.

### Documentation

The Documentation template structures technical or product documentation.

Documentation is particularly relevant to Code Lab and projects where external specifications or implementation references need to remain available.

### General

The General template handles reference material that does not naturally fit the other resource types.

### Knowledge

The Knowledge template represents durable knowledge that has been processed sufficiently to remain useful independently of the original capture workflow.

### Media

The Media template provides structure for durable media resources.

### Repositories

The Repository template structures references to source-code repositories and related development resources.

Repositories may be relevant to Code Lab, Projects, or general technical research.

---

# Resource Lifecycle

Resources commonly originate from Zettelkasten processing.

```text
External / Captured Material
            ↓
        Zettelkasten
            ↓
         Processing
            ↓
            Lit
            ↓
      3.RESOURCES
            ↓
       Durable use
```

Resources can subsequently be consumed by other systems:

```text
                    RESOURCES
                        │
       ┌────────────────┼────────────────┐
       │                │                │
    Projects         Code Lab         Library
       │                │                │
       └────────────────┼────────────────┘
                        │
                 Blog / Social
```

A resource should therefore be treated as reusable reference material rather than a one-time capture.

---

# Resource Relationships

Resources should remain connected to the rest of the vault through links, tags, properties, and other Library mechanisms where those relationships are meaningful.

Examples include:

```text
Article
  ├── related Knowledge
  ├── related Project
  ├── related Code Lab domain
  └── related Blog/Social content

Repository
  ├── related Project
  ├── related Code Lab patterns
  └── related Documentation

Book
  ├── extracted Knowledge
  ├── related topics
  └── related Projects
```

The Resource system therefore provides durable material while the Library provides mechanisms for discovering its relationships.

---

# Resource Creation

Resource creation should normally occur through the appropriate template and processing workflow.

```text
Capture
   ↓
Zettelkasten
   ↓
Process
   ↓
Select resource type
   ↓
Apply resource template
   ↓
Move into 3.RESOURCES
   ↓
Connect to existing knowledge
```

This keeps the distinction between processing and durable storage clear.

---

# Archive

## Purpose

`4.ARCHIVE` contains material that is no longer part of the active working environment but must remain available for historical reference.

Archive is a lifecycle destination, not an active workspace.

Its purpose is preservation rather than continued production.

## What Belongs in Archive

Material may enter Archive when it has become:

- inactive
    
- completed
    
- superseded
    
- obsolete
    
- no longer part of current work
    
- retained for historical or reference purposes

The important characteristic is that the material is no longer part of the active operating environment.

## Archive Lifecycle

```text
ACTIVE MATERIAL
      │
      ├── Project
      ├── Area
      └── Resource
            │
            ▼
       No longer active
            │
            ▼
         ARCHIVE
            │
            ▼
     Historical reference
```

Archive therefore represents a lifecycle transition rather than a second active organizational system.

## Archive Preservation

Moving material into Archive should preserve its useful context.

Where applicable, archived material should retain:

- its existing note identity
    
- meaningful metadata
    
- links to related material
    
- project or area relationships
    
- relevant historical context

Archiving should not unnecessarily destroy the relationships that make the material understandable.

## Archive and Active Systems

```text
                  ACTIVE VAULT
                       │
       ┌───────────────┼────────────────┐
       │               │                │
    Projects         Areas          Resources
       │               │                │
       └───────────────┼────────────────┘
                       │
                lifecycle complete
                       │
                       ▼
                    ARCHIVE
```

Archived material may still be discovered through Library relationships and vault search.

Archive does not replace deletion when material has no retention value; it exists for material that should remain available but should no longer occupy the active workspace.

---

# Resources vs Archive

The distinction is based on activity and expected reuse.

|Dimension|Resources|Archive|
|---|---|---|
|Purpose|Active reference|Historical retention|
|Status|Useful and reusable|Inactive or completed|
|Normal workflow|Consumed by Projects, Areas, Code Lab, Library, Blog, Social|Retrieved when historical context is needed|
|Creation|Often produced through Zettelkasten processing|Produced by lifecycle transitions|
|Active organization|Yes|No|
|Knowledge reuse|Expected|Occasional|
|Publishing/workflow role|Active input|Historical reference|

The distinction can be summarized as:

**Resources are retained because they remain useful. Archive is retained because the material remains worth keeping.**

---

# Overall Knowledge Lifecycle

The combined model is:

```text
CAPTURE
   │
   ▼
ZETTELKASTEN
   │
   ├── Fleeting
   ├── Processed notes
   ├── Literature
   └── Attachments
           │
           ▼
      3.RESOURCES
           │
           ├── Articles
           ├── Books
           ├── Documentation
           ├── General
           ├── Knowledge
           ├── Media
           └── Repositories
                    │
                    ▼
              Active reuse
                    │
       ┌────────────┼────────────┐
       │            │            │
    Projects     Code Lab   Blog / Social
       │            │            │
       └────────────┼────────────┘
                    │
                    ▼
             No longer active
                    │
                    ▼
               4.ARCHIVE
```

# Relationship to the Complete Vault

The major systems now form a coherent lifecycle:

```text
                    CAPTURE
                       │
                       ▼
                 ZETTELKASTEN
                       │
                 process / extract
                       │
                       ▼
                  RESOURCES
                       │
                connect / discover
                       │
                       ▼
                    LIBRARY
                       │
          ┌────────────┼────────────┐
          │            │            │
       PROJECTS      CODE LAB    PUBLISHING
                                   │
                              ┌────┴────┐
                              │         │
                            BLOG      SOCIAL
                              │         │
                              └────┬────┘
                                   │
                                publish
                                   │
                                   ▼
                                ARCHIVE
```

## Core Rules

1. `3.RESOURCES` contains durable reference material.
    
2. Resource types are Articles, Books, Documentation, General, Knowledge, Media, and Repositories.
    
3. Each resource type has an appropriate template.
    
4. Zettelkasten `lit` acts as staging before material enters Resources.
    
5. Resources are intended for continued reuse.
    
6. Library provides the mechanisms for discovering and managing relationships among resources and other vault content.
    
7. Archive is a lifecycle destination for inactive material.
    
8. Archive is not an active workspace.
    
9. Archiving should preserve useful context and relationships.
    
10. Resources and Archive are distinguished by continued usefulness versus historical retention.

## Result

The Resources and Archive layers provide the long-term lifecycle of vault material.

The complete distinction is:

**Zettelkasten processes information → Resources retain useful knowledge → Library connects and exposes it → Projects, Code Lab, Blog, and Social use it → Archive preserves material when its active lifecycle ends.**