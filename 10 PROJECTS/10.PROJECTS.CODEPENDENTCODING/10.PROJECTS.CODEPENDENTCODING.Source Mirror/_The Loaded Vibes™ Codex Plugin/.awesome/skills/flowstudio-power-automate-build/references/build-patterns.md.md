---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\flowstudio-power-automate-build\references\build-patterns.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\flowstudio-power-automate-build\references\build-patterns.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.flowstudio-power-automate-build.references.build-patterns.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\flowstudio-power-automate-build\references\build-patterns.md'
source_file: 'build-patterns.md'
source_sha256: '9ea419e8a890aa14d01a4d2662e5622091d2c9f8f04b50643a92b9d9e28e76a0'
generated: true
---

# `build-patterns.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\flowstudio-power-automate-build\references\build-patterns.md`
> SHA-256: `9ea419e8a890aa14d01a4d2662e5622091d2c9f8f04b50643a92b9d9e28e76a0`

````markdown
# Common Build Patterns

Complete flow definition templates ready to copy and customize.

---

## Pattern: Recurrence + SharePoint list read + Teams notification

```json
{
  "triggers": {
    "Recurrence": {
      "type": "Recurrence",
      "recurrence": { "frequency": "Day", "interval": 1,
                       "startTime": "2026-01-01T08:00:00Z",
                       "timeZone": "AUS Eastern Standard Time" }
    }
  },
  "actions": {
    "Get_SP_Items": {
      "type": "OpenApiConnection",
      "runAfter": {},
      "inputs": {
        "host": {
          "apiId": "/providers/Microsoft.PowerApps/apis/shared_sharepointonline",
          "connectionName": "shared_sharepointonline",
          "operationId": "GetItems"
        },
        "parameters": {
          "dataset": "https://mytenant.sharepoint.com/sites/mysite",
          "table": "MyList",
          "$filter": "Status eq 'Active'",
          "$top": 500
        }
      }
    },
    "Apply_To_Each": {
      "type": "Foreach",
      "runAfter": { "Get_SP_Items": ["Succeeded"] },
      "foreach": "@outputs('Get_SP_Items')?['body/value']",
      "actions": {
        "Post_Teams_Message": {
          "type": "OpenApiConnection",
          "runAfter": {},
          "inputs": {
            "host": {
              "apiId": "/providers/Microsoft.PowerApps/apis/shared_teams",
              "connectionName": "shared_teams",
              "operationId": "PostMessageToConversation"
            },
            "parameters": {
              "poster": "Flow bot",
              "location": "Channel",
              "body/recipient": {
                "groupId": "<team-id>",
                "channelId": "<channel-id>"
              },
              "body/messageBody": "Item: @{items('Apply_To_Each')?['Title']}"
            }
          }
        }
      },
      "operationOptions": "Sequential"
    }
  }
}
```

---

## Pattern: HTTP trigger (webhook / Power App call)

```json
{
  "triggers": {
    "manual": {
      "type": "Request",
      "kind": "Http",
      "inputs": {
        "schema": {
          "type": "object",
          "properties": {
            "name": { "type": "string" },
            "value": { "type": "number" }
          }
        }
      }
    }
  },
  "actions": {
    "Compose_Response": {
      "type": "Compose",
      "runAfter": {},
      "inputs": "Received: @{triggerBody()?['name']} = @{triggerBody()?['value']}"
    },
    "Response": {
      "type": "Response",
      "runAfter": { "Compose_Response": ["Succeeded"] },
      "inputs": {
        "statusCode": 200,
        "body": { "status": "ok", "message": "@{outputs('Compose_Response')}" }
      }
    }
  }
}
```

Access body values: `@triggerBody()?['name']`

````