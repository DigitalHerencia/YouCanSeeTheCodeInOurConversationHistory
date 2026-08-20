---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\scripts\appinsights.ps1'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\scripts\appinsights.ps1'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.appinsights-instrumentation.scripts.appinsights.ps1'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\scripts\appinsights.ps1'
source_file: 'appinsights.ps1'
source_sha256: '69e1ccdf00b138e9f7a245e8da1d28d0ac00112f2a6a05c76d4432cc16fe9919'
generated: true
---

# `appinsights.ps1`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\scripts\appinsights.ps1`
> SHA-256: `69e1ccdf00b138e9f7a245e8da1d28d0ac00112f2a6a05c76d4432cc16fe9919`

```powershell
# Create App Insights resource (3 steps)
## Add the Application Insights extension
az extension add -n application-insights
## Create a Log Analytics workspace
az monitor log-analytics workspace create --resource-group $resourceGroupName --workspace-name $logAnalyticsWorkspaceName --location $azureRegionName
## Create the Application Insights resource
az monitor app-insights component create --app $applicationInsightsResourceName --location $azureRegionName --resource-group $resourceGroupName --workspace $logAnalyticsWorkspaceName

# Query connection string of App Insights
az monitor app-insights component show --app $applicationInsightsResourceName --resource-group $resourceGroupName --query connectionString --output tsv

# Set environment variable of App Service
az webapp config appsettings set --resource-group $resourceGroupName --name $appName --settings $key=$value

# Set environment variable of Container App
# Or update an existing container app
az containerapp update -n $containerAppName -g $resourceGroupName --set-env-vars $key=$value

# Set environment variable of Function App
az functionapp config appsettings set --name $functionName --resource-group $ResourceGroupName --settings $key=$value

```