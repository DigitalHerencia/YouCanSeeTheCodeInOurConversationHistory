---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\eval-driven-dev\references\runnable-examples\standalone-function.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\eval-driven-dev\references\runnable-examples\standalone-function.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.eval-driven-dev.references.runnable-examples.standalone-function.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\eval-driven-dev\references\runnable-examples\standalone-function.md'
source_file: 'standalone-function.md'
source_sha256: 'd8726623e0471c7cab0fde622bb02fe9a327b751839ea537019fdb8f83b8aaa3'
generated: true
---

# `standalone-function.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\eval-driven-dev\references\runnable-examples\standalone-function.md`
> SHA-256: `d8726623e0471c7cab0fde622bb02fe9a327b751839ea537019fdb8f83b8aaa3`

````markdown
# Runnable Example: Standalone Function (No Server)

**When the app is a plain Python function or module** — no web framework, no server, no infrastructure.

**Approach**: Import and call the function directly from `run()`. This is the simplest case.

```python
# pixie_qa/run_app.py
from pydantic import BaseModel
import pixie


class AppArgs(BaseModel):
    question: str


class AppRunnable(pixie.Runnable[AppArgs]):
    """Drives a standalone function for tracing and evaluation."""

    @classmethod
    def create(cls) -> "AppRunnable":
        return cls()

    async def run(self, args: AppArgs) -> None:
        from myapp.agent import answer_question
        await answer_question(args.question)
```

If the function is synchronous, wrap it with `asyncio.to_thread`:

```python
import asyncio

async def run(self, args: AppArgs) -> None:
    from myapp.agent import answer_question
    await asyncio.to_thread(answer_question, args.question)
```

If the function depends on an external service (e.g., a vector store), the `wrap(purpose="input")` calls you added in Step 2a handle it automatically — the registry injects test data in eval mode.

### When to use `setup()` / `teardown()`

Most standalone functions don't need lifecycle methods. Use them only when the function requires a shared resource (e.g., a pre-loaded embedding model, a database connection):

```python
class AppRunnable(pixie.Runnable[AppArgs]):
    _model: SomeModel

    @classmethod
    def create(cls) -> "AppRunnable":
        return cls()

    async def setup(self) -> None:
        from myapp.models import load_model
        self._model = load_model()

    async def run(self, args: AppArgs) -> None:
        from myapp.agent import answer_question
        await answer_question(args.question, model=self._model)
```

````