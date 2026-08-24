# Plugin Configuration Plan

## Keep/configure
Hearth, Meta Bind, Callout Studio, Note Toolbar, Code Space, Templater, Obsidian Git, Linter (mechanical only), Table Editor, Note Refactor.

## Recommended additions after the schema pilot
TaskNotes, QuickAdd, Image Converter, Iconic.

Optional later: Excalidraw, Omnisearch.

## Current-state implications
- Meta Bind currently has no reusable control templates.
- Note Toolbar currently has no default/folder mappings.
- Hearth currently uses an experimental dashboard and old template launchers.
- Callout Studio already has the correct semantic vocabulary.
- Templater currently has one folder-auto-template mapping.
- The existing custom CSS is currently disabled.

## Strategy
Build stable user-owned assets under `_obsidian/` first; then configure plugin internals to consume them. Plugin JSON is implementation detail, not canonical knowledge.
