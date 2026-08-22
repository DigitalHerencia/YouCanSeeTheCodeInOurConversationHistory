---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\references\ASPNETCORE.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\references\ASPNETCORE.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.appinsights-instrumentation.references.aspnetcore.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\references\ASPNETCORE.md'
source_file: 'ASPNETCORE.md'
source_sha256: '29986d08a27b4d7a9086e89c1d56f9cc9b4e27bfd88ef65517f8bed641c7f636'
generated: true
---

# `ASPNETCORE.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\references\ASPNETCORE.md`
> SHA-256: `29986d08a27b4d7a9086e89c1d56f9cc9b4e27bfd88ef65517f8bed641c7f636`

````markdown
## Modify code

Make these necessary changes to the app.

- Install client library
```
dotnet add package Azure.Monitor.OpenTelemetry.AspNetCore
```

- Configure the app to use Azure Monitor
An ASP.NET Core app typically has a Program.cs file that "builds" the app. Find this file and apply these changes.
  - Add `using Azure.Monitor.OpenTelemetry.AspNetCore;` at the top
  - Before calling `builder.Build()`, add this line `builder.Services.AddOpenTelemetry().UseAzureMonitor();`.

> Note: since we modified the code of the app, the app needs to be deployed to take effect.

## Configure App Insights connection string

The App Insights resource has a connection string. Add the connection string as an environment variable of the running app. You can use Azure CLI to query the connection string of the App Insights resource. See [scripts/appinsights.ps1](../scripts/appinsights.ps1) for what Azure CLI command to execute for querying the connection string.

After getting the connection string, set this environment variable with its value.

```
"APPLICATIONINSIGHTS_CONNECTION_STRING={your_application_insights_connection_string}"
```

If the app has IaC template such as Bicep or terraform files representing its cloud instance, this environment variable should be added to the IaC template to be applied in each deployment. Otherwise, use Azure CLI to manually apply the environment variable to the cloud instance of the app. See [scripts/appinsights.ps1](../scripts/appinsights.ps1) for what Azure CLI command to execute for setting this environment variable.

> Important: Don't modify appsettings.json. It was a deprecated way to configure App Insights. The environment variable is the new recommended way.

````