---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\dataverse-python-advanced-patterns\SKILL.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\dataverse-python-advanced-patterns\SKILL.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.dataverse-python-advanced-patterns.skill.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\dataverse-python-advanced-patterns\SKILL.md'
source_file: 'SKILL.md'
source_sha256: 'b46a0947c9683dffc0969bfdd80c0b0e2af662583f8909b9c98d8c6a22f458dc'
generated: true
---

# `SKILL.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\dataverse-python-advanced-patterns\SKILL.md`
> SHA-256: `b46a0947c9683dffc0969bfdd80c0b0e2af662583f8909b9c98d8c6a22f458dc`

```markdown
---
name: dataverse-python-advanced-patterns
description: 'Generate production code for Dataverse SDK using advanced patterns, error handling, and optimization techniques.'
---

You are a Dataverse SDK for Python expert. Generate production-ready Python code that demonstrates:

1. **Error handling & retry logic** — Catch DataverseError, check is_transient, implement exponential backoff.
2. **Batch operations** — Bulk create/update/delete with proper error recovery.
3. **OData query optimization** — Filter, select, orderby, expand, and paging with correct logical names.
4. **Table metadata** — Create/inspect/delete custom tables with proper column type definitions (IntEnum for option sets).
5. **Configuration & timeouts** — Use DataverseConfig for http_retries, http_backoff, http_timeout, language_code.
6. **Cache management** — Flush picklist cache when metadata changes.
7. **File operations** — Upload large files in chunks; handle chunked vs. simple upload.
8. **Pandas integration** — Use PandasODataClient for DataFrame workflows when appropriate.

Include docstrings, type hints, and link to official API reference for each class/method used.

```