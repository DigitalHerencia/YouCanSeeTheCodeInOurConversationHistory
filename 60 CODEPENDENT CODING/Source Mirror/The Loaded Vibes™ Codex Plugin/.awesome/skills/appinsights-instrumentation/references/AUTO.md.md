---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\references\AUTO.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\references\AUTO.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.appinsights-instrumentation.references.auto.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\references\AUTO.md'
source_file: 'AUTO.md'
source_sha256: '8a0a447289e232dc54909017b4a490b46ca5fc1eb90099645eeb99b1b9a8a732'
generated: true
---

# `AUTO.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\references\AUTO.md`
> SHA-256: `8a0a447289e232dc54909017b4a490b46ca5fc1eb90099645eeb99b1b9a8a732`

````markdown
# Auto-instrument app

Use Azure Portal to auto-instrument a webapp hosted in Azure App Service for App Insights without making any code changes. Only the following types of app can be auto-instrumented. See [supported environments and resource providers](https://learn.microsoft.com/azure/azure-monitor/app/codeless-overview#supported-environments-languages-and-resource-providers).

- ASP.NET Core app hosted in Azure App Service
- Node.js app hosted in Azure App Service

Construct a url to bring the user to the Application Insights blade in Azure Portal for the App Service App.
```
https://portal.azure.com/#resource/subscriptions/{subscription_id}/resourceGroups/{resource_group_name}/providers/Microsoft.Web/sites/{app_service_name}/monitoringSettings
```

Use the context or ask the user to get the subscription_id, resource_group_name, and the app_service_name hosting the webapp.

````