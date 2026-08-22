---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\ErrorHandling.java'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\ErrorHandling.java'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.cookbook.copilot-sdk.java.recipe.errorhandling.java'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\ErrorHandling.java'
source_file: 'ErrorHandling.java'
source_sha256: 'd9c46227ab4e0f2190fa68ebc181ddd72e893bec5dbfde22f844ae8d0a8c1358'
generated: true
---

# `ErrorHandling.java`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\cookbook\copilot-sdk\java\recipe\ErrorHandling.java`
> SHA-256: `d9c46227ab4e0f2190fa68ebc181ddd72e893bec5dbfde22f844ae8d0a8c1358`

```java
///usr/bin/env jbang "$0" "$@" ; exit $?
//DEPS com.github:copilot-sdk-java:0.2.1-java.1

import com.github.copilot.sdk.*;
import com.github.copilot.sdk.events.*;
import com.github.copilot.sdk.json.*;
import java.util.concurrent.ExecutionException;

public class ErrorHandling {
    public static void main(String[] args) {
        try (var client = new CopilotClient()) {
            client.start().get();

            try (var session = client.createSession(
                new SessionConfig()
                    .setOnPermissionRequest(PermissionHandler.APPROVE_ALL)
                    .setModel("gpt-5")).get()) {

                session.on(AssistantMessageEvent.class,
                    msg -> System.out.println(msg.getData().content()));

                session.sendAndWait(
                    new MessageOptions().setPrompt("Hello!")).get();
            }
        } catch (ExecutionException ex) {
            Throwable cause = ex.getCause();
            Throwable error = cause != null ? cause : ex;
            System.err.println("Error: " + error.getMessage());
            error.printStackTrace();
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
            System.err.println("Interrupted: " + ex.getMessage());
            ex.printStackTrace();
        } catch (Exception ex) {
            System.err.println("Error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }
}

```