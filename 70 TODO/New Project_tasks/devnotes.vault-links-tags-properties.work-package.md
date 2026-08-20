---
pm-task: true
projectId: "aujyaujimsy9s0iz"
parentId:
id: "0yoroeikmsy9yu7x"
title: "devnotes.vault-links-tags-properties.work-package"
type: "task"
status: "todo"
priority: "medium"
start: "2026-08-18"
due: ""
progress: 0
assignees: []
tags: []
subtaskIds: []
dependencies: []
createdAt: "2026-08-18T06:21:47.517Z"
updatedAt: "2026-08-18T06:21:47.517Z"
---

# Rebuild Backlinks, Tags, Properties, and Maps After the Architecture Migration

**Priority:** P1  
**Phase:** Vault Infrastructure  
**Task status:** Backlog

## Outcome

Restore Obsidian-native discoverability after canonical notes move, rename, supersede, and split.

## Why This Exists

The vault’s contracts require durable notes to be discoverable through folder, namespace, project/scope, domain, type/kind, status, and authority.

## Execution Checklist

- [ ] Update `parent`, `depends_on`, and `supersedes` properties.
- [ ] Update backlinks/wikilinks to renamed/moved canonical notes.
- [ ] Normalize project/domain/status tags.
- [ ] Add aliases for major branded/human-readable terms where useful.
- [ ] Update Zettelkasten, project, tech-stack, Codependent Coding, and Obsidian maps.
- [ ] Check for orphaned canonical notes.
- [ ] Check for links still pointing to superseded authorities.
- [ ] Preserve archive/provenance links without surfacing them as primary guidance.
- [ ] Run vault lint/link checks supported by the current setup.

## Acceptance Criteria

- [ ] Canonical notes are reachable from relevant maps.
- [ ] No known important backlinks target obsolete authority when a replacement exists.
- [ ] Required frontmatter is present and semantically correct.
- [ ] Deprecated/archive status is visible in queries.

## Dependencies

- [[devnotes.project-folder-realignment.work-package]]

## Source Basis

- `obsidian.contracts.naming-standard.md`
- `obsidian.contracts.property-schema.md`
- `obsidian.contracts.note-types.md`

## Execution Notes

- Verify current repository/vault state before editing; this note is a planning baseline derived from the current corpus, not a claim that the task is still untouched.
- Preserve unrelated work and existing provenance.
- Do not mark acceptance criteria complete without fresh evidence appropriate to the task.

Project: [[New Project|New Project]]