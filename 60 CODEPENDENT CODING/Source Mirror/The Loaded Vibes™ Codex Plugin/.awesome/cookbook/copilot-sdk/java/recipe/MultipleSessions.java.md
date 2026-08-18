---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\MultipleSessions.java'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\MultipleSessions.java'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.java.recipe.multiplesessions.java'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\MultipleSessions.java'
source_file: 'MultipleSessions.java'
source_sha256: '1de641e38d3bf965a61cb9e2f6dcdbd0103ce68e2a56c1f737e37e5a12591893'
generated: true
---

# `MultipleSessions.java`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\MultipleSessions.java`
> SHA-256: `1de641e38d3bf965a61cb9e2f6dcdbd0103ce68e2a56c1f737e37e5a12591893`

```java
///usr/bin/env jbang "$0" "$@" ; exit $?
//DEPS com.github:copilot-sdk-java:0.2.1-java.1

import com.github.copilot.sdk.*;
import com.github.copilot.sdk.json.*;
import java.util.concurrent.CompletableFuture;

public class MultipleSessions {
    public static void main(String[] args) throws Exception {
        try (var client = new CopilotClient()) {
            client.start().get();

            var config = new SessionConfig()
                .setModel("gpt-5")
                .setOnPermissionRequest(PermissionHandler.APPROVE_ALL);

            // Create 3 sessions in parallel
            var f1 = client.createSession(config);
            var f2 = client.createSession(config);
            var f3 = client.createSession(new SessionConfig()
                .setModel("claude-sonnet-4.5")
                .setOnPermissionRequest(PermissionHandler.APPROVE_ALL));
            CompletableFuture.allOf(f1, f2, f3).get();

            var s1 = f1.get(); var s2 = f2.get(); var s3 = f3.get();

            // Send a message to each session
            System.out.println("S1: " + s1.sendAndWait(new MessageOptions().setPrompt("Explain Java records")).get().getData().content());
            System.out.println("S2: " + s2.sendAndWait(new MessageOptions().setPrompt("Explain sealed classes")).get().getData().content());
            System.out.println("S3: " + s3.sendAndWait(new MessageOptions().setPrompt("Explain pattern matching")).get().getData().content());

            // Clean up
            s1.close(); s2.close(); s3.close();
        }
    }
}

```