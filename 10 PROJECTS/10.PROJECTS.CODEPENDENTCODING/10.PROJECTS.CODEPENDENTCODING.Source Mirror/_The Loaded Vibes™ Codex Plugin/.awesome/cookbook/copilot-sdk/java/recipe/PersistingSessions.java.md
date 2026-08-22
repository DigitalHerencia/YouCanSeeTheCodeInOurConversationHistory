---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\PersistingSessions.java'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\PersistingSessions.java'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.java.recipe.persistingsessions.java'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\PersistingSessions.java'
source_file: 'PersistingSessions.java'
source_sha256: '6136007ed5c900ef9ac10e02539b402ba6cdd1ba54e051f5a4657032347f0612'
generated: true
---

# `PersistingSessions.java`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\PersistingSessions.java`
> SHA-256: `6136007ed5c900ef9ac10e02539b402ba6cdd1ba54e051f5a4657032347f0612`

```java
///usr/bin/env jbang "$0" "$@" ; exit $?
//DEPS com.github:copilot-sdk-java:0.2.1-java.1

import com.github.copilot.sdk.*;
import com.github.copilot.sdk.events.*;
import com.github.copilot.sdk.json.*;

public class PersistingSessions {
    public static void main(String[] args) throws Exception {
        try (var client = new CopilotClient()) {
            client.start().get();

            // Create a session with a custom ID so we can resume it later
            var session = client.createSession(
                new SessionConfig()
                    .setOnPermissionRequest(PermissionHandler.APPROVE_ALL)
                    .setSessionId("user-123-conversation")
                    .setModel("gpt-5")
            ).get();

            session.on(AssistantMessageEvent.class,
                msg -> System.out.println(msg.getData().content()));

            session.sendAndWait(new MessageOptions()
                .setPrompt("Let's discuss TypeScript generics")).get();

            System.out.println("\nSession ID: " + session.getSessionId());

            // Close session but keep data on disk for later resumption
            session.close();
            System.out.println("Session closed — data persisted to disk.");
        }
    }
}

```