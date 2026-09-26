# Hearth Workflow

Hearth Automation is a local Obsidian plugin implemented with the Obsidian Plugin, Vault, MetadataCache, Workspace, and FileManager APIs. It runs on project/task changes, starts with reconciliation, refreshes Daily generated regions when opening a Daily note, and exposes explicit reconciliation commands. It writes only machine-managed identifiers, timestamps, progress, health, counts, and next action; user state remains under Meta Bind.

Templater scripts provide repeatable project-pack generation and an explicit fallback for relation reconciliation and Daily refresh. QuickAdd handles on-demand meeting generation and TaskNotes task creation.

All relations are resolved from explicit wikilinks. Missing source relations remain repair items. Daily refresh only replaces text between generated markers; text between human markers remains unchanged.
