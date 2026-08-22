---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\winmd-api-search\scripts\cache-generator\CacheGenerator.csproj'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\winmd-api-search\scripts\cache-generator\CacheGenerator.csproj'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.winmd-api-search.scripts.cache-generator.cachegenerator.csproj'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\winmd-api-search\scripts\cache-generator\CacheGenerator.csproj'
source_file: 'CacheGenerator.csproj'
source_sha256: '18f9e1622ef856e91333afcb944a81d6f63e66c35ca21d9e62f9438b8c1095c8'
generated: true
---

# `CacheGenerator.csproj`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\winmd-api-search\scripts\cache-generator\CacheGenerator.csproj`
> SHA-256: `18f9e1622ef856e91333afcb944a81d6f63e66c35ca21d9e62f9438b8c1095c8`

```text
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <!-- Default fallback; Update-WinMdCache.ps1 overrides via -p:TargetFramework=net{X}.0 -->
    <TargetFramework Condition="'$(TargetFramework)' == ''">net8.0</TargetFramework>
    <Nullable>enable</Nullable>
    <ImplicitUsings>enable</ImplicitUsings>
  </PropertyGroup>
  <!-- System.Reflection.Metadata is inbox in net9.0+, only needed for net8.0 -->
  <ItemGroup Condition="'$(TargetFramework)' == 'net8.0'">
    <PackageReference Include="System.Reflection.Metadata" Version="8.0.1" />
  </ItemGroup>

  <!--
    Baseline WinAppSDK packages: downloaded during restore so the cache generator
    can always index WinAppSDK APIs, even if the target project hasn't been restored.
    ExcludeAssets="all" means they're downloaded but don't affect this tool's build.

    When the repo has a known version (passed via -p:WinAppSdkVersion=X.Y.Z from
    Update-WinMdCache.ps1), prefer that version to avoid unnecessary NuGet downloads.
    Falls back to Version="*" (latest) on fresh clones with no restore.
  -->
  <ItemGroup Condition="'$(WinAppSdkVersion)' != ''">
    <PackageReference Include="Microsoft.WindowsAppSDK" Version="$(WinAppSdkVersion)" ExcludeAssets="all" />
  </ItemGroup>
  <ItemGroup Condition="'$(WinAppSdkVersion)' == ''">
    <PackageReference Include="Microsoft.WindowsAppSDK" Version="*" ExcludeAssets="all" />
  </ItemGroup>
</Project>

```