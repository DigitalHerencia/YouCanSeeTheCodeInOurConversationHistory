---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\metadata-python.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\metadata-python.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.metadata-python.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\metadata-python.md'
source_file: 'metadata-python.md'
source_sha256: 'f058bd2c15c6f273d51859273e89b942685c35fb954fc723c54d94455a4022fc'
generated: true
---

# `metadata-python.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\metadata-python.md`
> SHA-256: `f058bd2c15c6f273d51859273e89b942685c35fb954fc723c54d94455a4022fc`

````markdown
# Phoenix Tracing: Custom Metadata (Python)

Add custom attributes to spans for richer observability.

## Install

```bash
pip install arize-phoenix-otel  # context managers and SpanAttributes re-exported since 0.16.0
```

## Session

```python
from phoenix.otel import using_session

with using_session(session_id="my-session-id"):
    # Spans get: "session.id" = "my-session-id"
    ...
```

## User

```python
from phoenix.otel import using_user

with using_user("my-user-id"):
    # Spans get: "user.id" = "my-user-id"
    ...
```

## Metadata

```python
from phoenix.otel import using_metadata

with using_metadata({"key": "value", "experiment_id": "exp_123"}):
    # Spans get: "metadata" = '{"key": "value", "experiment_id": "exp_123"}'
    ...
```

## Tags

```python
from phoenix.otel import using_tags

with using_tags(["tag_1", "tag_2"]):
    # Spans get: "tag.tags" = '["tag_1", "tag_2"]'
    ...
```

## Combined (using_attributes)

```python
from phoenix.otel import using_attributes

with using_attributes(
    session_id="my-session-id",
    user_id="my-user-id",
    metadata={"environment": "production"},
    tags=["prod", "v2"],
    prompt_template="Answer: {question}",
    prompt_template_version="v1.0",
    prompt_template_variables={"question": "What is Phoenix?"},
):
    # All attributes applied to spans in this context
    ...
```

## On a Single Span

```python
span.set_attribute("metadata", json.dumps({"key": "value"}))
span.set_attribute("user.id", "user_123")
span.set_attribute("session.id", "session_456")
```

## As Decorators

All context managers can be used as decorators:

```python
from phoenix.otel import using_session, using_user, using_metadata

@using_session(session_id="my-session-id")
@using_user("my-user-id")
@using_metadata({"env": "prod"})
def my_function():
    ...
```

````