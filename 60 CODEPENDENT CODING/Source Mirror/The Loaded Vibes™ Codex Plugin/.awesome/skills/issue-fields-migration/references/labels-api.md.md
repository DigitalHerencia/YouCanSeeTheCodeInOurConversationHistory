---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\issue-fields-migration\references\labels-api.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\issue-fields-migration\references\labels-api.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.issue-fields-migration.references.labels-api.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\issue-fields-migration\references\labels-api.md'
source_file: 'labels-api.md'
source_sha256: 'f3cc6afe3df9e5cf036dd4b869c4ae66c66541c77835d1d0d16838b49563e4dc'
generated: true
---

# `labels-api.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\issue-fields-migration\references\labels-api.md`
> SHA-256: `f3cc6afe3df9e5cf036dd4b869c4ae66c66541c77835d1d0d16838b49563e4dc`

````markdown
# Labels API Reference

Reference for GitHub Labels REST API endpoints used in the label migration flow.

## List Labels in a Repository

```
GET /repos/{owner}/{repo}/labels
```

Returns all labels defined on a repository. Paginated (max 100 per page).

**CLI shortcut:**

```bash
gh label list -R {owner}/{repo} --limit 1000 --json name,color,description
```

**Response fields:** `id`, `node_id`, `url`, `name`, `description`, `color`, `default`.

## List Issues by Label

```
GET /repos/{owner}/{repo}/issues?labels={label_name}&state=all&per_page=100
```

Returns issues (and pull requests) matching the label. Filter out PRs by checking `pull_request` field is absent.

**CLI shortcut:**

```bash
gh issue list -R {owner}/{repo} --label "{label_name}" --state all \
  --json number,title,labels --limit 1000
```

The `gh issue list` command automatically excludes PRs.

**Pagination:** use `--limit` in CLI or `page` query param in REST. For repos with >1000 matching issues, use cursor-based pagination via Link headers.

## Remove a Label from an Issue

```
DELETE /repos/{owner}/{repo}/issues/{issue_number}/labels/{label_name}
```

Removes a single label from an issue. Returns `200 OK` with the remaining labels on the issue.

**Important:** URL-encode label names with spaces or special characters:
- `good first issue` → `good%20first%20issue`
- `bug/critical` → `bug%2Fcritical`

**CLI shortcut:**

```bash
gh api /repos/{owner}/{repo}/issues/{number}/labels/{label_name} -X DELETE
```

## Add a Label to an Issue

```
POST /repos/{owner}/{repo}/issues/{issue_number}/labels
```

Body: `{"labels": ["label1", "label2"]}`

Not typically needed for migration, but useful for rollback scenarios.

## Notes

- Labels are repo-scoped. The same label name can exist independently in different repos.
- There is no MCP tool for listing repo labels. Use `gh label list` or the REST API.
- The MCP tool `mcp__github__list_issues` supports a `labels` filter for fetching issues by label.
- Label names are case-insensitive for matching purposes, but the API preserves the original casing.
- Maximum labels per issue: no hard limit, but practically dozens.

````