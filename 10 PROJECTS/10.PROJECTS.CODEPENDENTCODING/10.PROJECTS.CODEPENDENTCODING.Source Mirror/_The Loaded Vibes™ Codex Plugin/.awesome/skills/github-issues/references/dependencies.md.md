---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\github-issues\references\dependencies.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\github-issues\references\dependencies.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.github-issues.references.dependencies.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\github-issues\references\dependencies.md'
source_file: 'dependencies.md'
source_sha256: '9503d23ba104de1aae51176e4f29d3cf6b85c83e3421252a4808140d60eba571'
generated: true
---

# `dependencies.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\github-issues\references\dependencies.md`
> SHA-256: `9503d23ba104de1aae51176e4f29d3cf6b85c83e3421252a4808140d60eba571`

````markdown
# Issue Dependencies (Blocked By / Blocking)

Dependencies let you mark that an issue is blocked by another issue. This creates a formal dependency relationship visible in the UI and trackable via API. No MCP tools exist for dependencies; use REST or GraphQL directly.

## Using REST API

**List issues blocking this issue:**
```
GET /repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocked_by
```

**Add a blocking dependency:**
```
POST /repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocked_by
Body: { "issue_id": 12345 }
```

The `issue_id` is the numeric issue **ID** (not the issue number).

**Remove a blocking dependency:**
```
DELETE /repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocked_by/{issue_id}
```

## Using GraphQL

**Read dependencies:**
```graphql
{
  repository(owner: "OWNER", name: "REPO") {
    issue(number: 123) {
      blockedBy(first: 10) { nodes { number title state } }
      blocking(first: 10) { nodes { number title state } }
      issueDependenciesSummary { blockedBy blocking totalBlockedBy totalBlocking }
    }
  }
}
```

**Add a dependency:**
```graphql
mutation {
  addBlockedBy(input: {
    issueId: "BLOCKED_ISSUE_NODE_ID"
    blockingIssueId: "BLOCKING_ISSUE_NODE_ID"
  }) {
    blockingIssue { number title }
  }
}
```

**Remove a dependency:**
```graphql
mutation {
  removeBlockedBy(input: {
    issueId: "BLOCKED_ISSUE_NODE_ID"
    blockingIssueId: "BLOCKING_ISSUE_NODE_ID"
  }) {
    blockingIssue { number title }
  }
}
```

## Tracked issues (read-only)

Task-list tracking relationships are available via GraphQL as read-only fields:

- `trackedIssues(first: N)` - issues tracked in this issue's task list
- `trackedInIssues(first: N)` - issues whose task lists reference this issue

These are set automatically when issues are referenced in task lists (`- [ ] #123`). There are no mutations to manage them.

````