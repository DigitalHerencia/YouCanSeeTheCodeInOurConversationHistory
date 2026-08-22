---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\examples\appinsights.bicep'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\examples\appinsights.bicep'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.appinsights-instrumentation.examples.appinsights.bicep'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\examples\appinsights.bicep'
source_file: 'appinsights.bicep'
source_sha256: '35793f28333b37b4639f866b2204a48eebcab343f0e52ab44128a618a28eaacb'
generated: true
---

# `appinsights.bicep`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\appinsights-instrumentation\examples\appinsights.bicep`
> SHA-256: `35793f28333b37b4639f866b2204a48eebcab343f0e52ab44128a618a28eaacb`

```text
@description('Location for all resources')
param location string = resourceGroup().location

@description('Name for new Application Insights')
param name string

// Create Log Analytics Workspace
resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: '${name}-workspace'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

// Create Application Insights
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: name
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

output connectionString string = applicationInsights.properties.ConnectionString

```