---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\error_handling.py'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\error_handling.py'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.python.recipe.error-handling.py'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\error_handling.py'
source_file: 'error_handling.py'
source_sha256: 'b6868ed230d54d4ab660e5e0521589bf91a01d12af4ae08881631af23d7de1f3'
generated: true
---

# `error_handling.py`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\error_handling.py`
> SHA-256: `b6868ed230d54d4ab660e5e0521589bf91a01d12af4ae08881631af23d7de1f3`

```python
#!/usr/bin/env python3

import asyncio
from copilot import CopilotClient, SessionConfig, MessageOptions, PermissionHandler

async def main():
    client = CopilotClient()

    try:
        await client.start()
        session = await client.create_session(SessionConfig(model="gpt-5",
        on_permission_request=PermissionHandler.approve_all))

        response = await session.send_and_wait(MessageOptions(prompt="Hello!"))

        if response:
            print(response.data.content)

        await session.destroy()
    except Exception as e:
        print(f"Error: {e}")
    finally:
        await client.stop()

if __name__ == "__main__":
    asyncio.run(main())

```