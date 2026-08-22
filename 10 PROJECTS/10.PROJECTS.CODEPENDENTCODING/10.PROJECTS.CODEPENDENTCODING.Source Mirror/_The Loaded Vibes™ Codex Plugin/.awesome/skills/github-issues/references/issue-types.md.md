---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\github-issues\references\issue-types.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\github-issues\references\issue-types.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.github-issues.references.issue-types.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\github-issues\references\issue-types.md'
source_file: 'issue-types.md'
source_sha256: 'be0a33a4a4a15ce92c6b589f19943813b69c25cd1f20e9e30df567bab50e5e63'
generated: true
---

# `issue-types.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\github-issues\references\issue-types.md`
> SHA-256: `be0a33a4a4a15ce92c6b589f19943813b69c25cd1f20e9e30df567bab50e5e63`

````markdown
# Issue Types (Advanced GraphQL)

Issue types (Bug, Feature, Task, Epic, etc.) are defined at the **organization** level and inherited by repositories. They categorize issues beyond labels.

For basic usage, the MCP tools handle issue types natively. Call `mcp__github__list_issue_types` to discover types, and pass `type: "Bug"` to `mcp__github__create_issue` or `mcp__github__update_issue`. This reference covers advanced GraphQL operations.

## GraphQL Feature Header

All GraphQL issue type operations require the `GraphQL-Features: issue_types` HTTP header.

## List types (org or repo level)

```graphql
# Header: GraphQL-Features: issue_types
{
  organization(login: "OWNER") {
    issueTypes(first: 20) {
      nodes { id name color description isEnabled }
    }
  }
}
```

Types can also be listed per-repo via `repository.issueTypes` or looked up by name via `repository.issueType(name: "Bug")`.

## Read an issue's type

```graphql
# Header: GraphQL-Features: issue_types
{
  repository(owner: "OWNER", name: "REPO") {
    issue(number: 123) {
      issueType { id name color }
    }
  }
}
```

## Set type on an existing issue

```graphql
# Header: GraphQL-Features: issue_types
mutation {
  updateIssueIssueType(input: {
    issueId: "ISSUE_NODE_ID"
    issueTypeId: "IT_xxx"
  }) {
    issue { id issueType { name } }
  }
}
```

## Create issue with type

```graphql
# Header: GraphQL-Features: issue_types
mutation {
  createIssue(input: {
    repositoryId: "REPO_NODE_ID"
    title: "Fix login bug"
    issueTypeId: "IT_xxx"
  }) {
    issue { id number issueType { name } }
  }
}
```

To clear the type, set `issueTypeId` to `null`.

## Available colors

`GRAY`, `BLUE`, `GREEN`, `YELLOW`, `ORANGE`, `RED`, `PINK`, `PURPLE`

````