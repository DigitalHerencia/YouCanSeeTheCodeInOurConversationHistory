---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\persisting_sessions.py'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\persisting_sessions.py'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.python.recipe.persisting-sessions.py'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\persisting_sessions.py'
source_file: 'persisting_sessions.py'
source_sha256: 'f1ca1c7989b986bf7fa721ce8eafca3d97a8688efc266cf931f0a204ca4d5b9a'
generated: true
---

# `persisting_sessions.py`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\python\recipe\persisting_sessions.py`
> SHA-256: `f1ca1c7989b986bf7fa721ce8eafca3d97a8688efc266cf931f0a204ca4d5b9a`

```python
#!/usr/bin/env python3

import asyncio
from copilot import CopilotClient, SessionConfig, MessageOptions, PermissionHandler

async def main():
    client = CopilotClient()
    await client.start()

    # Create session with a memorable ID
    session = await client.create_session(SessionConfig(
        session_id="user-123-conversation",
        model="gpt-5",
        on_permission_request=PermissionHandler.approve_all))

    await session.send_and_wait(MessageOptions(prompt="Let's discuss TypeScript generics"))
    print(f"Session created: {session.session_id}")

    # Destroy session but keep data on disk
    await session.destroy()
    print("Session destroyed (state persisted)")

    # Resume the previous session
    resumed = await client.resume_session("user-123-conversation", on_permission_request=PermissionHandler.approve_all)
    print(f"Resumed: {resumed.session_id}")

    await resumed.send_and_wait(MessageOptions(prompt="What were we discussing?"))

    # List sessions
    sessions = await client.list_sessions()
    print("Sessions:", [s.session_id for s in sessions])

    # Delete session permanently
    await client.delete_session("user-123-conversation")
    print("Session deleted")

    await resumed.destroy()
    await client.stop()

if __name__ == "__main__":
    asyncio.run(main())

```