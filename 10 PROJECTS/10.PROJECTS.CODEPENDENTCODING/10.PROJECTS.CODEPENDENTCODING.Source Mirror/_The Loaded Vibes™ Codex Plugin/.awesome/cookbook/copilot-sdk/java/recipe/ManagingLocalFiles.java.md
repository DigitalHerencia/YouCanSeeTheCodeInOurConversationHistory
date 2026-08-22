---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\ManagingLocalFiles.java'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\ManagingLocalFiles.java'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.java.recipe.managinglocalfiles.java'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\ManagingLocalFiles.java'
source_file: 'ManagingLocalFiles.java'
source_sha256: '14f7ce9dd334883b36c3983d2306ee26e53c04b5b8308d5003d2d3f9e6a96869'
generated: true
---

# `ManagingLocalFiles.java`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\ManagingLocalFiles.java`
> SHA-256: `14f7ce9dd334883b36c3983d2306ee26e53c04b5b8308d5003d2d3f9e6a96869`

```java
///usr/bin/env jbang "$0" "$@" ; exit $?
//DEPS com.github:copilot-sdk-java:0.2.1-java.1

import com.github.copilot.sdk.CopilotClient;
import com.github.copilot.sdk.events.AssistantMessageEvent;
import com.github.copilot.sdk.events.SessionIdleEvent;
import com.github.copilot.sdk.events.ToolExecutionCompleteEvent;
import com.github.copilot.sdk.events.ToolExecutionStartEvent;
import com.github.copilot.sdk.json.MessageOptions;
import com.github.copilot.sdk.json.PermissionHandler;
import com.github.copilot.sdk.json.SessionConfig;
import java.util.concurrent.CountDownLatch;

public class ManagingLocalFiles {
    public static void main(String[] args) throws Exception {
        try (var client = new CopilotClient()) {
            client.start().get();

            // Create session
            var session = client.createSession(
                new SessionConfig().setOnPermissionRequest(PermissionHandler.APPROVE_ALL).setModel("gpt-5")).get();

            // Set up event handlers
            var done = new CountDownLatch(1);

            session.on(AssistantMessageEvent.class, msg -> 
                System.out.println("\nCopilot: " + msg.getData().content())
            );

            session.on(ToolExecutionStartEvent.class, evt -> 
                System.out.println("  → Running: " + evt.getData().toolName())
            );

            session.on(ToolExecutionCompleteEvent.class, evt -> 
                System.out.println("  ✓ Completed: " + evt.getData().toolCallId())
            );

            session.on(SessionIdleEvent.class, evt -> done.countDown());

            // Ask Copilot to organize files - using a safe example folder
            // For real use, replace with your target folder
            String targetFolder = args.length > 0 ? args[0] : 
                System.getProperty("java.io.tmpdir") + "/example-files";

            String prompt = String.format("""
                Analyze the files in "%s" and show how you would organize them into subfolders.

                1. First, list all files and their metadata
                2. Preview grouping by file extension
                3. Suggest appropriate subfolders (e.g., "images", "documents", "videos")
                
                IMPORTANT: DO NOT move any files. Only show the plan.
                """, targetFolder);

            session.send(new MessageOptions().setPrompt(prompt));

            // Wait for completion
            done.await();

            session.close();
        }
    }
}

```