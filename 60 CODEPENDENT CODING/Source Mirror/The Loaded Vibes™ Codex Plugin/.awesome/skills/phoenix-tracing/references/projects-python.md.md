---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\projects-python.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\projects-python.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.projects-python.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\projects-python.md'
source_file: 'projects-python.md'
source_sha256: 'fa887f8dd068c83d6c837f508980eac102f0a50deddfdd4a11ec11362248cf33'
generated: true
---

# `projects-python.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\projects-python.md`
> SHA-256: `fa887f8dd068c83d6c837f508980eac102f0a50deddfdd4a11ec11362248cf33`

````markdown
# Phoenix Tracing: Projects (Python)

**Organize traces by application using projects (Phoenix's top-level grouping).**

## Overview

Projects group traces for a single application or experiment.

**Use for:** Environments (dev/staging/prod), A/B testing, versioning

## Setup

### Environment Variable (Recommended)

```bash
export PHOENIX_PROJECT_NAME="my-app-prod"
```

```python
import os
os.environ["PHOENIX_PROJECT_NAME"] = "my-app-prod"
from phoenix.otel import register
register()  # Uses "my-app-prod"
```

### Code

```python
from phoenix.otel import register
register(project_name="my-app-prod")
```

## Use Cases

**Environments:**

```python
# Dev, staging, prod
register(project_name="my-app-dev")
register(project_name="my-app-staging")
register(project_name="my-app-prod")
```

**A/B Testing:**

```python
# Compare models
register(project_name="chatbot-gpt4")
register(project_name="chatbot-claude")
```

**Versioning:**

```python
# Track versions
register(project_name="my-app-v1")
register(project_name="my-app-v2")
```

## Switching Projects (Python Notebooks Only)

```python
from openinference.instrumentation import dangerously_using_project
from phoenix.otel import register

register(project_name="my-app")

# Switch temporarily for evals
with dangerously_using_project("my-eval-project"):
    run_evaluations()
```

**⚠️ Only use in notebooks/scripts, not production.**

````