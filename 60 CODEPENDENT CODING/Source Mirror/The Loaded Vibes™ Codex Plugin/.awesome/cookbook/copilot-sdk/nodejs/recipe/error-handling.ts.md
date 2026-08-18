---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\error-handling.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\error-handling.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.nodejs.recipe.error-handling.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\error-handling.ts'
source_file: 'error-handling.ts'
source_sha256: '9ae4eceb781046f31cc2b98744b6f2f4e45b68113d98686b57dbf3eb55eaa16f'
generated: true
---

# `error-handling.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\nodejs\recipe\error-handling.ts`
> SHA-256: `9ae4eceb781046f31cc2b98744b6f2f4e45b68113d98686b57dbf3eb55eaa16f`

```ts
import { CopilotClient, approveAll } from "@github/copilot-sdk";

const client = new CopilotClient();

try {
    await client.start();
    const session = await client.createSession({
        onPermissionRequest: approveAll,
        model: "gpt-5",
    });

    const response = await session.sendAndWait({ prompt: "Hello!" });
    console.log(response?.data.content);

    await session.destroy();
} catch (error: any) {
    console.error("Error:", error.message);
} finally {
    await client.stop();
}

```