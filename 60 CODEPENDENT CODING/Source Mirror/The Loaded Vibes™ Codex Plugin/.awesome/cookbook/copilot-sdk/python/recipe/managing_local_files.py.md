---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\managing_local_files.py'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\managing_local_files.py'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.python.recipe.managing-local-files.py'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\managing_local_files.py'
source_file: 'managing_local_files.py'
source_sha256: '845a1dc5969a2460daf096bcc04febb8c076e87be5a8fe9bcf124366583b9af9'
generated: true
---

# `managing_local_files.py`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\managing_local_files.py`
> SHA-256: `845a1dc5969a2460daf096bcc04febb8c076e87be5a8fe9bcf124366583b9af9`

```python
#!/usr/bin/env python3

import asyncio
import os
from copilot import (
    CopilotClient,
    SessionConfig,
    MessageOptions,
    SessionEvent,
    PermissionHandler,
)

async def main():
    # Create and start client
    client = CopilotClient()
    await client.start()

    # Create session
    session = await client.create_session(SessionConfig(model="gpt-5",
        on_permission_request=PermissionHandler.approve_all))

    done = asyncio.Event()

    # Event handler
    def handle_event(event: SessionEvent):
        if event.type.value == "assistant.message":
            print(f"\nCopilot: {event.data.content}")
        elif event.type.value == "tool.execution_start":
            print(f"  → Running: {event.data.tool_name}")
        elif event.type.value == "tool.execution_complete":
            print(f"  ✓ Completed: {event.data.tool_call_id}")
        elif event.type.value == "session.idle":
            done.set()

    session.on(handle_event)

    # Ask Copilot to organize files
    # Change this to your target folder
    target_folder = os.path.expanduser("~/Downloads")

    await session.send(MessageOptions(prompt=f"""
Analyze the files in "{target_folder}" and organize them into subfolders.

1. First, list all files and their metadata
2. Preview grouping by file extension
3. Create appropriate subfolders (e.g., "images", "documents", "videos")
4. Move each file to its appropriate subfolder

Please confirm before moving any files.
"""))

    await done.wait()

    await session.destroy()
    await client.stop()

if __name__ == "__main__":
    asyncio.run(main())

```