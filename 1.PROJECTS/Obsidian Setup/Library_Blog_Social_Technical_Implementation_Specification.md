# Library, Blog & Social Technical Implementation Specification

## Purpose

Library, Blog, and Social form the vault's knowledge-navigation and publishing layer.

Library supports discovery and relationship navigation. Blog and Social turn selected knowledge into public-facing content and share a publishing calendar/planner.

## Library

Library works with:

- Markdown notes;
- images;
- backlinks;
- outgoing links;
- graph;
- tags;
- bookmarks;
- properties;
- footnotes;
- Bases;
- QuickAdd.

Library does not own the underlying notes.

## Blog

Blog is the creative-writing and publishing lab.

It should support:

- drafts;
- long-form posts;
- source references;
- media;
- review;
- publication state;
- links to related Library and Resource material.

## Social

Social is the social-content lab.

It should support:

- short-form posts;
- threads;
- images;
- GIFs/memes;
- platform-specific variants;
- publication state;
- related Blog/Library references.

## Shared Publishing Planner

Blog and Social share a calendar/planner.

They retain separate content contexts and templates.

```text
Blog content ─┐
              ├── Publishing Calendar
Social content┘
```

The planner presents schedule state; it does not replace the content records.

## Workflow

```text
Library / Resources
        ↓
Idea / source
        ↓
Blog or Social draft
        ↓
Review
        ↓
Schedule
        ↓
Publish
        ↓
Archive / retain published record
```

## Media

Media files remain separate from Markdown content and follow the vault's attachment rules.

The system should support images, GIFs, and memes without embedding binary content directly into the content model.

## Rules

1. Library is for discovery.
2. Blog is for long-form creative work.
3. Social is for social publishing.
4. The publishing calendar is shared.
5. Content records remain distinct.
6. Source links should be preserved.
7. Publication state should be represented in note properties.
8. No publishing workflow should duplicate the underlying source note.

## Validation

The system is implemented when Library navigation works, Blog and Social have distinct content records, both can be scheduled through the shared planner, and source relationships remain navigable.
