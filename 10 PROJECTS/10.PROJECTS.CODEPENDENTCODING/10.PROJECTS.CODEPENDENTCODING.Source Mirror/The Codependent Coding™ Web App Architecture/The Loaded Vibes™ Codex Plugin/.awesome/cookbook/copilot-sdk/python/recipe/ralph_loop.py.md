---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\ralph_loop.py'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\ralph_loop.py'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.python.recipe.ralph-loop.py'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\ralph_loop.py'
source_file: 'ralph_loop.py'
source_sha256: 'a3ca3ceb46ad966ad3ba02d9a19afe705f93a6e31813ef2890c19fd29ea69794'
generated: true
---

# `ralph_loop.py`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\ralph_loop.py`
> SHA-256: `a3ca3ceb46ad966ad3ba02d9a19afe705f93a6e31813ef2890c19fd29ea69794`

```python
#!/usr/bin/env python3

"""
Ralph loop: autonomous AI task loop with fresh context per iteration.

Two modes:
  - "plan": reads PROMPT_plan.md, generates/updates IMPLEMENTATION_PLAN.md
  - "build": reads PROMPT_build.md, implements tasks, runs tests, commits

Each iteration creates a fresh session so the agent always operates in
the "smart zone" of its context window. State is shared between
iterations via files on disk (IMPLEMENTATION_PLAN.md, AGENTS.md, specs/*).

Usage:
  python ralph_loop.py              # build mode, 50 iterations
  python ralph_loop.py plan         # planning mode
  python ralph_loop.py 20           # build mode, 20 iterations
  python ralph_loop.py plan 5       # planning mode, 5 iterations
"""

import asyncio
import sys
from pathlib import Path

from copilot import CopilotClient, MessageOptions, SessionConfig, PermissionHandler


async def ralph_loop(mode: str = "build", max_iterations: int = 50):
    prompt_file = "PROMPT_plan.md" if mode == "plan" else "PROMPT_build.md"

    client = CopilotClient()
    await client.start()

    print("━" * 40)
    print(f"Mode:   {mode}")
    print(f"Prompt: {prompt_file}")
    print(f"Max:    {max_iterations} iterations")
    print("━" * 40)

    try:
        prompt = Path(prompt_file).read_text()

        for i in range(1, max_iterations + 1):
            print(f"\n=== Iteration {i}/{max_iterations} ===")

            session = await client.create_session(SessionConfig(
                model="gpt-5.1-codex-mini",
                # Pin the agent to the project directory
                working_directory=str(Path.cwd()),
                # Auto-approve tool calls for unattended operation
                on_permission_request=PermissionHandler.approve_all,
            ))

            # Log tool usage for visibility
            def log_tool_event(event):
                if event.type.value == "tool.execution_start":
                    print(f"  ⚙ {event.data.tool_name}")

            session.on(log_tool_event)
            try:
                await session.send_and_wait(
                    MessageOptions(prompt=prompt), timeout=600
                )
            finally:
                await session.destroy()

            print(f"\nIteration {i} complete.")

        print(f"\nReached max iterations: {max_iterations}")
    finally:
        await client.stop()


if __name__ == "__main__":
    args = sys.argv[1:]
    mode = "plan" if "plan" in args else "build"
    max_iter = next((int(a) for a in args if a.isdigit()), 50)
    asyncio.run(ralph_loop(mode, max_iter))

```