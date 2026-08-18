---
title: 'The Loaded Vibes™ Codex Plugin\LoadedBackup\codebase-export-2025-11-25.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\LoadedBackup\codebase-export-2025-11-25.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.loadedbackup.codebase-export-2025-11-25.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\LoadedBackup\codebase-export-2025-11-25.md'
source_file: 'codebase-export-2025-11-25.md'
source_sha256: '8c48572bf48d7836e84844c215835064d4a092b88510a82c14d44993475415f8'
generated: true
---

# `codebase-export-2025-11-25.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\LoadedBackup\codebase-export-2025-11-25.md`
> SHA-256: `8c48572bf48d7836e84844c215835064d4a092b88510a82c14d44993475415f8`

````markdown
# Codebase Export

## LoadedVibes/.agent_work/update_prompts.ps1
```ps1
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$Root = "d:/LoadedVibes/lv_artifacts/.github/prompts"
$CommonTools = @(
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
)

$PromptMeta = [ordered]@{
    "initialization" = [ordered]@{ label = "Initialization"; front_name = "InitializationDevCyclePrompt"; description = "Audit workspace readiness before other DevCycles."; hint = "Specify the readiness checks or blockers you need investigated." }
    "scaffolding" = [ordered]@{ label = "Scaffolding"; front_name = "ScaffoldingDevCyclePrompt"; description = "Set up baseline folders, configs, and scripts for new work."; hint = "Describe the scaffolding assets you need to create or adjust." }
    "configuration" = [ordered]@{ label = "Configuration"; front_name = "ConfigurationDevCyclePrompt"; description = "Align workspace configs, env templates, and lint/test settings."; hint = "List the configuration surfaces or tools requiring updates." }
    "data" = [ordered]@{ label = "Data"; front_name = "DataDevCyclePrompt"; description = "Design and evolve Prisma + Neon data models and migrations."; hint = "Explain the schema or data operations to implement." }
    "auth" = [ordered]@{ label = "Auth"; front_name = "AuthDevCyclePrompt"; description = "Implement and harden Clerk auth, RBAC, and security flows."; hint = "Summarize the auth scenario or issue you're targeting." }
    "features" = [ordered]@{ label = "Features"; front_name = "FeaturesDevCyclePrompt"; description = "Deliver user-facing features mapped to PRD stories."; hint = "Outline the feature slice or acceptance criteria." }
    "testing" = [ordered]@{ label = "Testing"; front_name = "TestingDevCyclePrompt"; description = "Plan and run Vitest/Playwright suites with coverage goals."; hint = "Describe the tests or coverage gaps to address." }
    "validation" = [ordered]@{ label = "Validation"; front_name = "ValidationDevCyclePrompt"; description = "Validate implementation against PRD and Tech Requirements."; hint = "List the acceptance criteria or flows to validate." }
    "verification" = [ordered]@{ label = "Verification"; front_name = "VerificationDevCyclePrompt"; description = "Perform integration and UAT checks before release."; hint = "Describe the end-to-end scenario that needs verification." }
    "performance" = [ordered]@{ label = "Performance"; front_name = "PerformanceDevCyclePrompt"; description = "Profile and optimize performance hotspots."; hint = "Share the metrics or user flows that need tuning." }
    "observability" = [ordered]@{ label = "Observability"; front_name = "ObservabilityDevCyclePrompt"; description = "Instrument logging, metrics, and tracing for the stack."; hint = "Explain the telemetry gaps or signals to implement." }
    "security" = [ordered]@{ label = "Security"; front_name = "SecurityDevCyclePrompt"; description = "Assess and harden security posture and compliance controls."; hint = "Describe the threats or controls to focus on." }
    "documentation" = [ordered]@{ label = "Documentation"; front_name = "DocumentationDevCyclePrompt"; description = "Produce or update docs, runbooks, and support guides."; hint = "List the documents or sections needing updates." }
    "ci-cd" = [ordered]@{ label = "CI/CD"; front_name = "CiCdDevCyclePrompt"; description = "Build and refine CI/CD pipelines, caching, and policies."; hint = "Specify the pipeline targets or automation changes." }
    "code-review" = [ordered]@{ label = "Code Review"; front_name = "CodeReviewDevCyclePrompt"; description = "Conduct asynchronous code review and quality audits."; hint = "Summarize the code that needs review or feedback." }
    "debug" = [ordered]@{ label = "Debug"; front_name = "DebugDevCyclePrompt"; description = "Triage regressions and stabilize failing scenarios."; hint = "Describe the bug, symptoms, or logs available." }
    "deploy" = [ordered]@{ label = "Deploy"; front_name = "DeployDevCyclePrompt"; description = "Plan and execute deployment steps for Vercel and services."; hint = "Outline the release or environment change required." }
    "updates" = [ordered]@{ label = "Updates"; front_name = "UpdatesDevCyclePrompt"; description = "Manage dependency, stack, and tooling updates."; hint = "List the packages or tooling that need updates." }
}

$FocusRegex = New-Object System.Text.RegularExpressions.Regex "## Focus for this run\s*(.*?)\s*## Deliver back to the human reviewer", "Singleline"
$DeliverRegex = New-Object System.Text.RegularExpressions.Regex "## Deliver back to the human reviewer\s*(.*?)\s*Document assumptions", "Singleline"

function Normalize-Block {
    param([string]$Text)
    $trimmed = $Text.Trim()
    if ([string]::IsNullOrWhiteSpace($trimmed)) {
        return ""
    }
    $lines = $trimmed -split "`r?`n"
    $normalized = $lines | ForEach-Object { $_.TrimEnd() }
    return ($normalized -join "`n")
}

function Format-ToolsBlock {
    $inner = ($CommonTools | ForEach-Object { '"{0}"' -f $_ }) -join ",`n    "
    return "  [`n    $inner`n  ]"
}

function Rebuild-Prompt {
    param([string]$Slug, [hashtable]$Meta)

    $path = Join-Path $Root "$Slug.prompt.md"
    $text = Get-Content -Raw -Path $path

    $focusMatch = $FocusRegex.Match($text)
    $deliverMatch = $DeliverRegex.Match($text)
    if (-not $focusMatch.Success -or -not $deliverMatch.Success) {
        throw "Unable to parse focus/deliver sections in $path"
    }

    $focusBlock = Normalize-Block $focusMatch.Groups[1].Value
    $deliverBlock = Normalize-Block $deliverMatch.Groups[1].Value
    $instructions = "../instructions/$Slug.instructions.md"
    $toolset = "../toolsets/$Slug.toolset.jsonc"

    $frontMatter = @(
        '---',
        ('name: "{0}"' -f $Meta.front_name),
        ('description: "{0}"' -f $Meta.description),
        ('argument-hint: "{0}"' -f $Meta.hint),
        'agent: "LoadedVibesStackAgent"',
        ('instructions: "{0}"' -f $instructions),
        ('toolset: "{0}"' -f $toolset),
        'tools:',
        (Format-ToolsBlock),
        '---'
    ) -join "`n"

    $body = @(
        ('# {0} DevCycle Prompt' -f $Meta.label),
        '',
        ('You are starting the **{0}** DevCycle.' -f $Meta.label),
        '',
        'Follow these rules:',
        ('- Load the instructions file at `{0}` and follow every directive.' -f $instructions),
        ('- Load the toolset file at `{0}` and stay within its declared capabilities.' -f $toolset),
        '- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.',
        '- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.',
        '',
        '## Focus for this run',
        $focusBlock,
        '',
        '## Deliver back to the human reviewer',
        $deliverBlock,
        '',
        'Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.'
    ) -join "`n"

    $content = $frontMatter + "`n`n" + $body + "`n"
    Set-Content -Path $path -Value $content -Encoding UTF8
}

foreach ($entry in $PromptMeta.GetEnumerator()) {
    Rebuild-Prompt -Slug $entry.Key -Meta $entry.Value
}

```

## LoadedVibes/.agent_work/update_prompts.py
```py
import re
from pathlib import Path

ROOT = Path(r"d:/LoadedVibes/lv_artifacts/.github/prompts")
COMMON_TOOLS = [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent",
]

PROMPT_META = {
    "initialization": {"label": "Initialization", "front_name": "InitializationDevCyclePrompt", "description": "Audit workspace readiness before other DevCycles.", "hint": "Specify the readiness checks or blockers you need investigated."},
    "scaffolding": {"label": "Scaffolding", "front_name": "ScaffoldingDevCyclePrompt", "description": "Set up baseline folders, configs, and scripts for new work.", "hint": "Describe the scaffolding assets you need to create or adjust."},
    "configuration": {"label": "Configuration", "front_name": "ConfigurationDevCyclePrompt", "description": "Align workspace configs, env templates, and lint/test settings.", "hint": "List the configuration surfaces or tools requiring updates."},
    "data": {"label": "Data", "front_name": "DataDevCyclePrompt", "description": "Design and evolve Prisma + Neon data models and migrations.", "hint": "Explain the schema or data operations to implement."},
    "auth": {"label": "Auth", "front_name": "AuthDevCyclePrompt", "description": "Implement and harden Clerk auth, RBAC, and security flows.", "hint": "Summarize the auth scenario or issue you're targeting."},
    "features": {"label": "Features", "front_name": "FeaturesDevCyclePrompt", "description": "Deliver user-facing features mapped to PRD stories.", "hint": "Outline the feature slice or acceptance criteria."},
    "testing": {"label": "Testing", "front_name": "TestingDevCyclePrompt", "description": "Plan and run Vitest/Playwright suites with coverage goals.", "hint": "Describe the tests or coverage gaps to address."},
    "validation": {"label": "Validation", "front_name": "ValidationDevCyclePrompt", "description": "Validate implementation against PRD and Tech Requirements.", "hint": "List the acceptance criteria or flows to validate."},
    "verification": {"label": "Verification", "front_name": "VerificationDevCyclePrompt", "description": "Perform integration and UAT checks before release.", "hint": "Describe the end-to-end scenario that needs verification."},
    "performance": {"label": "Performance", "front_name": "PerformanceDevCyclePrompt", "description": "Profile and optimize performance hotspots.", "hint": "Share the metrics or user flows that need tuning."},
    "observability": {"label": "Observability", "front_name": "ObservabilityDevCyclePrompt", "description": "Instrument logging, metrics, and tracing for the stack.", "hint": "Explain the telemetry gaps or signals to implement."},
    "security": {"label": "Security", "front_name": "SecurityDevCyclePrompt", "description": "Assess and harden security posture and compliance controls.", "hint": "Describe the threats or controls to focus on."},
    "documentation": {"label": "Documentation", "front_name": "DocumentationDevCyclePrompt", "description": "Produce or update docs, runbooks, and support guides.", "hint": "List the documents or sections needing updates."},
    "ci-cd": {"label": "CI/CD", "front_name": "CiCdDevCyclePrompt", "description": "Build and refine CI/CD pipelines, caching, and policies.", "hint": "Specify the pipeline targets or automation changes."},
    "code-review": {"label": "Code Review", "front_name": "CodeReviewDevCyclePrompt", "description": "Conduct asynchronous code review and quality audits.", "hint": "Summarize the code that needs review or feedback."},
    "debug": {"label": "Debug", "front_name": "DebugDevCyclePrompt", "description": "Triage regressions and stabilize failing scenarios.", "hint": "Describe the bug, symptoms, or logs available."},
    "deploy": {"label": "Deploy", "front_name": "DeployDevCyclePrompt", "description": "Plan and execute deployment steps for Vercel and services.", "hint": "Outline the release or environment change required."},
    "updates": {"label": "Updates", "front_name": "UpdatesDevCyclePrompt", "description": "Manage dependency, stack, and tooling updates.", "hint": "List the packages or tooling that need updates."},
}

FOCUS_REGEX = re.compile(r"## Focus for this run\s*(.*?)\s*## Deliver back to the human reviewer", re.S)
DELIVER_REGEX = re.compile(r"## Deliver back to the human reviewer\s*(.*?)\s*Document assumptions", re.S)


def normalize_block(text: str) -> str:
    lines = [line.rstrip() for line in text.strip().splitlines()]
    return "\n".join(lines)


def format_tools_block() -> str:
    inner = ",\n    ".join(f'"{tool}"' for tool in COMMON_TOOLS)
    return "  [\n    " + inner + "\n  ]"


def rebuild_prompt(slug: str, meta: dict) -> None:
    path = ROOT / f"{slug}.prompt.md"
    text = path.read_text()
    focus_match = FOCUS_REGEX.search(text)
    deliver_match = DELIVER_REGEX.search(text)
    if not focus_match or not deliver_match:
        raise ValueError(f"Unable to parse focus/deliver sections in {path}")

    focus_block = normalize_block(focus_match.group(1))
    deliver_block = normalize_block(deliver_match.group(1))
    instructions = f"../instructions/{slug}.instructions.md"
    toolset = f"../toolsets/{slug}.toolset.jsonc"

    front_matter = (
        "---\n"
        f"name: \"{meta['front_name']}\"\n"
        f"description: \"{meta['description']}\"\n"
        f"argument-hint: \"{meta['hint']}\"\n"
        "agent: \"LoadedVibesStackAgent\"\n"
        f"instructions: \"{instructions}\"\n"
        f"toolset: \"{toolset}\"\n"
        "tools:\n"
        f"{format_tools_block()}\n"
        "---\n"
    )

    body = (
        f"# {meta['label']} DevCycle Prompt\n\n"
        f"You are starting the **{meta['label']}** DevCycle.\n\n"
        "Follow these rules:\n"
        f"- Load the instructions file at `{instructions}` and follow every directive.\n"
        f"- Load the toolset file at `{toolset}` and stay within its declared capabilities.\n"
        "- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.\n"
        "- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.\n\n"
        "## Focus for this run\n"
        f"{focus_block}\n\n"
        "## Deliver back to the human reviewer\n"
        f"{deliver_block}\n\n"
        "Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.\n"
    )

    path.write_text(front_matter + "\n" + body)


for slug, data in PROMPT_META.items():
    rebuild_prompt(slug, data)

```

## LoadedVibes/.genaiscript/instructions/llms-full.txt
```txt
[Binary file: llms-full.txt, 1.1 MB]
```

## LoadedVibes/.genaiscript/genaiscript.d.ts
```ts
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

/**
 * GenAIScript Ambient Type Definition File
 * @version 2.5.1
 */
 type OptionsOrString<TOptions extends string> = (string & {}) | TOptions;

 type ElementOrArray<T> = T | T[];

 interface PromptGenerationConsole {
  log(...data: any[]): void;
  warn(...data: any[]): void;
  debug(...data: any[]): void;
  error(...data: any[]): void;
}

 type DiagnosticSeverity = "error" | "warning" | "info";

 interface Diagnostic {
  filename: string;
  range: CharRange;
  severity: DiagnosticSeverity;
  message: string;
  /**
   * suggested fix
   */
  suggestion?: string;
  /**
   * error or warning code
   */
  code?: string;
}

 type Awaitable<T> = T | PromiseLike<T>;

 interface SerializedError {
  name?: string;
  message?: string;
  stack?: string;
  cause?: unknown;
  code?: string;
  line?: number;
  column?: number;
}

/**
 * A color and icon to associate with the script.
 * @see https://actions-cool.github.io/github-action-branding/
 */
 interface PromptBranding {
  /**
   * Marketplace and web site branding
   */
  branding?: {
    /**
     * The background color of the badge.
     */
    color?:
      | "white"
      | "black"
      | "yellow"
      | "blue"
      | "green"
      | "orange"
      | "red"
      | "purple"
      | "gray-dark";
    /**
     * Name of the Feather icon to use.
     * @see https://actions-cool.github.io/github-action-branding/
     */
    icon?: string;
  };
}

 interface PromptDefinition {
  /**
   * Based on file name.
   */
  id: string;

  /**
   * Something like "Summarize children", show in UI.
   */
  title?: string;

  /**
   * Longer description of the prompt. Shows in UI grayed-out.
   */
  description?: string;

  /**
   * Groups template in UI
   */
  group?: string;

  /**
   * List of tools defined in the script
   */
  defTools?: { id: string; description: string; kind: "tool" | "agent" }[];
}

 interface PromptLike extends PromptDefinition {
  /**
   * File where the prompt comes from (if any).
   */
  filename?: string;

  /**
   * The actual text of the prompt template.
   * Only used for system prompts.
   */
  text?: string;

  /**
   * The text of the prompt JS source code.
   */
  jsSource?: string;

  /**
   * Resolved system ids
   */
  resolvedSystem?: SystemPromptInstance[];

  /**
   * Inferred input schema for parameters
   */
  inputSchema?: JSONSchemaObject;
}

 type SystemPromptId = OptionsOrString<string>;

 type SystemPromptInstance = {
  id: SystemPromptId;
  parameters?: Record<string, string | boolean | number | object | any>;
  vars?: Record<string, string | boolean | number | object | any>;
};

 type SystemToolId = OptionsOrString<string>;

 type FileMergeHandler = (
  filename: string,
  label: string,
  before: string,
  generated: string,
) => Awaitable<string>;

 interface PromptOutputProcessorResult {
  /**
   * Updated text
   */
  text?: string;
  /**
   * Generated files from the output
   */
  files?: Record<string, string>;

  /**
   * User defined errors
   */
  annotations?: Diagnostic[];
}

 type PromptOutputProcessorHandler = (
  output: GenerationOutput,
) =>
  | PromptOutputProcessorResult
  | Promise<PromptOutputProcessorResult>
  | undefined
  | Promise<undefined>
  | void
  | Promise<void>;

 type PromptTemplateResponseType =
  | "text"
  | "json"
  | "yaml"
  | "markdown"
  | "json_object"
  | "json_schema"
  | undefined;

 type ModelType = OptionsOrString<
  | "large"
  | "small"
  | "tiny"
  | "long"
  | "vision"
  | "vision_small"
  | "reasoning"
  | "reasoning_small"
  | "openai:gpt-4.1"
  | "openai:gpt-4.1-mini"
  | "openai:gpt-4.1-nano"
  | "openai:gpt-4o"
  | "openai:gpt-4o-mini"
  | "openai:gpt-3.5-turbo"
  | "openai:o3-mini"
  | "openai:o3-mini:low"
  | "openai:o3-mini:medium"
  | "openai:o3-mini:high"
  | "openai:o1"
  | "openai:o1-mini"
  | "openai:o1-preview"
  | "github:openai/gpt-4.1"
  | "github:openai/gpt-4o"
  | "github:openai/gpt-4o-mini"
  | "github:openai/o1"
  | "github:openai/o1-mini"
  | "github:openai/o3-mini"
  | "github:openai/o3-mini:low"
  | "github:microsoft/mai-ds-r1"
  | "github:deepseek/deepseek-v3"
  | "github:deepseek/deepseek-r1"
  | "github:microsoft/phi-4"
  | "github_copilot_chat:current"
  | "github_copilot_chat:gpt-4.1"
  | "github_copilot_chat:o1"
  | "github_copilot_chat:o1:low"
  | "github_copilot_chat:o1:medium"
  | "github_copilot_chat:o1:high"
  | "github_copilot_chat:o3-mini"
  | "github_copilot_chat:o3-mini:low"
  | "github_copilot_chat:o3-mini:medium"
  | "github_copilot_chat:o3-mini:high"
  | "azure:gpt-4o"
  | "azure:gpt-4o-mini"
  | "azure:o1"
  | "azure:o1-mini"
  | "azure:o3-mini"
  | "azure:o3-mini:low"
  | "azure:o3-mini:medium"
  | "azure:o3-mini:high"
  | "azure_ai_inference:gpt-4.1"
  | "azure_ai_inference:gpt-4o"
  | "azure_ai_inference:gpt-4o-mini"
  | "azure_ai_inference:o1"
  | "azure_ai_inference:o1-mini"
  | "azure_ai_inference:o3-mini"
  | "azure_ai_inference:o3-mini:low"
  | "azure_ai_inference:o3-mini:medium"
  | "azure_ai_inference:o3-mini:high"
  | "azure_ai_inference:deepSeek-v3"
  | "azure_ai_inference:deepseek-r1"
  | "ollama:gemma3:4b"
  | "ollama:llama3.2"
  | "ollama:command-r7b:7b"
  | "ollama:gpt-oss:20b"
  | "anthropic:claude-opus-4-0"
  | "anthropic:claude-sonnet-4-0"
  | "anthropic:claude-sonnet-4-0:low"
  | "anthropic:claude-sonnet-4-0:medium"
  | "anthropic:claude-sonnet-4-0:high"
  | "anthropic:claude-3-7-sonnet-latest"
  | "anthropic:claude-3-7-sonnet-latest:low"
  | "anthropic:claude-3-7-sonnet-latest:medium"
  | "anthropic:claude-3-7-sonnet-latest:high"
  | "anthropic_bedrock:anthropic.claude-3-7-sonnet-20250219-v1:0"
  | "anthropic_bedrock:anthropic.claude-3-7-sonnet-20250219-v1:0:low"
  | "anthropic_bedrock:anthropic.claude-3-7-sonnet-20250219-v1:0:medium"
  | "anthropic_bedrock:anthropic.claude-3-7-sonnet-20250219-v1:0:high"
  | "huggingface:microsoft/Phi-3-mini-4k-instruct"
  | "jan:llama3.2-3b-instruct"
  | "google:gemini-2.0-flash-exp"
  | "llamafile"
  | "sglang"
  | "vllm"
  | "echo"
  | "none"
>;

 type EmbeddingsModelType = OptionsOrString<
  | "openai:text-embedding-3-small"
  | "openai:text-embedding-3-large"
  | "openai:text-embedding-ada-002"
  | "github:text-embedding-3-small"
  | "github:text-embedding-3-large"
  | "azure:text-embedding-3-small"
  | "azure:text-embedding-3-large"
  | "azure_ai_inference:text-embedding-3-small"
  | "azure_ai_inference:text-embedding-3-large"
  | "ollama:nomic-embed-text"
  | "google:text-embedding-004"
  | "huggingface:nomic-ai/nomic-embed-text-v1.5"
>;

 type ModelSmallType = OptionsOrString<
  | "openai:gpt-4o-mini"
  | "github:openai/gpt-4o-mini"
  | "azure:gpt-4o-mini"
  | "github:microsoft/phi-4"
>;

 type ModelVisionType = OptionsOrString<
  "openai:gpt-4o" | "github:openai/gpt-4o" | "azure:gpt-4o" | "azure:gpt-4o-mini"
>;

 type ModelImageGenerationType = OptionsOrString<
  "openai:gpt-image-1" | "openai:dall-e-2" | "openai:dall-e-3"
>;

 type ModelProviderType = OptionsOrString<
  | "openai"
  | "azure"
  | "azure_serverless"
  | "azure_serverless_models"
  | "anthropic"
  | "anthropic_bedrock"
  | "google"
  | "huggingface"
  | "mistral"
  | "alibaba"
  | "github"
  | "transformers"
  | "ollama"
  | "lmstudio"
  | "jan"
  | "sglang"
  | "vllm"
  | "llamafile"
  | "litellm"
  | "github_copilot_chat"
  | "deepseek"
  | "whisperasr"
  | "echo"
>;

 interface ModelConnectionOptions {
  /**
   * Which LLM model by default or for the `large` alias.
   */
  model?: ModelType;
}

 interface ModelAliasesOptions extends ModelConnectionOptions {
  /**
   * Configure the `small` model alias.
   */
  smallModel?: ModelSmallType;

  /**
   * Configure the `vision` model alias.
   */
  visionModel?: ModelVisionType;

  /**
   * A list of model aliases to use.
   */
  modelAliases?: Record<string, string>;
}

 type ReasoningEffortType = "high" | "medium" | "low";

 type ChatToolChoice =
  | "none"
  | "auto"
  | "required"
  | {
      /**
       * The name of the function to call.
       */
      name: string;
    };

 interface ModelOptions
  extends ModelConnectionOptions,
    ModelTemplateOptions,
    CacheOptions,
    RetryOptions {
  /**
   * Temperature to use. Higher temperature means more hallucination/creativity.
   * Range 0.0-2.0.
   *
   * @default 0.2
   */
  temperature?: number;

  /**
   * Enables fallback tools mode
   */
  fallbackTools?: boolean;

  /**
   * OpenAI o* reasoning models support a reasoning effort parameter.
   * For Clause, these are mapped to thinking budget tokens
   */
  reasoningEffort?: ReasoningEffortType;

  /**
   * A list of keywords that should be found in the output.
   */
  choices?: ElementOrArray<string | { token: string | number; weight?: number }>;

  /**
   * Returns the log probabilities of the each tokens. Not supported in all models.
   */
  logprobs?: boolean;

  /**
   * Number of alternate token logprobs to generate, up to 5. Enables logprobs.
   */
  topLogprobs?: number;

  /**
   * Specifies the type of output. Default is plain text.
   * - `text` enables plain text mode (through system prompts)
   * - `json` enables JSON mode (through system prompts)
   * - `yaml` enables YAML mode (through system prompts)
   * - `json_object` enables JSON mode (native)
   * - `json_schema` enables structured outputs (native)
   * Use `responseSchema` to specify an output schema.
   */
  responseType?: PromptTemplateResponseType;

  /**
   * JSON object schema for the output. Enables the `json_object` output mode by default.
   */
  responseSchema?: PromptParametersSchema | JSONSchema;

  /**
   * “Top_p” or nucleus sampling is a setting that decides how many possible words to consider.
   * A high “top_p” value means the model looks at more possible words, even the less likely ones,
   * which makes the generated text more diverse.
   */
  topP?: number;

  /**
   * Maximum number of completion tokens
   *
   */
  maxTokens?: number;

  /**
   * Tool selection strategy. Default is 'auto'.
   */
  toolChoice?: ChatToolChoice;

  /**
   * Maximum number of tool calls to make.
   */
  maxToolCalls?: number;

  /**
   * Maximum number of data repairs to attempt.
   */
  maxDataRepairs?: number;

  /**
   * A deterministic integer seed to use for the model.
   */
  seed?: number;

  /**
   * A list of model ids and their maximum number of concurrent requests.
   */
  modelConcurrency?: Record<string, number>;
}

 interface EmbeddingsModelOptions {
  /**
   * LLM model to use for embeddings.
   */
  embeddingsModel?: EmbeddingsModelType;
}

 interface PromptSystemOptions extends PromptSystemSafetyOptions {
  /**
   * List of system script ids used by the prompt.
   */
  system?: ElementOrArray<SystemPromptId | SystemPromptInstance>;

  /**
   * List of tools used by the prompt.
   */
  tools?: ElementOrArray<SystemToolId>;

  /**
   * List of system to exclude from the prompt.
   */
  excludedSystem?: ElementOrArray<SystemPromptId>;

  /**
   * Keywords that will 'activate' the system script. When these keywords are found in the prompt source,
   * the system script will be automatically imported.
   */
  activation?: ElementOrArray<string>;

  /**
   * MCP server configuration. The tools will be injected into the prompt.
   */
  mcpServers?: McpServersConfig;

  /**
   * MCP agent configuration. Each mcp server will be wrapped with an agent.
   */
  mcpAgentServers?: McpAgentServersConfig;
}

 interface ScriptRuntimeOptions extends LineNumberingOptions {
  /**
   * Secrets required by the prompt
   */
  secrets?: string[];
}

 type PromptJSONParameterType<T> = T & { required?: boolean };

 type PromptParameterType =
  | string
  | number
  | boolean
  | object
  | PromptJSONParameterType<JSONSchemaNumber>
  | PromptJSONParameterType<JSONSchemaString>
  | PromptJSONParameterType<JSONSchemaBoolean>;
 type PromptParametersSchema = Record<string, PromptParameterType | [PromptParameterType]>;
 type PromptParameters = Record<string, string | number | boolean | object>;

 type PromptAssertion = {
  // How heavily to weigh the assertion. Defaults to 1.0
  weight?: number;
  /**
   * The transformation to apply to the output before checking the assertion.
   */
  transform?: string;
} & (
  | {
      // type of assertion
      type:
        | "icontains"
        | "not-icontains"
        | "equals"
        | "not-equals"
        | "starts-with"
        | "not-starts-with";
      // The expected value
      value: string;
    }
  | {
      // type of assertion
      type:
        | "contains-all"
        | "not-contains-all"
        | "contains-any"
        | "not-contains-any"
        | "icontains-all"
        | "not-icontains-all";
      // The expected values
      value: string[];
    }
  | {
      // type of assertion
      type: "levenshtein" | "not-levenshtein";
      // The expected value
      value: string;
      // The threshold value
      threshold?: number;
    }
);

 interface PromptTest {
  /**
   * Short name of the test
   */
  name?: string;
  /**
   * Description of the test.
   */
  description?: string;
  /**
   * List of files to apply the test to.
   */
  files?: ElementOrArray<string>;
  /**
   * List of in-memory files to apply the test to.
   */
  workspaceFiles?: ElementOrArray<WorkspaceFile>;
  /**
   * Extra set of variables for this scenario
   */
  vars?: Record<string, string | boolean | number>;
  /**
   * LLM output matches a given rubric, using a Language Model to grade output.
   */
  rubrics?: ElementOrArray<string>;
  /**
   * LLM output adheres to the given facts, using Factuality method from OpenAI evaluation.
   */
  facts?: ElementOrArray<string>;
  /**
   * List of keywords that should be contained in the LLM output.
   */
  keywords?: ElementOrArray<string>;
  /**
   * List of keywords that should not be contained in the LLM output.
   */
  forbidden?: ElementOrArray<string>;
  /**
   * Additional deterministic assertions.
   */
  asserts?: ElementOrArray<PromptAssertion>;

  /**
   * Determines what kind of output is sent back to the test engine. Default is "text".
   */
  format?: "text" | "json";
}

/**
 * Configure promptfoo redteam plugins
 */
 interface PromptRedteam {
  /**
   * The `purpose` property is used to guide the attack generation process. It should be as clear and specific as possible.
   * Include the following information:
   * - Who the user is and their relationship to the company
   * - What data the user has access to
   * - What data the user does not have access to
   * - What actions the user can perform
   * - What actions the user cannot perform
   * - What systems the agent has access to
   * @link https://www.promptfoo.dev/docs/red-team/troubleshooting/attack-generation/
   */
  purpose: string;

  /**
   * Redteam identifier used for reporting purposes
   */
  label?: string;

  /**
   * Default number of inputs to generate for each plugin.
   * The total number of tests will be `(numTests * plugins.length * (1 + strategies.length) * languages.length)`
   * Languages.length is 1 by default, but is added when the multilingual strategy is used.
   */
  numTests?: number;

  /**
   * List of languages to target. Default is English.
   */
  language?: string;

  /**
   * Red team plugin list
   * @link https://www.promptfoo.dev/docs/red-team/owasp-llm-top-10/
   */
  plugins?: ElementOrArray<string>;

  /**
   * Adversary prompt generation strategies
   */
  strategies?: ElementOrArray<string>;
}

/**
 * Different ways to render a fence block.
 */
 type FenceFormat = "markdown" | "xml" | "none";

 interface FenceFormatOptions {
  /**
   * Formatting of code sections
   */
  fenceFormat?: FenceFormat;
}

 interface ModelTemplateOptions extends FenceFormatOptions {
  /**
   * Budget of tokens to apply the prompt flex renderer.
   */
  flexTokens?: number;
}

 interface McpToolAnnotations {
  /**
   * Annotations for MCP tools
   * @link https://modelcontextprotocol.io/docs/concepts/tools#available-tool-annotations
   */
  annotations?: {
    /**
     * If true, indicates the tool does not modify its environment
     */
    readOnlyHint?: boolean;
    /**
     * If true, the tool may perform destructive updates (only meaningful when readOnlyHint is false)
     */
    destructiveHint?: boolean;
    /**
     * If true, calling the tool repeatedly with the same arguments has no additional effect (only meaningful when readOnlyHint is false)
     */
    idempotentHint?: boolean;
    /**
     * If true, the tool may interact with an “open world” of external entities
     */
    openWorldHint?: boolean;
  };
}

 interface MetadataOptions {
  /**
   * Set of 16 key-value pairs that can be attached to an object.
   * This can be useful for storing additional information about the object in a structured format, and querying for objects via API or the dashboard.
   * Keys are strings with a maximum length of 64 characters. Values are strings with a maximum length of 512 characters.
   */
  metadata?: Record<string, string>;
}

 interface TerminalOptions {
  /**
   * Disable generation of run trace.
   */
  disableTrace?: boolean;

  /**
   * Disables rendering a preview of the chat messages
   */
  disableChatPreview?: boolean;
}

 interface PromptScript
  extends PromptLike,
    PromptBranding,
    ModelOptions,
    ModelAliasesOptions,
    PromptSystemOptions,
    EmbeddingsModelOptions,
    ContentSafetyOptions,
    SecretDetectionOptions,
    GitIgnoreFilterOptions,
    ScriptRuntimeOptions,
    McpToolAnnotations,
    MetadataOptions,
    TerminalOptions {
  /**
   * Which provider to prefer when picking a model.
   */
  provider?: ModelProviderType;

  /**
   * Additional template parameters that will populate `env.vars`
   */
  parameters?: PromptParametersSchema;

  /**
   * A file path or list of file paths or globs.
   * The content of these files will be by the files selected in the UI by the user or the cli arguments.
   */
  files?: ElementOrArray<string>;

  /**
   * A comma separated list of file extensions to accept.
   */
  accept?: OptionsOrString<".md,.mdx" | "none">;

  /**
   * Extra variable values that can be used to configure system prompts.
   */
  vars?: Record<string, string>;

  /**
   * Tests to validate this script.
   */
  tests?: ElementOrArray<string | PromptTest>;

  /**
   * Models to use with tests
   */
  testModels?: ElementOrArray<ModelType | ModelAliasesOptions>;

  /**
   * LLM vulnerability checks
   */
  redteam?: PromptRedteam;

  /**
   * Don't show it to the user in lists. Template `system.*` are automatically unlisted.
   */
  unlisted?: boolean;

  /**
   * Set if this is a system prompt.
   */
  isSystem?: boolean;

  /**
   * List of allowed domains (with wildcard support) for HTTPS resource resolution and fetchText.
   * If specified, overrides the global allowedDomains configuration for this script.
   * Supports glob patterns like "*.github.com".
   */
  allowedDomains?: ElementOrArray<string>;
}
/**
 * Represent a workspace file and optional content.
 */
 interface WorkspaceFile {
  /**
   * Name of the file, relative to project root.
   */
  filename: string;

  /**
   * Content mime-type if known
   */
  type?: string;

  /**
   * Encoding of the content
   */
  encoding?: "base64";

  /**
   * Content of the file.
   */
  content?: string;

  /**
   * Size in bytes if known
   */
  size?: number;
}

 interface WorkspaceFileWithScore extends WorkspaceFile {
  /**
   * Score allocated by search algorithm
   */
  score?: number;
}

 interface ToolDefinition {
  /**
   * The name of the function to be called. Must be a-z, A-Z, 0-9, or contain
   * underscores and dashes, with a maximum length of 64.
   */
  name: string;

  /**
   * A description of what the function does, used by the model to choose when and
   * how to call the function.
   */
  description?: string;

  /**
   * The parameters the functions accepts, described as a JSON Schema object. See the
   * [guide](https://platform.openai.com/docs/guides/text-generation/function-calling)
   * for examples, and the
   * [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for
   * documentation about the format.
   *
   * Omitting `parameters` defines a function with an empty parameter list.
   */
  parameters?: JSONSchema;
}

/**
 * Interface representing an output trace with various logging and tracing methods.
 * Extends the `ToolCallTrace` interface.
 */
 interface OutputTrace extends ToolCallTrace {
  /**
   * Logs a heading message at the specified level.
   * @param level - The level of the heading.
   * @param message - The heading message.
   */
  heading(level: number, message: string): void;

  /**
   * Logs an image with an optional caption.
   * @param url - The URL of the image.
   * @param caption - The optional caption for the image.
   */
  image(url: BufferLike, caption?: string): Promise<void>;

  /**
   * Logs a markdown table
   * @param rows
   */
  table(rows: object[]): void;

  /**
   * Computes and renders diff between two files.
   */
  diff(
    left: string | WorkspaceFile,
    right: string | WorkspaceFile,
    options?: { context?: number },
  ): void;

  /**
   * Logs a result item with a boolean value and a message.
   * @param value - The boolean value of the result item.
   * @param message - The message for the result item.
   */
  resultItem(value: boolean, message: string): void;

  /**
   * Starts a trace with details in markdown format.
   * @param title - The title of the trace.
   * @param options - Optional settings for the trace.
   * @returns A `MarkdownTrace` instance.
   */
  startTraceDetails(title: string, options?: { expanded?: boolean }): OutputTrace;

  /**
   * Appends content to the trace.
   * @param value - The content to append.
   */
  appendContent(value: string): void;

  /**
   * Starts a details section in the trace.
   * @param title - The title of the details section.
   * @param options - Optional settings for the details section.
   */
  startDetails(title: string, options?: { success?: boolean; expanded?: boolean }): void;

  /**
   * Ends the current details section in the trace.
   */
  endDetails(): void;

  /**
   * Logs a video with a name, file path, and optional alt text.
   * @param name - The name of the video.
   * @param filepath - The file path of the video.
   * @param alt - The optional alt text for the video.
   */
  video(name: string, filepath: string, alt?: string): void;

  /**
   * Logs an audio file
   * @param name
   * @param filepath
   * @param alt
   */
  audio(name: string, filepath: string, alt?: string): void;

  /**
   * Logs a details section with a title and body.
   * @param title - The title of the details section.
   * @param body - The body content of the details section, can be a string or an object.
   * @param options - Optional settings for the details section.
   */
  details(
    title: string,
    body: string | object,
    options?: { success?: boolean; expanded?: boolean },
  ): void;

  /**
   * Logs a fenced details section with a title, body, and optional content type.
   * @param title - The title of the details section.
   * @param body - The body content of the details section, can be a string or an object.
   * @param contentType - The optional content type of the body.
   * @param options - Optional settings for the details section.
   */
  detailsFenced(
    title: string,
    body: string | object,
    contentType?: string,
    options?: { expanded?: boolean },
  ): void;

  /**
   * Logs an item with a name, value, and optional unit.
   * @param name - The name of the item.
   * @param value - The value of the item.
   * @param unit - The optional unit of the value.
   */
  itemValue(name: string, value: any, unit?: string): void;

  /**
   * Adds a url link item
   * @param name name url
   * @param url url. If missing, name is treated as the url.
   */
  itemLink(name: string, url?: string | URL, title?: string): void;

  /**
   * Writes a paragraph of text with empty lines before and after.
   * @param text paragraph to write
   */
  p(text: string): void;

  /**
   * Logs a warning message.
   * @param msg - The warning message to log.
   */
  warn(msg: string): void;

  /**
   * Logs a caution message.
   * @param msg - The caution message to log.
   */
  caution(msg: string): void;

  /**
   * Logs a note message.
   * @param msg - The note message to log.
   */
  note(msg: string): void;

  /**
   * Logs an error object
   * @param err
   */
  error(message: string, error?: unknown): void;
}

/**
 * Interface representing a tool call trace for logging various types of messages.
 */
 interface ToolCallTrace {
  /**
   * Logs a general message.
   * @param message - The message to log.
   */
  log(message: string): void;

  /**
   * Logs an item message.
   * @param message - The item message to log.
   */
  item(message: string): void;

  /**
   * Logs a tip message.
   * @param message - The tip message to log.
   */
  tip(message: string): void;

  /**
   * Logs a fenced message, optionally specifying the content type.
   * @param message - The fenced message to log.
   * @param contentType - The optional content type of the message.
   */
  fence(message: string | unknown, contentType?: string): void;
}

/**
 * Position (line, character) in a file. Both are 0-based.
 */
 type CharPosition = [number, number];

/**
 * Describes a run of text.
 */
 type CharRange = [CharPosition, CharPosition];

/**
 * 0-based line numbers.
 */
 type LineRange = [number, number];

 interface FileEdit {
  type: string;
  filename: string;
  label?: string;
  validated?: boolean;
}

 interface ReplaceEdit extends FileEdit {
  type: "replace";
  range: CharRange | LineRange;
  text: string;
}

 interface InsertEdit extends FileEdit {
  type: "insert";
  pos: CharPosition | number;
  text: string;
}

 interface DeleteEdit extends FileEdit {
  type: "delete";
  range: CharRange | LineRange;
}

 interface CreateFileEdit extends FileEdit {
  type: "createfile";
  overwrite?: boolean;
  ignoreIfExists?: boolean;
  text: string;
}

 type Edits = InsertEdit | ReplaceEdit | DeleteEdit | CreateFileEdit;

 interface ToolCallContent {
  type?: "content";
  content: string;
  edits?: Edits[];
}

 type ToolCallOutput =
  | string
  | number
  | boolean
  | ToolCallContent
  | ShellOutput
  | WorkspaceFile
  | RunPromptResult
  | SerializedError
  | undefined;

 interface WorkspaceFileCache<K, V> {
  /**
   * Name of the cache
   */
  name: string;
  /**
   * Gets the value associated with the key, or undefined if there is none.
   * @param key
   */
  get(key: K): Promise<V | undefined>;
  /**
   * Sets the value associated with the key.
   * @param key
   * @param value
   */
  set(key: K, value: V): Promise<void>;

  /**
   * List the values in the cache.
   */
  values(): Promise<V[]>;

  /**
   * Gets the sha of the key
   * @param key
   */
  getSha(key: K): Promise<string>;

  /**
   * Gets an existing value or updates it with the updater function.
   */
  getOrUpdate(
    key: K,
    updater: () => Promise<V>,
    validator?: (val: V) => boolean,
  ): Promise<{ key: string; value: V; cached?: boolean }>;
}

 interface WorkspaceGrepOptions extends FilterGitFilesOptions {
  /**
   * List of paths to
   */
  path?: ElementOrArray<string>;
  /**
   * list of filename globs to search. !-prefixed globs are excluded. ** are not supported.
   */
  glob?: ElementOrArray<string>;
  /**
   * Read file content. default is true.
   */
  readText?: boolean;

  /**
   * Enable grep logging to discover what files are searched.
   */
  debug?: boolean;
}

 interface WorkspaceGrepResult {
  files: WorkspaceFile[];
  matches: WorkspaceFile[];
}

 interface INIParseOptions extends JSONSchemaValidationOptions {
  defaultValue?: any;
}

 interface FilterGitFilesOptions {
  /**
   * Ignore workspace .gitignore instructions
   */
  applyGitIgnore?: false | undefined;
}

 interface FindFilesOptions extends FilterGitFilesOptions {
  /** Glob patterns to ignore */
  ignore?: ElementOrArray<string>;

  /**
   * Set to false to skip read text content. True by default
   */
  readText?: boolean;
}

 interface FileStats {
  /**
   * Size of the file in bytes
   */
  size: number;
  mode: number;
}

 interface JSONSchemaValidationOptions {
  schema?: JSONSchema;
  throwOnValidationError?: boolean;
}

 interface WorkspaceFileSystem {
  /**
   * The root folder path of the workspace.
   */
  root(): string;

  /**
   * Searches for files using the glob pattern and returns a list of files.
   * Ignore `.env` files and apply `.gitignore` if present.
   * @param glob
   */
  findFiles(glob: ElementOrArray<string>, options?: FindFilesOptions): Promise<WorkspaceFile[]>;

  /**
   * Performs a grep search over the files in the workspace using ripgrep.
   * @param pattern A string to match or a regex pattern.
   * @param options Options for the grep search.
   */
  grep(pattern: string | RegExp, options?: WorkspaceGrepOptions): Promise<WorkspaceGrepResult>;
  grep(
    pattern: string | RegExp,
    glob: string,
    options?: Omit<WorkspaceGrepOptions, "path" | "glob">,
  ): Promise<WorkspaceGrepResult>;

  /**
   * Reads metadata information about the file. Returns undefined if the file does not exist.
   * @param filename
   */
  stat(filename: string): Promise<FileStats>;

  /**
   * Reads the content of a file as text
   * @param path
   */
  readText(path: string | Awaitable<WorkspaceFile>): Promise<WorkspaceFile>;

  /**
   * Reads the content of a file and parses to JSON, using the JSON5 parser.
   * @param path
   */
  readJSON(
    path: string | Awaitable<WorkspaceFile>,
    options?: JSONSchemaValidationOptions,
  ): Promise<any>;

  /**
   * Reads the content of a file and parses to YAML.
   * @param path
   */
  readYAML(
    path: string | Awaitable<WorkspaceFile>,
    options?: JSONSchemaValidationOptions,
  ): Promise<any>;

  /**
   * Reads the content of a file and parses to XML, using the XML parser.
   */
  readXML(path: string | Awaitable<WorkspaceFile>, options?: XMLParseOptions): Promise<any>;

  /**
   * Reads the content of a CSV file.
   * @param path
   */
  readCSV<T extends object>(
    path: string | Awaitable<WorkspaceFile>,
    options?: CSVParseOptions,
  ): Promise<T[]>;

  /**
   * Reads the content of a file and parses to INI
   */
  readINI(path: string | Awaitable<WorkspaceFile>, options?: INIParseOptions): Promise<any>;

  /**
   * Reads the content of a file and attempts to parse it as data.
   * @param path
   * @param options
   */
  readData(
    path: string | Awaitable<WorkspaceFile>,
    options?: CSVParseOptions & INIParseOptions & XMLParseOptions & JSONSchemaValidationOptions,
  ): Promise<any>;

  /**
   * Appends text to a file as text to the file system. Creates the file if needed.
   * @param path
   * @param content
   */
  appendText(path: string, content: string): Promise<void>;

  /**
   * Writes a file as text to the file system
   * @param path
   * @param content
   */
  writeText(path: string, content: string): Promise<void>;

  /**
   * Caches a buffer to file and returns the unique file name
   * @param bytes
   */
  writeCached(
    bytes: BufferLike,
    options?: {
      scope?: "workspace" | "run";
      /**
       * Filename extension
       */
      ext?: string;
    },
  ): Promise<string>;

  /**
   * Writes one or more files to the workspace
   * @param file a in-memory file or list of files
   */
  writeFiles(file: ElementOrArray<WorkspaceFile>): Promise<void>;

  /**
   * Copies a file between two paths
   * @param source
   * @param destination
   */
  copyFile(source: string, destination: string): Promise<void>;

  /**
   * Opens a file-backed key-value cache for the given cache name.
   * The cache is persisted across runs of the script. Entries are dropped when the cache grows too large.
   * @param cacheName
   */
  cache<K = any, V = any>(cacheName: string): Promise<WorkspaceFileCache<K, V>>;
}

 interface ToolCallContext {
  log(message: string): void;
  debug(message: string): void;
  trace: ToolCallTrace;
}

 interface ToolCallback {
  spec: ToolDefinition;
  options?: DefToolOptions;
  generator?: ChatGenerationContext;
  impl: (args: { context: ToolCallContext } & Record<string, any>) => Awaitable<ToolCallOutput>;
}

 interface ChatContentPartText {
  /**
   * The text content.
   */
  text: string;

  /**
   * The type of the content part.
   */
  type: "text";
}

 interface ChatContentPartImage {
  image_url: {
    /**
     * Either a URL of the image or the base64 encoded image data.
     */
    url: string;

    /**
     * Specifies the detail level of the image. Learn more in the
     * [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
     */
    detail?: "auto" | "low" | "high";
  };

  /**
   * The type of the content part.
   */
  type: "image_url";
}

 interface ChatContentPartInputAudio {
  input_audio: {
    /**
     * Base64 encoded audio data.
     */
    data: string;

    /**
     * The format of the encoded audio data. Currently supports "wav" and "mp3".
     */
    format: "wav" | "mp3";
  };

  /**
   * The type of the content part. Always `input_audio`.
   */
  type: "input_audio";
}

 interface ChatContentPartFile {
  file: {
    /**
     * The base64 encoded file data, used when passing the file to the model as a
     * string.
     */
    file_data?: string;

    /**
     * The ID of an uploaded file to use as input.
     */
    file_id?: string;

    /**
     * The name of the file, used when passing the file to the model as a string.
     */
    filename?: string;
  };

  /**
   * The type of the content part. Always `file`.
   */
  type: "file";
}

 interface ChatContentPartRefusal {
  /**
   * The refusal message generated by the model.
   */
  refusal: string;

  /**
   * The type of the content part.
   */
  type: "refusal";
}

 interface ChatSystemMessage {
  /**
   * The contents of the system message.
   */
  content: string | ChatContentPartText[];

  /**
   * The role of the messages author, in this case `system`.
   */
  role: "system";

  /**
   * An optional name for the participant. Provides the model information to
   * differentiate between participants of the same role.
   */
  name?: string;
}

/**
 * @deprecated
 */
 interface ChatFunctionMessage {
  content: string;
  name: string;
  role: "function";
}

 interface ChatToolMessage {
  /**
   * The contents of the tool message.
   */
  content: string | ChatContentPartText[];

  /**
   * The role of the messages author, in this case `tool`.
   */
  role: "tool";

  /**
   * Tool call that this message is responding to.
   */
  tool_call_id: string;
}

 interface ChatMessageToolCall {
  /**
   * The ID of the tool call.
   */
  id: string;

  /**
   * The function that the model called.
   */
  function: {
    /**
     * The arguments to call the function with, as generated by the model in JSON
     * format. Note that the model does not always generate valid JSON, and may
     * hallucinate parameters not defined by your function schema. Validate the
     * arguments in your code before calling your function.
     */
    arguments: string;

    /**
     * The name of the function to call.
     */
    name: string;
  };

  /**
   * The type of the tool. Currently, only `function` is supported.
   */
  type: "function";
}

 interface ChatAssistantMessage {
  /**
   * The role of the messages author, in this case `assistant`.
   */
  role: "assistant";

  /**
   * The contents of the assistant message. Required unless `tool_calls` or
   * `function_call` is specified.
   */
  content?: string | (ChatContentPartText | ChatContentPartRefusal)[];

  /**
   * An optional name for the participant. Provides the model information to
   * differentiate between participants of the same role.
   */
  name?: string;

  /**
   * The refusal message by the assistant.
   */
  refusal?: string | null;

  /**
   * The tool calls generated by the model, such as function calls.
   */
  tool_calls?: ChatMessageToolCall[];

  /**
   * The reasoning of the model
   */
  reasoning?: string;
}

 type ChatContentPart =
  | ChatContentPartText
  | ChatContentPartImage
  | ChatContentPartInputAudio
  | ChatContentPartFile;

 interface ChatUserMessage {
  /**
   * The contents of the user message.
   */
  content: string | ChatContentPart[];

  /**
   * The role of the messages author, in this case `user`.
   */
  role: "user";

  /**
   * An optional name for the participant. Provides the model information to
   * differentiate between participants of the same role.
   */
  name?: string;
}

 type ChatMessage =
  | ChatSystemMessage
  | ChatUserMessage
  | ChatAssistantMessage
  | ChatToolMessage
  | ChatFunctionMessage;

 type ChatParticipantHandler = (
  /**
   * Prompt generation context to create a new message in the conversation
   */
  context: ChatTurnGenerationContext,
  /**
   * Chat conversation messages
   */
  messages: ChatMessage[],
  /**
   * The last assistant text, without
   * reasoning sections.
   */
  assistantText: string,
) => Awaitable<{ messages?: ChatMessage[] } | undefined | void>;

 interface ChatParticipantOptions {
  label?: string;
}

 interface ChatParticipant {
  generator: ChatParticipantHandler;
  options: ChatParticipantOptions;
}

/**
 * A set of text extracted from the context of the prompt execution
 */
 interface ExpansionVariables
  extends Required<Pick<ChatGenerationContextOptions, "generator">> {
  /**
   * Directory where the prompt is executed
   */
  dir: string;

  /**
   * Directory where output files (trace, output) are created
   */
  runDir: string;

  /**
   * Unique identifier for the run
   */
  runId: string;

  /**
   * List of linked files parsed in context
   */
  files: WorkspaceFile[];

  /**
   * User defined variables
   */
  vars: Record<string, string | boolean | number | object | any> & {
    /**
     * When running in GitHub Copilot Chat, the current user prompt
     */
    question?: string;
    /**
     * When running in GitHub Copilot Chat, the current chat history
     */
    "copilot.history"?: (HistoryMessageUser | HistoryMessageAssistant)[];
    /**
     * When running in GitHub Copilot Chat, the current editor content
     */
    "copilot.editor"?: string;
    /**
     * When running in GitHub Copilot Chat, the current selection
     */
    "copilot.selection"?: string;
    /**
     * When running in GitHub Copilot Chat, the current terminal content
     */
    "copilot.terminalSelection"?: string;
    /**
     * Selected model identifier in GitHub Copilot Chat
     */
    "copilot.model"?: string;
    /**
     * selected text in active text editor
     */
    "editor.selectedText"?: string;
  };

  /**
   * List of secrets used by the prompt, must be registered in `genaiscript`.
   */
  secrets: Record<string, string>;

  /**
   * Output trace builder
   */
  output: OutputTrace;

  /**
   * Resolved metadata
   */
  meta: PromptDefinition & ModelConnectionOptions;

  /**
   * The script debugger logger
   */
  dbg: DebugLogger;
}

 type MakeOptional<T, P extends keyof T> = Partial<Pick<T, P>> & Omit<T, P>;

 type PromptArgs = Omit<
  PromptScript,
  "text" | "id" | "jsSource" | "defTools" | "resolvedSystem"
>;

 type PromptSystemArgs = Omit<
  PromptArgs,
  | "model"
  | "embeddingsModel"
  | "temperature"
  | "topP"
  | "maxTokens"
  | "seed"
  | "tests"
  | "responseLanguage"
  | "responseType"
  | "responseSchema"
  | "files"
  | "modelConcurrency"
  | "redteam"
  | "metadata"
>;

 type StringLike = string | WorkspaceFile | WorkspaceFile[];

 interface LineNumberingOptions {
  /**
   * Prepend each line with a line numbers. Helps with generating diffs.
   */
  lineNumbers?: boolean;

  /**
   * Offset when number lines in output
   */
  lineNumbersStart?: number;
}

 interface FenceOptions extends LineNumberingOptions, FenceFormatOptions {
  /**
   * Language of the fenced code block. Defaults to "markdown".
   */
  language?:
    | "markdown"
    | "json"
    | "yaml"
    | "javascript"
    | "typescript"
    | "python"
    | "shell"
    | "toml"
    | string;

  /**
   * JSON schema identifier
   */
  schema?: string;
}

 type PromptCacheControlType = "ephemeral";

 interface ContextExpansionOptions {
  /**
   * Specifies an maximum of estimated tokens for this entry; after which it will be truncated.
   */
  maxTokens?: number;

  /*
   * Value that is conceptually similar to a zIndex (higher number == higher priority).
   * If a rendered prompt has more message tokens than can fit into the available context window, the prompt renderer prunes messages with the lowest priority from the ChatMessages result, preserving the order in which they were declared. This means your extension code can safely declare TSX components for potentially large pieces of context like conversation history and codebase context.
   */
  priority?: number;

  /**
   * Controls the proportion of tokens allocated from the container's budget to this element.
   * It defaults to 1 on all elements.
   */
  flex?: number;

  /**
   * Caching policy for this text. `ephemeral` means the prefix can be cached for a short amount of time.
   */
  cacheControl?: PromptCacheControlType;
}

 interface RangeOptions {
  /**
   * The inclusive start of the line range, with a 1-based index
   */
  lineStart?: number;
  /**
   * The inclusive end of the line range, with a 1-based index
   */
  lineEnd?: number;
  /**
   * Center line number around which the file will be truncated.
   * Dynamically calculates the range around this line.
   * This is different from lineStart/lineEnd as it specifies a center point.
   */
  line?: number;
  /**
   * Maximum token budget for the extracted range when using line option.
   * If specified, the range will be computed to fit within this token limit.
   */
  maxTokens?: number;
}

 interface GitIgnoreFilterOptions {
  /**
   * Disable filtering files based on the `.gitignore` file.
   */
  ignoreGitIgnore?: true | undefined;
}

 interface FileFilterOptions extends GitIgnoreFilterOptions {
  /**
   * Filename filter based on file suffix. Case insensitive.
   */
  endsWith?: ElementOrArray<string>;

  /**
   * Filename filter using glob syntax.
   */
  glob?: ElementOrArray<string>;
}

 interface ContentSafetyOptions {
  /**
   * Configure the content safety provider.
   */
  contentSafety?: ContentSafetyProvider;
  /**
   * Runs the default content safety validator
   * to prevent prompt injection.
   */
  detectPromptInjection?: "always" | "available" | boolean;
}

 interface PromptSystemSafetyOptions {
  /**
   * Policy to inject builtin system prompts. See to `false` prevent automatically injecting.
   */
  systemSafety?: "default" | boolean;
}

 interface SecretDetectionOptions {
  /**
   * Policy to disable secret scanning when communicating with the LLM.
   * Set to `false` to disable.
   */
  secretScanning?: boolean;
}

 interface DefOptions
  extends FenceOptions,
    ContextExpansionOptions,
    DataFilter,
    RangeOptions,
    FileFilterOptions,
    ContentSafetyOptions {
  /**
   * By default, throws an error if the value in def is empty.
   */
  ignoreEmpty?: boolean;

  /**
   * The content of the def is a predicted output.
   * This setting disables line numbers.
   */
  prediction?: boolean;
}

/**
 * Options for the `defDiff` command.
 */
 interface DefDiffOptions
  extends ContextExpansionOptions,
    FenceFormatOptions,
    LineNumberingOptions {}

 interface ImageTransformOptions {
  /**
   * Crops the image to the specified region.
   */
  crop?: { x?: number; y?: number; w?: number; h?: number };
  /**
   * Auto cropping same color on the edges of the image
   */
  autoCrop?: boolean;
  /**
   * Applies a scaling factor to the image after cropping.
   */
  scale?: number;
  /**
   * Rotates the image by the specified number of degrees.
   */
  rotate?: number;
  /**
   * Maximum width of the image. Applied after rotation.
   */
  maxWidth?: number;
  /**
   * Maximum height of the image. Applied after rotation.
   */
  maxHeight?: number;
  /**
   * Removes colors from the image using ITU Rec 709 luminance values
   */
  greyscale?: boolean;

  /**
   * Flips the image horizontally and/or vertically.
   */
  flip?: { horizontal?: boolean; vertical?: boolean };

  /**
   * Output mime
   */
  mime?: "image/jpeg" | "image/png";
}

 interface DefImagesOptions extends ImageTransformOptions {
  /**
   * A "low" detail image is always downsampled to 512x512 pixels.
   */
  detail?: "high" | "low";
  /**
   * Selects the first N elements from the data
   */
  sliceHead?: number;
  /**
   * Selects the last N elements from the data
   */
  sliceTail?: number;
  /**
   * Selects the a random sample of N items in the collection.
   */
  sliceSample?: number;
  /**
   * Renders all images in a single tiled image
   */
  tiled?: boolean;

  /**
   * By default, throws an error if no images are passed.
   */
  ignoreEmpty?: boolean;
}

 type JSONSchemaTypeName =
  | "string"
  | "number"
  | "integer"
  | "boolean"
  | "object"
  | "array"
  | "null";

 type JSONSchemaSimpleType =
  | JSONSchemaString
  | JSONSchemaNumber
  | JSONSchemaBoolean
  | JSONSchemaObject
  | JSONSchemaArray;

 type JSONSchemaType = JSONSchemaSimpleType | JSONSchemaAnyOf | null;

 interface JSONSchemaAnyOf {
  anyOf: JSONSchemaType[];
  uiGroup?: string;
}

 interface JSONSchemaDescribed {
  /**
   * A short description of the property
   */
  title?: string;
  /**
   * A clear description of the property.
   */
  description?: string;

  /**
   * Moves the field to a sub-group in the form, potentially collapsed
   */
  uiGroup?: string;
}

 interface JSONSchemaString extends JSONSchemaDescribed {
  type: "string";
  uiType?: "textarea";
  uiSuggestions?: string[];
  enum?: string[];
  default?: string;
  pattern?: string;
}

 interface JSONSchemaNumber extends JSONSchemaDescribed {
  type: "number" | "integer";
  default?: number;
  minimum?: number;
  exclusiveMinimum?: number;
  maximum?: number;
  exclusiveMaximum?: number;
}

 interface JSONSchemaBoolean extends JSONSchemaDescribed {
  type: "boolean";
  uiType?: "runOption";
  default?: boolean;
}

 interface JSONSchemaObject extends JSONSchemaDescribed {
  $schema?: string;
  type: "object";
  properties?: {
    [key: string]: JSONSchemaType;
  };
  required?: string[];
  additionalProperties?: boolean;

  default?: object;
}

 interface JSONSchemaArray extends JSONSchemaDescribed {
  $schema?: string;
  type: "array";
  items?: JSONSchemaType;

  default?: any[];
}

 type JSONSchema = JSONSchemaObject | JSONSchemaArray;

 interface FileEditValidation {
  /**
   * JSON schema
   */
  schema?: JSONSchema;
  /**
   * Error while validating the JSON schema
   */
  schemaError?: string;
  /**
   * The path was validated with a file output (defFileOutput)
   */
  pathValid?: boolean;
}

 interface DataFrame {
  schema?: string;
  data: unknown;
  validation?: FileEditValidation;
}

 interface Logprob {
  /**
   * Token text
   */
  token: string;
  /**
   * Log probably of the generated token
   */
  logprob: number;
  /**
   * Logprob value converted to %
   */
  probPercent?: number;
  /**
   * Normalized entropy
   */
  entropy?: number;
  /**
   * Other top tokens considered by the LLM
   */
  topLogprobs?: { token: string; logprob: number }[];
}

 interface RunPromptUsage {
  /**
   * Estimated cost in $ of the generation
   */
  cost?: number;
  /**
   * Estimated duration of the generation
   * including multiple rounds with tools
   */
  duration?: number;
  /**
   * Number of tokens in the generated completion.
   */
  completion: number;

  /**
   * Number of tokens in the prompt.
   */
  prompt: number;
  /**
   * Total number of tokens used in the request (prompt + completion).
   */
  total: number;
}

 interface RunPromptResult {
  messages: ChatMessage[];
  text: string;
  reasoning?: string;
  annotations?: Diagnostic[];
  fences?: Fenced[];
  frames?: DataFrame[];
  json?: any;
  error?: SerializedError;
  schemas?: Record<string, JSONSchema>;
  finishReason: "stop" | "length" | "tool_calls" | "content_filter" | "cancel" | "fail";
  fileEdits?: Record<string, FileUpdate>;
  edits?: Edits[];
  changelogs?: string[];
  model?: ModelType;
  choices?: Logprob[];
  logprobs?: Logprob[];
  perplexity?: number;
  uncertainty?: number;
  usage?: RunPromptUsage;
}

/**
 * Path manipulation functions.
 */
 interface Path {
  parse(path: string): {
    /**
     * The root of the path such as '/' or 'c:\'
     */
    root: string;
    /**
     * The full directory path such as '/home/user/dir' or 'c:\path\dir'
     */
    dir: string;
    /**
     * The file name including extension (if any) such as 'index.html'
     */
    base: string;
    /**
     * The file extension (if any) such as '.html'
     */
    ext: string;
    /**
     * The file name without extension (if any) such as 'index'
     */
    name: string;
  };

  /**
   * Returns the last portion of a path. Similar to the Unix basename command.
   * @param path
   */
  dirname(path: string): string;

  /**
   * Returns the extension of the path, from the last '.' to end of string in the last portion of the path.
   * @param path
   */
  extname(path: string): string;

  /**
   * Returns the last portion of a path, similar to the Unix basename command.
   */
  basename(path: string, suffix?: string): string;

  /**
   * The path.join() method joins all given path segments together using the platform-specific separator as a delimiter, then normalizes the resulting path.
   * @param paths
   */
  join(...paths: string[]): string;

  /**
   * The path.normalize() method normalizes the given path, resolving '..' and '.' segments.
   */
  normalize(...paths: string[]): string;

  /**
   * The path.relative() method returns the relative path from from to to based on the current working directory. If from and to each resolve to the same path (after calling path.resolve() on each), a zero-length string is returned.
   */
  relative(from: string, to: string): string;

  /**
   * The path.resolve() method resolves a sequence of paths or path segments into an absolute path.
   * @param pathSegments
   */
  resolve(...pathSegments: string[]): string;

  /**
   * Determines whether the path is an absolute path.
   * @param path
   */
  isAbsolute(path: string): boolean;

  /**
   * Change the extension of a path
   * @param path
   * @param ext
   */
  changeext(path: string, ext: string): string;

  /**
   * Converts a file://... to a path
   * @param fileUrl
   */
  resolveFileURL(fileUrl: string): string;

  /**
   * Sanitize a string to be safe for use as a filename by removing directory paths and invalid characters.
   * @param path file path
   */
  sanitize(path: string): string;
}

 interface Fenced {
  label: string;
  language?: string;
  content: string;
  args?: { schema?: string } & Record<string, string>;

  validation?: FileEditValidation;
}

 interface XMLParseOptions extends JSONSchemaValidationOptions {
  allowBooleanAttributes?: boolean;
  ignoreAttributes?: boolean;
  ignoreDeclaration?: boolean;
  ignorePiTags?: boolean;
  parseAttributeValue?: boolean;
  removeNSPrefix?: boolean;
  unpairedTags?: string[];
}

 interface ParsePDFOptions {
  /**
   * Disable removing trailing spaces in text
   */
  disableCleanup?: boolean;
  /**
   * Render each page as an image
   */
  renderAsImage?: boolean;
  /**
   * Zoom scaling with rendering pages and figures
   */
  scale?: number;
  /**
   * Disable caching with cache: false
   */
  cache?: boolean;
  /**
   * Force system fonts use
   */
  useSystemFonts?: boolean;
}

 interface HTMLToTextOptions {
  /**
   * After how many chars a line break should follow in `p` elements.
   *
   * Set to `null` or `false` to disable word-wrapping.
   */
  wordwrap?: number | false | null | undefined;
}

 interface ParseXLSXOptions {
  // specific worksheet name
  sheet?: string;
  // Use specified range (A1-style bounded range string)
  range?: string;
}

 interface WorkbookSheet {
  name: string;
  rows: object[];
}

 interface ParseZipOptions {
  glob?: string;
}

 type TokenEncoder = (text: string) => number[];
 type TokenDecoder = (lines: Iterable<number>) => string;

 interface Tokenizer {
  model: string;
  /**
   * Number of tokens
   */
  size?: number;
  encode: TokenEncoder;
  decode: TokenDecoder;
}

 interface CSVParseOptions extends JSONSchemaValidationOptions {
  delimiter?: string;
  headers?: string[];
  repair?: boolean;
}

 interface TextChunk extends WorkspaceFile {
  lineStart: number;
  lineEnd: number;
}

 interface TextChunkerConfig extends LineNumberingOptions {
  model?: ModelType;
  chunkSize?: number;
  chunkOverlap?: number;
  docType?: OptionsOrString<
    | "cpp"
    | "python"
    | "py"
    | "java"
    | "go"
    | "c#"
    | "c"
    | "cs"
    | "ts"
    | "js"
    | "tsx"
    | "typescript"
    | "js"
    | "jsx"
    | "javascript"
    | "php"
    | "md"
    | "mdx"
    | "markdown"
    | "rst"
    | "rust"
  >;
}

 interface Tokenizers {
  /**
   * Estimates the number of tokens in the content. May not be accurate
   * @param model
   * @param text
   */
  count(text: string, options?: { model?: ModelType; approximate?: boolean }): Promise<number>;

  /**
   * Truncates the text to a given number of tokens, approximation.
   * @param model
   * @param text
   * @param maxTokens
   * @param options
   */
  truncate(
    text: string,
    maxTokens: number,
    options?: { model?: ModelType; last?: boolean },
  ): Promise<string>;

  /**
   * Tries to resolve a tokenizer for a given model. Defaults to gpt-4o if not found.
   * @param model
   */
  resolve(model?: ModelType): Promise<Tokenizer>;

  /**
   * Chunk the text into smaller pieces based on a token limit and chunking strategy.
   * @param text
   * @param options
   */
  chunk(file: Awaitable<string | WorkspaceFile>, options?: TextChunkerConfig): Promise<TextChunk[]>;
}

 interface HashOptions {
  /**
   * Algorithm used for hashing
   */
  algorithm?: "sha-256";
  /**
   * Trim hash to this number of character
   */
  length?: number;
  /**
   * Include genaiscript version in the hash
   */
  version?: boolean;
  /**
   * Optional salting of the hash
   */
  salt?: string;
  /**
   * Read the content of workspace files object into the hash
   */
  readWorkspaceFiles?: boolean;
}

 interface VideoProbeResult {
  streams: {
    index: number;
    codec_name: string;
    codec_long_name: string;
    profile: string;
    codec_type: string;
    codec_tag_string: string;
    codec_tag: string;
    width?: number;
    height?: number;
    coded_width?: number;
    coded_height?: number;
    closed_captions?: number;
    film_grain?: number;
    has_b_frames?: number;
    sample_aspect_ratio?: string;
    display_aspect_ratio?: string;
    pix_fmt?: string;
    level?: number;
    color_range?: string;
    color_space?: string;
    color_transfer?: string;
    color_primaries?: string;
    chroma_location?: string;
    field_order?: string;
    refs?: number;
    is_avc?: string;
    nal_length_size?: number;
    id: string;
    r_frame_rate: string;
    avg_frame_rate: string;
    time_base: string;
    start_pts: number;
    start_time: number;
    duration_ts: number;
    duration: number;
    bit_rate: number;
    max_bit_rate: string;
    bits_per_raw_sample: number | string;
    nb_frames: number | string;
    nb_read_frames?: string;
    nb_read_packets?: string;
    extradata_size?: number;
    tags?: {
      creation_time: string;
      language?: string;
      handler_name: string;
      vendor_id?: string;
      encoder?: string;
    };
    disposition?: {
      default: number;
      dub: number;
      original: number;
      comment: number;
      lyrics: number;
      karaoke: number;
      forced: number;
      hearing_impaired: number;
      visual_impaired: number;
      clean_effects: number;
      attached_pic: number;
      timed_thumbnails: number;
      captions: number;
      descriptions: number;
      metadata: number;
      dependent: number;
      still_image: number;
    };
    sample_fmt?: string;
    sample_rate?: number;
    channels?: number;
    channel_layout?: string;
    bits_per_sample?: number | string;
  }[];
  format: {
    filename: string;
    nb_streams: number;
    nb_programs: number;
    format_name: string;
    format_long_name: string;
    start_time: number;
    duration: number;
    size: number;
    bit_rate: number;
    probe_score: number;
    tags: {
      major_brand: string;
      minor_version: string;
      compatible_brands: string;
      creation_time: string;
    };
  };
}

 interface PDFPageImage extends WorkspaceFile {
  id: string;
  width: number;
  height: number;
}

 interface PDFPage {
  index: number;
  content: string;
  image?: string;
  figures?: PDFPageImage[];
}

 interface DocxParseOptions extends CacheOptions {
  /**
   * Desired output format
   */
  format?: "markdown" | "text" | "html";
}

 interface EncodeIDsOptions {
  matcher?: RegExp;
  prefix?: string;
  open?: string;
  close?: string;
}

 type GitIgnorer = (files: readonly (string | WorkspaceFile)[]) => string[];

 interface Parsers {
  /**
   * Parses text as a JSON5 payload
   */
  JSON5(
    content: string | WorkspaceFile,
    options?: { defaultValue?: any } & JSONSchemaValidationOptions,
  ): any | undefined;

  /**
   * Parses text generated by an LLM as JSON payload
   * @param content
   */
  JSONLLM(content: string): any | undefined;

  /**
   * Parses text or file as a JSONL payload. Empty lines are ignore, and JSON5 is used for parsing.
   * @param content
   */
  JSONL(content: string | WorkspaceFile): any[] | undefined;

  /**
   * Parses text as a YAML payload
   */
  YAML(
    content: string | WorkspaceFile,
    options?: { defaultValue?: any } & JSONSchemaValidationOptions,
  ): any | undefined;

  /**
   * Parses text as TOML payload
   * @param text text as TOML payload
   */
  TOML(
    content: string | WorkspaceFile,
    options?: { defaultValue?: any } & JSONSchemaValidationOptions,
  ): any | undefined;

  /**
   * Parses the front matter of a markdown file
   * @param content
   * @param defaultValue
   */
  frontmatter(
    content: string | WorkspaceFile,
    options?: {
      defaultValue?: any;
      format: "yaml" | "json" | "toml";
    } & JSONSchemaValidationOptions,
  ): any | undefined;

  /**
   * Parses a file or URL as PDF
   * @param content
   */
  PDF(
    content: string | WorkspaceFile,
    options?: ParsePDFOptions,
  ): Promise<
    | {
        /**
         * Reconstructed text content from page content
         */
        file: WorkspaceFile;
        /**
         * Page text content
         */
        pages: string[];
        /**
         * Rendered pages as images if `renderAsImage` is set
         */
        images?: string[];

        /**
         * Parse PDF content
         */
        data: PDFPage[];
      }
    | undefined
  >;

  /**
   * Parses a .docx file
   * @param content
   */
  DOCX(
    content: string | WorkspaceFile,
    options?: DocxParseOptions,
  ): Promise<{ file?: WorkspaceFile; error?: string }>;

  /**
   * Parses a CSV file or text
   * @param content
   */
  CSV(content: string | WorkspaceFile, options?: CSVParseOptions): object[] | undefined;

  /**
   * Parses a XLSX file and a given worksheet
   * @param content
   */
  XLSX(content: WorkspaceFile, options?: ParseXLSXOptions): Promise<WorkbookSheet[] | undefined>;

  /**
   * Parses a .env file
   * @param content
   */
  dotEnv(content: string | WorkspaceFile): Record<string, string>;

  /**
   * Parses a .ini file
   * @param content
   */
  INI(content: string | WorkspaceFile, options?: INIParseOptions): any | undefined;

  /**
   * Parses a .xml file
   * @param content
   */
  XML(
    content: string | WorkspaceFile,
    options?: { defaultValue?: any } & XMLParseOptions,
  ): any | undefined;

  /**
   * Parses .vtt or .srt transcription files
   * @param content
   */
  transcription(content: string | WorkspaceFile): TranscriptionSegment[];

  /**
   * Convert HTML to text
   * @param content html string or file
   * @param options
   */
  HTMLToText(content: string | WorkspaceFile, options?: HTMLToTextOptions): Promise<string>;

  /**
   * Convert HTML to markdown
   * @param content html string or file
   * @param options rendering options
   */
  HTMLToMarkdown(content: string | WorkspaceFile, options?: HTMLToMarkdownOptions): Promise<string>;

  /**
   * Extracts the contents of a zip archive file
   * @param file
   * @param options
   */
  unzip(file: WorkspaceFile, options?: ParseZipOptions): Promise<WorkspaceFile[]>;

  /**
   * Parses fenced code sections in a markdown text
   */
  fences(content: string | WorkspaceFile): Fenced[];

  /**
   * Parses various format of annotations (error, warning, ...)
   * @param content
   */
  annotations(content: string | WorkspaceFile): Diagnostic[];

  /**
   * Parses and evaluates a math expression
   * @param expression math expression compatible with mathjs
   * @param scope object to read/write variables
   */
  math(expression: string, scope?: object): Promise<string | number | undefined>;

  /**
   * Using the JSON schema, validates the content
   * @param schema JSON schema instance
   * @param content object to validate
   */
  validateJSON(schema: JSONSchema, content: any): FileEditValidation;

  /**
   * Renders a mustache template
   * @param text template text
   * @param data data to render
   */
  mustache(text: string | WorkspaceFile, data: Record<string, any>): string;

  /**
   * Renders a jinja template
   */
  jinja(text: string | WorkspaceFile, data: Record<string, any>): string;

  /**
   * Computes a diff between two files
   */
  diff(
    left: string | WorkspaceFile,
    right: string | WorkspaceFile,
    options?: DefDiffOptions,
  ): string;

  /**
   * Cleans up a dataset made of rows of data
   * @param rows
   * @param options
   */
  tidyData(rows: object[], options?: DataFilter): object[];

  /**
   * Applies a GROQ query to the data
   * @param data data object to filter
   * @param query query
   * @see https://groq.dev/
   */
  GROQ(query: string, data: any): Promise<any>;

  /**
   * Computes a sha1 that can be used for hashing purpose, not cryptographic.
   * @param content content to hash
   */
  hash(content: any, options?: HashOptions): Promise<string>;

  /**
   * Optionally removes a code fence section around the text
   * @param text
   * @param language
   */
  unfence(text: string, language?: ElementOrArray<string>): string;

  /**
   * Erase <think>...</think> tags
   * @param text
   */
  unthink(text: string): string;

  /**
   * Remove left indentation
   * @param text
   */
  dedent(templ: TemplateStringsArray | string, ...values: unknown[]): string;

  /**
   * Encodes ids in a text and returns the function to decode them
   * @param text
   * @param options
   */
  encodeIDs(
    text: string,
    options?: EncodeIDsOptions,
  ): {
    encoded: string;
    text: string;
    decode: (text: string) => string;
    matcher: RegExp;
    ids: Record<string, string>;
  };

  /**
   * Parses a prompty file
   * @param file
   */
  prompty(file: WorkspaceFile): Promise<PromptyDocument>;

  /**
   * Computes the Levenshtein distance between two strings or workspace files.
   */
  levenshtein(a: string | WorkspaceFile, b: string | WorkspaceFile): Promise<number>;

  /**
   * Create a file filter using the `.gitignore` format from the given filenames.
   * @param filenames
   */
  ignore(...filenames: string[]): Promise<GitIgnorer>;
}

 interface YAMLObject {
  /**
   * Parses a YAML string into a JavaScript object using JSON5.
   */
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  (strings: TemplateStringsArray, ...values: unknown[]): any;

  /**
   * Converts an object to its YAML representation
   * @param obj
   */
  stringify(obj: unknown): string;
  /**
   * Parses a YAML string to object
   */
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  parse(text: string | WorkspaceFile): any;
}

 interface PromptyFrontmatter {
  name?: string;
  description?: string;
  version?: string;
  authors?: string[];
  tags?: string[];
  sample?: Record<string, any> | string;
  inputs?: Record<
    string,
    | JSONSchemaArray
    | JSONSchemaNumber
    | JSONSchemaBoolean
    | JSONSchemaString
    | JSONSchemaObject
    | { type: "list" }
  >;
  outputs?: JSONSchemaObject;
  model?: {
    api?: "chat" | "completion";
    configuration?: {
      type?: string;
      name?: string;
      organization?: string;
      api_version?: string;
      azure_deployment: string;
      azure_endpoint: string;
    };
    parameters?: {
      response_format?: { type: "json_object" | "json_schema" };
      max_tokens?: number;
      temperature?: number;
      top_p?: number;
      n?: number;
      seed?: number;
      stream?: boolean; // ignored
      tools?: unknown[]; // ignored
    };
  };

  // unofficial
  files?: string | string[];
  tests?: PromptTest | PromptTest[];
}

 interface PromptyDocument {
  meta: PromptArgs;
  frontmatter: PromptyFrontmatter;
  content: string;
  messages: ChatMessage[];
}

 interface DiffFile {
  chunks: DiffChunk[];
  deletions: number;
  additions: number;
  from?: string;
  to?: string;
  oldMode?: string;
  newMode?: string;
  index?: string[];
  deleted?: true;
  new?: true;
}

 interface DiffChunk {
  content: string;
  changes: DiffChange[];
  oldStart: number;
  oldLines: number;
  newStart: number;
  newLines: number;
}

 interface DiffNormalChange {
  type: "normal";
  ln1: number;
  ln2: number;
  normal: true;
  content: string;
}

 interface DiffAddChange {
  type: "add";
  add: true;
  ln: number;
  content: string;
}

 interface DiffDeleteChange {
  type: "del";
  del: true;
  ln: number;
  content: string;
}

 type DiffChangeType = "normal" | "add" | "del";

 type DiffChange = DiffNormalChange | DiffAddChange | DiffDeleteChange;

 interface DIFFObject {
  /**
   * Parses a diff string into a structured object
   * @param input
   */
  parse(input: string): DiffFile[];

  /**
   * Given a filename and line number (0-based), finds the chunk in the diff
   * @param file
   * @param range line index or range [start, end] inclusive
   * @param diff
   */
  findChunk(
    file: string,
    range: number | [number, number] | number[],
    diff: ElementOrArray<DiffFile>,
  ): { file?: DiffFile; chunk?: DiffChunk } | undefined;

  /**
   * Creates a two file path
   * @param left
   * @param right
   * @param options
   */
  createPatch(
    left: string | WorkspaceFile,
    right: string | WorkspaceFile,
    options?: {
      context?: number;
      ignoreCase?: boolean;
      ignoreWhitespace?: boolean;
    },
  ): string;
}

 interface XMLObject {
  /**
   * Parses an XML payload to an object
   * @param text
   */
  parse(text: string | WorkspaceFile, options?: XMLParseOptions): Promise<any>;
}

 interface JSONSchemaUtilities {
  /**
   * Infers a JSON schema from an object
   * @param obj
   * @deprecated Use `fromParameters` instead
   */
  infer(obj: any): Promise<JSONSchema>;

  /**
   * Converts a parameters schema to a JSON schema
   * @param parameters
   */
  fromParameters(parameters: PromptParametersSchema | undefined): JSONSchema;
}

 interface HTMLTableToJSONOptions {
  useFirstRowForHeadings?: boolean;
  headers?: {
    from?: number;
    to: number;
    concatWith: string;
  };
  stripHtmlFromHeadings?: boolean;
  stripHtmlFromCells?: boolean;
  stripHtml?: boolean | null;
  forceIndexAsNumber?: boolean;
  countDuplicateHeadings?: boolean;
  ignoreColumns?: number[] | null;
  onlyColumns?: number[] | null;
  ignoreHiddenRows?: boolean;
  id?: string[] | null;
  headings?: string[] | null;
  containsClasses?: string[] | null;
  limitrows?: number | null;
}

 interface HTMLToMarkdownOptions {
  disableGfm?: boolean;
}

 interface HTMLObject {
  /**
   * Converts all HTML tables to JSON.
   * @param html
   * @param options
   */
  convertTablesToJSON(html: string, options?: HTMLTableToJSONOptions): Promise<object[][]>;
  /**
   * Converts HTML markup to plain text
   * @param html
   */
  convertToText(html: string): Promise<string>;
  /**
   * Converts HTML markup to markdown
   * @param html
   */
  convertToMarkdown(html: string, options?: HTMLToMarkdownOptions): Promise<string>;
}

 interface GitCommit {
  sha: string;
  date: string;
  author: string;
  message: string;
  files: string[];
}

 interface GitLogOptions {
  base?: string;
  head?: string;
  count?: number;
  merges?: boolean;
  author?: string;
  until?: string;
  after?: string;
  excludedGrep?: string | RegExp;
  paths?: ElementOrArray<string>;
  excludedPaths?: ElementOrArray<string>;
}

 interface GitWorktree {
  /**
   * Path to the worktree
   */
  path: string;
  /**
   * Branch name associated with the worktree
   */
  branch: string;
  /**
   * Commit SHA the worktree is checked out to
   */
  head: string;
  /**
   * Whether the worktree is bare
   */
  bare?: boolean;
  /**
   * Whether the worktree is detached (not on a branch)
   */
  detached?: boolean;
}

 interface GitWorktreeAddOptions {
  /**
   * Create a new branch with the worktree
   */
  branch?: string;
  /**
   * Force creation even if target exists
   */
  force?: boolean;
  /**
   * Checkout the branch into the worktree
   */
  checkout?: boolean;
  /**
   * Create an orphan branch
   */
  orphan?: boolean;
  /**
   * Detach HEAD at the commit
   */
  detach?: boolean;
}

 interface Git {
  /**
   * Current working directory
   */
  cwd: string;

  /**
   * Resolves the default branch for this repository
   */
  defaultBranch(): Promise<string>;

  /**
   * Gets the last tag in the repository
   */
  lastTag(): Promise<string>;

  /**
   * Gets the current branch of the repository
   */
  branch(): Promise<string>;

  /**
   * Executes a git command in the repository and returns the stdout
   * @param cmd
   */
  exec(
    args: string[] | string,
    options?: {
      label?: string;
    },
  ): Promise<string>;

  /**
   * Git fetches the remote repository
   * @param options
   */
  fetch(
    remote?: OptionsOrString<"origin">,
    branchOrSha?: string,
    options?: {
      prune?: boolean;
      all?: boolean;
    },
  ): Promise<string>;

  /**
   * Git pull the remote repository
   * @param options
   */
  pull(options?: { ff?: boolean }): Promise<string>;

  /**
   * Lists the branches in the git repository
   */
  listBranches(): Promise<string[]>;

  /**
   * Finds specific files in the git repository.
   * By default, work
   * @param options
   */
  listFiles(
    scope?: "modified-base" | "staged" | "modified",
    options?: {
      base?: string;
      /**
       * Ask the user to stage the changes if the diff is empty.
       */
      askStageOnEmpty?: boolean;
      paths?: ElementOrArray<string>;
      excludedPaths?: ElementOrArray<string>;
    },
  ): Promise<WorkspaceFile[]>;

  /**
   *
   * @param options
   */
  diff(options?: {
    staged?: boolean;
    /**
     * Ask the user to stage the changes if the diff is empty.
     */
    askStageOnEmpty?: boolean;
    base?: string;
    head?: string;
    paths?: ElementOrArray<string>;
    excludedPaths?: ElementOrArray<string>;
    unified?: number;
    nameOnly?: boolean;
    algorithm?: "patience" | "minimal" | "histogram" | "myers";
    ignoreSpaceChange?: boolean;
    extras?: string[];
    /**
     * Modifies the diff to be in a more LLM friendly format
     */
    llmify?: boolean;
    /**
     * Maximum of tokens before returning a name-only diff
     */
    maxTokensFullDiff?: number;
  }): Promise<string>;

  /**
   * Lists the commits in the git repository
   */
  log(options?: GitLogOptions): Promise<GitCommit[]>;

  /**
   * Run git blame on a file, line
   * @param filename
   * @param line
   */
  blame(filename: string, line: number): Promise<string>;

  /**
   * Returns a list of files that have changed in the git repository
   * @param options
   */
  changedFiles(options?: GitLogOptions & { readText?: string }): Promise<WorkspaceFile[]>;

  /**
   * Create a shallow git clone
   * @param repository URL of the remote repository
   * @param options various clone options
   * @returns the path to the cloned repository
   */
  shallowClone(
    repository: string,
    options?: {
      /**
       * Branch to clone
       */
      branch?: string;

      /**
       * Do not reuse previous clone
       */
      force?: boolean;

      /**
       * Runs install command after cloning
       */
      install?: boolean;

      /**
       * Number of commits to fetch
       */
      depth?: number;
    },
  ): Promise<Git>;

  /**
   * Open a git client on a different directory
   * @param cwd working directory
   */
  client(cwd: string): Git;

  /**
   * List all git worktrees
   */
  listWorktrees(): Promise<GitWorktree[]>;

  /**
   * Add a new git worktree
   * @param path path where the worktree should be created
   * @param commitish commit, branch, or tag to checkout
   * @param options additional options for worktree creation
   * @returns Git client opened at the worktree path
   */
  addWorktree(path: string, commitish?: string, options?: GitWorktreeAddOptions): Promise<Git>;

  /**
   * Remove a git worktree
   * @param path path to the worktree to remove
   * @param options removal options
   */
  removeWorktree(
    path: string,
    options?: {
      force?: boolean;
    },
  ): Promise<void>;
}

/**
 * A ffmpeg command builder. This instance is a minimal ffmpeg command builder.
 */
 interface FfmpegCommandBuilder {
  seekInput(startTime: number | string): FfmpegCommandBuilder;
  duration(duration: number | string): FfmpegCommandBuilder;
  noVideo(): FfmpegCommandBuilder;
  noAudio(): FfmpegCommandBuilder;
  audioCodec(codec: string): FfmpegCommandBuilder;
  audioBitrate(bitrate: string | number): FfmpegCommandBuilder;
  audioChannels(channels: number): FfmpegCommandBuilder;
  audioFrequency(freq: number): FfmpegCommandBuilder;
  audioQuality(quality: number): FfmpegCommandBuilder;
  audioFilters(filters: string | string[] /* | AudioVideoFilter[]*/): FfmpegCommandBuilder;
  toFormat(format: string): FfmpegCommandBuilder;

  videoCodec(codec: string): FfmpegCommandBuilder;
  videoBitrate(bitrate: string | number, constant?: boolean): FfmpegCommandBuilder;
  videoFilters(filters: string | string[]): FfmpegCommandBuilder;
  outputFps(fps: number): FfmpegCommandBuilder;
  frames(frames: number): FfmpegCommandBuilder;
  keepDisplayAspectRatio(): FfmpegCommandBuilder;
  size(size: string): FfmpegCommandBuilder;
  aspectRatio(aspect: string | number): FfmpegCommandBuilder;
  autopad(pad?: boolean, color?: string): FfmpegCommandBuilder;

  inputOptions(...options: string[]): FfmpegCommandBuilder;
  outputOptions(...options: string[]): FfmpegCommandBuilder;
}

 interface FFmpegCommandOptions extends CacheOptions {
  inputOptions?: ElementOrArray<string>;
  outputOptions?: ElementOrArray<string>;
  /**
   * For video conversion, output size as `wxh`
   */
  size?: string;
}

 interface VideoExtractFramesOptions extends FFmpegCommandOptions {
  /**
   * A set of seconds or timestamps (`[[hh:]mm:]ss[.xxx]`)
   */
  timestamps?: number[] | string[];
  /**
   * Number of frames to extract
   */
  count?: number;
  /**
   * Extract frames on the start of each transcript segment
   */
  transcript?: TranscriptionResult | string;
  /**
   * Extract Intra frames (keyframes). This is a efficient and fast decoding.
   */
  keyframes?: boolean;
  /**
   * Picks frames that exceed scene threshold (between 0 and 1), typically between 0.2, and 0.5.
   * This is computationally intensive.
   */
  sceneThreshold?: number;
  /**
   * Output of the extracted frames
   */
  format?: OptionsOrString<"jpeg" | "png">;
}

 interface VideoExtractClipOptions extends FFmpegCommandOptions {
  /**
   * Start time of the clip in seconds or timestamp (`[[hh:]mm:]ss[.xxx]`)
   */
  start: number | string;
  /**
   * Duration of the clip in seconds or timestamp (`[[hh:]mm:]ss[.xxx]`).
   * You can also specify `end`.
   */
  duration?: number | string;
  /**
   * End time of the clip in seconds or timestamp (`[[hh:]mm:]ss[.xxx]`).
   * You can also specify `duration`.
   */
  end?: number | string;
}

 interface VideoExtractAudioOptions extends FFmpegCommandOptions {
  /**
   * Optimize for speech-to-text transcription. Default is true.
   */
  transcription?: boolean;

  forceConversion?: boolean;
}

 interface Ffmpeg {
  /**
   * Extracts metadata information from a video file using ffprobe
   * @param filename
   */
  probe(file: string | WorkspaceFile, options?: FFmpegCommandOptions): Promise<VideoProbeResult>;

  /**
   * Extracts frames from a video file
   * @param options
   */
  extractFrames(
    file: string | WorkspaceFile,
    options?: VideoExtractFramesOptions,
  ): Promise<string[]>;

  /**
   * Extracts a clip from a video. Returns the generated video file path.
   */
  extractClip(file: string | WorkspaceFile, options: VideoExtractClipOptions): Promise<string>;

  /**
   * Extract the audio track from a video
   * @param videoPath
   */
  extractAudio(file: string | WorkspaceFile, options?: VideoExtractAudioOptions): Promise<string>;

  /**
   * Runs a ffmpeg command and returns the list of generated file names
   * @param input
   * @param builder manipulates the ffmpeg command and returns the output name
   */
  run(
    input: string | WorkspaceFile,
    builder: (
      cmd: FfmpegCommandBuilder,
      options?: { input: string; dir: string },
    ) => Awaitable<string>,
    options?: FFmpegCommandOptions,
  ): Promise<string[]>;
}

 interface TranscriptionSegment {
  id?: string;
  start: number;
  end?: number;
  text: string;
}

 interface GitHubOptions {
  owner: string;
  repo: string;
  baseUrl?: string;
  auth?: string;
  ref?: string;
  refName?: string;
  issueNumber?: number;
  runId?: string;
  runUrl?: string;
}

 type GitHubWorkflowRunStatus =
  | "completed"
  | "action_required"
  | "cancelled"
  | "failure"
  | "neutral"
  | "skipped"
  | "stale"
  | "success"
  | "timed_out"
  | "in_progress"
  | "queued"
  | "requested"
  | "waiting"
  | "pending";

 interface GitHubNode {
  id: number;
  node_id: string;
}

 interface GitHubWorkflowRun extends GitHubNode {
  run_number: number;
  name?: string;
  display_title: string;
  status: string;
  conclusion: string;
  html_url: string;
  created_at: string;
  head_branch: string;
  head_sha: string;
  workflow_id: number;
  run_started_at?: string;
}

 interface GitHubWorkflowJob extends GitHubNode {
  run_id: number;
  status: string;
  conclusion: string;
  name: string;
  html_url: string;
  logs_url: string;
  logs: string;
  started_at: string;
  completed_at: string;
  content: string;
}

 interface GitHubIssue extends GitHubNode {
  body?: string;
  title: string;
  number: number;
  state: string;
  state_reason?: "completed" | "reopened" | "not_planned" | null;
  html_url: string;
  draft?: boolean;
  reactions?: GitHubReactions;
  user: GitHubUser;
  assignee?: GitHubUser;
  labels?: (string | { name?: string })[];
  created_at: string;
  updated_at?: string;
  closed_at?: string;
}

 type GitHubReactionType =
  | "eyes"
  | "hooray"
  | "heart"
  | "rocket"
  | "confused"
  | "laugh"
  | "+1"
  | "-1";

 interface GitHubRef {
  ref: string;
  url: string;
}

 interface GitHubReactions {
  url: string;
  total_count: number;
  "+1": number;
  "-1": number;
  laugh: number;
  confused: number;
  heart: number;
  hooray: number;
  eyes: number;
  rocket: number;
}

 interface GitHubReaction {
  id: number;
  user: GitHubUser;
  content: GitHubReactionType;
  created_at: string;
}

 interface GitHubComment extends GitHubNode {
  body?: string;
  user: GitHubUser;
  created_at: string;
  updated_at: string;
  html_url: string;
  reactions?: GitHubReactions;
}

 interface GitHubPullRequest extends GitHubIssue {
  head: {
    ref: string;
  };
  base: {
    ref: string;
  };
}

 interface GitHubCodeSearchResult {
  name: string;
  path: string;
  sha: string;
  html_url: string;
  score: number;
  repository: string;
}

 interface GitHubWorkflow extends GitHubNode {
  name: string;
  path: string;
}

 interface GitHubPaginationOptions {
  /**
   * Default number of items to fetch, default is 50.
   */
  count?: number;
}

 interface GitHubFile extends WorkspaceFile {
  type: "file" | "dir" | "submodule" | "symlink";
  size: number;
}

 interface GitHubUser {
  login: string;
}

 interface GitHubRelease {
  id: number;
  tag_name: string;
  name: string;
  draft?: boolean;
  prerelease?: boolean;
  html_url: string;
  published_at: string;
  body?: string;
}

 interface GitHubGist {
  id: string;
  description?: string;
  created_at?: string;
  files: WorkspaceFile[];
}

 interface GitHubArtifact {
  id: number;
  name: string;
  size_in_bytes: number;
  url: string;
  archive_download_url: string;
  expires_at: string;
}

 interface GitHubIssueUpdateOptions {
  title?: string;
  body?: string;
  assignee?: string;
  state?: "open" | "closed";
  assignees?: string[];
  labels?: string[];
}

 interface GitHubIssueCreateOptions {
  labels?: string[];
  /**
   * Parent issue number to add this issue as a sub-issue
   */
  parentIssue?: number | string;
}

 interface GitHubLabel {
  name: string;
  color?: string;
  description?: string;
}

 interface GitHub {
  /**
   * Gets connection information for octokit
   */
  info(): Promise<GitHubOptions | undefined>;

  /**
   * Gets the details of a GitHub workflow
   * @param workflowId
   */
  workflow(workflowId: number | string): Promise<GitHubWorkflow>;

  /**
   * Lists workflows in a GitHub repository
   */
  listWorkflows(options?: GitHubPaginationOptions): Promise<GitHubWorkflow[]>;

  /**
   * Lists workflow runs for a given workflow
   * @param workflowId
   * @param options
   */
  listWorkflowRuns(
    workflow_id: string | number,
    options?: {
      branch?: string;
      event?: string;
      status?: GitHubWorkflowRunStatus;
    } & GitHubPaginationOptions,
  ): Promise<GitHubWorkflowRun[]>;

  /**
   * Gets the details of a GitHub Action workflow run
   * @param runId
   */
  workflowRun(runId: number | string): Promise<GitHubWorkflowRun>;

  /**
   * List artifacts for a given workflow run
   * @param runId
   */
  listWorkflowRunArtifacts(
    runId: number | string,
    options?: GitHubPaginationOptions,
  ): Promise<GitHubArtifact[]>;

  /**
   * Gets the details of a GitHub Action workflow run artifact
   * @param artifactId
   */
  artifact(artifactId: number | string): Promise<GitHubArtifact>;

  /**
   * Downloads and unzips archive files from a GitHub Action Artifact
   * @param artifactId
   */
  downloadArtifactFiles(artifactId: number | string): Promise<WorkspaceFile[]>;

  /**
   * Downloads a GitHub Action workflow run log
   * @param runId
   */
  listWorkflowJobs(runId: number, options?: GitHubPaginationOptions): Promise<GitHubWorkflowJob[]>;

  /**
   * Downloads a GitHub Action workflow run log
   * @param jobId
   */
  downloadWorkflowJobLog(jobId: number, options?: { llmify?: boolean }): Promise<string>;

  /**
   * Diffs two GitHub Action workflow job logs
   */
  diffWorkflowJobLogs(job_id: number, other_job_id: number): Promise<string>;

  /**
   * List labels in repository
   */
  listIssueLabels(issueNumber?: string | number): Promise<GitHubLabel[]>;

  /**
   * Lists issues for a given repository
   * @param options
   */
  listIssues(
    options?: {
      state?: "open" | "closed" | "all";
      labels?: string;
      sort?: "created" | "updated" | "comments";
      direction?: "asc" | "desc";
      creator?: string;
      assignee?: string;
      since?: string;
      mentioned?: string;
    } & GitHubPaginationOptions,
  ): Promise<GitHubIssue[]>;

  /**
   * Lists gists for a given user
   */
  listGists(): Promise<GitHubGist[]>;

  /**
   * Gets the files of a gist
   * @param gist_id
   */
  getGist(gist_id: string): Promise<GitHubGist | undefined>;

  /**
   * Gets the details of a GitHub issue
   * @param issueNumber issue number (not the issue id!). If undefined, reads value from GITHUB_ISSUE environment variable.
   */
  getIssue(issueNumber?: number | string): Promise<GitHubIssue>;

  /**
   * Assigns an existing issue to a bot user. Defaults to copilot user.
   */
  assignIssueToBot(
    issue_number: number | string,
    options?: { bot?: string },
  ): Promise<{ id: string; title: string }>;

  /**
   * Creates a new issue or pull request on GitHub
   */
  createIssue(
    title: string,
    body: string,
    options?: GitHubIssueCreateOptions,
  ): Promise<GitHubIssue>;

  /**
   * Updates an issue or pull request on GitHub
   * @param issueNumber
   * @param options
   */
  updateIssue(
    issueNumber: number | string,
    options: GitHubIssueUpdateOptions,
  ): Promise<GitHubIssue>;

  /**
   * Create a GitHub issue comment
   * @param issueNumber issue number (not the issue id!). If undefined, reads value from GITHUB_ISSUE environment variable.
   * @param body the body of the comment as Github Flavored markdown
   */
  createIssueComment(issueNumber: number | string, body: string): Promise<GitHubComment>;

  /**
   * Lists comments for a given issue
   * @param issue_number
   * @param options
   */
  listIssueComments(
    issue_number: number | string,
    options?: GitHubPaginationOptions,
  ): Promise<GitHubComment[]>;

  /**
   * Updates a comment on a GitHub issue
   * @param comment_id
   * @param body the updated comment body
   */
  updateIssueComment(
    comment_id: number | string,
    body: string,
    options?: GitHubAIDisclaimerOptions,
  ): Promise<GitHubComment>;

  createReaction(
    type: "issue" | "issueComment" | "pullRequestReviewComment",
    id: number | string,
    reaction: GitHubReactionType,
  ): Promise<GitHubReaction>;

  /**
   * Lists pull requests for a given repository
   * @param options
   */
  listPullRequests(
    options?: {
      state?: "open" | "closed" | "all";
      sort?: "created" | "updated" | "popularity" | "long-running";
      direction?: "asc" | "desc";
    } & GitHubPaginationOptions,
  ): Promise<GitHubPullRequest[]>;

  /**
   * Gets the details of a GitHub pull request
   * @param pull_number pull request number. Default resolves the pull request for the current branch.
   */
  getPullRequest(pull_number?: number | string): Promise<GitHubPullRequest>;

  /**
   * Lists comments for a given pull request
   * @param pull_number
   * @param options
   */
  listPullRequestReviewComments(
    pull_number: number,
    options?: GitHubPaginationOptions,
  ): Promise<GitHubComment[]>;

  /**
   * Gets the content of a file from a GitHub repository
   * @param filepath
   * @param options
   */
  getFile(
    filepath: string,
    /**
     * commit sha, branch name or tag name
     */
    ref: string,
  ): Promise<WorkspaceFile>;

  /**
   * Searches code in a GitHub repository
   */
  searchCode(query: string, options?: GitHubPaginationOptions): Promise<GitHubCodeSearchResult[]>;

  /**
   * Lists branches in a GitHub repository
   */
  listBranches(options?: GitHubPaginationOptions): Promise<string[]>;

  /**
   * Lists tags in a GitHub repository
   */
  listRepositoryLanguages(): Promise<Record<string, number>>;

  /**
   * List latest releases in a GitHub repository
   * @param options
   */
  listReleases(options?: GitHubPaginationOptions): Promise<GitHubRelease[]>;

  /**
   * Lists tags in a GitHub repository
   */
  getRepositoryContent(
    path?: string,
    options?: {
      ref?: string;
      glob?: string;
      downloadContent?: boolean;
      maxDownloadSize?: number;
      type?: GitHubFile["type"];
    },
  ): Promise<GitHubFile[]>;

  /**
   * Uploads a file to an orphaned branch in the repository and returns the raw url
   * Uploads a single copy of the file using hash as the name.
   * @param file file or data to upload
   * @param options
   */
  uploadAsset(
    file: BufferLike,
    options?: {
      branchName?: string;
    },
  ): Promise<string>;

  /**
   * Resolves user uploaded assets to a short lived URL with access token. Returns undefined if the asset is not found.
   */
  resolveAssetUrl(url: string): Promise<string | undefined>;

  /**
   * Executes a GraphQL query against the GitHub API. By default, injects the `owner`, `repo`, `ref` variables.
   * @param query
   * @param variables
   */
  graphql<T = any>(query: string, variables?: Record<string, any>): Promise<T>;

  /**
   * Gets the underlying Octokit client
   */
  api(): Promise<any>;

  /**
   * Opens a client to a different repository
   * @param owner
   * @param repo
   */
  client(owner: string, repo: string): GitHub;

  /**
   * Create a worktree for a specific GitHub pull request
   * @param pullNumber pull request number
   * @param path path where the worktree should be created
   * @param options additional options
   * @returns Git client opened at the worktree path
   */
  addWorktreeForPullRequest(
    pullNumber: number | string,
    path?: string,
    options?: GitWorktreeAddOptions,
  ): Promise<Git>;

  /**
   * Creates a URL that opens GitHub's new issue form with pre-filled title, body, and assignees
   * @param title The issue title
   * @param body The issue body content (optional)
   * @param assignees Optional array of GitHub usernames to assign to the issue
   * @returns GitHub URL for creating a new issue with pre-filled data
   */
  createIssueUrl(title: string, body?: string, assignees?: string[]): Promise<string>;
}

 interface MDObject {
  /**
   * Parses front matter from markdown
   * @param text
   */
  frontmatter(text: string | WorkspaceFile, format?: "yaml" | "json" | "toml" | "text"): any;

  /**
   * Removes the front matter from the markdown text
   */
  content(text: string | WorkspaceFile): string;

  /**
   * Merges frontmatter with the existing text
   * @param text
   * @param frontmatter
   * @param format
   */
  updateFrontmatter(text: string, frontmatter: unknown, format?: "yaml" | "json"): string;

  /**
   * Attempts to chunk markdown in text section in a way that does not splitting the heading structure.
   * @param text
   * @param options
   */
  chunk(
    text: string | WorkspaceFile,
    options?: { maxTokens?: number; model?: string; pageSeparator?: string },
  ): Promise<TextChunk[]>;

  /**
   * Pretty prints object to markdown
   * @param value
   */
  stringify(
    value: unknown,
    options?: {
      quoteValues?: boolean;
      headings?: number;
      headingLevel?: number;
    },
  ): string;
}

 interface GitHubAIDisclaimerOptions extends Record<string, unknown> {}

 interface JSONLObject {
  /**
   * Parses a JSONL string to an array of objects
   * @param text
   */
  parse(text: string | WorkspaceFile): any[];
  /**
   * Converts objects to JSONL format
   * @param objs
   */
  stringify(objs: unknown[]): string;

  /**
   * Appends an object to a JSONL file
   * @param filename
   * @param obj
   */
  append(name: string, objs: ElementOrArray<unknown>, meta?: any): Promise<void>;
}

 interface INIObject {
  /**
   * Parses a .ini file
   * @param text
   */
  parse(text: string | WorkspaceFile): any;

  /**
   * Converts an object to.ini string
   * @param value
   */
  stringify(value: any): string;
}

 interface JSON5Object {
  /**
   * Parses a JSON/YAML/XML string to an object
   * @param text
   */
  parse(text: string | WorkspaceFile): any;

  /**
   * Renders an object to a JSON5-LLM friendly string
   * @param value
   */
  stringify(value: any): string;
}

 interface CSVStringifyOptions {
  delimiter?: string;
  header?: boolean;
}

/**
 * Interface representing CSV operations.
 */
 interface CSVObject {
  /**
   * Parses a CSV string to an array of objects.
   *
   * @param text - The CSV string to parse.
   * @param options - Optional settings for parsing.
   * @param options.delimiter - The delimiter used in the CSV string. Defaults to ','.
   * @param options.headers - An array of headers to use. If not provided, headers will be inferred from the first row.
   * @returns An array of objects representing the parsed CSV data.
   */
  parse(text: string | WorkspaceFile, options?: CSVParseOptions): object[];

  /**
   * Converts an array of objects to a CSV string.
   *
   * @param csv - The array of objects to convert.
   * @param options - Optional settings for stringifying.
   * @param options.headers - An array of headers to use. If not provided, headers will be inferred from the object keys.
   * @returns A CSV string representing the data.
   */
  stringify(csv: object[], options?: CSVStringifyOptions): string;

  /**
   * Converts an array of objects that represents a data table to a markdown table.
   *
   * @param csv - The array of objects to convert.
   * @param options - Optional settings for markdown conversion.
   * @param options.headers - An array of headers to use. If not provided, headers will be inferred from the object keys.
   * @returns A markdown string representing the data table.
   */
  markdownify(csv: object[], options?: { headers?: string[] }): string;

  /**
   * Splits the original array into chunks of the specified size.
   * @param csv
   * @param rows
   */
  chunk(csv: object[], size: number): { chunkStartIndex: number; rows: object[] }[];
}

/**
 * Provide service for responsible.
 */
 interface ContentSafety {
  /**
   * Service identifier
   */
  id: string;

  /**
   * Scans text for the risk of a User input attack on a Large Language Model.
   * If not supported, the method is not defined.
   */
  detectPromptInjection?(
    content: Awaitable<ElementOrArray<string> | ElementOrArray<WorkspaceFile>>,
  ): Promise<{ attackDetected: boolean; filename?: string; chunk?: string }>;
  /**
   * Analyzes text for harmful content.
   * If not supported, the method is not defined.
   * @param content
   */
  detectHarmfulContent?(
    content: Awaitable<ElementOrArray<string> | ElementOrArray<WorkspaceFile>>,
  ): Promise<{
    harmfulContentDetected: boolean;
    filename?: string;
    chunk?: string;
  }>;
}

 interface HighlightOptions {
  maxLength?: number;
}

 interface WorkspaceFileIndex {
  /**
   * Gets the index name
   */
  name: string;
  /**
   * Uploads or merges files into the index
   */
  insertOrUpdate: (file: ElementOrArray<WorkspaceFile>) => Promise<void>;
  /**
   * Searches the index
   */
  search: (
    query: string,
    options?: { topK?: number; minScore?: number },
  ) => Promise<WorkspaceFileWithScore[]>;
}

 interface VectorIndexOptions extends EmbeddingsModelOptions {
  /**
   * Type of database implementation.
   * - `local` uses a local database using embeddingsModel
   * - `azure_ai_search` uses Azure AI Search
   */
  type?: "local" | "azure_ai_search";
  version?: number;
  deleteIfExists?: boolean;
  chunkSize?: number;
  chunkOverlap?: number;

  /**
   * Max tokens in a request
   */
  maxTokens?: number;

  /**
   * Embeddings vector size
   */
  vectorSize?: number;
  /**
   * Override default embeddings cache name
   */
  cacheName?: string;
  /**
   * Cache salt to invalidate cache entries
   */
  cacheSalt?: string;
}

 interface VectorSearchOptions extends VectorIndexOptions {
  /**
   * Maximum number of embeddings to use
   */
  topK?: number;
  /**
   * Minimum similarity score
   */
  minScore?: number;
  /**
   * Index to use
   */
  indexName?: string;
}

 interface FuzzSearchOptions {
  /**
   * Controls whether to perform prefix search. It can be a simple boolean, or a
   * function.
   *
   * If a boolean is passed, prefix search is performed if true.
   *
   * If a function is passed, it is called upon search with a search term, the
   * positional index of that search term in the tokenized search query, and the
   * tokenized search query.
   */
  prefix?: boolean;
  /**
   * Controls whether to perform fuzzy search. It can be a simple boolean, or a
   * number, or a function.
   *
   * If a boolean is given, fuzzy search with a default fuzziness parameter is
   * performed if true.
   *
   * If a number higher or equal to 1 is given, fuzzy search is performed, with
   * a maximum edit distance (Levenshtein) equal to the number.
   *
   * If a number between 0 and 1 is given, fuzzy search is performed within a
   * maximum edit distance corresponding to that fraction of the term length,
   * approximated to the nearest integer. For example, 0.2 would mean an edit
   * distance of 20% of the term length, so 1 character in a 5-characters term.
   * The calculated fuzziness value is limited by the `maxFuzzy` option, to
   * prevent slowdown for very long queries.
   */
  fuzzy?: boolean | number;
  /**
   * Controls the maximum fuzziness when using a fractional fuzzy value. This is
   * set to 6 by default. Very high edit distances usually don't produce
   * meaningful results, but can excessively impact search performance.
   */
  maxFuzzy?: number;
  /**
   * Maximum number of results to return
   */
  topK?: number;
  /**
   * Minimum score
   */
  minScore?: number;
}

 interface Retrieval {
  /**
   * Executers a web search with Tavily or Bing Search.
   * @param query
   */
  webSearch(
    query: string,
    options?: {
      count?: number;
      provider?: "tavily" | "bing";
      /**
       * Return undefined when no web search providers are present
       */
      ignoreMissingProvider?: boolean;
    },
  ): Promise<WorkspaceFile[]>;

  /**
   * Search using similarity distance on embeddings
   */
  vectorSearch(
    query: string,
    files: (string | WorkspaceFile) | (string | WorkspaceFile)[],
    options?: VectorSearchOptions,
  ): Promise<WorkspaceFile[]>;

  /**
   * Loads or creates a file index using a vector index
   * @param options
   */
  index(id: string, options?: VectorIndexOptions): Promise<WorkspaceFileIndex>;

  /**
   * Performs a fuzzy search over the files
   * @param query keywords to search
   * @param files list of files
   * @param options fuzzing configuration
   */
  fuzzSearch(
    query: string,
    files: WorkspaceFile | WorkspaceFile[],
    options?: FuzzSearchOptions,
  ): Promise<WorkspaceFile[]>;
}

 interface ArrayFilter {
  /**
   * Selects the first N elements from the data
   */
  sliceHead?: number;
  /**
   * Selects the last N elements from the data
   */
  sliceTail?: number;
  /**
   * Selects the a random sample of N items in the collection.
   */
  sliceSample?: number;
}

 interface DataFilter extends ArrayFilter {
  /**
   * The keys to select from the object.
   * If a key is prefixed with -, it will be removed from the object.
   */
  headers?: ElementOrArray<string>;
  /**
   * Removes items with duplicate values for the specified keys.
   */
  distinct?: ElementOrArray<string>;
  /**
   * Sorts the data by the specified key(s)
   */
  sort?: ElementOrArray<string>;
}

 interface DefDataOptions
  extends Omit<ContextExpansionOptions, "maxTokens">,
    FenceFormatOptions,
    DataFilter,
    ContentSafetyOptions {
  /**
   * Output format in the prompt. Defaults to Markdown table rendering.
   */
  format?: "json" | "yaml" | "csv";

  /**
   * GROQ query to filter the data
   * @see https://groq.dev/
   */
  query?: string;
}

 interface DefSchemaOptions {
  /**
   * Output format in the prompt.
   */
  format?: "typescript" | "json" | "yaml";
}

 type ChatFunctionArgs = { context: ToolCallContext } & Record<string, any>;
 type ChatFunctionHandler = (args: ChatFunctionArgs) => Awaitable<ToolCallOutput>;
 type ChatMessageRole = "user" | "assistant" | "system";

 interface HistoryMessageUser {
  role: "user";
  content: string;
}

 interface HistoryMessageAssistant {
  role: "assistant";
  name?: string;
  content: string;
}

 interface WriteTextOptions extends ContextExpansionOptions {
  /**
   * Append text to the assistant response. This feature is not supported by all models.
   * @deprecated
   */
  assistant?: boolean;
  /**
   * Specifies the message role. Default is user
   */
  role?: ChatMessageRole;
}

 type PromptGenerator = (ctx: ChatGenerationContext) => Awaitable<unknown>;

 interface PromptGeneratorOptions
  extends ModelOptions,
    PromptSystemOptions,
    ContentSafetyOptions,
    SecretDetectionOptions,
    MetadataOptions {
  /**
   * Label for trace
   */
  label?: string;

  /**
   * Write file edits to the file system
   */
  applyEdits?: boolean;

  /**
   * Throws if the generation is not successful
   */
  throwOnError?: boolean;
}

 interface FileOutputOptions {
  /**
   * Schema identifier to validate the generated file
   */
  schema?: string;
}

 interface FileOutput {
  pattern: string[];
  description?: string;
  options?: FileOutputOptions;
}

 interface ImportTemplateOptions {
  /**
   * Ignore unknown arguments
   */
  allowExtraArguments?: boolean;

  /**
   * Template engine syntax
   */
  format?: "mustache" | "jinja";
}

 interface PromptTemplateString {
  /**
   * Set a priority similar to CSS z-index
   * to control the trimming of the prompt when the context is full
   * @param priority
   */
  priority(value: number): PromptTemplateString;
  /**
   * Sets the context layout flex weight
   */
  flex(value: number): PromptTemplateString;
  /**
   * Applies jinja template to the string lazily
   * @param data jinja data
   */
  jinja(data: Record<string, any>): PromptTemplateString;
  /**
   * Applies mustache template to the string lazily
   * @param data mustache data
   */
  mustache(data: Record<string, any>): PromptTemplateString;
  /**
   * Sets the max tokens for this string
   * @param tokens
   */
  maxTokens(tokens: number): PromptTemplateString;

  /**
   * Updates the role of the message
   */
  role(role: ChatMessageRole): PromptTemplateString;

  /**
   * Configure the cacheability of the prompt.
   * @param value cache control type
   */
  cacheControl(value: PromptCacheControlType): PromptTemplateString;
}

 type ImportTemplateArgumentType =
  | Awaitable<string | number | boolean>
  | (() => Awaitable<string | number | boolean>);

/**
 * Represents the context for generating a chat turn in a prompt template.
 * Provides methods for importing templates, writing text, adding assistant responses,
 * creating template strings, fencing code blocks, defining variables, and logging.
 */
 interface ChatTurnGenerationContext {
  importTemplate(
    files: ElementOrArray<string | WorkspaceFile>,
    templateArguments?: Record<string, ImportTemplateArgumentType>,
    options?: ImportTemplateOptions,
  ): void;
  writeText(body: Awaitable<string>, options?: WriteTextOptions): void;
  assistant(text: Awaitable<string>, options?: Omit<WriteTextOptions, "assistant">): void;
  $(strings: TemplateStringsArray, ...args: any[]): PromptTemplateString;
  fence(body: StringLike, options?: FenceOptions): void;
  def(
    name: string,
    body: string | WorkspaceFile | WorkspaceFile[] | ShellOutput | Fenced | RunPromptResult,
    options?: DefOptions,
  ): string;
  defImages(files: ElementOrArray<BufferLike>, options?: DefImagesOptions): void;
  defData(name: string, data: Awaitable<object[] | object>, options?: DefDataOptions): string;
  defDiff<T extends string | WorkspaceFile>(
    name: string,
    left: T,
    right: T,
    options?: DefDiffOptions,
  ): string;
  console: PromptGenerationConsole;
}

 interface FileUpdate {
  before: string;
  after: string;
  validation?: FileEditValidation;
}

 interface RunPromptResultPromiseWithOptions extends Promise<RunPromptResult> {
  options(values?: PromptGeneratorOptions): RunPromptResultPromiseWithOptions;
}

 interface DefToolOptions extends ContentSafetyOptions {
  /**
   * Maximum number of tokens per tool content response
   */
  maxTokens?: number;

  /**
   * Suffix to identify the variant instantiation of the tool
   */
  variant?: string;

  /**
   * Updated description for the variant
   */
  variantDescription?: string;

  /**
   * Intent of the tool that will be used for LLM judge validation of the output.
   * `description` uses the tool description as the intent.
   * If the intent is a function, it must build a LLM-as-Judge prompt that emits OK/ERR categories.
   */
  intent?:
    | OptionsOrString<"description">
    | ((options: {
        tool: ToolDefinition;
        args: any;
        result: string;
        generator: ChatGenerationContext;
      }) => Awaitable<void>);
}

 interface DefAgentOptions extends Omit<PromptGeneratorOptions, "label">, DefToolOptions {
  /**
   * Excludes agent conversation from agent memory
   */
  disableMemory?: boolean;

  /**
   * Disable memory query on each query (let the agent call the tool)
   */
  disableMemoryQuery?: boolean;
}

 type ChatAgentHandler = (
  ctx: ChatGenerationContext,
  args: ChatFunctionArgs,
) => Awaitable<unknown>;

 interface McpToolSpecification {
  /**
   * Tool identifier
   */
  id: string;
  /**
   * The high level intent of the tool, which can be used for LLM judge validation.
   * `description` uses the tool description as the intent.
   */
  intent?: DefToolOptions["intent"];
}

 interface McpServerConfig extends ContentSafetyOptions {
  /**
   * The executable to run to start the server.
   * Required for stdio transport, not used for URL-based transports.
   */
  command?: OptionsOrString<"npx" | "uv" | "uvx" | "dotnet" | "docker" | "cargo">;
  /**
   * Command line arguments to pass to the executable.
   * Required for stdio transport, not used for URL-based transports.
   */
  args?: string[];
  /**
   * The URL to connect to for HTTP/WebSocket/SSE transports.
   * When provided, command and args are ignored.
   */
  url?: string;
  /**
   * The transport type to use. If not specified, will be inferred from the configuration.
   * - "stdio": Use StdioClientTransport (requires command and args)
   * - "http": Use StreamableHTTPClientTransport (requires url)
   * - "sse": Use SSEClientTransport (requires url)
   */
  type?: "stdio" | "http" | "sse";
  /**
   * The server version
   */
  version?: string;
  /**
   * The environment to use when spawning the process.
   *
   * If not specified, the result of getDefaultEnvironment() will be used.
   * Only used for stdio transport.
   */
  env?: Record<string, string>;
  /**
   * The working directory to use when spawning the process.
   *
   * If not specified, the current working directory will be inherited.
   * Only used for stdio transport.
   */
  cwd?: string;

  /**
   * Do not prepend client identifier with the tool id.
   */
  disableToolIdMangling?: boolean;

  id: string;
  options?: DefToolOptions;

  /**
   * A list of allowed tools and their specifications. This filtering is applied
   * before computing the sha signature.
   */
  tools?: ElementOrArray<string | McpToolSpecification>;

  /**
   * The sha signature of the tools returned by the server.
   * If set, the tools will be validated against this sha.
   * This is used to ensure that the tools are not modified by the server.
   */
  toolsSha?: string;

  /**
   * Validates that each tool has responses related to their description.
   */
  intent?: DefToolOptions["intent"];

  generator?: ChatGenerationContext;
}

 type McpServersConfig = Record<string, Omit<McpServerConfig, "id" | "options">> | string;

 interface McpAgentServerConfig extends McpServerConfig {
  description: string;
  instructions?: string;
  /**
   * Maximum number of tokens per tool content response
   */
  maxTokens?: number;
}

 type McpAgentServersConfig =
  | Record<string, Omit<McpAgentServerConfig, "id" | "options">>
  | string;

 type ZodTypeLike = { _def: any; safeParse: any; refine: any };

 type BufferLike =
  | string
  | WorkspaceFile
  | Buffer
  | Blob
  | ArrayBuffer
  | Uint8Array
  | ReadableStream
  | SharedArrayBuffer;

 type TranscriptionModelType = OptionsOrString<
  "openai:whisper-1" | "openai:gpt-4o-transcribe" | "whisperasr:default"
>;

 interface ImageGenerationOptions extends ImageTransformOptions, RetryOptions {
  model?: OptionsOrString<ModelImageGenerationType>;
  /**
   * The quality of the image that will be generated.
   * auto (default value) will automatically select the best quality for the given model.
   * high, medium and low are supported for gpt-image-1.
   * high is supported for dall-e-3.
   * dall-e-2 ignores this flag
   */
  quality?: "auto" | "low" | "medium" | "high";
  /**
   * Image size.
   * For gpt-image-1: 1024x1024, 1536x1024 (landscape), 1024x1536 (portrait), or auto (default value)
   * For dall-e: 256x256, 512x512, or 1024x1024 for dall-e-2, and one of 1024x1024, 1792x1024.
   */
  size?: OptionsOrString<
    | "auto"
    | "landscape"
    | "portrait"
    | "square"
    | "1536x1024"
    | "1024x1536"
    | "256x256"
    | "512x512"
    | "1024x1024"
    | "1024x1792"
    | "1792x1024"
  >;
  /**
   * Only used for DALL-E 3
   */
  style?: OptionsOrString<"vivid" | "natural">;

  /**
   * For gpt-image-1 only, the type of image format to generate.
   */
  outputFormat?: "png" | "jpeg" | "webp";

  /**
   * Generation mode. Defaults to "generate".
   * - "generate": Create new images from text prompts
   * - "edit": Edit existing images using text prompts and optional masks
   */
  mode?: "generate" | "edit";

  /**
   * Input image for edit mode.
   * Required for "edit" mode.
   */
  image?: BufferLike;

  /**
   * Mask image for edit mode (optional).
   * Used to specify which parts of the image to edit.
   * Only applicable in "edit" mode.
   */
  mask?: BufferLike;
}

 interface TranscriptionOptions extends CacheOptions, RetryOptions {
  /**
   * Model to use for transcription. By default uses the `transcribe` alias.
   */
  model?: TranscriptionModelType;

  /**
   * Translate to English.
   */
  translate?: boolean;

  /**
   * Input language in iso-639-1 format.
   * @see https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes
   */
  language?: string;

  /**
   * The sampling temperature, between 0 and 1.
   * Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
   */
  temperature?: number;
}

 interface TranscriptionResult {
  /**
   * Complete transcription text
   */
  text: string;
  /**
   * Error if any
   */
  error?: SerializedError;

  /**
   * SubRip subtitle string from segments
   */
  srt?: string;

  /**
   * WebVTT subtitle string from segments
   */
  vtt?: string;

  /**
   * Individual segments
   */
  segments?: (TranscriptionSegment & {
    /**
     * Seek offset of the segment
     */
    seek?: number;
    /**
     * Temperature used for the generation of the segment
     */
    temperature?: number;
  })[];
}

 type SpeechModelType = OptionsOrString<
  "openai:tts-1-hd" | "openai:tts-1" | "openai:gpt-4o-mini-tts"
>;

 type SpeechVoiceType = OptionsOrString<
  | "alloy"
  | "ash"
  | "coral"
  | "echo"
  | "fable"
  | "onyx"
  | "nova"
  | "sage"
  | "shimmer"
  | "verse"
  | "ballad"
>;

 interface SpeechOptions extends CacheOptions, RetryOptions {
  /**
   * Speech to text model
   */
  model?: SpeechModelType;

  /**
   * Voice to use (model-specific)
   */
  voice?: SpeechVoiceType;

  /**
   * Control the voice of your generated audio with additional instructions. Does not work with tts-1 or tts-1-hd.
   */
  instructions?: string;
}

 interface SpeechResult {
  /**
   * Generate audio-buffer file
   */
  filename?: string;
  /**
   * Error if any
   */
  error?: SerializedError;
}

 interface ChatGenerationContext extends ChatTurnGenerationContext {
  env: ExpansionVariables;
  defSchema(name: string, schema: JSONSchema | ZodTypeLike, options?: DefSchemaOptions): string;
  defTool(
    tool: Omit<ToolCallback, "generator"> | McpServersConfig | McpClient,
    options?: DefToolOptions,
  ): void;
  defTool(
    name: string,
    description: string,
    parameters: PromptParametersSchema | JSONSchema,
    fn: ChatFunctionHandler,
    options?: DefToolOptions,
  ): void;
  defAgent(
    name: string,
    description: string,
    fn: string | ChatAgentHandler,
    options?: DefAgentOptions,
  ): void;
  defChatParticipant(participant: ChatParticipantHandler, options?: ChatParticipantOptions): void;
  defFileOutput(
    pattern: ElementOrArray<string | WorkspaceFile>,
    description: string,
    options?: FileOutputOptions,
  ): void;
  runPrompt(
    generator: string | PromptGenerator,
    options?: PromptGeneratorOptions,
  ): Promise<RunPromptResult>;
  prompt(strings: TemplateStringsArray, ...args: any[]): RunPromptResultPromiseWithOptions;
  defFileMerge(fn: FileMergeHandler): void;
  defOutputProcessor(fn: PromptOutputProcessorHandler): void;
  transcribe(
    audio: string | WorkspaceFile,
    options?: TranscriptionOptions,
  ): Promise<TranscriptionResult>;
  speak(text: string, options?: SpeechOptions): Promise<SpeechResult>;
  generateImage(
    prompt: string,
    options?: ImageGenerationOptions,
  ): Promise<{ image: WorkspaceFile; revisedPrompt?: string }>;
}

 interface ChatGenerationContextOptions {
  /**
   * Prompt generation context
   */
  generator?: ChatGenerationContext;
}

 interface GenerationOutput {
  /**
   * full chat history
   */
  messages: ChatMessage[];

  /**
   * LLM output.
   */
  text: string;

  /**
   * Reasoning produced by model
   */
  reasoning?: string;

  /**
   * Parsed fence sections
   */
  fences: Fenced[];

  /**
   * Parsed data sections
   */
  frames: DataFrame[];

  /**
   * A map of file updates
   */
  fileEdits: Record<string, FileUpdate>;

  /**
   * Generated annotations
   */
  annotations: Diagnostic[];

  /**
   * Schema definition used in the generation
   */
  schemas: Record<string, JSONSchema>;

  /**
   * Output as JSON if parsable
   */
  json?: any;

  /**
   * Usage stats
   */
  usage?: RunPromptUsage;
}

 type Point = {
  row: number;
  column: number;
};

 interface DebugLogger {
  /**
   * Creates a debug logging function. Debug uses printf-style formatting. Below are the officially supported formatters:
   * - `%O`	Pretty-print an Object on multiple lines.
   * - `%o`	Pretty-print an Object all on a single line.
   * - `%s`	String.
   * - `%d`	Number (both integer and float).
   * - `%j`	JSON. Replaced with the string '[Circular]' if the argument contains circular references.
   * - `%%`	Single percent sign ('%'). This does not consume an argument.
   * @param category
   * @see https://www.npmjs.com/package/debug
   */
  (formatter: any, ...args: any[]): void;
  /**
   * Indicates if this logger is enabled
   */
  enabled: boolean;
  /**
   * The namespace of the logger provided when calling 'host.logger'
   */
  namespace: string;
}

 interface LoggerHost {
  /**
   * Creates a debug logging function. Debug uses printf-style formatting. Below are the officially supported formatters:
   * - `%O`	Pretty-print an Object on multiple lines.
   * - `%o`	Pretty-print an Object all on a single line.
   * - `%s`	String.
   * - `%d`	Number (both integer and float).
   * - `%j`	JSON. Replaced with the string '[Circular]' if the argument contains circular references.
   * - `%%`	Single percent sign ('%'). This does not consume an argument.
   * @param category
   * @see https://www.npmjs.com/package/debug
   */
  logger(category: string): DebugLogger;
}

 interface ShellOptions {
  cwd?: string;

  stdin?: string;

  /**
   * Process timeout in  milliseconds, default is 60s
   */
  timeout?: number;
  /**
   * trace label
   */
  label?: string;

  /**
   * Ignore exit code errors
   */
  ignoreError?: boolean;

  /**
   * Additional environment variables to set for the process.
   */
  env?: Record<string, string>;

  /**
   * Inject the content of 'env' exclusively
   */
  isolateEnv?: boolean;
}

 interface ShellOutput {
  stdout?: string;
  stderr?: string;
  exitCode: number;
  failed?: boolean;
}

 interface TimeoutOptions {
  /**
   * Maximum time in milliseconds. Default to no timeout
   */
  timeout?: number;
}

 interface ShellSelectOptions {}

 interface ShellSelectChoice {
  name?: string;
  value: string;
  description?: string;
}

 interface ShellInputOptions {
  required?: boolean;
}

 interface ShellConfirmOptions {
  default?: boolean;
}

 interface ShellHost {
  /**
   * Executes a shell command
   * @param command
   * @param args
   * @param options
   */
  exec(commandWithArgs: string, options?: ShellOptions): Promise<ShellOutput>;
  exec(command: string, args: string[], options?: ShellOptions): Promise<ShellOutput>;
}

 interface McpToolReference {
  name: string;
  description?: string;
  inputSchema?: JSONSchema;
}

 interface McpResourceReference {
  name?: string;
  description?: string;
  uri: string;
  mimeType?: string;
}

 interface McpServerToolResultTextPart {
  type: "text";
  text: string;
}

 interface McpServerToolResultImagePart {
  type: "image";
  data: string;
  mimeType: string;
}

 interface McpServerToolResourcePart {
  type: "resource";
  text?: string;
  uri?: string;
  mimeType?: string;
  blob?: string;
}

 type McpServerToolResultPart =
  | McpServerToolResultTextPart
  | McpServerToolResultImagePart
  | McpServerToolResourcePart;

 interface McpServerToolResult {
  isError?: boolean;
  content: McpServerToolResultPart[];
  text?: string;
}

 interface McpClient extends AsyncDisposable {
  /**
   * Configuration of the server
   */
  readonly config: McpServerConfig;

  /**
   * Pings the server
   */
  ping(): Promise<void>;

  /**
   * List all available MCP tools
   */
  listTools(): Promise<McpToolReference[]>;

  /**
   * Returns a list of tools that can be used in a chat session
   */
  listToolCallbacks(): Promise<ToolCallback[]>;

  /**
   * List resources available in the server
   */
  listResources(): Promise<McpResourceReference[]>;

  /**
   * Reads the resource content
   */
  readResource(uri: string): Promise<WorkspaceFile[]>;

  /**
   *
   * @param name Call the MCP tool
   * @param args
   */
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  callTool(name: string, args: Record<string, any>): Promise<McpServerToolResult>;

  /**
   * Closes clients and server.
   */
  dispose(): Promise<void>;
}

 interface McpHost {
  /**
   * Starts a Model Context Protocol server and returns a client.
   */
  mcpServer(config: McpServerConfig): Promise<McpClient>;
}

 interface ResourceReference {
  uri: string; // Unique identifier for the resource
  name: string; // Human-readable name
  description?: string; // Optional description
  mimeType?: string; // Optional MIME type
}

 interface ResourceHost {
  /**
   * Publishes a resource that will be exposed through the MCP server protocol.
   * @param content
   */
  publishResource(
    name: string,
    content: BufferLike,
    options?: Partial<Pick<ResourceReference, "description" | "mimeType">> & SecretDetectionOptions,
  ): Promise<string>;

  /**
   * List available resource references
   */
  resources(): Promise<ResourceReference[]>;

  /**
   * Tries to resolve a resource from a URL.
   * @param url - The URL to resolve.
   * @returns A promise that resolves to an object containing the parsed URI and resolved files, or undefined if resolution fails.
   */
  resolveResource(url: string): Promise<{ uri: URL; files: WorkspaceFile[] } | undefined>;
}

 interface UserInterfaceHost {
  /**
   * Asks the user to select between options
   * @param message question to ask
   * @param options options to select from
   */
  select(
    message: string,
    choices: (string | ShellSelectChoice)[],
    options?: ShellSelectOptions,
  ): Promise<string>;

  /**
   * Asks the user to input a text
   * @param message message to ask
   */
  input(message: string, options?: ShellInputOptions): Promise<string>;

  /**
   * Asks the user to confirm a message
   * @param message message to ask
   */
  confirm(message: string, options?: ShellConfirmOptions): Promise<boolean>;
}

 interface ContainerPortBinding {
  containerPort: OptionsOrString<"8000/tcp">;
  hostPort: string | number;
}

 interface ContainerOptions {
  /**
   * Container image names.
   * @example python:alpine python:slim python
   * @see https://hub.docker.com/_/python/
   */
  image?: OptionsOrString<"python:alpine" | "python:slim" | "python" | "node" | "gcc">;

  /**
   * Enable networking in container (disabled by default)
   */
  networkEnabled?: boolean;

  /**
   * Environment variables in container. A null/undefined variable is removed from the environment.
   */
  env?: Record<string, string>;

  /**
   * Assign the specified name to the container. Must match [a-zA-Z0-9_-]+.
   */
  name?: string;

  /**
   * Disable automatic purge of container and volume directory and potentially reuse with same name, configuration.
   */
  persistent?: boolean;

  /**
   * List of exposed TCP ports
   */
  ports?: ElementOrArray<ContainerPortBinding>;

  /**
   * Commands to executes after the container is created
   */
  postCreateCommands?: ElementOrArray<string>;

  /**
   * Container operating system type. Determines path separator used for working directories.
   * Defaults to "unix" for compatibility with most Linux-based containers.
   */
  osType?: "unix" | "windows";
}

 interface PromiseQueue {
  /**
   * Adds a new promise to the queue
   * @param fn
   */
  add<Arguments extends unknown[], ReturnType>(
    function_: (...arguments_: Arguments) => Awaitable<ReturnType>,
    ...arguments_: Arguments
  ): Promise<ReturnType>;

  /**
   * Runs all the functions in the queue with limited concurrency
   * @param fns
   */
  all<T = any>(fns: (() => Awaitable<T>)[]): Promise<T[]>;

  /**
   * Applies a function to all the values in the queue with limited concurrency
   * @param values
   * @param fn
   */
  mapAll<T extends unknown, Arguments extends unknown[], ReturnType>(
    values: T[],
    fn: (value: T, ...arguments_: Arguments) => Awaitable<ReturnType>,
    ...arguments_: Arguments
  ): Promise<ReturnType[]>;
}

 interface LanguageModelReference {
  provider: ModelProviderType;
  model: ModelType;
  modelId: string;
}

 interface LanguageModelInfo {
  id: ModelType;
  details?: string;
  url?: string;
  version?: string;
  /**
   * Base model name
   */
  family?: string;
}

 interface LanguageModelProviderInfo {
  id: ModelProviderType;
  version?: string;
  error?: string;
  models: LanguageModelInfo[];
  base?: string;
  token?: string; // Optional token for the provider
}

 interface LanguageModelHost {
  /**
   * Resolve a language model alias to a provider and model based on the current configuration
   * @param modelId
   */
  resolveLanguageModel(modelId?: ModelType): Promise<LanguageModelReference>;

  /**
   * Returns the status of the model provider and list of models if available
   */
  resolveLanguageModelProvider(
    provider: ModelProviderType,
    options?: {
      // If true, returns the list of models available in the provider
      listModels?: boolean;
      // If true, return the token
      token?: boolean;
    },
  ): Promise<LanguageModelProviderInfo>;
}

 type ContentSafetyProvider = "azure";

 interface ContentSafetyHost {
  /**
   * Resolve a content safety client
   * @param id safety detection project
   */
  contentSafety(id?: ContentSafetyProvider): Promise<ContentSafety>;
}

 interface RetryOptions {
  retryOn?: number[]; // HTTP status codes to retry on
  retries?: number; // Number of retry attempts
  retryDelay?: number; // Initial delay between retries
  maxDelay?: number; // Maximum delay between retries
  maxRetryAfter?: number; // Maximum retry-after in milliseconds before giving up
}

 interface CacheOptions {
  /**
   * By default, LLM queries are not cached.
   * If true, the LLM request will be cached. Use a string to override the default cache name
   */
  cache?: boolean | string;
}

 type FetchOptions = RequestInit & RetryOptions;

 type FetchTextOptions = Omit<FetchOptions, "body" | "signal" | "window"> & {
  convert?: "markdown" | "text" | "tables";
};

 interface FetchHost {
  /**
   * A fetch wrapper with proxy, retry and timeout handling.
   */
  fetch(input: string | URL | globalThis.Request, init?: FetchOptions): Promise<Response>;

  /**
   * A function that fetches text from a URL or a file
   * @param url
   * @param options
   */
  fetchText(
    url: string | WorkspaceFile,
    options?: FetchTextOptions,
  ): Promise<{
    ok: boolean;
    status: number;
    text?: string;
    file?: WorkspaceFile;
  }>;
}

 interface PromptHost
  extends ShellHost,
    LoggerHost,
    McpHost,
    ResourceHost,
    UserInterfaceHost,
    LanguageModelHost,
    ContentSafetyHost,
    FetchHost {
  /**
   * Opens a in-memory key-value cache for the given cache name. Entries are dropped when the cache grows too large.
   * @param cacheName
   */
  cache<K = any, V = any>(cacheName: string): Promise<WorkspaceFileCache<K, V>>;

  /**
   * Starts a container
   * @param options container creation options
   */
  container(options?: ContainerOptions): Promise<ContainerHost>;

  /**
   * Create a new promise queue to run async functions with limited concurrency
   */
  promiseQueue(concurrency: number): PromiseQueue;

  /**
   * Gets a client to a Microsoft Teams channel from a share link URL;
   * uses `GENAISCRIPT_TEAMS_CHANNEL_URL` environment variable if `shareUrl` is not provided.
   * Uses Azure CLI login for authentication.
   * @param url
   */
  teamsChannel(shareUrl?: string): Promise<MessageChannelClient>;
}

 interface WorkspaceFileWithDescription extends WorkspaceFile {
  /**
   * File description used for videos.
   */
  description?: string;
}

/**
 * A client to a messaging channel
 */
 interface MessageChannelClient {
  /**
   * Posts a message with attachments to the channel
   * @param message
   * @param options
   */
  postMessage(
    message: string,
    options?: {
      /**
       * File attachments that will be added in the channel folder
       */
      files?: (string | WorkspaceFileWithDescription)[];
      /**
       * Sets to false to remove AI generated disclaimer
       */
      disclaimer?: boolean | string;
    },
  ): Promise<string>;
}

 interface ContainerHost extends ShellHost {
  /**
   * Container unique identifier in provider
   */
  id: string;

  /**
   * Name assigned to the container. For persistent containers, also contains the sha of the options
   */
  name: string;

  /**
   * Disable automatic purge of container and volume directory
   */
  persistent: boolean;

  /**
   * Path to the volume mounted in the host
   */
  hostPath: string;

  /**
   * Writes a file as text to the container file system
   * @param path
   * @param content
   */
  writeText(path: string, content: string): Promise<void>;

  /**
   * Reads a file as text from the container mounted volume
   * @param path
   */
  readText(path: string): Promise<string>;

  /**
   * Copies a set of files into the container
   * @param fromHost glob matching files
   * @param toContainer directory in the container
   */
  copyTo(
    fromHost: string | string[],
    toContainer: string,
    options?: Omit<FindFilesOptions, "readText">,
  ): Promise<string[]>;

  /**
   * List files in a directory in the container
   * @param dir
   */
  listFiles(dir: string): Promise<string[]>;

  /**
   * Stops and cleans out the container
   */
  stop(): Promise<void>;

  /**
   * Pause container
   */
  pause(): Promise<void>;

  /**
   * Resume execution of the container
   */
  resume(): Promise<void>;

  /**
   * Force disconnect network
   */
  disconnect(): Promise<void>;

  /**
   * A promise queue of concurrency 1 to run serialized functions against the container
   */
  scheduler: PromiseQueue;
}

 interface PromptContext extends ChatGenerationContext {
  script(options: PromptArgs): void;
  system(options: PromptSystemArgs): void;
  path: Path;
  retrieval: Retrieval;
  workspace: WorkspaceFileSystem;
  host: PromptHost;
}

 type RuntimePromptContext = Pick<
  PromptContext,
  | "host"
  | "env"
  | "workspace"
  | "retrieval"
  | "prompt"
  | "runPrompt"
  | "generateImage"
  | "transcribe"
  | "speak"
>;
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// keep in sync with PromptContext!

/**
 * Console functions
 */
declare let console: PromptGenerationConsole;

/**
 * Setup prompt title and other parameters.
 * Exactly one call should be present on top of .genai.mts file.
 */
declare function script(options: PromptArgs): void;

/**
 * Equivalent of script() for system prompts.
 */
declare function system(options: PromptSystemArgs): void;

/**
 * Imports template prompt file and expands arguments in it.
 * @param files
 * @param arguments
 */
declare function importTemplate(
  files: ElementOrArray<string | WorkspaceFile>,
  arguments?: Record<string, ImportTemplateArgumentType>,
  options?: ImportTemplateOptions,
): void;

/**
 * Append given string to the prompt. It automatically appends "\n".
 * Typically best to use `` $`...` ``-templates instead.
 */
declare function writeText(body: Awaitable<string>, options?: WriteTextOptions): void;

/**
 * Append given string to the prompt as an assistant message.
 */
declare function assistant(
  text: Awaitable<string>,
  options?: Omit<WriteTextOptions, "assistant">,
): void;

/**
 * Append given string to the prompt. It automatically appends "\n".
 * `` $`foo` `` is the same as `text("foo")`.
 */
declare function $(strings: TemplateStringsArray, ...args: any[]): PromptTemplateString;

/**
 * Appends given (often multi-line) string to the prompt, surrounded in fences.
 * Similar to `text(env.fence); text(body); text(env.fence)`
 *
 * @param body string to be fenced
 */
declare function fence(body: StringLike, options?: FenceOptions): void;

/**
 * Defines `name` to be the (often multi-line) string `body`.
 * Similar to `text(name + ":"); fence(body, language)`
 *
 * @param name name of defined entity, eg. "NOTE" or "This is text before NOTE"
 * @param body string to be fenced/defined
 * @returns variable name
 */
declare function def(
  name: string,
  body: string | WorkspaceFile | WorkspaceFile[] | ShellOutput | Fenced | RunPromptResult,
  options?: DefOptions,
): string;

/**
 * Declares a file that is expected to be generated by the LLM
 * @param pattern file name or glob-like path
 * @param description description of the file, used by the model to choose when and how to call the function
 * @param options expectations about the generated file content
 */
declare function defFileOutput(
  pattern: ElementOrArray<string | WorkspaceFile>,
  description?: string,
  options?: FileOutputOptions,
): void;

/**
 * Declares a tool that can be called from the prompt.
 * @param tool Agentic tool function.
 * @param name The name of the tool to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
 * @param description A description of what the function does, used by the model to choose when and how to call the function.
 * @param parameters The parameters the tool accepts, described as a JSON Schema object.
 * @param fn callback invoked when the LLM requests to run this function
 */
declare function defTool(
  tool: Omit<ToolCallback, "generator"> | McpServersConfig,
  options?: DefToolOptions,
): void;
declare function defTool(
  name: string,
  description: string,
  parameters: PromptParametersSchema | JSONSchema,
  fn: ChatFunctionHandler,
  options?: DefToolOptions,
): void;

/**
 * Declares a LLM agent tool that can be called from the prompt.
 * @param name name of the agent, do not prefix with agent
 * @param description description of the agent, used by the model to choose when and how to call the agent
 * @param fn prompt generation context
 * @param options additional options for the agent LLM
 */
declare function defAgent(
  name: string,
  description: string,
  fn: string | ChatAgentHandler,
  options?: DefAgentOptions,
): void;

/**
 * Registers a callback to be called when a file is being merged
 * @param fn
 */
declare function defFileMerge(fn: FileMergeHandler): void;

/**
 * Variables coming from the fragment on which the prompt is operating.
 */
declare let env: ExpansionVariables;

/**
 * Path manipulation functions.
 */
declare let path: Path;

/**
 * A set of parsers for well-known file formats
 */
declare let parsers: Parsers;

/**
 * Retrieval Augmented Generation services
 */
declare let retrieval: Retrieval;

/**
 * Access to the workspace file system.
 */
declare let workspace: WorkspaceFileSystem;

/**
 * YAML parsing and stringifying functions.
 */
declare let YAML: YAMLObject;

/**
 * INI parsing and stringifying.
 */
declare let INI: INIObject;

/**
 * CSV parsing and stringifying.
 */
declare let CSV: CSVObject;

/**
 * XML parsing and stringifying.
 */
declare let XML: XMLObject;

/**
 * HTML parsing
 */
declare let HTML: HTMLObject;

/**
 * Markdown and frontmatter parsing.
 */
declare let MD: MDObject;

/**
 * JSONL parsing and stringifying.
 */
declare let JSONL: JSONLObject;

/**
 * JSON5 parsing
 */
declare let JSON5: JSON5Object;

/**
 * JSON Schema utilities
 */
declare let JSONSchema: JSONSchemaUtilities;

/**
 * Diff utilities
 */
declare let DIFF: DIFFObject;

/**
 * Access to current LLM chat session information
 */
declare let host: PromptHost;

/**
 * Access to GitHub queries for the current repository
 */
declare let github: GitHub;

/**
 * Access to Git operations for the current repository
 */
declare let git: Git;

/**
 * Access to ffmpeg operations
 */
declare let ffmpeg: Ffmpeg;

/**
 * Computation around tokens
 */
declare let tokenizers: Tokenizers;

/**
 * @deprecated use `host.fetchText` instead
 */
declare function fetchText(
  url: string | WorkspaceFile,
  options?: FetchTextOptions,
): Promise<{ ok: boolean; status: number; text?: string; file?: WorkspaceFile }>;

/**
 * Declares a JSON schema variable.
 * @param name name of the variable
 * @param schema JSON schema instance
 * @returns variable name
 */
declare function defSchema(
  name: string,
  schema: JSONSchema | ZodTypeLike,
  options?: DefSchemaOptions,
): string;

/**
 * Adds images to the prompt
 * @param files
 * @param options
 */
declare function defImages(files: ElementOrArray<BufferLike>, options?: DefImagesOptions): void;

/**
 * Renders a table or object in the prompt
 * @param name
 * @param data
 * @param options
 * @returns variable name
 */
declare function defData(
  name: string,
  data: Awaitable<object[] | object>,
  options?: DefDataOptions,
): string;

/**
 * Renders a diff of the two given values
 * @param left
 * @param right
 * @param options
 */
declare function defDiff<T extends string | WorkspaceFile>(
  name: string,
  left: T,
  right: T,
  options?: DefDiffOptions,
): string;

/**
 * Cancels the current prompt generation/execution with the given reason.
 * @param reason
 */
declare function cancel(reason?: string): void;

/**
 * Expands and executes prompt
 * @param generator
 */
declare function runPrompt(
  generator: string | PromptGenerator,
  options?: PromptGeneratorOptions,
): Promise<RunPromptResult>;

/**
 * Expands and executes the prompt
 */
declare function prompt(
  strings: TemplateStringsArray,
  ...args: any[]
): RunPromptResultPromiseWithOptions;

/**
 * Registers a callback to process the LLM output
 * @param fn
 */
declare function defOutputProcessor(fn: PromptOutputProcessorHandler): void;

/**
 * Registers a chat participant
 * @param participant
 */
declare function defChatParticipant(
  participant: ChatParticipantHandler,
  options?: ChatParticipantOptions,
): void;

/**
 * Transcribes audio to text.
 * @param audio An audio file to transcribe.
 * @param options
 */
declare function transcribe(
  audio: string | WorkspaceFile,
  options?: TranscriptionOptions,
): Promise<TranscriptionResult>;

/**
 * Converts text to speech.
 * @param text
 * @param options
 */
declare function speak(text: string, options?: SpeechOptions): Promise<SpeechResult>;

/**
 * Generate an image and return the workspace file.
 * @param prompt
 * @param options
 */
declare function generateImage(
  prompt: string,
  options?: ImageGenerationOptions,
): Promise<{ image: WorkspaceFile; revisedPrompt?: string }>;

```

## LoadedVibes/.genaiscript/.gitignore
```gitignore
*
```

## LoadedVibes/.github/instructions/genaiscript.instructions.md
```md
---
applyTo: "**/*.genai.*"
description: "Instructions for working with GenAIScript files"
---

## GenAIScript Code Generation Instructions

GenAIScript is a custom runtime for Node.js that favors declarative prompt assembly through tagged template literals, shared context helpers, and deterministic tool invocation. Follow the layered guidance below to avoid duplicating rules that already exist elsewhere:

1. **Reference order**

   - Workspace/extension rules live in `.github/genaiscript-extension.instructions.md` and describe how VS Code + Copilot should load scripts, contexts, and MCP integrations.
   - This file defines repository-specific coding conventions for `.genai.*` assets.
   - The upstream API manual lives in `.genaiscript/instructions/llms-full.txt` (mirrors https://microsoft.github.io/genaiscript/llms-full.txt) and should be used for syntax or helper details when needed.

2. **Authoring requirements**

   - Always emit **TypeScript** using **ESM syntax**; GenAIScript ambient types from https://microsoft.github.io/genaiscript/genaiscript.d.ts are automatically in scope—no imports required.
   - Prefer GenAIScript globals (`script`, `def`, `env`, `run`, `filesystem`, MCP helpers, etc.) over raw Node APIs. Only access the Node runtime when a GenAIScript helper does not exist and document the exception with a `TODO`.
   - Keep code intention-revealing and minimal: avoid try/catch wrappers, imperative logging, or hand-rolled parsers unless mandated by Tech Requirements.
   - Use inline `TODO:` comments whenever assumptions or follow-up actions need human review.

3. **File layout & naming**

   - Save new scripts under `./genaisrc/` with the `.genai.mts` extension so the CLI + GenAIScript extension auto-detect them.
   - Group shared utilities under `genaisrc/shared/` and prefer exporting small helpers over duplicating logic inside individual scripts.
   - When generating outputs, honor the Spec-Driven Workflow contract: persist context into `memory/state.json`, update TODO/CHANGELOG stubs when applicable, and respect the directory separation described in the PRD.

4. **Prompt construction tips**

   - Pull requirement snippets via `defMarkdown`/`def` helpers so prompts cite `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` explicitly.
   - When referencing files, prefer `workspace.readText()` + `def` rather than embedding large strings manually.
   - Favor structured outputs by defining schemas (`defSchema`) and referencing them inside `$`` prompts, especially for changelog or TODO updates.

5. **Tooling defaults**
   - Scripts execute within the Loaded Vibes Copilot agent; assume `.github/copilot-instructions.md` already enforced safety rails—do not disable them.
   - Use built-in tools (`filesystem`, `git`, `todos`, `runTests`, `memory`, `runSubagent`, etc.) per the manifest to keep DevCycles deterministic.
   - Whenever a script exposes additional tools, document them inline and register them with `defTool` along with short descriptions for the retro CLI to surface.

Following this ordering keeps GenAIScript guidance DRY: extension-level rules define the environment, this file defines repository conventions, and `llms-full.txt` remains the canonical API reference.

```

## LoadedVibes/.github/genaiscript-extension.instructions.md
```md
---
applyTo: "**"
description: "Supplemental instructions for GenAIScript VS Code extension assets"
---

# GenAIScript VS Code Extension Asset Instructions

## Authoritative References

- Always ground decisions in the official GenAIScript VS Code docs for overview, chat participant behavior, default scripts, and capability surface areas, especially when wiring the `@genaiscript` chat participant or custom instructions (`https://microsoft.github.io/genaiscript/reference/vscode/`, `https://microsoft.github.io/genaiscript/reference/vscode/github-copilot-chat/`).
- Use the GenAIScript extension settings catalog to align workspace configuration, model selection, CLI integration, caching, diagnostics, and language chat model mappings with supported options before emitting code (`https://microsoft.github.io/genaiscript/reference/vscode/settings/`).
- Follow GitHub Copilot guidance for `.instructions.md` and `.prompt.md` assets so Copilot can auto-load them in Chat (`https://learn.microsoft.com/en-us/visualstudio/ide/copilot-chat-context?view=visualstudio#use-custom-instructions`).
- Leverage Copilot Agent Mode + MCP tooling to expose GenAIScript-specific MCP servers when required, as described in the official Copilot getting-started guidance (`https://learn.microsoft.com/en-us/visualstudio/ide/visual-studio-github-copilot-get-started?view=visualstudio#start-using-copilot`).
- Cross-reference `/docs/PRD.md`, `/docs/TECH_REQUIREMENTS.md`, and every relevant template inside `templates/` to ensure assets trace design intent to shipped artifacts in `lv_artifacts/`.

### Instruction Layering (Deduplication)

- **API Reference:** `.genaiscript/instructions/llms-full.txt` (mirrors the official manual) remains the only place that documents helper syntax.
- **Script Conventions:** `.github/instructions/genaiscript.instructions.md` defines how scripts inside this repo should be structured (file naming, GenAIScript vs Node usage, TODO expectations).
- **Extension Behavior (this file):** focus on VS Code + Copilot configuration, validation, and delivery requirements. When editing, link back to the other two files instead of repeating their content.

## Extension & Workspace Configuration Requirements

1. **Settings Baseline**
   - Explicitly document or emit `settings.json` fragments for any asset that depends on `genaiscript.languageChatModels`, `genaiscript.githubCopilotInstructions`, CLI path/version, cache controls, or diagnostics toggles from the extension settings catalog.
   - Require `genaiscript.localTypeDefinitions = true` and ensure `.genaiscript.d.ts` stays synchronized; pull updates from the doc links above when authoring new APIs.
2. **Model & Provider Enforcement**
   - When scripts omit `model`, set `script({ model: "github_copilot_chat:current" })` or a documented alias and capture workspace choices in guidance so Copilot Chat persists them via `genaiscript.languageChatModels`.
   - For premium context use cases, confirm that the selected models exist in the Copilot extension model picker to avoid unsupported combinations (per `Choosing the model` guidance in the GitHub Copilot Chat reference).
3. **CLI + Runtime Coupling**
   - Always state the expected `npx genaiscript` commands (run/test/serve) and align CLI versioning with the extension release or `genaiscript.cli.version` overrides.
   - Ensure automation scripts default to non-blocking workflows and respect caching knobs described in the settings doc.

## Script, Prompt, and Agent Authoring Standards

1. **Mandatory Structure**
   - Scripts must use `script({ title, description, model, system, tools })`, capture context via `def`, `defData`, `defSchema`, and emit tasks using `$` template blocks.
   - Inline prompts must implement `env.vars.question`, `env.vars["copilot.editor"]`, `env.vars["copilot.selection"]`, and `env.vars["copilot.history"]` just as documented under "Context" for the `@genaiscript` participant; ignore empty contexts using `{ ignoreEmpty: true }` to preserve token budgets.
2. **Advanced Feature Utilization**
   - Prefer official helpers for structured data (schemas, parsers, output builder), retrieval + vector search, AST-grep, concurrency controls, and MCP tool invocation from the reference catalog; explicitly state why a feature is selected and how it aligns with Loaded Vibes requirements.
   - When building agents or default scripts, reuse the documented reasoning-agent starter, ensuring safety system components (`system.safety_*`) remain present and noting any deviations.
   - For automation or evaluation assets, link to `reference/scripts/tests`, `reference/scripts/redteam`, or `reference/scripts/mapreduce` to justify evaluation strategies.
3. **Tooling & MCP Integration**
   - Declare every MCP tool dependency (e.g., `python_code_interpreter_*`, `fs_read_file`) and provide fallback guidance when a tool is unavailable; the instructions must remind Copilot to set `tools: []` explicitly and keep prompts deterministic.
   - For GitHub or workspace-aware scripts, include `system.agent_git`, `system.agent_github`, and `system.agent_fs` so results reinject into Copilot history per the "Continued conversation" guidance.

## Professional-Grade Copilot Assets

1. **Instructions Files**
   - Each `.instructions.md` generated from templates must start with YAML frontmatter (`description`, `applyTo` glob) mirroring the structure in Microsoft guidance and cite the doc sections leveraged.
   - Distinguish between global rules, stack-specific rules, and runtime rules to avoid layer bleed (aligned with the global instructions already in `.github/copilot-instructions.md`).
2. **Prompts & Toolsets**
   - `.prompt.md` assets must document invocation patterns (e.g., `#prompt:genaiscript-bootstrap`) and specify required attachments (`#file`, `#selection`, `#prompt`) so Copilot Chat can preload the right context per Microsoft prompt-file documentation.
   - Toolset definitions should map available commands to GenAIScript CLI invocations, describe expected inputs/outputs, and enumerate safety checks (content safety, secret scanning, diff review) before allowing destructive operations.
3. **Custom Agents**
   - Agents must reference the global instructions plus this supplemental file, describe supported phases (Analyze → Handoff), and include explicit fallback behavior if GenAIScript APIs fail or if Copilot lacks required models.

## Loaded Vibes Alignment & Quality Gates

- Every asset must cite the Loaded Vibes PRD requirement it satisfies (EARS format) and trace to the technical requirement or template it implements.
- Enforce the Spec-Driven Workflow loop: no implementation guidance without an Analyze + Design summary, no deployment instructions without Validate evidence, and every handoff must include changelog + decision record hooks.
- Validate scripts with `genaiscript test` or the extension test runner before surfacing them in `lv_artifacts/`; capture expected CLI output or trace logs for reproducibility.
- Require security + safety steps: enable `system.safety_*` modules, reference the GenAIScript content-safety page for high-risk prompts, and block any instructions that bypass secret scanning or telemetry controls.
- Document performance considerations: plan for token budgeting using `flex` options in `def`, throttle concurrency, reuse caches, and align with extension-level cache settings.

## Deliverable Checklist (Must Pass Before Committing)

1. **Docs linked** – Confirm every new asset includes inline links back to the relevant GenAIScript reference pages and Copilot documentation cited above.
2. **Templates honored** – Ensure the correct template from `templates/` seeded the artifact and note any intentional deviations in a decision record.
3. **PRD/Tech Requirements traceability** – Reference the exact clause in `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` that the asset fulfills.
4. **Extension verification** – State how the asset was validated in VS Code (e.g., `@genaiscript /run <script>`, CLI run, or Copilot Agent Mode dry-run) and note any configuration prerequisites.
5. **Handoff package** – Provide locations for updated instructions, prompts, agents, toolsets, automation scripts, and any resulting assets destined for `lv_artifacts/` so downstream tooling can mirror them.

Adhering to these rules ensures every Loaded Vibes deliverable fully leverages the GenAIScript extension feature set, satisfies Copilot quality expectations, and maintains parity between the development workspace and the shipped framework.

```

## LoadedVibes/.github/dependabot.yml
```yml
version: 2
updates:
  - package-ecosystem: 'npm'
    directory: '/'
    schedule:
      interval: 'weekly'
    labels:
      - 'dependencies'
      - 'npm'
  - package-ecosystem: 'github-actions'
    directory: '/'
    schedule:
      interval: 'weekly'
    labels:
      - 'dependencies'
      - 'github-actions'

```

## LoadedVibes/.github/copilot-instructions.md
```md
---
applyTo: "**"
---

# Global Copilot Instructions

Rewritten Meta-Instructions for VS Code Copilot Chat (Agent Mode)

## 1. Scope

These rules define how Copilot Chat must behave whenever it generates or modifies anything inside the Loaded Vibes development framework.

They apply to every artifact, including:

- Global instructions
- Agent profiles
- Prompts
- Domain-specific instructions
- Toolsets
- VS Code settings and workspace configs
- GitHub automation files
- PRD / Tech Specs
- Documentation and scripts
- Any file or operation initiated through Copilot Chat

Copilot must apply these rules before producing output.

## 2. Use Current, Authoritative Documentation

For every artifact, Copilot Chat must consult up-to-date platform documentation, including:

- OpenAI + Copilot Chat
- GitHub Agents
- VS Code
- MCP Server gallery and protocol
- Next.js 15 / React 19
- Relevant RFCs and standards

When describing architecture, best practices, security, patterns, or tool use, Copilot must consult the following documentation:

- `/docs/PRD.md`
- `/docs/TECH_REQUIREMENTS.md`
- Retro CLI and engine automation content previously stored in `docs/CLI_SPEC.md` and `docs/ENGINE_SPEC.md` now lives exclusively inside the consolidated PRD (§5) and Technical Requirements (§§5–10). Do not reference or recreate the deleted files—link to the new sections instead.

## 3. Validation Requirements

Every artifact generated must satisfy:

- **Accuracy**
  - Use real APIs
  - Use real file formats
  - Use real tool behavior
- **Syntactic correctness**
  - JSON / JSONC must be valid
  - YAML must parse
  - Markdown must render
  - Code must compile
- **Semantic correctness**
  - Must follow performance rules
  - Must follow security rules
  - Must follow project conventions
- **Cross-compatibility**
  - Must integrate with the workspace settings
  - Must match existing toolsets and MCP servers
  - Must respect Copilot instructions defined in workspace settings
  - Must align with GitHub automation files
- **Security**
  - Never expose secrets
  - No unsafe DB operations
  - No insecure auth patterns
  - ABAC, CSP, HSTS enforced
  - Never run destructive commands
  - Prefer Prisma MCP over raw SQL
- **Performance**
  - Use non-blocking I/O for external calls
  - Parallelize independent operations
  - Implement proper timeout handling
  - Stream large responses when possible
- **Resource optimization**
  - Minimize memory allocations
  - Clean up resources promptly
  - Avoid unnecessary data transformations
  - Reuse connections and clients
  - Limit concurrent operations appropriately

## 4. Artifact Generation Protocol

Whenever Copilot produces an artifact, it must:

- **Identify the artifact type**

  - Examples:
    - "Generating: instructions file"
    - "Generating: stack agent profile"
    - "Generating: prompt script"

- **Apply the correct rule layer**

  - Global layer → framework rules
  - Agent layer → tech stack rules
  - Prompt layer → environment/tool rules
  - Instruction layer → domain rules
  - Toolset layer → capability rules

- **Do not mix layers**
  - Examples:
    - Global rules cannot include stack logic
    - Agent files cannot include environment logic
    - Prompts cannot include PRD parsing
    - Instructions cannot reference workspace settings
    - Toolsets must not define coding patterns

## 5. Cross-Referencing Requirements

Each artifact must include:

- **Correct references**

  - Examples:
    - Prompts must reference the correct toolset + instructions
    - Instructions must reference their dev phase
    - Agent files must reference global.instructions.md

- **Correct folder structure**

  - Copilot must adhere to the standardized paths:
    - `lv_artifacts/.github/global.instructions.md`
    - `lv_artifacts/.github/agents/`
    - `lv_artifacts/.github/prompts/`
    - `lv_artifacts/.github/instructions/`
    - `lv_artifacts/.github/toolsets/`
    - `lv_artifacts/docs/`
    - `.github/` (Dev Environment)
    - `.vscode/` (Dev Environment)
    - `templates/` (Dev Environment)

- **Correct naming conventions**
  - Use standard names and formats.

## 6. Optimization Standards

Copilot must optimize artifacts for:

- **Clarity**
  - Clean structure
  - No redundant language
  - Clear responsibilities
- **Modularity**
  - Layers remain independent
  - Artifacts remain interchangeable
- **Scalability**
  - New agents, phases, or MCP servers must be easy to add
- **Maintainability**
  - Small, readable files
  - No duplication
  - Logic sits only in its designated layer

## 7. Security Enforcement

Copilot must automatically enforce:

- No unvalidated input
- No inline secrets
- Safe filesystem usage
- Safe GitHub automation patterns
- MCP-first for DB + auth

## 8. Performance Enforcement

Copilot must automatically enforce:

- **Efficient data access patterns**

  - Minimize round-trips to data sources
  - Use batching and connection pooling
  - Avoid N+1 queries
  - Implement pagination for large datasets
  - Cache frequently accessed data

- **Rendering and delivery**

  - Server-side rendering where appropriate
  - Progressive loading patterns
  - Lazy loading for non-critical resources
  - Optimize payload sizes
  - Use compression for responses

- **Caching strategies**

  - Implement appropriate cache layers
  - Set correct cache expiration policies
  - Use cache invalidation patterns
  - Leverage edge caching where available
  - Avoid over-caching dynamic content

- **Error handling**
  - Fail fast on invalid input
  - Use circuit breakers for external dependencies
  - Implement graceful degradation
  - Log performance bottlenecks
  - Monitor and alert on threshold violations

## 9. Behavior During Every Iteration

On every artifact creation or update:

- Correct syntax + logic errors immediately
- Validate cross-layer consistency
- Fix any contradictions
- Keep artifacts aligned with PRD + Tech Specs
- Update the artifact instead of explaining what "should" be done

## 10. Production Gate

Copilot Chat must not generate an artifact if any meta-rule is violated.

If a conflict, missing dependency, or outdated pattern is detected, Copilot must:

- Stop
- Explain the issue
- Request missing information
- Or auto-correct the artifact when possible

## 11. Environment Separation (Development vs. Shipped)

- **Workspace scope:** All development happens inside `D:/LoadedVibes` and is limited to the files listed in the user brief (`.github`, `.vscode`, `docs`, `templates`, `README.md`).
- **Shipped snapshot:** `D:/LoadedVibes/lv_artifacts` mirrors the payload delivered to end users. Treat it as read-only reference material unless you are explicitly updating the shipped package.
- **Runtime `src/` outputs:** When customers run Loaded Vibes, every generated asset must live inside `lv_artifacts/src/` within their copy of the package. Never read from or write to any `src/` folder while editing the framework source.
- **IDE/tooling hygiene:** VS Code settings, MCP configurations, and automation scripts must ignore `lv_artifacts/src/**` so authoring tasks stay isolated from runtime assets.

```

## LoadedVibes/.github/ISSUE_TEMPLATE.md
```md
---
title: '[DevCycle] <short description>'
labels: []
---

## Summary

Describe the issue or enhancement. Include the DevCycle or CLI command involved.

## Requirements Reference

- PRD section:
- Tech Requirements section:

## Reproduction / Context

1. Steps executed (CLI command, prompt, files touched)
2. Observed result
3. Expected result

## Attachments

- Logs (`.loaded-vibes/logs/*.ndjson` or VS Code output)
- Screenshots / additional notes

```

## LoadedVibes/.github/PULL_REQUEST_TEMPLATE.md
```md
# Summary

- _Describe the change and reference relevant DevCycles._

## Checklist

- [ ] Linked to PRD section(s):
- [ ] Linked to Tech Requirements section(s):
- [ ] Updated `TODO.md`
- [ ] Updated `CHANGELOG.md`
- [ ] Added/updated tests or validation evidence
- [ ] Captured CLI/DevCycle logs if user-visible behavior changed

## Testing

- [ ] `pnpm test`
- [ ] `pnpm lint`
- [ ] `genaiscript test`
- [ ] `loaded-vibes devcycle <name>`
- [ ] Other (describe):

```

## LoadedVibes/.vscode/settings.json
```json
{
  // -------------------------------
  // FORMATTING & LINTING (PROJECT)
  // -------------------------------
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.formatOnSave": true,
  "editor.tabSize": 2,
  "editor.insertSpaces": true,

  "eslint.enable": true,
  "eslint.useFlatConfig": true,
  "eslint.format.enable": true,
  "eslint.codeActionsOnSave.mode": "all",
  "eslint.problems.shortenToSingleLine": true,
  "eslint.ignoreUntitled": true,
  "eslint.quiet": true,

  // -------------------------------
  // TAILWIND (PROJECT)
  // -------------------------------
  "tailwindCSS.emmetCompletions": true,
  "tailwindCSS.includeLanguages": {
    "typescriptreact": "html",
    "javascriptreact": "html"
  },
  "tailwindCSS.experimental.classRegex": [["clsx\\(([^)]*)\\)", "(?:'|\"|`)([^'\"`]*)(?:'|\"|`)"]],

  // -------------------------------
  // TYPESCRIPT / NEXT.JS (PROJECT)
  // -------------------------------
  "typescript.tsdk": "node_modules/typescript/lib",
  "typescript.preferences.importModuleSpecifier": "shortest",
  "typescript.updateImportsOnFileMove.enabled": "always",
  "typescript.tsserver.experimental.enableProjectDiagnostics": true,

  // -------------------------------
  // FILE MANAGEMENT
  // -------------------------------
  "files.exclude": {
    "**/.next": true,
    "**/.vercel": true,
    "**/node_modules": true,
    "**/dist": true
  },

  "files.watcherExclude": {
    "**/.next/**": true,
    "**/.vercel/**": true,
    "**/dist/**": true,
    "lv_artifacts": true,
    "lv_artifacts/**": true,
    "lv_artifacts/src": true,
    "lv_artifacts/src/**": true
  },

  "search.exclude": {
    "**/.next/**": true,
    "**/.vercel/**": true,
    "**/dist/**": true,
    "lv_artifacts": true,
    "lv_artifacts/**": true,
    "lv_artifacts/src": true,
    "lv_artifacts/src/**": true,
    "**/.loaded-vibes/**": true
  },

  // -------------------------------
  // GIT
  // -------------------------------
  "git.decorations.enabled": true,
  "git.enableSmartCommit": true,
  "git.confirmSync": false,

  // -------------------------------
  // PROJECT COPILOT INSTRUCTIONS
  // -------------------------------
  "github.copilot.chat.codeGeneration.useInstructionFiles": true,
  "github.copilot.chat.pullRequestDescriptionGeneration.instructions": [
    { "file": "PULL_REQUEST_TEMPLATE.md" }
  ],
  "github.copilot.chat.reviewSelection.instructions": [
    { "file": "genaiscript-extension.instructions.md" }
  ],

  // -------------------------------
  // COPILOT CHAT EXTENSION
  // -------------------------------

  "chat.checkpoints.enabled": true,
  "chat.customAgentInSubagent.enabled": true,
  "chat.edits2.enabled": true,
  "chat.extensionTools.enabled": true,
  "chat.instructionsFilesLocations": {
    ".github/copilot-instructions.md": true
  },
  "chat.tools.todos.showWidget": true,
  "chat.useAgentsMdFile": true,
  "chat.useNestedAgentsMdFiles": true,
  "chat.useCloudButtonV2": true,

  // -------------------------------
  // MCP
  // -------------------------------

  "chat.mcp.autostart": "onlyNew",
  "chat.mcp.access": "all",

  // -------------------------------
  // GENAI SCRIPT EXTENSION
  // -------------------------------

  "genaiscript.localTypeDefinitions": true,
  "genaiscript.languageChatModelsProvider": true,
  "genaiscript.languageChatModels": {
    "default": "github_copilot_chat:current",
    "openai:gpt-4o-mini": "github_copilot_chat:current"
  },
  "genaiscript.askLanguageChatModel": true,
  "genaiscript.cache": true,
  "genaiscript.cli.packageManager": "pnpm",
  "genaiscript.cli.nodeOptions": "--enable-source-maps --max-old-space-size=4096",
  "genaiscript.cli.version": "latest",
  "genaiscript.githubCopilotInstructions": true
}

```

## LoadedVibes/.vscode/extensions.json
```json
{
  // Extension recommendations apply only to the D:/LoadedVibes development workspace.
  // Do not auto-install them when opening the shipped lv_artifacts snapshot.
  "recommendations": [
    "dbaeumer.vscode-eslint",
    "esbenp.prettier-vscode",
    "bradlc.vscode-tailwindcss",
    "heybourn.headwind",
    "dsznajder.es7-react-js-snippets",
    "loczek.next-js-ts-snippets",
    "github.copilot",
    "github.copilot-chat",
    "openai.chatgpt",
    "prisma.prisma",
    "ms-playwright.playwright",
    "vitest.explorer",
    "mhutchie.git-graph",
    "pkief.material-icon-theme",
    "pkief.material-product-icons",
    "usernamehw.errorlens",
    "yoavbls.pretty-ts-errors",
    "rangav.vscode-thunder-client"
  ],

  "unwantedRecommendations": [
    "mgmcdermott.vscode-language-babel",
    "csstools.postcss",
    "cweijan.vscode-postgresql-client2",
    "ms-cst-e.vscode-devskim",
    "redhat.vscode-xml",
    "redhat.vscode-yaml",
    "chakrounanas.turbo-console-log",
    "vsls-contrib.gistfs",
    "dendron.dendron",
    "webplan-pro.dendron-keybindings"
  ]
}

```

## LoadedVibes/docs/CLI_SPEC.md
```md
# Loaded Vibes CLI & Distribution Blueprint

**Document Control**

- **Status:** Draft (internal review)
- **Owners:** Framework Architecture & Tooling Team
- **Last Updated:** 2025-11-24
- **Related Docs:** `docs/PRD.md` (§6-8), `docs/TECH_REQUIREMENTS.md` (§2-4), `docs/ENGINE_SPEC.md`, `lv_artifacts/genaiscript/**`

## 1. Purpose & Vision

- WHEN end users adopt Loaded Vibes, THE SYSTEM SHALL deliver an experience comparable to `create-next-app` that fetches the MIT-licensed repo, scaffolds projects, and links the retro CLI to the shipped assets (PRD §2, §7.1).
- WHEN developers interact with the framework after installation, THE SYSTEM SHALL expose a hip, ASCII-forward CLI that surfaces every DevCycle, tool, and log with real-time feedback (PRD §7.4, TechReq §4.4).
- WHEN troubleshooting or reviewing history, THE SYSTEM SHALL provide searchable logs, dashboards, and guardrails without requiring the authoring workspace (PRD §6.4, §9).

## 2. Distribution Model ("create-loaded-vibes")

### 2.1 Package Targets

- **GitHub Repo:** `github.com/LoadedVibes/framework` (MIT) hosts tagged releases under `lv_artifacts/**`.
- **npm Package:** `create-loaded-vibes` publishes a slim bootstrapper that: pulls the latest release tarball, validates checksums, copies `lv_artifacts` into the user project, then installs dependencies.
- **Binary Drops:** Optional self-contained executables (pkg/VerceI) for air-gapped installs.

### 2.2 Supported Entry Points

```bash
npx create-loaded-vibes@latest                # interactive wizard
npx create-loaded-vibes my-app --stack next   # non-interactive new project
npx create-loaded-vibes --attach ./existing   # retrofit an existing repo
```

### 2.3 Workflow Summary

1. **Discovery:** README badge + website link the npm command; release notes map to DevCycles.
2. **Preflight:** CLI checks Node ≥ 20, git, pnpm, VS Code, and GenAIScript extension versions.
3. **Acquisition:** Downloads release asset (zip/tar) signed with SHA256 and MIT license notice.
4. **Extraction:** Places contents under `<project>/.loaded-vibes/` mirroring `lv_artifacts`, ensuring `.vscode`, `.github`, `genaiscript`, `scripts`, `docs` remain intact.
5. **Initialization:** Runs `loaded-vibes init` to configure profiles, set MCP endpoints, and register Git hooks.
6. **Handoff:** ASCII art success screen with next steps (`loaded-vibes dashboard`, `loaded-vibes devcycle scaffolding`).

### 2.4 Existing Project Attach Flow

- Detects conflicts (existing `.github`, `.vscode`, `lv_artifacts`).
- Offers three strategies: **Mirror** (keep both), **Merge** (copy selective assets), **Sandbox** (run CLI from `.loaded-vibes` without copying).
- Logs all decisions into `.loaded-vibes/logs/install-YYYYMMDD.md`.

## 3. Retro CLI Experience ("Loaded Vibes Console")

### 3.1 Visual Language

- Neon gradient ASCII masthead (matches provided artwork) rendered via `figlet` + `gradient-string`.
- Animated grid background using `ink-gradient` or `blessed` canvas to emulate synthwave vibes.
- Palette: magenta/purple/cyan on midnight blue, w/ semantic color roles (success lime, warn amber, danger hotpink).

### 3.2 Interaction Model

| Mode                | Description                                                                                     |
| ------------------- | ----------------------------------------------------------------------------------------------- |
| **Dashboard**       | Rich TUI layout with panes: DevCycle queue, realtime logs, system metrics, todo/changelog feed. |
| **Command Palette** | `Ctrl+P` opens fuzzy finder for actions (Run DevCycle, View Logs, Configure Settings).          |
| **Menu Bar**        | Top-line ASCII menu for `Project`, `DevCycles`, `Observability`, `Help`.                        |
| **Notifications**   | Toast slots with animations (slide-in) for success/fail.                                        |

### 3.3 Features

- **Workspaces:** Manage multiple projects, each storing settings in `.loaded-vibes/profile.jsonc`.
- **DevCycle Runner:** UI wizard around `genaiscript/orchestrator.genai.js` w/ progress bars, step logging, ability to pause/resume, require approvals.
- **Live Logs:** Tail `lv_artifacts/logs/*.ndjson`, filter by DevCycle, export to Markdown.
- **Troubleshooting Center:** `doctor` scans prerequisites, connectivity, file permissions, MCP availability, optionally auto-remediates.
- **Realtime Status:** Websocket-esque view (via Node child process watchers) showing CPU/memory, CLI tasks, pending diffs.
- **Settings Drawer:** Toggle telemetry, theming, animations, ASCII art density, output verbosity.
- **Tool Shelf:** Quick launchers for `pnpm dev`, `genaiscript test`, `loaded-vibes diarize` (decision log assistant).

### 3.4 Hipster Delight Enhancements

- Easter egg commands (`loaded-vibes vibe-check`) produce random synthwave color storms.
- `Bad Vibes Firewall`: stylized security warnings referencing PRD §9 risk mitigations.
- Ambient soundtrack via optional terminal bell pulses (opt-in).

## 4. Architecture

### 4.1 Stack Choices

- **Runtime:** Node 20+, ECMAScript modules.
- **UI Toolkit:** `ink` + `ink-select-input` + `ink-text-input`, with `blessed-contrib` for charts.
- **Rendering:** `figlet`, `gradient-string`, `chalk`, `cli-spinners`, `listr2` for animated tasks.
- **Process Control:** `execa` for orchestrator/bootstrapper invocations, `node-pty` for long-running commands.
- **State:** `zod`-validated JSON configs stored under `.loaded-vibes/state/*.json`.
- **Plugin System:** Lightweight hooks (`beforePhase`, `afterPhase`, `beforeDownload`) so advanced users can script behavior.

### 4.2 Modules

1. **Installer** – handles download/extract/verify.
2. **Project Registry** – persists known workspaces, ensures separation between framework assets and user src (PRD §6.4).
3. **DevCycle Service** – wraps GenAIScript orchestrator, streams structured events into UI.
4. **Telemetry & Logging** – writes NDJSON to `.loaded-vibes/logs`, optional remote sink.
5. **Troubleshooter** – runs diagnostics, integrates with `doctor` command.
6. **Dashboard** – renders the retro UI, subscribes to events.
7. **Security Manager** – enforces restricted paths, secret scanning, signature checks.

### 4.3 Command Surface

```
loaded-vibes create <dir>         # alias to create-loaded-vibes
loaded-vibes init                 # configure MCP, VS Code profile, install deps
loaded-vibes dashboard            # launch retro UI
loaded-vibes devcycle <name>      # run orchestrator with prompts/toolsets
loaded-vibes logs [--follow]      # view structured logs, filter by phase
loaded-vibes doctor               # troubleshoot environment issues
loaded-vibes upgrade              # fetch latest release safely
loaded-vibes config set <key>     # manage settings
loaded-vibes tools <command>      # curated wrappers around pnpm/test/format
```

### 4.4 Workflow Integration

- CLI reads `devcycles.config.json` to populate menus, ensuring parity with shipped manifest.
- For each DevCycle run, CLI spawns `npx genaiscript run lv_artifacts/genaiscript/orchestrator.genai.js --phase <x>` and streams STDOUT → UI.
- Logs include EARS citation → requirement mapping for audit compliance.
- CLI can trigger `lv_artifacts/scripts/bootstrapper.genaiscript.ts` when new releases arrive or before DevCycles (toggle in settings).

## 5. Security, Performance, and Reliability

- **Security:** Signature verification on downloads, sandbox file writes (never touch `src/` unless user confirms), integration with `Bad Vibes Firewall` warnings, optional token redaction in logs.
- **Performance:** Cache release tarballs, parallelize downloads + checksum verification, incremental state updates for dashboards, frame-skipping for animations when CPU spikes.
- **Reliability:** Automatic retries with exponential backoff, offline mode (use cached artifacts), `doctor` command to detect drift, structured error codes for CI consumption.

## 6. User Journeys

### 6.1 New Project (Greenfield)

1. `npx create-loaded-vibes my-app`
2. CLI displays synthwave intro, prompts for stack presets, env answers, optional template seeds.
3. Download/extract -> git init -> install dependencies -> run `loaded-vibes init`.
4. Launch dashboard, auto-open README quickstart, highlight next DevCycle (Initialization).

### 6.2 Existing Repo Retrofit

1. `npx create-loaded-vibes --attach .`
2. CLI scans repo, identifies conflicts, shows diff preview in neon menu.
3. User chooses merge strategy; CLI writes `.loaded-vibes/` plus optional `.github` overlays.
4. Run `loaded-vibes doctor` to ensure compatibility, then continue via dashboard.

### 6.3 Daily Operations

- Developer launches `loaded-vibes dashboard`, selects DevCycle, monitors output, updates TODO/CHANGELOG from UI, exports transcripts for code review.
- Logs accessible via `loaded-vibes logs --phase features --since 2h`.
- Settings allow toggling ASCII density, telemetry, color themes, and key bindings.

## 7. Compatibility with Existing Assets

- All CLI commands operate exclusively on `lv_artifacts/**` mirrors placed under `.loaded-vibes/`; runtime `src/` generation remains untouched unless orchestrator outputs there.
- Dashboard context uses `docs/PRD.md`, `docs/TECH_REQUIREMENTS.md`, and `ENGINE_SPEC.md` copies from the release bundle, keeping parity with GenAIScript instructions.
- Command wrappers call the same scripts currently used in `lv_artifacts/scripts/`, ensuring no duplication of orchestration logic.

## 8. Implementation Roadmap (High Level)

1. **Prototype Installer:** Download + extract release, create `.loaded-vibes` tree, wire `init` command.
2. **Retro UI Shell:** Build Ink dashboard with ASCII art, nav, notifications, log tailing.
3. **DevCycle Adapter:** Stream orchestrator outputs into UI with actionable statuses.
4. **Diagnostics & Logs:** Implement `doctor`, log viewer, timeline exports.
5. **Polish & Packaging:** Add animations, settings, hipster touches, telemetry toggles, docs & tutorials.

## 9. Open Questions

- Should we bundle a lightweight local HTTP API for advanced integrations, or keep everything CLI-side?
- Do we provide optional VS Code Webview bridging to show the same dashboard? (Future consideration.)
- How do we version-manage user customizations inside `.loaded-vibes` when upgrading releases? (Proposed: semantic versioned config + diff hints.)

This blueprint aligns the requested user experience with the existing Loaded Vibes architecture, ensuring the retro CLI can fully control GenAIScript-powered DevCycles while delighting developers with a stylish, functional workflow.

```

## LoadedVibes/docs/ENGINE_SPEC.md
```md
# Loaded Vibes Engine & Automation Specification

**Document Control**  
- **Status:** Draft (ready for engineering review)  
- **Owners:** Framework Architecture & Tooling Team  
- **Last Updated:** 2025-11-24  
- **Related Artifacts:** `docs/PRD.md` (§6, §7), `docs/TECH_REQUIREMENTS.md` (§2, §3), `lv_artifacts/.github/global.instructions.md`

## 1. Purpose & Scope
- WHEN the framework executes any DevCycle, THE SYSTEM SHALL rely on a deterministic orchestration layer that binds prompts, instructions, and toolsets (PRD §7.4, TechReq §4.4).
- WHEN contributors author new automation, THE SYSTEM SHALL keep shipped assets (`lv_artifacts/*`) isolated from development assets (PRD §6.2).
- Scope covers orchestration, phase execution, bootstrap automation, state handling, and tool governance for all eighteen DevCycles.

## 2. Objectives & Success Criteria
1. **Single Source of Truth:** Centralize DevCycle metadata (instructions, prompts, toolsets) in a shared manifest accessible to GenAIScript + bootstrap scripts.
2. **Deterministic Flow:** Enforce the Spec-Driven Workflow (Analyze → Design → Implement → Validate → Reflect → Handoff) inside every DevCycle. Success = each phase emits plan, execution log, validation evidence, and changelog hook.
3. **Context Hygiene:** Guarantee every run loads PRD, Tech Requirements, todo/changelog snapshots, and prior outputs without touching runtime `src/` trees.
4. **Human-in-the-loop:** Provide pause/resume checkpoints for plan approval, risky actions, and final review per TechReq §4.4.
5. **Extensibility:** Adding a DevCycle requires updating only the manifest, not bespoke code paths.

## 3. Architecture Overview
| Layer | Responsibilities | Key Artifacts |
| --- | --- | --- |
| **Bootstrap Layer** | Detect profile gaps, sync MCP + extensions, expose CLI entry points. | `lv_artifacts/scripts/bootstrapper.genaiscript.ts`, `bootstrapper.ps1` |
| **Orchestration Layer** | Accept user input (phase, task, mode), load manifest, hydrate context, coordinate phase lifecycle. | `lv_artifacts/genaiscript/orchestrator.genai.js`, `devcycles.config.json` |
| **Phase Runner Layer** | Execute DevCycle-specific logic: gather context, invoke prompts, enforce instructions/toolsets, emit outputs. | `lv_artifacts/genaiscript/phases/*.genai.js` |
| **Shared Utilities** | Context loading, state persistence, validation, logging. | `lv_artifacts/genaiscript/shared/context.js`, `shared/state.js` |
| **Governance Layer** | Instructions, prompts, toolsets, tasks, changelog. | `lv_artifacts/.github/**`, `todo.md`, `CHANGELOG.md` |

## 4. Component Specifications
### 4.1 DevCycle Manifest (`devcycles.config.json`)
- Maps canonical DevCycle keys → { instructions, toolset, prompt, default tools, required contexts, stop-points }.
- Consumed by orchestrator + bootstrapper so both stay aligned. Manifest validation runs at bootstrap time.

### 4.2 Orchestrator Script
- Parameters: `phase`, `task`, `mode` (`plan-only`, `execute`, `validate`), `skipBootstrap`.
- Responsibilities: bootstrap check, manifest validation, context hydration, plan generation, phase invocation, result collation, human checkpoint prompts.
- Tooling: `filesystem`, `git`, `memory`, `sequentialthinking`, `runTests`, `todos`, `runSubagent`.
- Outputs: structured log (per phase), plan summary, validation evidence stub, memory/todo updates.

### 4.3 Phase Runner Template
- Steps per DevCycle:
  1. **Analyze:** Load PRD/TechReq excerpts + DevCycle instructions; produce requirement digest.
  2. **Design:** Request plan from LLM referencing manifest context.
  3. **Implement:** Execute tasks gated by toolset allowances; require confirmation for destructive ops.
  4. **Validate:** Run tests or verifications (if available) and summarize.
  5. **Reflect/Handoff:** Update TODO + CHANGELOG entries referencing DevCycle + PRD clause.
- Each phase script exports metadata (name, description, required inputs) to support discoverability.

### 4.4 Bootstrapper Flow
1. Ensure VS Code profile + MCP config align with TechReq §2.6.
2. Validate manifest coherence (instructions/toolset/prompt files exist).
3. Provide CLI entry points: `pwsh ./lv_artifacts/scripts/bootstrapper.ps1 -Phase scaffolding`, `npx genaiscript run ./lv_artifacts/genaiscript/orchestrator.genai.js --phase scaffolding`.
4. Expose machine-readable status for CI gating.

### 4.5 State & Telemetry
- Store execution snapshot in `memory/state.json` (phase, params, outputs, timestamps).
- Append summary stub to `todo.md` + `CHANGELOG.md`; full content handled by DevCycle instructions.
- Provide hook for future telemetry (TechReq §6 open question).

## 5. Data Flow
1. User invokes bootstrapper → ensures environment + manifest.
2. Orchestrator loads manifest, determines phase, fetches required context (PRD, TechReq, TODO, CHANGELOG, memory).
3. Orchestrator generates plan (LLM) referencing instructions to confirm understanding.
4. Orchestrator runs phase script with context + plan + manifest entry.
5. Phase script performs work, updates tracking docs, returns status.
6. Orchestrator logs outputs, surfaces checkpoints, optionally advances to next phase.

## 6. Non-Functional Requirements
- **Security:** Never touch `lv_artifacts/src/**`, block secret exfiltration, enforce restricted paths (PRD §9). All prompts include safety guardrails from `genaiscript-extension.instructions.md`.
- **Performance:** Cache context loads, stream long outputs, parallelize independent validations (TechReq §2.7).
- **Reliability:** Fail fast on missing manifest entries or instructions; provide actionable remediation instructions.
- **Extensibility:** Adding or editing a phase requires editing only `devcycles.config.json` + optional new phase script.

## 7. Implementation Plan (High Level)
1. **Manifest & Shared Utilities** – Create `devcycles.config.json`, `shared/context.js`, `shared/state.js`.
2. **Orchestrator Rewrite** – Implement param parsing, bootstrap invocation, context hydration, plan + execution pipeline.
3. **Phase Template** – Create base helper `phases/phase-runner.genai.js`; refactor `scaffolding.genai.js` to new template, add placeholders for remaining phases (stub referencing instructions).
4. **Bootstrapper Updates** – Align `.ts` manifest import, add validation + CLI entry, update PowerShell wrapper to call orchestrator or CLI with defaults.
5. **Documentation & Hooks** – Update README/CHANGELOG after DevCycle runs (future automation).

## 8. Open Questions / Future Enhancements
- Should orchestrator auto-chain phases or default to single-phase per invocation? (Recommend single-phase with optional `--chain next` flag.)
- How should telemetry integrate with `lv_artifacts/genaiscript/tools`? (Placeholder for future MCP-based logging tools.)
- Determine format for persisted execution summaries (JSON vs Markdown) before enabling CI gating.

## 9. Validation Strategy
- `genaiscript test` for orchestrator + phase scripts with mocked env vars.
- Dry-run mode (`mode=plan-only`) to ensure instructions load without file mutations.
- Unit-style prompts verifying manifest coherence + context loader output.

This specification satisfies the request for an optimized engine/infrastructure/tooling architecture and guides the subsequent code overhaul.

```

## LoadedVibes/docs/TECH_REQUIREMENTS.md
```md
# Loaded Vibes Technical Requirements

## Document Control

| Field         | Value                                 |
| ------------- | ------------------------------------- |
| Product       | Loaded Vibes Framework                |
| Document Type | Technical Requirements                |
| Status        | Draft (consolidated)                  |
| Last Updated  | 2025-11-24                            |
| Owners        | Framework Architecture & Tooling Team |

## 1. System Context & Principles

- Authoring occurs inside `D:/LoadedVibes` and is limited to `.github/`, `.vscode/`, `docs/`, and `templates/` unless explicitly updating `lv_artifacts/`.
- Shipped payloads live under `lv_artifacts/**`; runtime output lives under `lv_artifacts/src/**` only after users install the framework.
- Tooling (tasks, MCP servers, Copilot instructions) must reference development assets exclusively to avoid contaminating the shipped snapshot.
- Spec-Driven Workflow artifacts (PRD, this document, TODO, CHANGELOG) anchor every DevCycle.

## 2. Layered Architecture Overview

| Layer                | Responsibilities                                                              | Key Artifacts                                                             |
| -------------------- | ----------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| **Bootstrap**        | Detect profile gaps, sync MCP + extensions, expose CLI entry points.          | `lv_artifacts/scripts/bootstrapper.genaiscript.ts`, `bootstrapper.ps1`    |
| **Orchestration**    | Load manifest, hydrate context, coordinate Analyze → Handoff lifecycle.       | `lv_artifacts/genaiscript/orchestrator.genai.js`, `devcycles.config.json` |
| **Phase Runners**    | Execute DevCycle-specific logic with manifest-provided instructions/toolsets. | `lv_artifacts/genaiscript/phases/*.genai.js`                              |
| **Shared Utilities** | Context loading, memory/state persistence, validation helpers.                | `lv_artifacts/genaiscript/shared/*.js`                                    |
| **Governance**       | Instructions, prompts, toolsets, TODO/CHANGELOG, PRD/TechReq references.      | `lv_artifacts/.github/**`, workspace docs                                 |
| **Retro CLI**        | Installer, dashboard, diagnostics, DevCycle UX.                               | `create-loaded-vibes`, `loaded-vibes` CLI, `.loaded-vibes/**`             |

## 3. Artifact Layers & Deliverables

1. **Global Instructions (Framework Layer)** – `lv_artifacts/.github/global.instructions.md` defines universal rules, canonical DevCycle names, artifact taxonomy, and governance contract.
2. **Custom Agent (Stack Layer)** – `.github/copilot-instructions.md` for workspace + `lv_artifacts/.github/agents/*.agent.md` for shipped product enforce Next.js 15 / React 19 / Prisma / Clerk / Tailwind / Vercel guidance, formatting, safety, and self-correction behavior.
3. **Prompts (DevCycle Entry)** – `lv_artifacts/.github/prompts/*.prompt.md` trigger exactly one DevCycle, load correct instruction + toolset, and wire environment context.
4. **Instruction Files (Domain Layer)** – `lv_artifacts/.github/instructions/*.instructions.md` specify DevCycle goals, acceptance criteria, and security/performance guardrails.
5. **Toolsets (Execution Layer)** – `lv_artifacts/.github/toolsets/*.toolset.jsonc` enumerate allowed VS Code tools, MCP servers, CLIs, and safety checks per DevCycle; generated from workspace settings + MCP configs.
6. **Workspace Profile** – `.vscode/settings.json`, `.vscode/extensions.json`, `.vscode/mcp.json`, `.vscode/tasks.json` define maintainer environment; shipped equivalents live under `lv_artifacts/.vscode/`.
7. **Automation & Scripts** – `lv_artifacts/genaiscript/**` and `lv_artifacts/scripts/**` implement bootstrapper/orchestrator/phase tooling with deterministic outputs.

## 4. DevCycle Manifest & Engine Requirements

### 4.1 Manifest (`devcycles.config.json`)

- Maps each DevCycle key to `{instruction, prompt, toolset, description, defaultTools, checkpoints}`.
- Validated during bootstrap; missing files or mismatched references block execution.
- Includes metadata for CLI menus (display name, summary, risk flag) to ensure parity between orchestrator and console.

### 4.2 Orchestrator (`orchestrator.genai.js`)

- Parameters: `phase`, `task`, `mode (plan-only|execute|validate)`, `skipBootstrap`, and optional `chain` flag.
- Responsibilities: bootstrap verification, manifest load, context hydration (PRD, TechReq, TODO, CHANGELOG, state), plan generation, phase invocation, checkpoint enforcement.
- Tool access: `filesystem`, `git`, `memory`, `sequentialthinking`, `runTests`, `todos`, `runSubagent`, `fetch_webpage` (per instructions).
- Outputs: structured log segments (Analyze, Design, Implement, Validate, Reflect), TODO/CHANGELOG deltas, state snapshot, and optional telemetry event.

### 4.3 Phase Runner Template

- Each `phases/*.genai.js` script MUST export metadata `{name, description, requiredInputs}`.
- Execution stages:
  1. **Analyze:** Summarize relevant PRD/TechReq excerpts + instructions (EARS citations required).
  2. **Design:** Produce ordered plan referencing manifest + risk register.
  3. **Implement:** Execute allowed commands/tools only; require explicit approvals for destructive actions.
  4. **Validate:** Run tests/verifications; capture outputs.
  5. **Reflect/Handoff:** Update TODO/CHANGELOG, memory, changelog hooks.
- Scripts should call shared helpers for context hydration, logging, and TODO updates to ensure parity.

### 4.4 Bootstrapper Flow

1. Ensure VS Code profile + MCP config match workspace requirements (extensions installed, `genaiscript.localTypeDefinitions=true`).
2. Validate manifest coherence (files exist, instructions reference real toolsets, CLI + orchestrator in sync).
3. Provide CLI entry points: `pwsh ./lv_artifacts/scripts/bootstrapper.ps1 -Phase scaffolding` and `npx genaiscript run ./lv_artifacts/genaiscript/orchestrator.genai.js --phase scaffolding`.
4. Emit machine-readable status (JSON) for CLI dashboard + CI gating.

### 4.5 State & Telemetry

- Persist execution snapshots in `lv_artifacts/genaiscript/state/state.json` (phase, params, outputs, timestamps).
- Append summary stubs to `TODO.md` and `CHANGELOG.md`; DevCycle instructions flesh out details.
- Provide hooks for future telemetry exports (NDJSON, remote sink) referenced by CLI logs.

## 5. Retro CLI Platform Requirements

### 5.1 Distribution Model

- **Packages:** `create-loaded-vibes` npm package bootstraps projects; optional binaries (pkg/Vercel) for air-gapped environments.
- **Entry Points:**
  - `npx create-loaded-vibes@latest` (interactive wizard)
  - `npx create-loaded-vibes my-app --stack next` (non-interactive)
  - `npx create-loaded-vibes --attach ./existing` (retrofit)
- **Workflow:** discovery badge → preflight (Node ≥ 20, git, pnpm, VS Code, GenAIScript extension) → download signed release → extract to `.loaded-vibes/` → run `loaded-vibes init` → ASCII success + next steps.

### 5.2 Console UX & Modules

- UI toolkit: `ink`, `ink-select-input`, `ink-text-input`, `blessed-contrib` for charts; rendering via `figlet`, `gradient-string`, `chalk`, `cli-spinners`, `listr2`.
- Modules: Installer, Project Registry, DevCycle Service (wraps orchestrator), Telemetry/Logging, Troubleshooter (`doctor`), Dashboard, Security Manager.
- Command surface:

```
loaded-vibes create <dir>
loaded-vibes init
loaded-vibes dashboard
loaded-vibes devcycle <name>
loaded-vibes logs [--follow]
loaded-vibes doctor
loaded-vibes upgrade
loaded-vibes config set <key>
loaded-vibes tools <command>
```

- Dashboard panes: DevCycle queue, real-time logs, system metrics, TODO/CHANGELOG feed, notifications.
- Command palette (`Ctrl+P`) surfaces fuzzy actions (Run DevCycle, View Logs, Configure Settings).

### 5.3 Diagnostics & Logs

- `doctor` scans prerequisites, connectivity, MCP health, file permissions, `.loaded-vibes` drift; offers auto-remediation with confirmation.
- Logs stored as NDJSON in `.loaded-vibes/logs/*.ndjson`, filterable by DevCycle/time/severity; CLI exports Markdown snapshots for reviews.
- CLI streams orchestrator events; each event must cite the originating requirement (PRD or TechReq section).

### 5.4 Security & Performance

- Downloaded releases require SHA256 verification; unsigned payloads abort with actionable guidance.
- File writes restricted to `.loaded-vibes/**` and explicit user-approved copies.
- “Bad Vibes Firewall” prompts warn before destructive operations, describing affected paths + rollback steps.
- Cache release tarballs, parallelize download + checksum, throttle UI animations when CPU spikes, keep dashboard log latency < 200 ms.

## 6. Canonical DevCycle Table

| #   | DevCycle       | Purpose                                                                                            |
| --- | -------------- | -------------------------------------------------------------------------------------------------- |
| 1   | Initialization | Bootstrap environment, audit extensions/MCP/settings, validate PRD/TechReq, output readiness.      |
| 2   | Scaffolding    | Convert PRD/TechReq into project structure, base components, server actions, layout.               |
| 3   | Configuration  | Configure ESLint, Prettier, TS, Tailwind, Vitest, Playwright, `.env`, secrets, workspace settings. |
| 4   | Verification   | Run lint/typecheck/config validation/connectivity scans, detect missing files.                     |
| 5   | Data           | Design Prisma schema, migrations, safety checks, seeding, drift detection.                         |
| 6   | Auth           | Integrate Clerk, configure ABAC/RBAC, session security, onboarding flows.                          |
| 7   | Testing        | Configure test infra, generate plans, enforce acceptance criteria.                                 |
| 8   | Validation     | Confirm implementation matches PRD intent, UX flows, contracts.                                    |
| 9   | Features       | Implement application logic with performance budgets.                                              |
| 10  | Debug          | Resolve errors/failing tests, coordinate with perf/observability.                                  |
| 11  | Security       | Enforce CSP, HSTS, permissions, logging redaction, PII handling.                                   |
| 12  | Performance    | Optimize bundle size, DB queries, dependencies, tech debt.                                         |
| 13  | Observability  | Instrument telemetry/logs/alerts/dashboards.                                                       |
| 14  | Code Review    | Automate PR reviews, policies, static analysis.                                                    |
| 15  | Documentation  | Generate README, CONTRIBUTING, SECURITY, CODEOWNERS, templates.                                    |
| 16  | CI/CD          | Define GitHub Actions for lint/test/build/E2E, Vercel pipelines.                                   |
| 17  | Deploy         | Execute deployments, smoke tests, rollback/canary flows.                                           |
| 18  | Updates        | Post-launch fixes, QoL improvements, release notes.                                                |

Global instructions MUST list only these names; instruction files define behavior.

## 7. Workflow & Governance Requirements

- Prompts → Instructions → Toolsets chain is mandatory per DevCycle; add CI checks verifying manifest entries resolve.
- Custom agent obeys `global instructions → instruction file → toolset`; deviations require documented Decision Records.
- TODO/CHANGELOG updates are required outputs for every DevCycle; missing updates fail validation.
- Human checkpoints: `plan` approval, `pre-implement` approval for destructive steps, `reflect` summary sign-off.

## 8. Tooling & Automation Requirements

- Keep workspace profile (`.vscode/*.json`) in sync with shipped profile; differences logged in README + TODO.
- Provide `tasks.json` entries for running orchestrator, CLI, and lint/test operations (future work tracked in TODO).
- `genaiscript/localTypeDefinitions` flag must remain `true`; update `.genaiscript.d.ts` references when upstream changes.
- Prefer MCP servers/GenAIScript APIs over raw filesystem/network operations; document exceptions with Decision Records.

## 9. Security, Quality, and Compliance

- Instruction files enforce CSP, HSTS, ABAC, RBAC, content-safety, and secret-scanning guardrails.
- CLI and orchestrator must avoid touching `src/` trees unless acting within a user project’s `.loaded-vibes` environment.
- Automated operations are idempotent; rerunning a DevCycle cannot corrupt workspace or shipped artifacts.
- Telemetry pipelines must redact secrets and allow opt-out toggles via CLI settings.

## 10. Validation & Traceability

- `genaiscript test` covers orchestrator + phase scripts with mocked env.
- CLI smoke tests verify install, dashboard, doctor, logs, upgrade commands; results documented in TODO/CHANGELOG.
- Maintain mapping between PRD clauses and manifest entries; CLI logs must include `requirementId` metadata for audits.
- Periodically compare this document’s DevCycle list with `lv_artifacts/.github/global.instructions.md`; CI check recommended.

## 11. Roadmap & Open Questions

- Determine format for persisted execution summaries (JSON vs Markdown) before enabling CI gating.
- Evaluate optional local HTTP API for CLI dashboards or VS Code webviews.
- Design versioning strategy for user customizations inside `.loaded-vibes` during upgrades (semantic versions + diff hints proposed).
- Assess additional MCP/toolset needs for observability/performance phases.

This consolidated Technical Requirements document supersedes standalone CLI and engine specs; all future technical changes must update this file and receive PRD sign-off.

```

## LoadedVibes/docs/PRD.md
```md
# Loaded Vibes Product Requirements Document (PRD)

## Document Control

| Field         | Value                                 |
| ------------- | ------------------------------------- |
| Product       | Loaded Vibes Framework                |
| Document Type | Product Requirements Document         |
| Status        | Draft (consolidated)                  |
| Last Updated  | 2025-11-24                            |
| Owners        | Framework Architecture & Tooling Team |

## 1. Executive Summary

Loaded Vibes delivers a spec-driven framework that keeps authoring assets, shipped artifacts, and runtime code permanently isolated while delighting builders with a retro, DevCycle-aware CLI. This PRD consolidates the former PRD, CLI blueprint, and engine experience requirements into a single source of truth for product behavior, ensuring every workflow—from `npx create-loaded-vibes` through the synthwave console—aligns with the Spec-Driven Workflow enforced by the custom agent.

## 2. Product Goals & Success Metrics

- **Separation of concerns:** Authoring stays inside `.github/`, `.vscode`, `docs`, `templates`; shipped assets live in `lv_artifacts/**`; runtime code generates only under `lv_artifacts/src/**` in end-user projects.
- **Deterministic DevCycles:** Every DevCycle run produces traceable plans, validation evidence, TODO/CHANGELOG hooks, and human approval checkpoints.
- **Delightful CLI experience:** The retro console presents DevCycle queues, logs, diagnostics, and ASCII-first feedback that mirror the orchestrator state.
- **Distribution clarity:** Releases publish via `create-loaded-vibes`, optional binaries, and mirrored `.loaded-vibes/` folders with signed artifacts.
- **Measured outcomes:** 100% of IDE automation references development files only; every DevCycle task cites a PRD/TechReq clause; CLI interactions log to `.loaded-vibes/logs/*.ndjson`.

## 3. Personas & Journeys

| Persona                         | Needs                                                                                                          | Primary Touchpoints                                                  |
| ------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| **Framework Maintainer**        | Author specs, prompts, instructions, and toolsets without touching shipped payloads.                           | VS Code workspace, docs/, templates/, custom agent.                  |
| **Automation Agent (@copilot)** | Execute DevCycles deterministically, surface checkpoints, update TODO/CHANGELOG, honor safety tooling.         | Copilot instructions, toolsets, GenAIScript orchestrator.            |
| **End-User Builder**            | Install via CLI, run retro dashboard, trigger DevCycles, view logs/diagnostics without needing authoring repo. | `create-loaded-vibes`, `.loaded-vibes/`, retro CLI, docs in release. |

## 4. Scope & Boundaries

### 4.1 Asset Taxonomy

1. **Development Assets:** `.github/`, `.vscode/`, `docs/`, `templates/` govern authoring. Only these directories may change during framework development.
2. **Shipped Product:** `lv_artifacts/**` mirrors what users receive (agents, prompts, toolsets, docs, scripts, GenAIScript engine, VS Code defaults).
3. **Runtime Output:** End users generate `lv_artifacts/src/**` inside their projects; framework authors never lint or edit runtime files.

### 4.2 Directory Responsibilities

- `docs/` holds PRD + Tech Requirements plus all engineering specs—no standalone spec files elsewhere.
- `.github/` stores dev-environment governance (Copilot instructions, issue templates, automation configs).
- `.vscode/` configures IDE behavior for maintainers only; it never references shipped instructions.
- `templates/` stores gold master content used to regenerate shipped artifacts.
- `lv_artifacts/.github/**` defines the product-facing constitution (global instructions, agent manifests, prompts, toolsets).

### 4.3 Workspace vs. Release Enforcement

- WHEN authoring inside `D:/LoadedVibes`, THE SYSTEM SHALL block edits outside the allowed directories unless explicitly updating `lv_artifacts`.
- WHEN generating runtime code, THE SYSTEM SHALL emit assets exclusively under `lv_artifacts/src/**` within the consumer project.
- WHEN IDE tooling loads instructions or settings, THE SYSTEM SHALL source them from `.github`/`.vscode` in the workspace, never from shipped payloads.

## 5. Product Pillars & Requirements (EARS)

### 5.1 Distribution & Installation

- WHEN a user runs `npx create-loaded-vibes [project]`, THE SYSTEM SHALL download the latest signed release, mirror `lv_artifacts/**` into `.loaded-vibes/`, install dependencies, and invoke `loaded-vibes init` for profile setup.
- WHEN the CLI runs preflight checks, THE SYSTEM SHALL verify Node ≥ 20, git, pnpm, VS Code, and the GenAIScript extension, surfacing actionable remediation steps.
- WHEN attaching to an existing repo, THE SYSTEM SHALL detect conflicts in `.github`, `.vscode`, or `lv_artifacts/**` and offer Mirror, Merge, or Sandbox strategies while logging decisions to `.loaded-vibes/logs/install-YYYYMMDD.md`.

### 5.2 Retro Console Experience

- WHEN the user launches `loaded-vibes dashboard`, THE SYSTEM SHALL render the synthwave UI (ASCII masthead, gradient canvas, semantic colors) with panes for DevCycle queue, live logs, metrics, and TODO/CHANGELOG feeds.
- WHEN a DevCycle runs from the console, THE SYSTEM SHALL stream orchestrator events (plan, analyze, implement, validate, reflect) with pause/resume checkpoints and approval prompts for risky actions.
- WHEN notifications or errors occur, THE SYSTEM SHALL show animated toasts plus contextual remediation links to docs or `doctor` results.

### 5.3 DevCycle Governance

- WHEN a prompt triggers any DevCycle, THE SYSTEM SHALL load the associated instruction + toolset entry from `devcycles.config.json` before executing.
- WHEN DevCycles finish, THE SYSTEM SHALL append summarized work items to `TODO.md` and `CHANGELOG.md`, citing the originating requirement.
- WHEN a DevCycle needs additional guidance, THE SYSTEM SHALL offer a command palette entry (Ctrl+P) so users can rerun phases, view history, or open docs instantly.

### 5.4 Observability & Reporting

- WHEN troubleshooting (`loaded-vibes doctor`), THE SYSTEM SHALL scan prerequisites, MCP availability, file permissions, and drift between workspace + shipped manifest, offering optional auto-remediation.
- WHEN users request historical insight, THE SYSTEM SHALL provide searchable NDJSON logs filterable by DevCycle, timeframe, and severity, with export-to-Markdown support.
- WHEN release notes are generated, THE SYSTEM SHALL map CLI telemetry + changelog deltas directly to DevCycle identifiers for compliance.

### 5.5 Security & Risk Controls

- WHEN downloading releases, THE SYSTEM SHALL validate SHA256 signatures before extraction and block unsigned payloads.
- WHEN writing files, THE SYSTEM SHALL confine changes to `.loaded-vibes/**` unless the user explicitly approves copying templates into project roots.
- IF unsafe operations are requested, THEN THE SYSTEM SHALL raise a “Bad Vibes Firewall” warning describing impacted paths, required approvals, and rollback steps.

## 6. Success Metrics

- 100% of DevCycle runs include EARS-cited requirements within their execution logs.
- 0% of IDE settings reference shipped instructions; CI enforces guardrails.
- 100% of CLI installations log install strategy + checksum validation outcomes.
- CLI dashboard latency < 200 ms for log updates on modern hardware; `doctor` completes within 60 s for standard projects.

## 7. Dependencies & Assumptions

- Spec-Driven Workflow artifacts (PRD, Tech Requirements, TODO, CHANGELOG) stay current and live under `docs/`.
- GenAIScript orchestrator + bootstrapper referenced in Tech Requirements are available inside `lv_artifacts/genaiscript/**`.
- ASCII artwork, gradients, and fonts referenced by the CLI ship within releases or are generated locally without external fetches.

## 8. Risks & Mitigations

- **Confused responsibilities:** Mitigated by explicit directory ownership table and README guidance (Section 9).
- **CLI drift from orchestrator:** Mitigated by shared `devcycles.config.json` manifest and CI checks verifying parity with Tech Requirements (Section 4).
- **Token/safety regressions:** Mitigated by human-in-loop checkpoints, Bad Vibes Firewall prompts, and adherence to Copilot agent guardrails.

## 9. Directory Ownership Matrix

| Directory           | Owner            | Purpose                                                                                |
| ------------------- | ---------------- | -------------------------------------------------------------------------------------- |
| `.github/`          | Maintainers      | Dev-environment governance (instructions, templates, automation configs).              |
| `.vscode/`          | Maintainers      | IDE profile for authoring workspace only.                                              |
| `docs/`             | Maintainers      | Canonical specs (this PRD + Tech Requirements) and supporting references.              |
| `templates/`        | Maintainers      | Gold masters used to regenerate shipped artifacts.                                     |
| `lv_artifacts/`     | Product Snapshot | Shipped assets (agents, prompts, docs, scripts, GenAIScript engine, VS Code defaults). |
| `lv_artifacts/src/` | End User         | Runtime output produced in consumer projects; never referenced by workspace tooling.   |

## 10. Related Documents

- `docs/TECH_REQUIREMENTS.md` – Consolidated technical/architectural requirements, DevCycle manifest schema, engine automation, CLI implementation plan.
- `README.md` – Contributor quickstart and directory usage guidelines.
- `TODO.md` / `CHANGELOG.md` – Rolling execution evidence mandated by Spec-Driven Workflow.

This consolidated PRD supersedes prior standalone CLI and engine specs; future product changes MUST update this document before implementation.

```

## LoadedVibes/lv_artifacts/.github/agents/loaded-vibes-stack.agent.md
```md
```chatagent
---
name: "LoadedVibesStackAgent"
description: "Stack-specific agent for the Loaded Vibes framework (Next.js 15, React 19, Prisma + Neon, Clerk, Tailwind v4, shadcn/ui, Vitest, Playwright, Vercel)."
argument-hint: "State the active DevCycle and desired outcome (e.g., 'Configuration: harden ESLint' or 'Data: extend tenant schema')."
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "new/newWorkspace"
  ]
target: vscode
handoffs: []
---

# Loaded Vibes Stack Agent Charter

## 1. Purpose
- Represent the official Loaded Vibes application stack across every DevCycle.
- Translate PRD (`docs/PRD.md`) and Tech Requirements (`docs/TECH_REQUIREMENTS.md`) into production-ready Next.js 15 implementations.
- Enforce deterministic execution by following the chain: global instructions → DevCycle instructions → toolset.

## 2. Responsibilities
### 2.1 Framework Governance
- Load PRD + Tech Requirements before planning or coding.
- Respect workspace separation (touch only `.github/`, `.vscode/`, `docs/`, `templates/`, and `lv_artifacts/`).
- Keep humans in the loop for plans, migrations, and ambiguous requirements.

### 2.2 Architecture & Code Patterns
- Default to React Server Components; create Client Components only for interactive islands.
- Prefer Server Actions over API routes and colocate data mutations with route groups.
- Structure features using route groups, domain folders, and shared utilities under `lib/`.

### 2.3 Data & Integration Discipline
- Use Prisma targeting Neon Postgres; avoid raw SQL unless instructions demand it.
- Apply pagination, connection pooling, and query batching to honor performance goals.
- Execute migrations via MCP-first flows, documenting schema diffs and seeding steps.

### 2.4 Auth, Security, and Compliance
- Use Clerk helpers (`auth()`, `currentUser()`) and enforce ABAC/RBAC rules in Tech Requirements.
- Apply CSP + HSTS defaults, secure headers in `next.config.ts`, and sanitize user input.
- Coordinate with Security DevCycle outputs for rotating secrets and telemetry redaction.

### 2.5 UI, Styling, and Vibes
- Implement Tailwind v4 tokens, the 80-15-5 palette, four-tier typography, and shadcn/ui primitives per PRD branding.
- Provide skeleton states, only enable optimistic UX when reconciliation is deterministic, and maintain accessible contrast.
- Reuse Lucide icons and gradient CTAs sparingly to keep consistent vibes.

### 2.6 Quality Gates
- Run lint, typecheck, Vitest, and Playwright suites whenever a DevCycle requires verification.
- Update `todo.md`, `CHANGELOG.md`, and related docs after completing a DevCycle.
- Store durable architectural decisions in MCP memory when future phases depend on them.

## 3. Inputs
- PRD + Tech Requirements
- Active DevCycle instruction file and toolset
- Workspace state (files, diffs, tasks, tests)
- Human clarifications and reviews

## 4. Outputs
- Code/config/documentation updates scoped to the active DevCycle
- Explanations of changes plus residual risks
- Logged tasks and changelog entries tied to PRD/Tech Req IDs

## 5. Human-in-the-Loop Rules
- Pause for approval on plans, schema changes, destructive operations, or ambiguous requirements.
- Present at least two options (with trade-offs) for high-impact choices.
- Provide verification evidence (command summaries, logs) before closing a DevCycle.

## 6. Error Handling
- Abort if PRD/Tech Requirements are missing or inconsistent; request updated copies.
- Detect violations of stack contracts (client-side secrets, blocking I/O) and self-correct.
- Escalate when tools or MCP servers defined in the toolset are unavailable.

## 7. Completion Definition
- All responsibilities for the DevCycle are satisfied and validated.
- Required documentation (`todo.md`, `CHANGELOG.md`, decision records) is updated.
- Human reviewer signs off or provides next steps.

## 8. Traceability
- WHEN a DevCycle executes under the Loaded Vibes stack, THE SYSTEM SHALL apply this charter to enforce stack rules and workflow guardrails (PRD §7.4, TechReq §2.2/§3).
- WHEN stack decisions diverge from defaults, THE SYSTEM SHALL document the rationale and link it to PRD or Tech Requirement references (PRD §8, TechReq §7).
```

```

## LoadedVibes/lv_artifacts/.github/instructions/auth.instructions.md
```md
```instructions
---
name: auth.instructions
applyTo: "**"
description: "Instructions for the Auth DevCycle."
---

# Auth DevCycle Instructions

## 1. Purpose
- Integrate Clerk authentication, enforce ABAC/RBAC, and define onboarding/offboarding flows.
- Ensure user/session security, secrets handling, and compliance requirements are satisfied.

## 2. Responsibilities
### 2.1 Identity Integration
- Configure Clerk SDKs, environment variables, and middleware per TechReq §3 DevCycle 6.
- Define session validation in middleware/Server Components and document required headers/cookies.

### 2.2 Access Control Modeling
- Implement role- or attribute-based checks aligned with PRD personas and tenancy model.
- Centralize authorization utilities (e.g., `lib/authz.ts`) with typed policies.

### 2.3 User Lifecycle Flows
- Design onboarding, invitation, suspension, and deletion flows referencing PRD §5 stakeholders.
- Ensure UI states exist for pending verification, revoked access, and recovery scenarios.

### 2.4 Secret & Session Hygiene
- Confirm tokens are stored server-side, sanitized before logging, and rotated per security guidance.
- Update `.env.example` + documentation with required Clerk keys and rotation cadence.

### 2.5 Validation & Auditing
- Write unit/integration tests for auth helpers.
- Document audit requirements (login attempts, admin actions) for Observability DevCycle.

## 3. Inputs
- Data schema (user/tenant tables)
- PRD personas + security requirements
- Clerk configuration docs
- Toolset access (Clerk MCP/fetch, filesystem, sequential thinking)

## 4. Outputs
- Auth configuration files, middleware, helper utilities
- Updated `.env.example`
- Tests verifying auth rules
- Tasks for unresolved auth items + changelog updates

## 5. Success Criteria
- Auth flows cover all PRD personas and failure states.
- Authorization utilities are reusable and tested.
- Secrets are documented without exposing real values.

## 6. Error Handling
- Stop if required env vars or Clerk config is missing.
- Escalate if auth changes impact migrations or data models without Data DevCycle coordination.

## 7. Toolset Hook
Use only tools declared in `../toolsets/auth.toolset.jsonc`.

## 8. Traceability
- WHEN authentication needs implementation or updates, THE SYSTEM SHALL run this Auth DevCycle to enforce security mandates (PRD §7.4, TechReq §3 DevCycle 6).
- WHEN auth risks are found, THE SYSTEM SHALL log mitigation tasks referencing PRD §9 and TechReq §6.
```

```

## LoadedVibes/lv_artifacts/.github/instructions/ci-cd.instructions.md
```md
```instructions
---
name: ci-cd.instructions
applyTo: "**"
description: "Instructions for the CI/CD DevCycle."
---

# CI/CD DevCycle Instructions

## 1. Purpose
- Define, implement, and validate automation pipelines that build, test, and deploy the Loaded Vibes stack.
- Ensure CI/CD workflows enforce DevCycle contracts and security gates.

## 2. Responsibilities
### 2.1 Pipeline Design
- Map required stages (lint, type, test, build, e2e, deploy, smoke) to GitHub Actions or equivalent tooling per TechReq §3 DevCycle 16.
- Encode environment guardrails (secrets, required approvals, branch protections).

### 2.2 Implementation
- Author/update workflow files, reusable actions, caching strategies, and secrets references.
- Provide local scripts or `npx genaiscript` tasks for reproducing CI steps.

### 2.3 Validation
- Run pipelines (or dry-run) to confirm they pass with current codebase.
- Capture logs/artifacts demonstrating success or document blockers.

### 2.4 Documentation & Governance
- Document pipeline stages, triggers, required approvals, and rollback procedures.
- Coordinate with Security/Deploy DevCycles to ensure compliance and readiness.

## 3. Inputs
- Outputs from Testing, Validation, Performance DevCycles
- Existing workflow files
- GitHub environment/secrets configuration
- Toolset for CI/CD

## 4. Outputs
- Updated workflow files and scripts
- Validation evidence (successful runs, logs)
- Docs describing pipeline behavior and required manual steps

## 5. Success Criteria
- Pipelines cover required stages and enforce policy gates.
- Secrets and tokens referenced securely (no plaintext values committed).
- Human reviewer approves pipeline updates after validation evidence is provided.

## 6. Error Handling
- Stop rollout if pipelines introduce regressions; coordinate rollback with Deploy DevCycle.
- Escalate when required secrets or permissions are missing.

## 7. Toolset Hook
Use only `../toolsets/ci-cd.toolset.jsonc` capabilities.

## 8. Traceability
- WHEN automation needs to be defined or changed, THE SYSTEM SHALL run this CI/CD DevCycle (PRD §7.4, TechReq §3 DevCycle 16).
- WHEN CI/CD issues arise, THE SYSTEM SHALL log remediation tasks referencing PRD §8 and TechReq §7.
```

```

## LoadedVibes/lv_artifacts/.github/instructions/code-review.instructions.md
```md
```instructions
---
name: code-review.instructions
applyTo: "**"
description: "Instructions for the Code Review DevCycle."
---

# Code Review DevCycle Instructions

## 1. Purpose
- Perform structured reviews of pull requests or change sets before integration.
- Enforce Loaded Vibes coding standards, security requirements, and workflow guardrails.

## 2. Responsibilities
### 2.1 Context Gathering
- Load PRD references, associated tickets, and DevCycle outputs to understand change scope.
- Identify dependencies or migrations that require special scrutiny.

### 2.2 Review Execution
- Analyze diffs for correctness, maintainability, performance, security, and documentation completeness.
- Confirm tests exist for new functionality and that changelog/todo updates accompany the work.

### 2.3 Findings & Severity
- Categorize findings (blocker, required, optional) with file/line references.
- Link findings to PRD/TechReq clauses or DevCycle instructions to justify severity.

### 2.4 Communication & Follow-up
- Provide actionable feedback, alternative proposals, or approval rationale.
- Track required changes via tasks/issues and ensure they are resolved before approval.

## 3. Inputs
- Pull request or diff summary
- PRD/Tech Requirements
- Test + verification results
- Toolset for Code Review cycle

## 4. Outputs
- Review report summarizing findings, approvals, or requested changes
- Logged tasks for follow-up work
- Updated changelog/todo references if reviewer makes edits

## 5. Success Criteria
- Every change receives at least one review aligned with these instructions.
- Findings are documented with severity and references; approvals include validation evidence.
- Human reviewer (approver) records final decision in repo tooling.

## 6. Error Handling
- Pause the review if context (design, tests, migrations) is missing; request additional artifacts.
- Reject changes that bypass required DevCycles or security gates.

## 7. Toolset Hook
Use only `../toolsets/code-review.toolset.jsonc` capabilities.

## 8. Traceability
- WHEN code is ready for integration, THE SYSTEM SHALL execute this Code Review DevCycle before merging (PRD §7.4, TechReq §3 DevCycle 14).
- WHEN issues surface, THE SYSTEM SHALL log remediation tasks referencing PRD §8 and TechReq §7.
```

```

## LoadedVibes/lv_artifacts/.github/instructions/data.instructions.md
```md
```instructions
---
name: data.instructions
applyTo: "**"
description: "Instructions for the Data DevCycle."
---

# Data DevCycle Instructions

## 1. Purpose
- Design and evolve the Prisma schema and database state backing the Loaded Vibes stack.
- Generate migrations, seeds, and safety checks that align with Neon Postgres constraints.
- Detect schema drift early and coordinate with other DevCycles (Auth, Features, Performance).

## 2. Responsibilities
### 2.1 Model Design
- Translate PRD domain models into Prisma schema definitions with explicit relations, indexes, and constraints.
- Annotate multi-tenant requirements (tenantId, role scopes) per TechReq §3 DevCycle 5.

### 2.2 Migration Planning
- Author Prisma migrations that are idempotent, backward-compatible when feasible, and documented with rationale.
- Coordinate with Neon resource limits; avoid long-running transactions and ensure connection pooling.

### 2.3 Data Safety & Seeding
- Create or update seeding scripts that respect ABAC/RBAC requirements and avoid leaking secrets.
- Validate seeding on a disposable database instance before recommending production rollout.

### 2.4 Drift Detection
- Compare schema to previously generated artifacts; surface drift or manual database edits.
- Log remediation tasks if divergence is detected.

### 2.5 Documentation & Hand-off
- Record schema updates, migrations, and operational considerations (backups, rollbacks) for Deploy DevCycle.

## 3. Inputs
- PRD/Tech Requirements data sections
- Existing Prisma schema + migrations
- Database connection details from Initialization/Configuration
- Toolset access to Prisma CLI + Postgres MCP

## 4. Outputs
- Updated `prisma/schema.prisma`
- Generated migrations + seed scripts
- Validation evidence (prisma format/validate/migrate)
- Tasks documenting follow-up work plus changelog entry

## 5. Success Criteria
- Schema reflects current PRD requirements and passes `prisma validate`.
- Migrations apply cleanly to a test database; seeds run without errors.
- Human reviewer signs off on data changes and associated risks.

## 6. Error Handling
- Stop if database connectivity fails or migrations would cause destructive changes without approval.
- Provide rollback guidance or snapshot instructions when required.

## 7. Toolset Hook
Use tools defined in `../toolsets/data.toolset.jsonc` (Prisma CLI, Postgres MCP, filesystem, git, sequential thinking) only.

## 8. Traceability
- WHEN domain models evolve, THE SYSTEM SHALL execute this Data DevCycle to align database artifacts with PRD §7 and TechReq §3 DevCycle 5.
- WHEN data changes introduce risk, THE SYSTEM SHALL log mitigation tasks referencing PRD security/performance clauses (PRD §9, TechReq §6/§7).
```

```

## LoadedVibes/lv_artifacts/.github/instructions/configuration.instructions.md
```md
```instructions
---
name: configuration.instructions
applyTo: "**"
description: "Instructions for the Configuration DevCycle."
---

# Configuration DevCycle Instructions

## 1. Purpose
- Establish the project's configuration baseline once scaffolding is approved.
- Set up formatting, linting, typing, testing frameworks, environment variables, and workspace metadata.
- Align project settings with PRD + Tech Requirements so later DevCycles operate deterministically.

## 2. Responsibilities
### 2.1 Configure Tooling
- Implement ESLint, Prettier, TypeScript, Tailwind, Vitest, Playwright, and other stack tools per TechReq §3 DevCycle 3.
- Ensure configuration values reflect PRD branding (e.g., Tailwind tokens, UI themes).

### 2.2 Generate Configuration Files
- Create/update `tsconfig.json`, `package.json` scripts, `.eslintrc`, `.prettierrc`, Tailwind config, Vitest/Playwright configs, and supporting metadata.
- Keep configs modular and documented, adding brief comments when intent is non-obvious.

### 2.3 Define Environment Variables
- Produce `.env.example` with Clerk, Neon, Vercel, and internal service keys sourced from PRD/Tech Requirements.
- Document secrets ownership, rotation expectations, and which DevCycles will populate values.

### 2.4 Align Workspace Settings
- Update `.vscode/settings.json`, tasks, and recommended extensions only when necessary, ensuring they continue to reference development assets (PRD §6.5).

### 2.5 Validate Toolchain
- Execute lint, typecheck, and test dry runs to confirm configs load without errors.
- Capture outputs or logs for the Validation DevCycle.

## 3. Inputs
- Approved scaffold + readiness report
- PRD + Tech Requirements
- Template snippets under `templates/`
- Toolset definition for Configuration

## 4. Outputs
- Generated/updated configuration files
- `.env.example` plus documentation for secret ownership
- Validation logs (lint/type/test) or recorded blockers
- Tasks + changelog entry summarizing configuration actions

## 5. Success Criteria
- All required configuration files exist, are syntactically valid, and align with PRD constraints.
- Tooling commands (`lint`, `typecheck`, `test`) run successfully or documented why not.
- Human reviewer approves the configuration baseline.

## 6. Error Handling
- Stop if conflicting configs or dependency mismatches are detected; propose reconciliation plan.
- Guard against writing secrets into tracked files.
- Revert partial config updates if validation fails catastrophically.

## 7. Toolset Hook
Use only the capabilities in `../toolsets/configuration.toolset.jsonc`.

## 8. Traceability
- WHEN the scaffold is ready for tooling, THE SYSTEM SHALL execute this Configuration DevCycle to establish the shared config baseline (PRD §7.4, TechReq §3 DevCycle 3).
- WHEN configuration gaps emerge, THE SYSTEM SHALL log remediation tasks and link them to PRD/TechReq references (PRD §8, TechReq §7).
```

```

## LoadedVibes/lv_artifacts/.github/instructions/debug.instructions.md
```md
```instructions
---
name: debug.instructions
applyTo: "**"
description: "Instructions for the Debug DevCycle."
---

# Debug DevCycle Instructions

## 1. Purpose
- Identify, reproduce, and resolve defects surfaced during Verification, Testing, Validation, or human feedback.
- Stabilize the codebase while preserving traceability and safety.

## 2. Responsibilities
### 2.1 Reproduction & Diagnostics
- Capture repro steps, environment details, logs, and data snapshots for each issue.
- Leverage sequential thinking/tooling to isolate root causes before applying fixes.

### 2.2 Fix Implementation
- Apply minimal, well-scoped fixes that respect stack conventions and do not introduce new risk.
- Update or add tests reproducing the bug to prevent regressions.

### 2.3 Regression Verification
- Re-run relevant lint/type/test suites plus any scenario-specific scripts to confirm resolution.
- Coordinate with Observability/Performance DevCycles if fixes touch instrumentation or budgets.

### 2.4 Documentation
- Record root cause, fix summary, and tests executed in `CHANGELOG.md` and/or issue trackers.
- Update runbooks or troubleshooting guides when appropriate.

## 3. Inputs
- Bug reports, failing tests, logs
- Current codebase + configs
- Toolset for Debug cycle

## 4. Outputs
- Code/config updates addressing the defect
- Updated tests covering the issue
- Documentation/log entries describing diagnosis and resolution

## 5. Success Criteria
- Reproduction steps now pass; automated tests confirm the fix.
- No unrelated files are modified; scope stays focused.
- Human reviewer acknowledges the fix and residual risks.

## 6. Error Handling
- Stop when reproduction is unclear; request clarification.
- Avoid speculative changes; revert attempts that fail validation.

## 7. Toolset Hook
Use only `../toolsets/debug.toolset.jsonc` capabilities.

## 8. Traceability
- WHEN defects arise, THE SYSTEM SHALL execute this Debug DevCycle before resuming feature work (PRD §7.4, TechReq §3 DevCycle 10).
- WHEN fixes are applied, THE SYSTEM SHALL document outcomes referencing PRD §8 and TechReq §7.
```

```

## LoadedVibes/lv_artifacts/.github/instructions/deploy.instructions.md
```md
```instructions
---
name: deploy.instructions
applyTo: "**"
description: "Instructions for the Deploy DevCycle."
---

# Deploy DevCycle Instructions

## 1. Purpose
- Execute production (or staging) deployments safely, including smoke tests, rollback planning, and stakeholder communication.
- Ensure deployments respect CI/CD gates, security controls, and PRD readiness criteria.

## 2. Responsibilities
### 2.1 Pre-flight Checklist
- Confirm Validation, Testing, Security, and Performance DevCycles are green or have waivers.
- Verify environment variables/secrets exist for the target environment (Vercel, etc.).

### 2.2 Deployment Execution
- Trigger deployment via approved tooling (e.g., Vercel CLI/API, GitHub Actions) while capturing logs.
- Follow canary/blue-green procedures if defined, otherwise execute standard rollout with monitoring.

### 2.3 Smoke & Health Checks
- Run smoke tests or targeted E2E scripts to confirm core flows post-deploy.
- Monitor logs/metrics for regressions; halt/rollback if thresholds exceed limits.

### 2.4 Rollback & Communication
- Document rollback steps and execute if necessary.
- Notify stakeholders of deployment status, including release notes and follow-up tasks.

## 3. Inputs
- Release candidate build artifacts
- CI/CD workflow outputs
- Environment configuration + secrets
- Toolset for Deploy cycle

## 4. Outputs
- Deployment logs and verification results
- Updated changelog/release notes
- Tasks for post-deploy fixes or follow-up monitoring

## 5. Success Criteria
- Deployment completes without errors; smoke tests pass.
- Stakeholders informed of release content and status.
- Rollback plan documented (executed if needed).

## 6. Error Handling
- Abort deployment if pre-flight gates fail or unexpected errors occur.
- Initiate rollback when smoke tests or monitoring detect severity-high regressions.

## 7. Toolset Hook
Use only `../toolsets/deploy.toolset.jsonc` capabilities.

## 8. Traceability
- WHEN releasing updates, THE SYSTEM SHALL execute this Deploy DevCycle (PRD §7.4, TechReq §3 DevCycle 17).
- WHEN incidents occur during deployment, THE SYSTEM SHALL log remediation tasks referencing PRD §9 and TechReq §7.
```

```

## LoadedVibes/lv_artifacts/.github/instructions/documentation.instructions.md
```md
```instructions
---
name: documentation.instructions
applyTo: "**"
description: "Instructions for the Documentation DevCycle."
---

# Documentation DevCycle Instructions

## 1. Purpose
- Produce and maintain project documentation (README, CONTRIBUTING, SECURITY, templates, release notes) that mirrors the current implementation.
- Ensure documentation remains the single source of truth per Spec-Driven Workflow.

## 2. Responsibilities
### 2.1 Inventory & Gap Analysis
- Review existing docs against PRD + Tech Requirements to identify missing sections or outdated guidance.
- Confirm templates in `templates/` reflect shipped artifacts under `lv_artifacts/`.

### 2.2 Author & Update Content
- Revise README, SUPPORT, SECURITY, CONTRIBUTING, CODEOWNERS, templates, and supplementary guides.
- Include links to relevant DevCycles, toolsets, and validation evidence where needed.

### 2.3 Traceability Artifacts
- Update `todo.md`, `CHANGELOG.md`, action/decision logs per workflow instructions.
- Document assumptions, decisions, and validation logs for future DevCycles.

### 2.4 Review & Publication
- Validate Markdown formatting, lint docs if applicable, and ensure cross-links work.
- Coordinate with Code Review to confirm documentation changes land alongside code.

## 3. Inputs
- Latest PRD/Tech Requirements
- Outputs from previous DevCycles
- Template sources
- Toolset for Documentation cycle

## 4. Outputs
- Updated documentation files + templates
- Summary of changes, linked tasks, and release notes entries
- Evidence that docs were verified (lint, preview screenshots, etc.)

## 5. Success Criteria
- Documentation accurately reflects current state; no contradictions with PRD/Tech Requirements.
- Required artifacts listed in Spec-Driven Workflow (README, SUPPORT, SECURITY, etc.) exist and are current.
- Stakeholders approve documentation updates.

## 6. Error Handling
- Pause documentation updates if dependent DevCycles are incomplete.
- Flag conflicting content and propose remediation steps.

## 7. Toolset Hook
Use tools defined in `../toolsets/documentation.toolset.jsonc`.

## 8. Traceability
- WHEN the knowledge base must be updated, THE SYSTEM SHALL execute this Documentation DevCycle (PRD §7.4, TechReq §3 DevCycle 15).
- WHEN documentation changes occur, THE SYSTEM SHALL update changelog/task artifacts referencing PRD §8 and TechReq §7.
```

```

## LoadedVibes/lv_artifacts/.github/instructions/features.instructions.md
```md
```instructions
---
name: features.instructions
applyTo: "**"
description: "Instructions for the Features DevCycle."
---

# Features DevCycle Instructions

## 1. Purpose
- Implement application functionality (components, server actions, workflows) derived from PRD stories.
- Maintain stack conventions, performance budgets, and human-in-the-loop checkpoints.

## 2. Responsibilities
### 2.1 Plan & Decompose
- Translate PRD stories into implementation plans referencing routes, components, data needs, and tests.
- Surface dependencies on other DevCycles (Data, Auth, Observability) before coding.

### 2.2 Implement Features
- Build React Server Components first; introduce Client Components only when interactivity requires it.
- Co-locate server actions with route groups, enforce typing, and reuse shared utilities.

### 2.3 Maintain Quality
- Keep functions small, document non-obvious intent, and follow Tailwind/shadcn design tokens.
- Update tests as features land (unit + integration) or log follow-up tasks for Testing DevCycle.

### 2.4 Documentation & Artifacts
- Update relevant docs (README sections, feature specs) and record decisions.
- Log tasks for partial work, TODOs, or follow-up validations.

## 3. Inputs
- Validated PRD requirements and design assets
- Data/Auth artifacts
- Toolset for Features cycle

## 4. Outputs
- Source code changes (components, server actions, utils)
- Updated docs/tests as applicable
- Task + changelog updates summarizing work and risks

## 5. Success Criteria
- Implementation matches PRD acceptance criteria and passes lint/type/test gates.
- No violations of stack conventions (client-side secrets, blocking IO, etc.).
- Human reviewer approves feature behavior or provides feedback.

## 6. Error Handling
- Pause when requirements are unclear; request decisions before coding.
- Revert or isolate incomplete work in feature flags if necessary.

## 7. Toolset Hook
Use only the capabilities in `../toolsets/features.toolset.jsonc`.

## 8. Traceability
- WHEN PRD stories enter implementation, THE SYSTEM SHALL execute this Features DevCycle to deliver stack-compliant code (PRD §7.4, TechReq §3 DevCycle 9).
- WHEN deviations or tech debt occur, THE SYSTEM SHALL log tasks referencing PRD §8 and TechReq §7.
```

```

## LoadedVibes/lv_artifacts/.github/instructions/initialization.instructions.md
```md
```instructions
---
name: initialization.instructions
applyTo: "**"
description: "Domain-agnostic rules for the Initialization DevCycle."
---

# Initialization DevCycle Instructions

## 1. Purpose
- Establish the Loaded Vibes environment state before any other DevCycle executes.
- Validate PRD (`docs/PRD.md`), Tech Requirements (`docs/TECH_REQUIREMENTS.md`), templates, and shipped artifacts for completeness.
- Produce an environment readiness report and log remediation tasks for human review.

## 2. Responsibilities
### 2.1 Audit VS Code & MCP Environment
- Enumerate installed VS Code extensions, settings, and CLI tasks exposed through the Initialization toolset.
- Detect available MCP servers (filesystem, git, github, postgres, fetch, memory, sequentialthinking) and verify connectivity per `.vscode/mcp.json`.

### 2.2 Audit Workspace Structure
- Confirm `.github/`, `.vscode/`, `docs/`, `templates/`, and `lv_artifacts/` match the ownership model (PRD §6.2).
- Ensure `global.instructions.md`, prompts, instructions, toolsets, orchestrators, and bootstrapper scripts exist and are readable.

### 2.3 Validate Source Documents
- Parse the PRD and Tech Requirements, ensuring all mandatory sections exist (architecture, data, security, testing, deployment, updates, etc.).
- Flag missing appendices, outdated dates, or contradictions between documents and log follow-up tasks.

### 2.4 Establish Baselines
- Capture revision hashes or timestamps for critical artifacts (global instructions, orchestrator scripts, templates, bootstrapper scripts).
- Record current git status, branch name, pending changes, and open tasks for downstream DevCycles.

### 2.5 Report Readiness
- Generate a readiness summary describing findings, blockers, and remediation actions.
- Update `todo.md` and `CHANGELOG.md` with any gaps discovered during initialization.

## 3. Inputs
- `docs/PRD.md`
- `docs/TECH_REQUIREMENTS.md`
- `.vscode/settings.json`, `.vscode/extensions.json`, `.vscode/mcp.json`
- Template catalog under `templates/`
- Shipped assets in `lv_artifacts/`

## 4. Outputs
- Environment readiness summary with pass/fail indicators per audit category
- Logged tasks for missing tooling, docs, or assets
- Changelog entry referencing Initialization findings

## 5. Success Criteria
- All mandatory assets exist and pass syntax validation.
- Toolset components listed in `../toolsets/initialization.toolset.jsonc` respond successfully.
- Human reviewer confirms readiness to proceed or accepts the documented remediation plan.

## 6. Error Handling
- Stop execution if PRD or Tech Requirements are missing or invalid; request updated copies.
- Surface unavailable MCP servers/extensions with actionable steps to install or reconfigure them.
- Record git conflicts or dirty states requiring human intervention before proceeding.

## 7. Toolset Hook
Use only the capabilities declared in `../toolsets/initialization.toolset.jsonc`.

## 8. Traceability
- WHEN a framework session begins, THE SYSTEM SHALL execute this Initialization DevCycle before any other work (PRD §7.4, TechReq §2.4/§3).
- WHEN readiness gaps are detected, THE SYSTEM SHALL log remediation tasks and changelog notes mapped to PRD oversight requirements (PRD §8, TechReq §7).
```

```

## LoadedVibes/lv_artifacts/.github/instructions/performance.instructions.md
```md
```instructions
---
name: performance.instructions
applyTo: "**"
description: "Instructions for the Performance DevCycle."
---

# Performance DevCycle Instructions

## 1. Purpose
- Audit and optimize application performance, including bundle size, server response times, database queries, and dependency health.
- Ensure the experience meets PRD performance promises and TechReq §6 guidelines.

## 2. Responsibilities
### 2.1 Measurement
- Capture baseline metrics (Core Web Vitals, API latency, database query timing, memory usage) using profiling tools available in the toolset.
- Record scenarios, datasets, and environment info for repeatability.

### 2.2 Optimization
- Address bottlenecks: code splitting, caching, query batching, background processing, etc.
- Minimize bundle size via dependency pruning, lazy loading, and compression settings.

### 2.3 Database & API Efficiency
- Review Prisma queries for N+1 issues, add indexes, adjust pagination, and enforce connection pooling best practices.
- Evaluate external API usage for throttling/backoff compliance.

### 2.4 Regression Protection
- Update alerts, dashboards, or automated tests to detect performance regressions.
- Document budgets and guardrails for future DevCycles.

## 3. Inputs
- Observability metrics/logs
- Current implementation + dependencies
- Toolset for Performance cycle (profilers, benchmarking scripts)

## 4. Outputs
- Performance report with before/after metrics
- Code/config updates implementing optimizations
- Updated budgets or alerts; tasks for remaining risks

## 5. Success Criteria
- Key metrics meet or beat targets defined in PRD/Tech Requirements.
- Changes are validated via repeatable benchmarks and tests.
- Human reviewer accepts trade-offs or approves residual risks.

## 6. Error Handling
- If tooling cannot profile (e.g., missing data), coordinate with Observability/Deploy to provision environments.
- Roll back optimizations that regress correctness or security.

## 7. Toolset Hook
Use only the tools described in `../toolsets/performance.toolset.jsonc`.

## 8. Traceability
- WHEN performance budgets must be validated, THE SYSTEM SHALL execute this Performance DevCycle (PRD §7.4, TechReq §3 DevCycle 12).
- WHEN optimizations change behavior, THE SYSTEM SHALL document outcomes referencing PRD §8 and TechReq §7.
```

```

## LoadedVibes/lv_artifacts/.github/instructions/observability.instructions.md
```md
```instructions
---
name: observability.instructions
applyTo: "**"
description: "Instructions for the Observability DevCycle."
---

# Observability DevCycle Instructions

## 1. Purpose
- Implement telemetry (logging, metrics, tracing) that supports monitoring, alerting, and debugging requirements.
- Align with PRD observability goals and TechReq §3 DevCycle 13.

## 2. Responsibilities
### 2.1 Instrumentation Strategy
- Define what to measure (golden signals, tenant-level KPIs) and where instrumentation lives.
- Choose libraries/providers (Vercel OTEL, custom loggers) consistent with stack.

### 2.2 Implementation
- Add structured logging with redaction, metrics exporters, and trace spans for critical flows.
- Ensure instrumentation is opt-in for sensitive environments and respects privacy controls.

### 2.3 Alerts & Dashboards
- Propose alert thresholds, escalation paths, and dashboards for runtime monitoring.
- Document integration steps with target platforms (e.g., Vercel, Grafana, Datadog).

### 2.4 Validation
- Simulate events to confirm telemetry is emitted, collected, and viewable.
- Provide evidence (screenshots, CLI output) for the Validation/Deploy DevCycles.

## 3. Inputs
- PRD observability requirements
- Existing instrumentation + logs
- Toolset for Observability cycle

## 4. Outputs
- Code/config updates adding telemetry
- Documentation describing metrics, alerts, and dashboards
- Validation evidence plus tasks for gaps

## 5. Success Criteria
- Key flows emit actionable telemetry with proper metadata.
- Logging/tracing respects security and privacy requirements.
- Stakeholders know how to access dashboards and respond to alerts.

## 6. Error Handling
- Stop if telemetry introduces significant overhead or leaks secrets; redesign approach.
- Coordinate with Security/Performance when instrumentation affects budgets.

## 7. Toolset Hook
Operate within `../toolsets/observability.toolset.jsonc`.

## 8. Traceability
- WHEN runtime insight is required, THE SYSTEM SHALL run this Observability DevCycle (PRD §7.4, TechReq §3 DevCycle 13).
- WHEN telemetry gaps remain, THE SYSTEM SHALL log remediation tasks referencing PRD §8 and TechReq §7.
```

```

## LoadedVibes/lv_artifacts/.github/instructions/scaffolding.instructions.md
```md
```instructions
---
name: scaffolding.instructions
applyTo: "**"
description: "Instructions for the Scaffolding DevCycle."
---

# Scaffolding DevCycle Instructions

## 1. Purpose
- Translate validated PRD + Tech Requirements into a concrete project scaffold.
- Define directory layouts, entrypoints, and baseline files that honor the Loaded Vibes stack.
- Produce a project map that subsequent DevCycles can extend without rework.

## 2. Responsibilities
### 2.1 Interpret PRD + Tech Requirements
- Extract structural requirements, route groups, feature modules, and cross-cutting assets (PRD §6, TechReq §3 DevCycle 2).
- Identify dependencies between domains (auth, data, shared UI) to plan folder topology.

### 2.2 Generate Project Structure
- Create top-level directories: `app/`, `features/`, `components/`, `lib/`, `public/`, `styles/`, and any additional stack-specific folders.
- Ensure layout aligns with Next.js 15 conventions (app router, route groups, server components by default).

### 2.3 Establish Boilerplate Files
- Create placeholder files for layout, error/loading templates, environment exemplars, README stubs, and documentation hooks required by later DevCycles.
- Scaffold shared config files (e.g., `tsconfig.json`, `package.json` placeholders) without yet specifying tooling details (reserved for Configuration).

### 2.4 Produce Project Map & Task List
- Document directories and files created along with their intended responsibilities.
- Add follow-up tasks to `todo.md` for items deferred to later DevCycles.

### 2.5 Enforce Guardrails
- Keep runtime `src/` artifacts out of the workspace; only update directories sanctioned in PRD §6.2.
- Use only the tools authorized for Scaffolding, requesting human approval for destructive operations.

## 3. Inputs
- Initialization readiness report
- `docs/PRD.md`
- `docs/TECH_REQUIREMENTS.md`
- Templates from `templates/`
- Active branch state

## 4. Outputs
- Created directory tree and baseline files
- Project map summarizing structure and future extensions
- Logged tasks plus changelog entry referencing Scaffolding

## 5. Success Criteria
- Directory layout matches stack conventions and PRD expectations.
- No business logic implemented; only structure and placeholders exist.
- Human reviewer approves scaffold and recorded project map.

## 6. Error Handling
- Halt if required source documents or templates are missing.
- Roll back partial scaffolds if structural conflicts appear (e.g., name collisions, invalid routing hierarchy).
- Surface blockers (file permissions, tooling gaps) with actionable remediation steps.

## 7. Toolset Hook
Use only the capabilities listed in `../toolsets/scaffolding.toolset.jsonc`.

## 8. Traceability
- WHEN PRD + Tech Requirements call for a new application, THE SYSTEM SHALL execute this Scaffolding DevCycle to realize the prescribed structure (PRD §7.4, TechReq §3 DevCycle 2).
- WHEN scaffolding completes, THE SYSTEM SHALL document the resulting map and open tasks so Configuration can proceed deterministically (PRD §8, TechReq §7).
```

```

## LoadedVibes/lv_artifacts/.github/instructions/security.instructions.md
```md
```instructions
---
name: security.instructions
applyTo: "**"
description: "Instructions for the Security DevCycle."
---

# Security DevCycle Instructions

## 1. Purpose
- Harden the application across CSP, HSTS, route protection, secret management, and logging hygiene dimensions.
- Validate that security requirements in PRD §9 and TechReq §6 are enforced.

## 2. Responsibilities
### 2.1 Policy Definition
- Review threat model, ABAC/RBAC matrices, and compliance requirements; update as needed.
- Document security policies in a centralized reference (e.g., `docs/SECURITY.md`).

### 2.2 Application Hardening
- Configure CSP/HSTS headers, secure cookies, rate limiting, and middleware guards.
- Inspect dependencies for known vulnerabilities; propose upgrades or mitigations.

### 2.3 Secret & Key Management
- Audit `.env` usage, rotate secrets where necessary, and document storage/rotation owners.
- Ensure telemetry/logging redact PII and secrets.

### 2.4 Security Testing
- Run automated scanners (e.g., `npm audit`, dependency review), targeted penetration scripts, or manual reviews for high-risk areas.
- Coordinate with Testing/Observability to capture evidence.

### 2.5 Reporting
- Summarize risks, mitigations, and residual actions for stakeholders.
- File tasks for remediation items that cannot be addressed immediately.

## 3. Inputs
- PRD/TechReq security sections
- Auth/Data outputs
- Dependency manifest + lockfiles
- Toolset for Security cycle

## 4. Outputs
- Updated security configs/middleware/docs
- Audit logs, scanner reports, or manual review notes
- Tasks + changelog entries for mitigations

## 5. Success Criteria
- Security controls meet documented requirements; outstanding risks are tracked.
- No secrets committed; telemetry sanitized.
- Human reviewer (security owner) signs off on the hardening pass.

## 6. Error Handling
- Halt if tooling indicates severe vulnerability; coordinate with stakeholders before proceeding.
- Escalate if secrets or credentials leak; rotate immediately.

## 7. Toolset Hook
Use only the tools defined in `../toolsets/security.toolset.jsonc`.

## 8. Traceability
- WHEN security posture must be assessed or improved, THE SYSTEM SHALL run this Security DevCycle (PRD §7.4, TechReq §3 DevCycle 11).
- WHEN issues exist, THE SYSTEM SHALL log mitigation plans referencing PRD §9 and TechReq §6/§7.
```

```

## LoadedVibes/lv_artifacts/.github/instructions/updates.instructions.md
```md
```instructions
---
name: updates.instructions
applyTo: "**"
description: "Instructions for the Updates DevCycle."
---

# Updates DevCycle Instructions

## 1. Purpose
- Coordinate post-launch fixes, quality-of-life improvements, and PRD/Tech Requirement refreshes.
- Ensure updates remain traceable, documented, and aligned with roadmap priorities.

## 2. Responsibilities
### 2.1 Intake & Prioritization
- Review backlog items, customer feedback, and telemetry insights to determine scope.
- Map each update to PRD requirements or new change requests; capture acceptance criteria.

### 2.2 Planning
- Determine which DevCycles (Features, Testing, Deploy, etc.) must run for each update.
- Sequence work to minimize disruption and maintain human-in-the-loop checkpoints.

### 2.3 Execution Oversight
- Ensure dependent DevCycles complete successfully for the selected work items.
- Track status, blockers, and decisions in `todo.md`, `CHANGELOG.md`, or issue trackers.

### 2.4 Communication & Documentation
- Publish release notes or update summaries referencing tasks/issues addressed.
- Update PRD/Tech Requirements when scope changes become permanent.

## 3. Inputs
- Backlog, telemetry, customer feedback
- Latest PRD/Tech Requirements
- Outputs from recent DevCycles
- Toolset for Updates cycle

## 4. Outputs
- Prioritized update plan with associated DevCycles
- Documentation/release notes summarizing changes
- Logged tasks for remaining work or follow-ups

## 5. Success Criteria
- Updates are fully traced to requirements and validated DevCycles.
- Stakeholders agree on scope, status, and next steps.
- Change documentation (changelog, PRD revisions) is current.

## 6. Error Handling
- Pause updates if prerequisite DevCycles fail or requirements are unclear.
- Defer risky changes to future planning sessions with rationale.

## 7. Toolset Hook
Use `../toolsets/updates.toolset.jsonc` to manage planning artifacts and communication tools.

## 8. Traceability
- WHEN post-launch changes are requested, THE SYSTEM SHALL execute this Updates DevCycle to orchestrate required work (PRD §7.4, TechReq §3 DevCycle 18).
- WHEN updates complete, THE SYSTEM SHALL record revisions in PRD/Tech Requirements and changelog (PRD §8, TechReq §7).
```

```

## LoadedVibes/lv_artifacts/.github/instructions/testing.instructions.md
```md
```instructions
---
name: testing.instructions
applyTo: "**"
description: "Instructions for the Testing DevCycle."
---

# Testing DevCycle Instructions

## 1. Purpose
- Establish automated testing strategy across unit, integration, and end-to-end suites.
- Generate or update Vitest + Playwright scaffolding, feature test plans, and coverage targets.

## 2. Responsibilities
### 2.1 Test Harness Configuration
- Ensure Vitest and Playwright configs reflect current routes, data seeds, and auth patterns (TechReq §3 DevCycle 7).
- Add npm scripts and CI hooks for running focused suites.

### 2.2 Test Authoring & Plans
- Implement or update tests covering new functionality, mapping each to PRD acceptance criteria.
- Produce test plans/checklists when full automation is not yet feasible.

### 2.3 Data & Auth Coordination
- Seed test data securely, aligning with Data + Auth DevCycles to avoid state drift.
- Stub external services responsibly; capture assumptions.

### 2.4 Reporting
- Capture test results, coverage summaries, and flake investigations for Validation DevCycle.
- Log TODOs for missing coverage or manual verification requirements.

## 3. Inputs
- Configured toolchain
- Feature specs and PRD acceptance criteria
- Data/Auth implementations
- Toolset for Testing cycle

## 4. Outputs
- Updated Vitest/Playwright configs and scripts
- New or revised test files and/or manual test plans
- Coverage or result summaries with links to logs/artifacts
- Tasks + changelog entry capturing testing status

## 5. Success Criteria
- Critical flows identified in PRD have automated or documented manual tests.
- Test suites run successfully (or failures triaged with action plan).
- Coverage gaps and manual steps are visible for Validation/Deploy DevCycles.

## 6. Error Handling
- Stop if tests cannot run due to configuration issues; coordinate with Configuration/Verification to resolve.
- Document flakiness and create follow-up tasks rather than silently retrying.

## 7. Toolset Hook
Use capabilities listed in `../toolsets/testing.toolset.jsonc` only.

## 8. Traceability
- WHEN new functionality or regressions require validation, THE SYSTEM SHALL execute this Testing DevCycle to enforce acceptance criteria (PRD §7.4, TechReq §3 DevCycle 7).
- WHEN coverage gaps persist, THE SYSTEM SHALL log mitigation tasks referencing PRD §8 and TechReq §7.
```

```

## LoadedVibes/lv_artifacts/.github/instructions/validation.instructions.md
```md
```instructions
---
name: validation.instructions
applyTo: "**"
description: "Instructions for the Validation DevCycle."
---

# Validation DevCycle Instructions

## 1. Purpose
- Confirm that implemented features, UX flows, and data contracts match PRD intent.
- Validate business rules, content, and accessibility behaviors beyond static checks.

## 2. Responsibilities
### 2.1 Requirement Traceability
- Map delivered features back to PRD acceptance criteria and Tech Requirement references.
- Highlight deviations, partial completions, or assumptions needing stakeholder approval.

### 2.2 UX & Content Review
- Exercise primary flows end-to-end (including error states, loading skeletons, accessibility cues).
- Compare UI against vibe spec (palette, typography, microcopy) and log gaps for Documentation/Updates.

### 2.3 Data & API Validation
- Ensure client/server contracts, Prisma models, and API responses align; detect drift or serialization issues.
- Verify error handling paths produce actionable messaging without leaking secrets.

### 2.4 Evidence Capture
- Record screenshots, videos, or logs demonstrating validated flows.
- Update `todo.md`/`CHANGELOG.md` with validation outcomes and unresolved issues.

## 3. Inputs
- Feature branches or artifacts awaiting validation
- PRD + Tech Requirements
- Test results, static analysis reports
- Toolset for Validation

## 4. Outputs
- Validation report summarizing coverage, findings, and approvals
- Evidence artifacts linked in the report
- Tasks for unresolved validation items

## 5. Success Criteria
- Each PRD requirement in scope is marked accepted, deferred, or blocked with rationale.
- UX/UX guidelines, accessibility rules, and branding requirements are satisfied.
- Human reviewer (product/UX owner) acknowledges validation outcomes.

## 6. Error Handling
- Pause validation if prerequisites (tests, data migrations) are incomplete.
- Escalate requirements ambiguities to stakeholders before proceeding.

## 7. Toolset Hook
Use only tools listed in `../toolsets/validation.toolset.jsonc`.

## 8. Traceability
- WHEN implementation needs confirmation against business rules, THE SYSTEM SHALL run this Validation DevCycle (PRD §7.4, TechReq §3 DevCycle 8).
- WHEN validation uncovers misalignment, THE SYSTEM SHALL log actionable tasks referencing PRD §8 and TechReq §7.
```

```

## LoadedVibes/lv_artifacts/.github/instructions/verification.instructions.md
```md
```instructions
---
name: verification.instructions
applyTo: "**"
description: "Instructions for the Verification (static checks) DevCycle."
---

# Verification DevCycle Instructions

## 1. Purpose
- Run static checks to ensure the scaffolded and configured project is structurally sound before feature work begins.
- Detect lint, type, dependency, or configuration regressions early.
- Produce evidence for the Validation DevCycle and CI pipelines.

## 2. Responsibilities
### 2.1 Execute Static Analysis
- Run ESLint, TypeScript, Tailwind validations, and any additional static analyzers defined in TechReq §3 DevCycle 4.
- Capture outputs, exit codes, and summaries for the changelog.

### 2.2 Validate Configuration Consistency
- Confirm generated files (`tsconfig`, `next.config`, `tailwind.config`, etc.) resolve modules correctly and align with workspace settings.
- Detect missing scripts, dependencies, or conflicting versions.

### 2.3 Audit File Integrity
- Ensure required directories/files from Scaffolding + Configuration still exist and are not drifted.
- Compare against template manifests; log discrepancies as tasks.

### 2.4 Document Findings
- Classify findings (pass/blocker/warning) and map them to PRD acceptance criteria.
- Recommend next steps or remediation tasks for Debug/Updates DevCycles.

## 3. Inputs
- Configured codebase
- Lint/type/test scripts defined in `package.json`
- Tool outputs from Configuration
- PRD + Tech Requirements

## 4. Outputs
- Static analysis logs (lint/type/tailwind)
- Verification summary with pass/fail matrix
- Tasks for any violations + changelog entry

## 5. Success Criteria
- All required static checks pass or have documented remediation plans.
- Workspace structure matches expectations; no missing key assets.
- Human reviewer acknowledges verification status before feature work proceeds.

## 6. Error Handling
- Stop if tooling commands cannot execute; diagnose dependency or environment issues.
- Do not auto-fix findings without human approval; instead, recommend actions for relevant DevCycle.

## 7. Toolset Hook
Use capabilities defined in `../toolsets/verification.toolset.jsonc` only.

## 8. Traceability
- WHEN configuration completes, THE SYSTEM SHALL execute this Verification DevCycle to validate static integrity (PRD §7.4, TechReq §3 DevCycle 4).
- WHEN verification uncovers issues, THE SYSTEM SHALL record remediation tasks referencing PRD/TechReq clauses (PRD §8, TechReq §7).
```

```

## LoadedVibes/lv_artifacts/.github/prompts/ci-cd.prompt.md
```md
---
name: "CiCdDevCyclePrompt"
description: "Build and refine CI/CD pipelines, caching, and policies."
argument-hint: "Specify the pipeline targets or automation changes."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/ci-cd.instructions.md"
toolset: "../toolsets/ci-cd.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# CI/CD DevCycle Prompt

You are starting the **CI/CD** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/ci-cd.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/ci-cd.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Inventory existing pipelines + desired stages.
- Plan updates to workflow files, caching, secrets.
- Decide validation steps (dry-run, branch protection checks).

## Deliver back to the human reviewer
- Pipeline task breakdown.
- Risks or approvals required (secrets, permissions).
- Questions about deployment strategy.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/auth.prompt.md
```md
---
name: "AuthDevCyclePrompt"
description: "Implement and harden Clerk auth, RBAC, and security flows."
argument-hint: "Summarize the auth scenario or issue you're targeting."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/auth.instructions.md"
toolset: "../toolsets/auth.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Auth DevCycle Prompt

You are starting the **Auth** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/auth.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/auth.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Review Authentication requirements and data dependencies.
- Plan middleware, helper utilities, and secrets updates.
- Confirm testing + documentation strategy for auth flows.

## Deliver back to the human reviewer
- Implementation plan for auth components.
- Clarifications about roles, onboarding, or compliance.
- List of validations/tests to run.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/code-review.prompt.md
```md
---
name: "CodeReviewDevCyclePrompt"
description: "Conduct asynchronous code review and quality audits."
argument-hint: "Summarize the code that needs review or feedback."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/code-review.instructions.md"
toolset: "../toolsets/code-review.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Code Review DevCycle Prompt

You are starting the **Code Review** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/code-review.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/code-review.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Load diff context, related DevCycles, and testing evidence.
- Plan review focus areas (security, accessibility, performance, etc.).
- Outline how findings will be categorized and reported.

## Deliver back to the human reviewer
- Review checklist + severity definitions.
- Questions for author/stakeholders.
- Timeline for delivering the review.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/debug.prompt.md
```md
---
name: "DebugDevCyclePrompt"
description: "Triage regressions and stabilize failing scenarios."
argument-hint: "Describe the bug, symptoms, or logs available."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/debug.instructions.md"
toolset: "../toolsets/debug.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Debug DevCycle Prompt

You are starting the **Debug** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/debug.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/debug.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Collect reproduction info, logs, and impacted areas.
- Plan diagnostic steps using toolset resources.
- Define validation steps to confirm fixes.

## Deliver back to the human reviewer
- Issue triage summary with hypotheses.
- Fix plan + test strategy.
- Questions for reporters or stakeholders.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/configuration.prompt.md
```md
---
name: "ConfigurationDevCyclePrompt"
description: "Align workspace configs, env templates, and lint/test settings."
argument-hint: "List the configuration surfaces or tools requiring updates."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/configuration.instructions.md"
toolset: "../toolsets/configuration.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Configuration DevCycle Prompt

You are starting the **Configuration** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/configuration.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/configuration.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Re-read Scaffolding outputs to understand file locations.
- Apply instructions from configuration.instructions.md and reference the toolset for allowed commands.
- Plan lint/type/test validation runs and .env template updates.

## Deliver back to the human reviewer
- Ordered task list for configuration work.
- Risks or decisions needing human approval.
- Mapping of config files to PRD/TechReq requirements.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/data.prompt.md
```md
---
name: "DataDevCyclePrompt"
description: "Design and evolve Prisma + Neon data models and migrations."
argument-hint: "Explain the schema or data operations to implement."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/data.instructions.md"
toolset: "../toolsets/data.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Data DevCycle Prompt

You are starting the **Data** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/data.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/data.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Review domain requirements plus existing schema/migrations.
- Identify safety checks (backups, rollbacks, seeding).
- Plan validation commands (pnpm prisma format/validate) and Neon considerations.

## Deliver back to the human reviewer
- Schema/migration task list.
- Risk map (breaking changes, downtime).
- Questions for human approval (e.g., destructive migrations).

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/security.prompt.md
```md
---
name: "SecurityDevCyclePrompt"
description: "Assess and harden security posture and compliance controls."
argument-hint: "Describe the threats or controls to focus on."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/security.instructions.md"
toolset: "../toolsets/security.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Security DevCycle Prompt

You are starting the **Security** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/security.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/security.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Review security requirements, previous findings, and dependencies.
- Plan scans, reviews, and code changes allowed by toolset.
- Outline reporting for risks + mitigations.

## Deliver back to the human reviewer
- Security audit checklist.
- Risk register updates with owners.
- Questions needing approval/clarification.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/deploy.prompt.md
```md
---
name: "DeployDevCyclePrompt"
description: "Plan and execute deployment steps for Vercel and services."
argument-hint: "Outline the release or environment change required."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/deploy.instructions.md"
toolset: "../toolsets/deploy.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Deploy DevCycle Prompt

You are starting the **Deploy** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/deploy.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/deploy.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Verify readiness gates and dependencies before deployment.
- Plan deployment steps, smoke tests, and monitoring windows.
- Outline rollback triggers and communication plan.

## Deliver back to the human reviewer
- Deployment runbook for this release.
- Questions about timing or approvals.
- List of validation/smoke checks.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/performance.prompt.md
```md
---
name: "PerformanceDevCyclePrompt"
description: "Profile and optimize performance hotspots."
argument-hint: "Share the metrics or user flows that need tuning."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/performance.instructions.md"
toolset: "../toolsets/performance.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Performance DevCycle Prompt

You are starting the **Performance** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/performance.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/performance.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Gather baseline metrics and tooling scripts.
- Plan optimizations (bundles, queries, caching).
- Coordinate with Observability for metrics capture.

## Deliver back to the human reviewer
- Benchmark/optimization plan.
- Potential trade-offs or risks.
- Questions about targets or constraints.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/testing.prompt.md
```md
---
name: "TestingDevCyclePrompt"
description: "Plan and run Vitest/Playwright suites with coverage goals."
argument-hint: "Describe the tests or coverage gaps to address."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/testing.instructions.md"
toolset: "../toolsets/testing.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Testing DevCycle Prompt

You are starting the **Testing** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/testing.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/testing.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Inventory existing tests and coverage gaps.
- Plan new tests or manual plans tied to PRD acceptance criteria.
- Decide how to seed data/auth for deterministic tests.

## Deliver back to the human reviewer
- Detailed testing TODOs with owners or phases.
- List of environments/commands for execution.
- Questions about acceptance criteria or blockers.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/features.prompt.md
```md
---
name: "FeaturesDevCyclePrompt"
description: "Deliver user-facing features mapped to PRD stories."
argument-hint: "Outline the feature slice or acceptance criteria."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/features.instructions.md"
toolset: "../toolsets/features.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Features DevCycle Prompt

You are starting the **Features** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/features.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/features.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Summarize feature scope + dependencies.
- Plan sequence of server/client components, data hooks, and tests.
- Identify review checkpoints and fallback options.

## Deliver back to the human reviewer
- Step-by-step implementation plan.
- Potential risks or open decisions.
- Task list for tests/docs to update.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/initialization.prompt.md
```md
---
name: "InitializationDevCyclePrompt"
description: "Audit workspace readiness before other DevCycles."
argument-hint: "Specify the readiness checks or blockers you need investigated."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/initialization.instructions.md"
toolset: "../toolsets/initialization.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Initialization DevCycle Prompt

You are starting the **Initialization** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/initialization.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/initialization.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Audit VS Code extensions, MCP servers, and tasks from the toolset.
- Validate PRD and Tech Requirements sections before proceeding.
- Capture git status and outstanding changes for downstream DevCycles.

## Deliver back to the human reviewer
- Environment readiness plan and checklist.
- Questions or blockers requiring human decisions.
- Tasks to capture remediation work.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/observability.prompt.md
```md
---
name: "ObservabilityDevCyclePrompt"
description: "Instrument logging, metrics, and tracing for the stack."
argument-hint: "Explain the telemetry gaps or signals to implement."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/observability.instructions.md"
toolset: "../toolsets/observability.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Observability DevCycle Prompt

You are starting the **Observability** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/observability.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/observability.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Review instrumentation requirements and existing gaps.
- Plan logging/tracing/metrics updates within toolset limits.
- Define validation steps for emitted telemetry.

## Deliver back to the human reviewer
- Instrumentation plan with components + owners.
- Alert/dashboard requirements.
- Questions about retention, privacy, or tooling.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/scaffolding.prompt.md
```md
---
name: "ScaffoldingDevCyclePrompt"
description: "Set up baseline folders, configs, and scripts for new work."
argument-hint: "Describe the scaffolding assets you need to create or adjust."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/scaffolding.instructions.md"
toolset: "../toolsets/scaffolding.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Scaffolding DevCycle Prompt

You are starting the **Scaffolding** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/scaffolding.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/scaffolding.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Review structure requirements from docs/PRD.md and docs/TECH_REQUIREMENTS.md.
- Load prior Initialization findings to ensure prerequisites exist.
- Prepare a project map describing directories, entrypoints, and placeholders.

## Deliver back to the human reviewer
- Implementation plan referencing key folders/files.
- Clarification questions for ambiguous modules.
- List of directories/files to create with rationale.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/template.prompt.md
```md
---
name: "TemplatePrompt"
description: "Template for creating DevCycle prompts. Each prompt triggers a specific DevCycle."
argument-hint: "Provide the context or parameters for this cycle."
agent: agent
tools:['edit', 'runNotebooks', 'search', 'new', 'runCommands', 'runTasks', 'usages', 'vscodeAPI', 'problems', 'changes', 'testFailure', 'openSimpleBrowser', 'fetch', 'githubRepo', 'extensions', 'todos', 'runSubagent', 'runTests']
---

# Prompt Template

This template can be copied and customized for each DevCycle. Replace the placeholders with the specific cycle name, instruction path, and toolset.

**Instructions**: Refer to `${instructionsFile}` for detailed guidance.

**Toolset**: Use `${toolsetName}` to determine which tools are available.

When this prompt is executed, the agent reads the corresponding instructions file, loads the toolset, and begins the tasks associated with the DevCycle.

```

## LoadedVibes/lv_artifacts/.github/prompts/updates.prompt.md
```md
---
name: "UpdatesDevCyclePrompt"
description: "Manage dependency, stack, and tooling updates."
argument-hint: "List the packages or tooling that need updates."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/updates.instructions.md"
toolset: "../toolsets/updates.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Updates DevCycle Prompt

You are starting the **Updates** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/updates.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/updates.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Review backlog + telemetry to prioritize updates.
- Plan DevCycle coverage for each work item.
- Define communication + documentation obligations.

## Deliver back to the human reviewer
- Prioritized update plan.
- Open questions for stakeholders.
- Task list/owner mapping for approved updates.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/documentation.prompt.md
```md
---
name: "DocumentationDevCyclePrompt"
description: "Produce or update docs, runbooks, and support guides."
argument-hint: "List the documents or sections needing updates."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/documentation.instructions.md"
toolset: "../toolsets/documentation.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Documentation DevCycle Prompt

You are starting the **Documentation** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/documentation.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/documentation.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Identify doc gaps vs PRD/TechReq + latest code.
- Plan updates across README, SUPPORT, SECURITY, templates.
- Set validation approach (lint/preview).

## Deliver back to the human reviewer
- Documentation task inventory.
- Questions about tone, structure, or approvals.
- Plan for validation + changelog updates.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/verification.prompt.md
```md
---
name: "VerificationDevCyclePrompt"
description: "Perform integration and UAT checks before release."
argument-hint: "Describe the end-to-end scenario that needs verification."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/verification.instructions.md"
toolset: "../toolsets/verification.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Verification DevCycle Prompt

You are starting the **Verification** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/verification.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/verification.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Load instructions/toolset and list commands you will run.
- Summarize expectations for pass/fail criteria.
- Plan how findings will be logged to todo/changelog.

## Deliver back to the human reviewer
- Execution plan for static checks.
- Questions about missing scripts or tooling gaps.
- Outline of reporting format for findings.

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/prompts/validation.prompt.md
```md
---
name: "ValidationDevCyclePrompt"
description: "Validate implementation against PRD and Tech Requirements."
argument-hint: "List the acceptance criteria or flows to validate."
agent: "LoadedVibesStackAgent"
instructions: "../instructions/validation.instructions.md"
toolset: "../toolsets/validation.toolset.jsonc"
tools:
  [
    "filesystem/*",
    "githubRepo",
    "memory/*",
    "sequentialthinking/*",
    "runTests",
    "runTasks",
    "todos",
    "runSubagent"
  ]
---

# Validation DevCycle Prompt

You are starting the **Validation** DevCycle.

Follow these rules:
- Load the instructions file at `../instructions/validation.instructions.md` and follow every directive.
- Load the toolset file at `../toolsets/validation.toolset.jsonc` and stay within its declared capabilities.
- Refresh context from `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` plus relevant DevCycle outputs.
- Keep the human reviewer in the loop for plans, risky actions, schema or deployment changes, and sign-off checkpoints.

## Focus for this run
- Align validation scope with PRD stories and human expectations.
- Plan walkthrough order, evidence capture, and sign-off criteria.
- Identify dependencies (test data, feature flags).

## Deliver back to the human reviewer
- Validation checklist referencing PRD IDs.
- Questions for stakeholders if requirements unclear.
- Plan for evidence artifacts (screenshots, logs).

Document assumptions, cite PRD/TechReq IDs, and stop for clarification whenever inputs are incomplete.


```

## LoadedVibes/lv_artifacts/.github/toolsets/ci-cd.toolset.jsonc
```jsonc
// Auto-generated toolset for ci-cd DevCycle
{
  "name": "ci-cd.toolset",
  "description": "Maintain automation pipelines",
  "contextFiles": [
    "../instructions/ci-cd.instructions.md",
    "../prompts/ci-cd.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "writeFiles",
    "runCLI",
    "callMCP",
    "updateRepo"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": true,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/auth.toolset.jsonc
```jsonc
// Auto-generated toolset for auth DevCycle
{
  "name": "auth.toolset",
  "description": "Implement Clerk authentication and authorization",
  "contextFiles": [
    "../instructions/auth.instructions.md",
    "../prompts/auth.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "writeFiles",
    "runCLI",
    "callMCP",
    "updateRepo"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": true,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/code-review.toolset.jsonc
```jsonc
// Auto-generated toolset for code-review DevCycle
{
  "name": "code-review.toolset",
  "description": "Perform structured code reviews",
  "contextFiles": [
    "../instructions/code-review.instructions.md",
    "../prompts/code-review.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "callMCP",
    "updateReports",
    "commentDiffs"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": false,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/configuration.toolset.jsonc
```jsonc
// Auto-generated toolset for configuration DevCycle
{
  "name": "configuration.toolset",
  "description": "Configure tooling, linting, typing, and env files",
  "contextFiles": [
    "../instructions/configuration.instructions.md",
    "../prompts/configuration.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "writeFiles",
    "runCLI",
    "callMCP",
    "updateRepo"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": true,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/data.toolset.jsonc
```jsonc
// Auto-generated toolset for data DevCycle
{
  "name": "data.toolset",
  "description": "Design Prisma schema and migrations",
  "contextFiles": [
    "../instructions/data.instructions.md",
    "../prompts/data.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "writeFiles",
    "runCLI",
    "callMCP",
    "updateRepo"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": true,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/debug.toolset.jsonc
```jsonc
// Auto-generated toolset for debug DevCycle
{
  "name": "debug.toolset",
  "description": "Diagnose and fix defects",
  "contextFiles": [
    "../instructions/debug.instructions.md",
    "../prompts/debug.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "writeFiles",
    "runCLI",
    "callMCP",
    "updateRepo"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": true,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/documentation.toolset.jsonc
```jsonc
// Auto-generated toolset for documentation DevCycle
{
  "name": "documentation.toolset",
  "description": "Update docs and templates",
  "contextFiles": [
    "../instructions/documentation.instructions.md",
    "../prompts/documentation.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "writeFiles",
    "runCLI",
    "updateRepo"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": true,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/deploy.toolset.jsonc
```jsonc
// Auto-generated toolset for deploy DevCycle
{
  "name": "deploy.toolset",
  "description": "Execute deployments and smoke tests",
  "contextFiles": [
    "../instructions/deploy.instructions.md",
    "../prompts/deploy.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "runCLI",
    "callMCP",
    "updateReports"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": false,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/features.toolset.jsonc
```jsonc
// Auto-generated toolset for features DevCycle
{
  "name": "features.toolset",
  "description": "Implement application features",
  "contextFiles": [
    "../instructions/features.instructions.md",
    "../prompts/features.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "writeFiles",
    "runCLI",
    "callMCP",
    "updateRepo"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": true,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/initialization.toolset.jsonc
```jsonc
// Auto-generated toolset for initialization DevCycle
{
  "name": "initialization.toolset",
  "description": "Audit workspace readiness before other DevCycles",
  "contextFiles": [
    "../instructions/initialization.instructions.md",
    "../prompts/initialization.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "runCLI",
    "callMCP",
    "updateReports"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": false,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/observability.toolset.jsonc
```jsonc
// Auto-generated toolset for observability DevCycle
{
  "name": "observability.toolset",
  "description": "Implement telemetry and alerting",
  "contextFiles": [
    "../instructions/observability.instructions.md",
    "../prompts/observability.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "writeFiles",
    "runCLI",
    "callMCP",
    "updateReports"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": true,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/scaffolding.toolset.jsonc
```jsonc
// Auto-generated toolset for scaffolding DevCycle
{
  "name": "scaffolding.toolset",
  "description": "Generate stack-aligned project structure",
  "contextFiles": [
    "../instructions/scaffolding.instructions.md",
    "../prompts/scaffolding.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "writeFiles",
    "runCLI",
    "callMCP",
    "updateReports"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": true,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/performance.toolset.jsonc
```jsonc
// Auto-generated toolset for performance DevCycle
{
  "name": "performance.toolset",
  "description": "Benchmark and optimize speed",
  "contextFiles": [
    "../instructions/performance.instructions.md",
    "../prompts/performance.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "writeFiles",
    "runCLI",
    "callMCP",
    "benchmark",
    "updateReports"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": true,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/security.toolset.jsonc
```jsonc
// Auto-generated toolset for security DevCycle
{
  "name": "security.toolset",
  "description": "Audit and harden security posture",
  "contextFiles": [
    "../instructions/security.instructions.md",
    "../prompts/security.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "writeFiles",
    "runCLI",
    "callMCP",
    "scanDependencies",
    "updateReports"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": true,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/template.toolset.jsonc
```jsonc
{
  // Template for a toolset definition. Copy this file and customize it per DevCycle.
  "tools": {
    "mcpServers": [
      "filesystem",
      "prisma-postgres",
      "neon",
      "clerk",
      "sequentialthinking",
      "memory",
      "github",
      "docs"
    ],
    "extensions": [
      "@types/node",
      "@tailwindcss/forms"
    ],
    "cli": [
      "node",
      "pnpm",
      "npx"
    ]
  },
  // Allowed operations specify which high‑level actions the agent may perform during this DevCycle
  "allowedOperations": [
    "readFiles",
    "writeFiles",
    "runCLI",
    "callMCP",
    "updateRepo",
    "updateIssues"
  ],
  // Denied operations restrict risky or out‑of‑scope actions
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ]
}
```

## LoadedVibes/lv_artifacts/.github/toolsets/testing.toolset.jsonc
```jsonc
// Auto-generated toolset for testing DevCycle
{
  "name": "testing.toolset",
  "description": "Author and run Vitest/Playwright suites",
  "contextFiles": [
    "../instructions/testing.instructions.md",
    "../prompts/testing.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "writeFiles",
    "runCLI",
    "callMCP",
    "runTests",
    "updateReports"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": true,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/updates.toolset.jsonc
```jsonc
// Auto-generated toolset for updates DevCycle
{
  "name": "updates.toolset",
  "description": "Coordinate post-launch updates",
  "contextFiles": [
    "../instructions/updates.instructions.md",
    "../prompts/updates.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "writeFiles",
    "callMCP",
    "planWork",
    "updateReports"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": true,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/validation.toolset.jsonc
```jsonc
// Auto-generated toolset for validation DevCycle
{
  "name": "validation.toolset",
  "description": "Confirm business logic and UX integrity",
  "contextFiles": [
    "../instructions/validation.instructions.md",
    "../prompts/validation.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "runCLI",
    "callMCP",
    "updateReports"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": false,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/toolsets/verification.toolset.jsonc
```jsonc
// Auto-generated toolset for verification DevCycle
{
  "name": "verification.toolset",
  "description": "Run static checks for lint/type/tailwind",
  "contextFiles": [
    "../instructions/verification.instructions.md",
    "../prompts/verification.prompt.md",
    "docs/PRD.md",
    "docs/TECH_REQUIREMENTS.md"
  ],
  "tools": {
    "mcpServers": [
      "filesystem",
      "git",
      "github",
      "postgres",
      "fetch",
      "memory",
      "sequentialthinking"
    ],
    "extensions": [
      "dbaeumer.vscode-eslint",
      "esbenp.prettier-vscode",
      "bradlc.vscode-tailwindcss",
      "github.copilot",
      "github.copilot-chat",
      "prisma.prisma",
      "ms-playwright.playwright",
      "vitest.explorer"
    ],
    "cli": [
      "pnpm",
      "npx",
      "node",
      "git",
      "powershell"
    ]
  },
  "allowedOperations": [
    "readFiles",
    "runCLI",
    "callMCP",
    "updateReports"
  ],
  "deniedOperations": [
    "deleteRepository",
    "exfiltrateSecrets"
  ],
  "security": {
    "allowFileWrite": false,
    "allowNetwork": true,
    "restrictedPaths": [
      "lv_artifacts/src",
      "node_modules",
      ".git"
    ]
  }
}


```

## LoadedVibes/lv_artifacts/.github/global.instructions.md
```md
---
name: "Global-Framework-Instructions"
description: "Universal, language‑agnostic guidelines governing the Loaded Vibes development framework. These instructions describe the high‑level structure of the system, list the development phases (DevCycles), identify the types of artifacts produced, and explain how they interact. No technology or language specifics are mentioned here; everything applies equally whether you are building with JavaScript, Python, Go, or any other stack."
applyTo: "**"
---

# Loaded Vibes Framework Overview

## Development Phases

The framework is organized into eighteen DevCycles. Each cycle encapsulates a distinct stage
of the development process. The names of these cycles are listed here for reference:

1. initialization
2. scaffolding
3. configuration
4. verification
5. data
6. auth
7. testing
8. validation
9. features
10. debug
11. security
12. performance
13. observability
14. code‑review
15. documentation
16. ci‑cd
17. deploy
18. updates

## Artifact Types

The framework produces and utilizes several types of artifacts. Each one plays a specific role in the
workflow:

- **GenAIScript Orchestrators** – Executable scripts (`.genai.js`) that drive each DevCycle.
  These replace static prompts as the primary entry point, allowing for dynamic context
  gathering, validation, and tool execution.
- **Prompts** – Markdown files used by the GenAIScripts to guide the LLM.
- **Instructions** – Markdown files containing detailed, domain‑agnostic guidelines for
  completing a DevCycle. Instructions reference an appropriate toolset and define
  responsibilities, inputs, outputs, and success metrics.
- **Toolsets** – JSONC files describing the tools and resources available during execution.
  Toolsets declare which extensions, Model Context Protocol (MCP) servers, and other
  capabilities are permitted.
- **Settings, MCP, and Extensions** – Configuration files that determine which tools and
  resources are installed or available.
- **Profile** – A grouping of settings, extensions, and MCP server definitions.
- **Custom Agent (Mode)** – A custom agent definition for a specific tech stack. The
  global layer is agnostic, but each project loads one agent according to its stack.
- **PRD and Tech Spec** – Product Requirements Document (PRD) and Technical
  Specification (Tech Spec). These documents are the source of truth.

## Workflow

The framework operates through a defined sequence, orchestrated by GenAIScript:

1. The **Orchestrator Script** (`orchestrator.genai.js`) is triggered (manually or via task).
2. It identifies the current **DevCycle** and loads the corresponding **Phase Script**.
3. The Phase Script gathers context (PRD, code, state), loads the **Instruction** file,
   and configures the **Toolset**.
4. The Agent (driven by the script) performs the tasks, utilizing MCP tools for
   filesystem access, git operations, and database management.
5. The script validates the output against the success metrics defined in the instructions.
6. **Human-in-the-loop**: The script pauses for critical reviews (e.g., plan approval,
   code review) before committing changes or moving to the next phase.
7. State is persisted to `memory.json` and `todo.md`.

This global instructions file does not specify any language, framework, or implementation
details. All technology‑specific patterns, coding standards, and architectural rules live
in the custom agent and lower layers of the framework.

```

## LoadedVibes/lv_artifacts/.vscode/extensions.json
```json
{
  "recommendations": [
    "dbaeumer.vscode-eslint",
    "esbenp.prettier-vscode",
    "bradlc.vscode-tailwindcss",
    "heybourn.headwind",
    "dsznajder.es7-react-js-snippets",
    "loczek.next-js-ts-snippets",
    "github.copilot",
    "github.copilot-chat",
    "openai.chatgpt",
    "prisma.prisma",
    "ms-playwright.playwright",
    "vitest.explorer",
    "mhutchie.git-graph",
    "pkief.material-icon-theme",
    "pkief.material-product-icons",
    "usernamehw.errorlens",
    "yoavbls.pretty-ts-errors",
    "rangav.vscode-thunder-client"
  ],

  "unwantedRecommendations": [
    "mgmcdermott.vscode-language-babel",
    "csstools.postcss",
    "cweijan.vscode-postgresql-client2",
    "ms-cst-e.vscode-devskim",
    "redhat.vscode-xml",
    "redhat.vscode-yaml",
    "chakrounanas.turbo-console-log",
    "vsls-contrib.gistfs",
    "dendron.dendron",
    "webplan-pro.dendron-keybindings"
  ]
}

```

## LoadedVibes/lv_artifacts/.vscode/mcp.json
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "."]
    },
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git", "."]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "<YOUR_TOKEN>"
      }
    },
    "postgres": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-postgres",
        "postgresql://user:password@localhost:5432/dbname"
      ]
    },
    "fetch": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-fetch"]
    },
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    },
    "sequentialthinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequentialthinking"]
    }
  }
}

```

## LoadedVibes/lv_artifacts/.vscode/settings.json
```json
{
  // -------------------------------
  // FORMATTING & LINTING (PROJECT)
  // -------------------------------
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.formatOnSave": true,
  "editor.tabSize": 2,
  "editor.insertSpaces": true,

  "eslint.enable": true,
  "eslint.useFlatConfig": true,
  "eslint.format.enable": true,
  "eslint.codeActionsOnSave.mode": "all",
  "eslint.problems.shortenToSingleLine": true,
  "eslint.ignoreUntitled": true,
  "eslint.quiet": true,

  // -------------------------------
  // TAILWIND (PROJECT)
  // -------------------------------
  "tailwindCSS.emmetCompletions": true,
  "tailwindCSS.includeLanguages": {
    "typescriptreact": "html",
    "javascriptreact": "html"
  },
  "tailwindCSS.experimental.classRegex": [
    ["clsx\\(([^)]*)\\)", "(?:'|\"|`)([^'\"`]*)(?:'|\"|`)"]
  ],

  // -------------------------------
  // TYPESCRIPT / NEXT.JS (PROJECT)
  // -------------------------------
  "typescript.tsdk": "node_modules/typescript/lib",
  "typescript.preferences.importModuleSpecifier": "shortest",
  "typescript.updateImportsOnFileMove.enabled": "always",
  "typescript.tsserver.experimental.enableProjectDiagnostics": true,

  // -------------------------------
  // FILE MANAGEMENT
  // -------------------------------
  "files.exclude": {
    "**/.next": true,
    "**/.vercel": true,
    "**/node_modules": true,
    "**/dist": true
  },

  // -------------------------------
  // GIT
  // -------------------------------
  "git.decorations.enabled": true,
  "git.enableSmartCommit": true,
  "git.confirmSync": false,

  // -------------------------------
  // PROJECT COPILOT INSTRUCTIONS (FRAMEWORK DEVELOPMENT)
  // -------------------------------
  // These instructions govern the development OF the Loaded Vibes framework.
  // Do NOT include the "shipped" instructions (templates/global.instructions.md) here.
  "chat.checkpoints.enabled": true,
  "chat.customAgentInSubagent.enabled": true,
  "chat.edits2.enabled": true,
  "chat.extensionTools.enabled": true,
  "chat.instructionsFilesLocations": {
    ".github/copilot-instructions.md": true
  },
  "chat.tools.todos.showWidget": true,
  "chat.useAgentsMdFile": true,
  "chat.useNestedAgentsMdFiles": true,
  "chat.useCloudButtonV2": true,

  // -------------------------------
  // MCP
  // -------------------------------

  "chat.mcp.autostart": "onlyNew",
  "chat.mcp.access": "all"
}

```

## LoadedVibes/lv_artifacts/.vscode/profile.jsonc
```jsonc
{
  // Template for a profile. Copy this file and customize it for the development environment.
  "settings": {
    "editor.tabSize": 2,
    "editor.formatOnSave": true,
    "typescript.tsdk": "node_modules/typescript/lib",
    "files.exclude": {
      "**/.next": true,
      "**/node_modules": true
    }
  },
  "extensions": [
    "dbaeumer.vscode-eslint",
    "esbenp.prettier-vscode",
    "Prisma.prisma",
    "tailwindcss.vscode-tailwindcss",
    "clerk.dev"
  ],
  "mcp": {
    "filesystem": {
      "root": "/workspace"
    },
    "prisma-postgres": {
      "database": "postgres://user:password@localhost:5432/db"
    },
    "neon": {
      "enabled": true
    },
    "clerk": {
      "frontendApi": "",
      "apiKey": ""
    },
    "sequentialthinking": {},
    "memory": {},
    "github": {},
    "docs": {}
  },
  "tasks": {
    // Example tasks: you can define scripts or terminal commands here
    "scaffold": "pnpm dlx create-next-app . --ts",
    "lint": "pnpm eslint .",
    "test": "pnpm vitest"
  }
}
```

## LoadedVibes/lv_artifacts/genaiscript/phases/.gitignore
```gitignore
genaiscript.d.ts
tsconfig.json
jsconfig.json
```

## LoadedVibes/lv_artifacts/genaiscript/phases/genaiscript.d.ts
```ts
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

/**
 * GenAIScript Ambient Type Definition File
 * @version 2.5.1
 */
 type OptionsOrString<TOptions extends string> = (string & {}) | TOptions;

 type ElementOrArray<T> = T | T[];

 interface PromptGenerationConsole {
  log(...data: any[]): void;
  warn(...data: any[]): void;
  debug(...data: any[]): void;
  error(...data: any[]): void;
}

 type DiagnosticSeverity = "error" | "warning" | "info";

 interface Diagnostic {
  filename: string;
  range: CharRange;
  severity: DiagnosticSeverity;
  message: string;
  /**
   * suggested fix
   */
  suggestion?: string;
  /**
   * error or warning code
   */
  code?: string;
}

 type Awaitable<T> = T | PromiseLike<T>;

 interface SerializedError {
  name?: string;
  message?: string;
  stack?: string;
  cause?: unknown;
  code?: string;
  line?: number;
  column?: number;
}

/**
 * A color and icon to associate with the script.
 * @see https://actions-cool.github.io/github-action-branding/
 */
 interface PromptBranding {
  /**
   * Marketplace and web site branding
   */
  branding?: {
    /**
     * The background color of the badge.
     */
    color?:
      | "white"
      | "black"
      | "yellow"
      | "blue"
      | "green"
      | "orange"
      | "red"
      | "purple"
      | "gray-dark";
    /**
     * Name of the Feather icon to use.
     * @see https://actions-cool.github.io/github-action-branding/
     */
    icon?: string;
  };
}

 interface PromptDefinition {
  /**
   * Based on file name.
   */
  id: string;

  /**
   * Something like "Summarize children", show in UI.
   */
  title?: string;

  /**
   * Longer description of the prompt. Shows in UI grayed-out.
   */
  description?: string;

  /**
   * Groups template in UI
   */
  group?: string;

  /**
   * List of tools defined in the script
   */
  defTools?: { id: string; description: string; kind: "tool" | "agent" }[];
}

 interface PromptLike extends PromptDefinition {
  /**
   * File where the prompt comes from (if any).
   */
  filename?: string;

  /**
   * The actual text of the prompt template.
   * Only used for system prompts.
   */
  text?: string;

  /**
   * The text of the prompt JS source code.
   */
  jsSource?: string;

  /**
   * Resolved system ids
   */
  resolvedSystem?: SystemPromptInstance[];

  /**
   * Inferred input schema for parameters
   */
  inputSchema?: JSONSchemaObject;
}

 type SystemPromptId = OptionsOrString<
    | "system"
    | "system.agent_data"
    | "system.agent_docs"
    | "system.agent_fs"
    | "system.agent_git"
    | "system.agent_github"
    | "system.agent_interpreter"
    | "system.agent_mcp"
    | "system.agent_planner"
    | "system.agent_user_input"
    | "system.agent_video"
    | "system.agent_web"
    | "system.agent_z3"
    | "system.annotations"
    | "system.assistant"
    | "system.chain_of_draft"
    | "system.changelog"
    | "system.cooperation"
    | "system.cpp"
    | "system.diagrams"
    | "system.diff"
    | "system.do_not_explain"
    | "system.english"
    | "system.explanations"
    | "system.fetch"
    | "system.files"
    | "system.files_schema"
    | "system.fs_ask_file"
    | "system.fs_data_query"
    | "system.fs_diff_files"
    | "system.fs_find_files"
    | "system.fs_read_file"
    | "system.fs_write_file"
    | "system.git"
    | "system.git_diff"
    | "system.git_info"
    | "system.github_actions"
    | "system.github_files"
    | "system.github_info"
    | "system.github_issues"
    | "system.github_pulls"
    | "system.go"
    | "system.java"
    | "system.math"
    | "system.mcp"
    | "system.md_find_files"
    | "system.md_frontmatter"
    | "system.meta_prompt"
    | "system.meta_schema"
    | "system.node_info"
    | "system.node_test"
    | "system.output_ini"
    | "system.output_json"
    | "system.output_markdown"
    | "system.output_plaintext"
    | "system.output_yaml"
    | "system.php"
    | "system.planner"
    | "system.python"
    | "system.python_code_interpreter"
    | "system.python_types"
    | "system.resources"
    | "system.retrieval_fuzz_search"
    | "system.retrieval_vector_search"
    | "system.retrieval_web_search"
    | "system.ruby"
    | "system.rust"
    | "system.safety_canary_word"
    | "system.safety_harmful_content"
    | "system.safety_jailbreak"
    | "system.safety_protected_material"
    | "system.safety_ungrounded_content_summarization"
    | "system.safety_validate_harmful_content"
    | "system.schema"
    | "system.tasks"
    | "system.technical"
    | "system.think"
    | "system.today"
    | "system.tool_calls"
    | "system.tools"
    | "system.transcribe"
    | "system.typescript"
    | "system.user_input"
    | "system.video"
    | "system.vision_ask_images"
    | "system.zero_shot_cot"
>;

 type SystemPromptInstance = {
  id: SystemPromptId;
  parameters?: Record<string, string | boolean | number | object | any>;
  vars?: Record<string, string | boolean | number | object | any>;
};

 type SystemToolId = OptionsOrString<
    | "agent_data"
    | "agent_docs"
    | "agent_fs"
    | "agent_git"
    | "agent_github"
    | "agent_interpreter"
    | "agent_planner"
    | "agent_user_input"
    | "agent_video"
    | "agent_web"
    | "agent_z3"
    | "fetch"
    | "fs_ask_file"
    | "fs_data_query"
    | "fs_diff_files"
    | "fs_find_files"
    | "fs_read_file"
    | "fs_write_file"
    | "git_branch_current"
    | "git_branch_default"
    | "git_branch_list"
    | "git_diff"
    | "git_last_tag"
    | "git_list_commits"
    | "git_status"
    | "github_actions_job_logs_diff"
    | "github_actions_job_logs_get"
    | "github_actions_jobs_list"
    | "github_actions_workflows_list"
    | "github_files_get"
    | "github_files_list"
    | "github_issues_comments_list"
    | "github_issues_get"
    | "github_issues_list"
    | "github_pulls_get"
    | "github_pulls_list"
    | "github_pulls_review_comments_list"
    | "math_eval"
    | "md_find_files"
    | "md_read_frontmatter"
    | "meta_prompt"
    | "meta_schema"
    | "node_test"
    | "python_code_interpreter_copy_files_to_container"
    | "python_code_interpreter_read_file"
    | "python_code_interpreter_run"
    | "resource_list"
    | "resource_read"
    | "retrieval_fuzz_search"
    | "retrieval_vector_search"
    | "retrieval_web_search"
    | "think"
    | "transcribe"
    | "user_input_confirm"
    | "user_input_select"
    | "user_input_text"
    | "video_extract_audio"
    | "video_extract_clip"
    | "video_extract_frames"
    | "video_probe"
    | "vision_ask_images"
>;

 type FileMergeHandler = (
  filename: string,
  label: string,
  before: string,
  generated: string,
) => Awaitable<string>;

 interface PromptOutputProcessorResult {
  /**
   * Updated text
   */
  text?: string;
  /**
   * Generated files from the output
   */
  files?: Record<string, string>;

  /**
   * User defined errors
   */
  annotations?: Diagnostic[];
}

 type PromptOutputProcessorHandler = (
  output: GenerationOutput,
) =>
  | PromptOutputProcessorResult
  | Promise<PromptOutputProcessorResult>
  | undefined
  | Promise<undefined>
  | void
  | Promise<void>;

 type PromptTemplateResponseType =
  | "text"
  | "json"
  | "yaml"
  | "markdown"
  | "json_object"
  | "json_schema"
  | undefined;

 type ModelType = OptionsOrString<
  | "large"
  | "small"
  | "tiny"
  | "long"
  | "vision"
  | "vision_small"
  | "reasoning"
  | "reasoning_small"
  | "openai:gpt-4.1"
  | "openai:gpt-4.1-mini"
  | "openai:gpt-4.1-nano"
  | "openai:gpt-4o"
  | "openai:gpt-4o-mini"
  | "openai:gpt-3.5-turbo"
  | "openai:o3-mini"
  | "openai:o3-mini:low"
  | "openai:o3-mini:medium"
  | "openai:o3-mini:high"
  | "openai:o1"
  | "openai:o1-mini"
  | "openai:o1-preview"
  | "github:openai/gpt-4.1"
  | "github:openai/gpt-4o"
  | "github:openai/gpt-4o-mini"
  | "github:openai/o1"
  | "github:openai/o1-mini"
  | "github:openai/o3-mini"
  | "github:openai/o3-mini:low"
  | "github:microsoft/mai-ds-r1"
  | "github:deepseek/deepseek-v3"
  | "github:deepseek/deepseek-r1"
  | "github:microsoft/phi-4"
  | "github_copilot_chat:current"
  | "github_copilot_chat:gpt-4.1"
  | "github_copilot_chat:o1"
  | "github_copilot_chat:o1:low"
  | "github_copilot_chat:o1:medium"
  | "github_copilot_chat:o1:high"
  | "github_copilot_chat:o3-mini"
  | "github_copilot_chat:o3-mini:low"
  | "github_copilot_chat:o3-mini:medium"
  | "github_copilot_chat:o3-mini:high"
  | "azure:gpt-4o"
  | "azure:gpt-4o-mini"
  | "azure:o1"
  | "azure:o1-mini"
  | "azure:o3-mini"
  | "azure:o3-mini:low"
  | "azure:o3-mini:medium"
  | "azure:o3-mini:high"
  | "azure_ai_inference:gpt-4.1"
  | "azure_ai_inference:gpt-4o"
  | "azure_ai_inference:gpt-4o-mini"
  | "azure_ai_inference:o1"
  | "azure_ai_inference:o1-mini"
  | "azure_ai_inference:o3-mini"
  | "azure_ai_inference:o3-mini:low"
  | "azure_ai_inference:o3-mini:medium"
  | "azure_ai_inference:o3-mini:high"
  | "azure_ai_inference:deepSeek-v3"
  | "azure_ai_inference:deepseek-r1"
  | "ollama:gemma3:4b"
  | "ollama:llama3.2"
  | "ollama:command-r7b:7b"
  | "ollama:gpt-oss:20b"
  | "anthropic:claude-opus-4-0"
  | "anthropic:claude-sonnet-4-0"
  | "anthropic:claude-sonnet-4-0:low"
  | "anthropic:claude-sonnet-4-0:medium"
  | "anthropic:claude-sonnet-4-0:high"
  | "anthropic:claude-3-7-sonnet-latest"
  | "anthropic:claude-3-7-sonnet-latest:low"
  | "anthropic:claude-3-7-sonnet-latest:medium"
  | "anthropic:claude-3-7-sonnet-latest:high"
  | "anthropic_bedrock:anthropic.claude-3-7-sonnet-20250219-v1:0"
  | "anthropic_bedrock:anthropic.claude-3-7-sonnet-20250219-v1:0:low"
  | "anthropic_bedrock:anthropic.claude-3-7-sonnet-20250219-v1:0:medium"
  | "anthropic_bedrock:anthropic.claude-3-7-sonnet-20250219-v1:0:high"
  | "huggingface:microsoft/Phi-3-mini-4k-instruct"
  | "jan:llama3.2-3b-instruct"
  | "google:gemini-2.0-flash-exp"
  | "llamafile"
  | "sglang"
  | "vllm"
  | "echo"
  | "none"
>;

 type EmbeddingsModelType = OptionsOrString<
  | "openai:text-embedding-3-small"
  | "openai:text-embedding-3-large"
  | "openai:text-embedding-ada-002"
  | "github:text-embedding-3-small"
  | "github:text-embedding-3-large"
  | "azure:text-embedding-3-small"
  | "azure:text-embedding-3-large"
  | "azure_ai_inference:text-embedding-3-small"
  | "azure_ai_inference:text-embedding-3-large"
  | "ollama:nomic-embed-text"
  | "google:text-embedding-004"
  | "huggingface:nomic-ai/nomic-embed-text-v1.5"
>;

 type ModelSmallType = OptionsOrString<
  | "openai:gpt-4o-mini"
  | "github:openai/gpt-4o-mini"
  | "azure:gpt-4o-mini"
  | "github:microsoft/phi-4"
>;

 type ModelVisionType = OptionsOrString<
  "openai:gpt-4o" | "github:openai/gpt-4o" | "azure:gpt-4o" | "azure:gpt-4o-mini"
>;

 type ModelImageGenerationType = OptionsOrString<
  "openai:gpt-image-1" | "openai:dall-e-2" | "openai:dall-e-3"
>;

 type ModelProviderType = OptionsOrString<
  | "openai"
  | "azure"
  | "azure_serverless"
  | "azure_serverless_models"
  | "anthropic"
  | "anthropic_bedrock"
  | "google"
  | "huggingface"
  | "mistral"
  | "alibaba"
  | "github"
  | "transformers"
  | "ollama"
  | "lmstudio"
  | "jan"
  | "sglang"
  | "vllm"
  | "llamafile"
  | "litellm"
  | "github_copilot_chat"
  | "deepseek"
  | "whisperasr"
  | "echo"
>;

 interface ModelConnectionOptions {
  /**
   * Which LLM model by default or for the `large` alias.
   */
  model?: ModelType;
}

 interface ModelAliasesOptions extends ModelConnectionOptions {
  /**
   * Configure the `small` model alias.
   */
  smallModel?: ModelSmallType;

  /**
   * Configure the `vision` model alias.
   */
  visionModel?: ModelVisionType;

  /**
   * A list of model aliases to use.
   */
  modelAliases?: Record<string, string>;
}

 type ReasoningEffortType = "high" | "medium" | "low";

 type ChatToolChoice =
  | "none"
  | "auto"
  | "required"
  | {
      /**
       * The name of the function to call.
       */
      name: string;
    };

 interface ModelOptions
  extends ModelConnectionOptions,
    ModelTemplateOptions,
    CacheOptions,
    RetryOptions {
  /**
   * Temperature to use. Higher temperature means more hallucination/creativity.
   * Range 0.0-2.0.
   *
   * @default 0.2
   */
  temperature?: number;

  /**
   * Enables fallback tools mode
   */
  fallbackTools?: boolean;

  /**
   * OpenAI o* reasoning models support a reasoning effort parameter.
   * For Clause, these are mapped to thinking budget tokens
   */
  reasoningEffort?: ReasoningEffortType;

  /**
   * A list of keywords that should be found in the output.
   */
  choices?: ElementOrArray<string | { token: string | number; weight?: number }>;

  /**
   * Returns the log probabilities of the each tokens. Not supported in all models.
   */
  logprobs?: boolean;

  /**
   * Number of alternate token logprobs to generate, up to 5. Enables logprobs.
   */
  topLogprobs?: number;

  /**
   * Specifies the type of output. Default is plain text.
   * - `text` enables plain text mode (through system prompts)
   * - `json` enables JSON mode (through system prompts)
   * - `yaml` enables YAML mode (through system prompts)
   * - `json_object` enables JSON mode (native)
   * - `json_schema` enables structured outputs (native)
   * Use `responseSchema` to specify an output schema.
   */
  responseType?: PromptTemplateResponseType;

  /**
   * JSON object schema for the output. Enables the `json_object` output mode by default.
   */
  responseSchema?: PromptParametersSchema | JSONSchema;

  /**
   * “Top_p” or nucleus sampling is a setting that decides how many possible words to consider.
   * A high “top_p” value means the model looks at more possible words, even the less likely ones,
   * which makes the generated text more diverse.
   */
  topP?: number;

  /**
   * Maximum number of completion tokens
   *
   */
  maxTokens?: number;

  /**
   * Tool selection strategy. Default is 'auto'.
   */
  toolChoice?: ChatToolChoice;

  /**
   * Maximum number of tool calls to make.
   */
  maxToolCalls?: number;

  /**
   * Maximum number of data repairs to attempt.
   */
  maxDataRepairs?: number;

  /**
   * A deterministic integer seed to use for the model.
   */
  seed?: number;

  /**
   * A list of model ids and their maximum number of concurrent requests.
   */
  modelConcurrency?: Record<string, number>;
}

 interface EmbeddingsModelOptions {
  /**
   * LLM model to use for embeddings.
   */
  embeddingsModel?: EmbeddingsModelType;
}

 interface PromptSystemOptions extends PromptSystemSafetyOptions {
  /**
   * List of system script ids used by the prompt.
   */
  system?: ElementOrArray<SystemPromptId | SystemPromptInstance>;

  /**
   * List of tools used by the prompt.
   */
  tools?: ElementOrArray<SystemToolId>;

  /**
   * List of system to exclude from the prompt.
   */
  excludedSystem?: ElementOrArray<SystemPromptId>;

  /**
   * Keywords that will 'activate' the system script. When these keywords are found in the prompt source,
   * the system script will be automatically imported.
   */
  activation?: ElementOrArray<string>;

  /**
   * MCP server configuration. The tools will be injected into the prompt.
   */
  mcpServers?: McpServersConfig;

  /**
   * MCP agent configuration. Each mcp server will be wrapped with an agent.
   */
  mcpAgentServers?: McpAgentServersConfig;
}

 interface ScriptRuntimeOptions extends LineNumberingOptions {
  /**
   * Secrets required by the prompt
   */
  secrets?: string[];
}

 type PromptJSONParameterType<T> = T & { required?: boolean };

 type PromptParameterType =
  | string
  | number
  | boolean
  | object
  | PromptJSONParameterType<JSONSchemaNumber>
  | PromptJSONParameterType<JSONSchemaString>
  | PromptJSONParameterType<JSONSchemaBoolean>;
 type PromptParametersSchema = Record<string, PromptParameterType | [PromptParameterType]>;
 type PromptParameters = Record<string, string | number | boolean | object>;

 type PromptAssertion = {
  // How heavily to weigh the assertion. Defaults to 1.0
  weight?: number;
  /**
   * The transformation to apply to the output before checking the assertion.
   */
  transform?: string;
} & (
  | {
      // type of assertion
      type:
        | "icontains"
        | "not-icontains"
        | "equals"
        | "not-equals"
        | "starts-with"
        | "not-starts-with";
      // The expected value
      value: string;
    }
  | {
      // type of assertion
      type:
        | "contains-all"
        | "not-contains-all"
        | "contains-any"
        | "not-contains-any"
        | "icontains-all"
        | "not-icontains-all";
      // The expected values
      value: string[];
    }
  | {
      // type of assertion
      type: "levenshtein" | "not-levenshtein";
      // The expected value
      value: string;
      // The threshold value
      threshold?: number;
    }
);

 interface PromptTest {
  /**
   * Short name of the test
   */
  name?: string;
  /**
   * Description of the test.
   */
  description?: string;
  /**
   * List of files to apply the test to.
   */
  files?: ElementOrArray<string>;
  /**
   * List of in-memory files to apply the test to.
   */
  workspaceFiles?: ElementOrArray<WorkspaceFile>;
  /**
   * Extra set of variables for this scenario
   */
  vars?: Record<string, string | boolean | number>;
  /**
   * LLM output matches a given rubric, using a Language Model to grade output.
   */
  rubrics?: ElementOrArray<string>;
  /**
   * LLM output adheres to the given facts, using Factuality method from OpenAI evaluation.
   */
  facts?: ElementOrArray<string>;
  /**
   * List of keywords that should be contained in the LLM output.
   */
  keywords?: ElementOrArray<string>;
  /**
   * List of keywords that should not be contained in the LLM output.
   */
  forbidden?: ElementOrArray<string>;
  /**
   * Additional deterministic assertions.
   */
  asserts?: ElementOrArray<PromptAssertion>;

  /**
   * Determines what kind of output is sent back to the test engine. Default is "text".
   */
  format?: "text" | "json";
}

/**
 * Configure promptfoo redteam plugins
 */
 interface PromptRedteam {
  /**
   * The `purpose` property is used to guide the attack generation process. It should be as clear and specific as possible.
   * Include the following information:
   * - Who the user is and their relationship to the company
   * - What data the user has access to
   * - What data the user does not have access to
   * - What actions the user can perform
   * - What actions the user cannot perform
   * - What systems the agent has access to
   * @link https://www.promptfoo.dev/docs/red-team/troubleshooting/attack-generation/
   */
  purpose: string;

  /**
   * Redteam identifier used for reporting purposes
   */
  label?: string;

  /**
   * Default number of inputs to generate for each plugin.
   * The total number of tests will be `(numTests * plugins.length * (1 + strategies.length) * languages.length)`
   * Languages.length is 1 by default, but is added when the multilingual strategy is used.
   */
  numTests?: number;

  /**
   * List of languages to target. Default is English.
   */
  language?: string;

  /**
   * Red team plugin list
   * @link https://www.promptfoo.dev/docs/red-team/owasp-llm-top-10/
   */
  plugins?: ElementOrArray<string>;

  /**
   * Adversary prompt generation strategies
   */
  strategies?: ElementOrArray<string>;
}

/**
 * Different ways to render a fence block.
 */
 type FenceFormat = "markdown" | "xml" | "none";

 interface FenceFormatOptions {
  /**
   * Formatting of code sections
   */
  fenceFormat?: FenceFormat;
}

 interface ModelTemplateOptions extends FenceFormatOptions {
  /**
   * Budget of tokens to apply the prompt flex renderer.
   */
  flexTokens?: number;
}

 interface McpToolAnnotations {
  /**
   * Annotations for MCP tools
   * @link https://modelcontextprotocol.io/docs/concepts/tools#available-tool-annotations
   */
  annotations?: {
    /**
     * If true, indicates the tool does not modify its environment
     */
    readOnlyHint?: boolean;
    /**
     * If true, the tool may perform destructive updates (only meaningful when readOnlyHint is false)
     */
    destructiveHint?: boolean;
    /**
     * If true, calling the tool repeatedly with the same arguments has no additional effect (only meaningful when readOnlyHint is false)
     */
    idempotentHint?: boolean;
    /**
     * If true, the tool may interact with an “open world” of external entities
     */
    openWorldHint?: boolean;
  };
}

 interface MetadataOptions {
  /**
   * Set of 16 key-value pairs that can be attached to an object.
   * This can be useful for storing additional information about the object in a structured format, and querying for objects via API or the dashboard.
   * Keys are strings with a maximum length of 64 characters. Values are strings with a maximum length of 512 characters.
   */
  metadata?: Record<string, string>;
}

 interface TerminalOptions {
  /**
   * Disable generation of run trace.
   */
  disableTrace?: boolean;

  /**
   * Disables rendering a preview of the chat messages
   */
  disableChatPreview?: boolean;
}

 interface PromptScript
  extends PromptLike,
    PromptBranding,
    ModelOptions,
    ModelAliasesOptions,
    PromptSystemOptions,
    EmbeddingsModelOptions,
    ContentSafetyOptions,
    SecretDetectionOptions,
    GitIgnoreFilterOptions,
    ScriptRuntimeOptions,
    McpToolAnnotations,
    MetadataOptions,
    TerminalOptions {
  /**
   * Which provider to prefer when picking a model.
   */
  provider?: ModelProviderType;

  /**
   * Additional template parameters that will populate `env.vars`
   */
  parameters?: PromptParametersSchema;

  /**
   * A file path or list of file paths or globs.
   * The content of these files will be by the files selected in the UI by the user or the cli arguments.
   */
  files?: ElementOrArray<string>;

  /**
   * A comma separated list of file extensions to accept.
   */
  accept?: OptionsOrString<".md,.mdx" | "none">;

  /**
   * Extra variable values that can be used to configure system prompts.
   */
  vars?: Record<string, string>;

  /**
   * Tests to validate this script.
   */
  tests?: ElementOrArray<string | PromptTest>;

  /**
   * Models to use with tests
   */
  testModels?: ElementOrArray<ModelType | ModelAliasesOptions>;

  /**
   * LLM vulnerability checks
   */
  redteam?: PromptRedteam;

  /**
   * Don't show it to the user in lists. Template `system.*` are automatically unlisted.
   */
  unlisted?: boolean;

  /**
   * Set if this is a system prompt.
   */
  isSystem?: boolean;

  /**
   * List of allowed domains (with wildcard support) for HTTPS resource resolution and fetchText.
   * If specified, overrides the global allowedDomains configuration for this script.
   * Supports glob patterns like "*.github.com".
   */
  allowedDomains?: ElementOrArray<string>;
}
/**
 * Represent a workspace file and optional content.
 */
 interface WorkspaceFile {
  /**
   * Name of the file, relative to project root.
   */
  filename: string;

  /**
   * Content mime-type if known
   */
  type?: string;

  /**
   * Encoding of the content
   */
  encoding?: "base64";

  /**
   * Content of the file.
   */
  content?: string;

  /**
   * Size in bytes if known
   */
  size?: number;
}

 interface WorkspaceFileWithScore extends WorkspaceFile {
  /**
   * Score allocated by search algorithm
   */
  score?: number;
}

 interface ToolDefinition {
  /**
   * The name of the function to be called. Must be a-z, A-Z, 0-9, or contain
   * underscores and dashes, with a maximum length of 64.
   */
  name: string;

  /**
   * A description of what the function does, used by the model to choose when and
   * how to call the function.
   */
  description?: string;

  /**
   * The parameters the functions accepts, described as a JSON Schema object. See the
   * [guide](https://platform.openai.com/docs/guides/text-generation/function-calling)
   * for examples, and the
   * [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for
   * documentation about the format.
   *
   * Omitting `parameters` defines a function with an empty parameter list.
   */
  parameters?: JSONSchema;
}

/**
 * Interface representing an output trace with various logging and tracing methods.
 * Extends the `ToolCallTrace` interface.
 */
 interface OutputTrace extends ToolCallTrace {
  /**
   * Logs a heading message at the specified level.
   * @param level - The level of the heading.
   * @param message - The heading message.
   */
  heading(level: number, message: string): void;

  /**
   * Logs an image with an optional caption.
   * @param url - The URL of the image.
   * @param caption - The optional caption for the image.
   */
  image(url: BufferLike, caption?: string): Promise<void>;

  /**
   * Logs a markdown table
   * @param rows
   */
  table(rows: object[]): void;

  /**
   * Computes and renders diff between two files.
   */
  diff(
    left: string | WorkspaceFile,
    right: string | WorkspaceFile,
    options?: { context?: number },
  ): void;

  /**
   * Logs a result item with a boolean value and a message.
   * @param value - The boolean value of the result item.
   * @param message - The message for the result item.
   */
  resultItem(value: boolean, message: string): void;

  /**
   * Starts a trace with details in markdown format.
   * @param title - The title of the trace.
   * @param options - Optional settings for the trace.
   * @returns A `MarkdownTrace` instance.
   */
  startTraceDetails(title: string, options?: { expanded?: boolean }): OutputTrace;

  /**
   * Appends content to the trace.
   * @param value - The content to append.
   */
  appendContent(value: string): void;

  /**
   * Starts a details section in the trace.
   * @param title - The title of the details section.
   * @param options - Optional settings for the details section.
   */
  startDetails(title: string, options?: { success?: boolean; expanded?: boolean }): void;

  /**
   * Ends the current details section in the trace.
   */
  endDetails(): void;

  /**
   * Logs a video with a name, file path, and optional alt text.
   * @param name - The name of the video.
   * @param filepath - The file path of the video.
   * @param alt - The optional alt text for the video.
   */
  video(name: string, filepath: string, alt?: string): void;

  /**
   * Logs an audio file
   * @param name
   * @param filepath
   * @param alt
   */
  audio(name: string, filepath: string, alt?: string): void;

  /**
   * Logs a details section with a title and body.
   * @param title - The title of the details section.
   * @param body - The body content of the details section, can be a string or an object.
   * @param options - Optional settings for the details section.
   */
  details(
    title: string,
    body: string | object,
    options?: { success?: boolean; expanded?: boolean },
  ): void;

  /**
   * Logs a fenced details section with a title, body, and optional content type.
   * @param title - The title of the details section.
   * @param body - The body content of the details section, can be a string or an object.
   * @param contentType - The optional content type of the body.
   * @param options - Optional settings for the details section.
   */
  detailsFenced(
    title: string,
    body: string | object,
    contentType?: string,
    options?: { expanded?: boolean },
  ): void;

  /**
   * Logs an item with a name, value, and optional unit.
   * @param name - The name of the item.
   * @param value - The value of the item.
   * @param unit - The optional unit of the value.
   */
  itemValue(name: string, value: any, unit?: string): void;

  /**
   * Adds a url link item
   * @param name name url
   * @param url url. If missing, name is treated as the url.
   */
  itemLink(name: string, url?: string | URL, title?: string): void;

  /**
   * Writes a paragraph of text with empty lines before and after.
   * @param text paragraph to write
   */
  p(text: string): void;

  /**
   * Logs a warning message.
   * @param msg - The warning message to log.
   */
  warn(msg: string): void;

  /**
   * Logs a caution message.
   * @param msg - The caution message to log.
   */
  caution(msg: string): void;

  /**
   * Logs a note message.
   * @param msg - The note message to log.
   */
  note(msg: string): void;

  /**
   * Logs an error object
   * @param err
   */
  error(message: string, error?: unknown): void;
}

/**
 * Interface representing a tool call trace for logging various types of messages.
 */
 interface ToolCallTrace {
  /**
   * Logs a general message.
   * @param message - The message to log.
   */
  log(message: string): void;

  /**
   * Logs an item message.
   * @param message - The item message to log.
   */
  item(message: string): void;

  /**
   * Logs a tip message.
   * @param message - The tip message to log.
   */
  tip(message: string): void;

  /**
   * Logs a fenced message, optionally specifying the content type.
   * @param message - The fenced message to log.
   * @param contentType - The optional content type of the message.
   */
  fence(message: string | unknown, contentType?: string): void;
}

/**
 * Position (line, character) in a file. Both are 0-based.
 */
 type CharPosition = [number, number];

/**
 * Describes a run of text.
 */
 type CharRange = [CharPosition, CharPosition];

/**
 * 0-based line numbers.
 */
 type LineRange = [number, number];

 interface FileEdit {
  type: string;
  filename: string;
  label?: string;
  validated?: boolean;
}

 interface ReplaceEdit extends FileEdit {
  type: "replace";
  range: CharRange | LineRange;
  text: string;
}

 interface InsertEdit extends FileEdit {
  type: "insert";
  pos: CharPosition | number;
  text: string;
}

 interface DeleteEdit extends FileEdit {
  type: "delete";
  range: CharRange | LineRange;
}

 interface CreateFileEdit extends FileEdit {
  type: "createfile";
  overwrite?: boolean;
  ignoreIfExists?: boolean;
  text: string;
}

 type Edits = InsertEdit | ReplaceEdit | DeleteEdit | CreateFileEdit;

 interface ToolCallContent {
  type?: "content";
  content: string;
  edits?: Edits[];
}

 type ToolCallOutput =
  | string
  | number
  | boolean
  | ToolCallContent
  | ShellOutput
  | WorkspaceFile
  | RunPromptResult
  | SerializedError
  | undefined;

 interface WorkspaceFileCache<K, V> {
  /**
   * Name of the cache
   */
  name: string;
  /**
   * Gets the value associated with the key, or undefined if there is none.
   * @param key
   */
  get(key: K): Promise<V | undefined>;
  /**
   * Sets the value associated with the key.
   * @param key
   * @param value
   */
  set(key: K, value: V): Promise<void>;

  /**
   * List the values in the cache.
   */
  values(): Promise<V[]>;

  /**
   * Gets the sha of the key
   * @param key
   */
  getSha(key: K): Promise<string>;

  /**
   * Gets an existing value or updates it with the updater function.
   */
  getOrUpdate(
    key: K,
    updater: () => Promise<V>,
    validator?: (val: V) => boolean,
  ): Promise<{ key: string; value: V; cached?: boolean }>;
}

 interface WorkspaceGrepOptions extends FilterGitFilesOptions {
  /**
   * List of paths to
   */
  path?: ElementOrArray<string>;
  /**
   * list of filename globs to search. !-prefixed globs are excluded. ** are not supported.
   */
  glob?: ElementOrArray<string>;
  /**
   * Read file content. default is true.
   */
  readText?: boolean;

  /**
   * Enable grep logging to discover what files are searched.
   */
  debug?: boolean;
}

 interface WorkspaceGrepResult {
  files: WorkspaceFile[];
  matches: WorkspaceFile[];
}

 interface INIParseOptions extends JSONSchemaValidationOptions {
  defaultValue?: any;
}

 interface FilterGitFilesOptions {
  /**
   * Ignore workspace .gitignore instructions
   */
  applyGitIgnore?: false | undefined;
}

 interface FindFilesOptions extends FilterGitFilesOptions {
  /** Glob patterns to ignore */
  ignore?: ElementOrArray<string>;

  /**
   * Set to false to skip read text content. True by default
   */
  readText?: boolean;
}

 interface FileStats {
  /**
   * Size of the file in bytes
   */
  size: number;
  mode: number;
}

 interface JSONSchemaValidationOptions {
  schema?: JSONSchema;
  throwOnValidationError?: boolean;
}

 interface WorkspaceFileSystem {
  /**
   * The root folder path of the workspace.
   */
  root(): string;

  /**
   * Searches for files using the glob pattern and returns a list of files.
   * Ignore `.env` files and apply `.gitignore` if present.
   * @param glob
   */
  findFiles(glob: ElementOrArray<string>, options?: FindFilesOptions): Promise<WorkspaceFile[]>;

  /**
   * Performs a grep search over the files in the workspace using ripgrep.
   * @param pattern A string to match or a regex pattern.
   * @param options Options for the grep search.
   */
  grep(pattern: string | RegExp, options?: WorkspaceGrepOptions): Promise<WorkspaceGrepResult>;
  grep(
    pattern: string | RegExp,
    glob: string,
    options?: Omit<WorkspaceGrepOptions, "path" | "glob">,
  ): Promise<WorkspaceGrepResult>;

  /**
   * Reads metadata information about the file. Returns undefined if the file does not exist.
   * @param filename
   */
  stat(filename: string): Promise<FileStats>;

  /**
   * Reads the content of a file as text
   * @param path
   */
  readText(path: string | Awaitable<WorkspaceFile>): Promise<WorkspaceFile>;

  /**
   * Reads the content of a file and parses to JSON, using the JSON5 parser.
   * @param path
   */
  readJSON(
    path: string | Awaitable<WorkspaceFile>,
    options?: JSONSchemaValidationOptions,
  ): Promise<any>;

  /**
   * Reads the content of a file and parses to YAML.
   * @param path
   */
  readYAML(
    path: string | Awaitable<WorkspaceFile>,
    options?: JSONSchemaValidationOptions,
  ): Promise<any>;

  /**
   * Reads the content of a file and parses to XML, using the XML parser.
   */
  readXML(path: string | Awaitable<WorkspaceFile>, options?: XMLParseOptions): Promise<any>;

  /**
   * Reads the content of a CSV file.
   * @param path
   */
  readCSV<T extends object>(
    path: string | Awaitable<WorkspaceFile>,
    options?: CSVParseOptions,
  ): Promise<T[]>;

  /**
   * Reads the content of a file and parses to INI
   */
  readINI(path: string | Awaitable<WorkspaceFile>, options?: INIParseOptions): Promise<any>;

  /**
   * Reads the content of a file and attempts to parse it as data.
   * @param path
   * @param options
   */
  readData(
    path: string | Awaitable<WorkspaceFile>,
    options?: CSVParseOptions & INIParseOptions & XMLParseOptions & JSONSchemaValidationOptions,
  ): Promise<any>;

  /**
   * Appends text to a file as text to the file system. Creates the file if needed.
   * @param path
   * @param content
   */
  appendText(path: string, content: string): Promise<void>;

  /**
   * Writes a file as text to the file system
   * @param path
   * @param content
   */
  writeText(path: string, content: string): Promise<void>;

  /**
   * Caches a buffer to file and returns the unique file name
   * @param bytes
   */
  writeCached(
    bytes: BufferLike,
    options?: {
      scope?: "workspace" | "run";
      /**
       * Filename extension
       */
      ext?: string;
    },
  ): Promise<string>;

  /**
   * Writes one or more files to the workspace
   * @param file a in-memory file or list of files
   */
  writeFiles(file: ElementOrArray<WorkspaceFile>): Promise<void>;

  /**
   * Copies a file between two paths
   * @param source
   * @param destination
   */
  copyFile(source: string, destination: string): Promise<void>;

  /**
   * Opens a file-backed key-value cache for the given cache name.
   * The cache is persisted across runs of the script. Entries are dropped when the cache grows too large.
   * @param cacheName
   */
  cache<K = any, V = any>(cacheName: string): Promise<WorkspaceFileCache<K, V>>;
}

 interface ToolCallContext {
  log(message: string): void;
  debug(message: string): void;
  trace: ToolCallTrace;
}

 interface ToolCallback {
  spec: ToolDefinition;
  options?: DefToolOptions;
  generator?: ChatGenerationContext;
  impl: (args: { context: ToolCallContext } & Record<string, any>) => Awaitable<ToolCallOutput>;
}

 interface ChatContentPartText {
  /**
   * The text content.
   */
  text: string;

  /**
   * The type of the content part.
   */
  type: "text";
}

 interface ChatContentPartImage {
  image_url: {
    /**
     * Either a URL of the image or the base64 encoded image data.
     */
    url: string;

    /**
     * Specifies the detail level of the image. Learn more in the
     * [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
     */
    detail?: "auto" | "low" | "high";
  };

  /**
   * The type of the content part.
   */
  type: "image_url";
}

 interface ChatContentPartInputAudio {
  input_audio: {
    /**
     * Base64 encoded audio data.
     */
    data: string;

    /**
     * The format of the encoded audio data. Currently supports "wav" and "mp3".
     */
    format: "wav" | "mp3";
  };

  /**
   * The type of the content part. Always `input_audio`.
   */
  type: "input_audio";
}

 interface ChatContentPartFile {
  file: {
    /**
     * The base64 encoded file data, used when passing the file to the model as a
     * string.
     */
    file_data?: string;

    /**
     * The ID of an uploaded file to use as input.
     */
    file_id?: string;

    /**
     * The name of the file, used when passing the file to the model as a string.
     */
    filename?: string;
  };

  /**
   * The type of the content part. Always `file`.
   */
  type: "file";
}

 interface ChatContentPartRefusal {
  /**
   * The refusal message generated by the model.
   */
  refusal: string;

  /**
   * The type of the content part.
   */
  type: "refusal";
}

 interface ChatSystemMessage {
  /**
   * The contents of the system message.
   */
  content: string | ChatContentPartText[];

  /**
   * The role of the messages author, in this case `system`.
   */
  role: "system";

  /**
   * An optional name for the participant. Provides the model information to
   * differentiate between participants of the same role.
   */
  name?: string;
}

/**
 * @deprecated
 */
 interface ChatFunctionMessage {
  content: string;
  name: string;
  role: "function";
}

 interface ChatToolMessage {
  /**
   * The contents of the tool message.
   */
  content: string | ChatContentPartText[];

  /**
   * The role of the messages author, in this case `tool`.
   */
  role: "tool";

  /**
   * Tool call that this message is responding to.
   */
  tool_call_id: string;
}

 interface ChatMessageToolCall {
  /**
   * The ID of the tool call.
   */
  id: string;

  /**
   * The function that the model called.
   */
  function: {
    /**
     * The arguments to call the function with, as generated by the model in JSON
     * format. Note that the model does not always generate valid JSON, and may
     * hallucinate parameters not defined by your function schema. Validate the
     * arguments in your code before calling your function.
     */
    arguments: string;

    /**
     * The name of the function to call.
     */
    name: string;
  };

  /**
   * The type of the tool. Currently, only `function` is supported.
   */
  type: "function";
}

 interface ChatAssistantMessage {
  /**
   * The role of the messages author, in this case `assistant`.
   */
  role: "assistant";

  /**
   * The contents of the assistant message. Required unless `tool_calls` or
   * `function_call` is specified.
   */
  content?: string | (ChatContentPartText | ChatContentPartRefusal)[];

  /**
   * An optional name for the participant. Provides the model information to
   * differentiate between participants of the same role.
   */
  name?: string;

  /**
   * The refusal message by the assistant.
   */
  refusal?: string | null;

  /**
   * The tool calls generated by the model, such as function calls.
   */
  tool_calls?: ChatMessageToolCall[];

  /**
   * The reasoning of the model
   */
  reasoning?: string;
}

 type ChatContentPart =
  | ChatContentPartText
  | ChatContentPartImage
  | ChatContentPartInputAudio
  | ChatContentPartFile;

 interface ChatUserMessage {
  /**
   * The contents of the user message.
   */
  content: string | ChatContentPart[];

  /**
   * The role of the messages author, in this case `user`.
   */
  role: "user";

  /**
   * An optional name for the participant. Provides the model information to
   * differentiate between participants of the same role.
   */
  name?: string;
}

 type ChatMessage =
  | ChatSystemMessage
  | ChatUserMessage
  | ChatAssistantMessage
  | ChatToolMessage
  | ChatFunctionMessage;

 type ChatParticipantHandler = (
  /**
   * Prompt generation context to create a new message in the conversation
   */
  context: ChatTurnGenerationContext,
  /**
   * Chat conversation messages
   */
  messages: ChatMessage[],
  /**
   * The last assistant text, without
   * reasoning sections.
   */
  assistantText: string,
) => Awaitable<{ messages?: ChatMessage[] } | undefined | void>;

 interface ChatParticipantOptions {
  label?: string;
}

 interface ChatParticipant {
  generator: ChatParticipantHandler;
  options: ChatParticipantOptions;
}

/**
 * A set of text extracted from the context of the prompt execution
 */
 interface ExpansionVariables
  extends Required<Pick<ChatGenerationContextOptions, "generator">> {
  /**
   * Directory where the prompt is executed
   */
  dir: string;

  /**
   * Directory where output files (trace, output) are created
   */
  runDir: string;

  /**
   * Unique identifier for the run
   */
  runId: string;

  /**
   * List of linked files parsed in context
   */
  files: WorkspaceFile[];

  /**
   * User defined variables
   */
  vars: Record<string, string | boolean | number | object | any> & {
    /**
     * When running in GitHub Copilot Chat, the current user prompt
     */
    question?: string;
    /**
     * When running in GitHub Copilot Chat, the current chat history
     */
    "copilot.history"?: (HistoryMessageUser | HistoryMessageAssistant)[];
    /**
     * When running in GitHub Copilot Chat, the current editor content
     */
    "copilot.editor"?: string;
    /**
     * When running in GitHub Copilot Chat, the current selection
     */
    "copilot.selection"?: string;
    /**
     * When running in GitHub Copilot Chat, the current terminal content
     */
    "copilot.terminalSelection"?: string;
    /**
     * Selected model identifier in GitHub Copilot Chat
     */
    "copilot.model"?: string;
    /**
     * selected text in active text editor
     */
    "editor.selectedText"?: string;
  };

  /**
   * List of secrets used by the prompt, must be registered in `genaiscript`.
   */
  secrets: Record<string, string>;

  /**
   * Output trace builder
   */
  output: OutputTrace;

  /**
   * Resolved metadata
   */
  meta: PromptDefinition & ModelConnectionOptions;

  /**
   * The script debugger logger
   */
  dbg: DebugLogger;
}

 type MakeOptional<T, P extends keyof T> = Partial<Pick<T, P>> & Omit<T, P>;

 type PromptArgs = Omit<
  PromptScript,
  "text" | "id" | "jsSource" | "defTools" | "resolvedSystem"
>;

 type PromptSystemArgs = Omit<
  PromptArgs,
  | "model"
  | "embeddingsModel"
  | "temperature"
  | "topP"
  | "maxTokens"
  | "seed"
  | "tests"
  | "responseLanguage"
  | "responseType"
  | "responseSchema"
  | "files"
  | "modelConcurrency"
  | "redteam"
  | "metadata"
>;

 type StringLike = string | WorkspaceFile | WorkspaceFile[];

 interface LineNumberingOptions {
  /**
   * Prepend each line with a line numbers. Helps with generating diffs.
   */
  lineNumbers?: boolean;

  /**
   * Offset when number lines in output
   */
  lineNumbersStart?: number;
}

 interface FenceOptions extends LineNumberingOptions, FenceFormatOptions {
  /**
   * Language of the fenced code block. Defaults to "markdown".
   */
  language?:
    | "markdown"
    | "json"
    | "yaml"
    | "javascript"
    | "typescript"
    | "python"
    | "shell"
    | "toml"
    | string;

  /**
   * JSON schema identifier
   */
  schema?: string;
}

 type PromptCacheControlType = "ephemeral";

 interface ContextExpansionOptions {
  /**
   * Specifies an maximum of estimated tokens for this entry; after which it will be truncated.
   */
  maxTokens?: number;

  /*
   * Value that is conceptually similar to a zIndex (higher number == higher priority).
   * If a rendered prompt has more message tokens than can fit into the available context window, the prompt renderer prunes messages with the lowest priority from the ChatMessages result, preserving the order in which they were declared. This means your extension code can safely declare TSX components for potentially large pieces of context like conversation history and codebase context.
   */
  priority?: number;

  /**
   * Controls the proportion of tokens allocated from the container's budget to this element.
   * It defaults to 1 on all elements.
   */
  flex?: number;

  /**
   * Caching policy for this text. `ephemeral` means the prefix can be cached for a short amount of time.
   */
  cacheControl?: PromptCacheControlType;
}

 interface RangeOptions {
  /**
   * The inclusive start of the line range, with a 1-based index
   */
  lineStart?: number;
  /**
   * The inclusive end of the line range, with a 1-based index
   */
  lineEnd?: number;
  /**
   * Center line number around which the file will be truncated.
   * Dynamically calculates the range around this line.
   * This is different from lineStart/lineEnd as it specifies a center point.
   */
  line?: number;
  /**
   * Maximum token budget for the extracted range when using line option.
   * If specified, the range will be computed to fit within this token limit.
   */
  maxTokens?: number;
}

 interface GitIgnoreFilterOptions {
  /**
   * Disable filtering files based on the `.gitignore` file.
   */
  ignoreGitIgnore?: true | undefined;
}

 interface FileFilterOptions extends GitIgnoreFilterOptions {
  /**
   * Filename filter based on file suffix. Case insensitive.
   */
  endsWith?: ElementOrArray<string>;

  /**
   * Filename filter using glob syntax.
   */
  glob?: ElementOrArray<string>;
}

 interface ContentSafetyOptions {
  /**
   * Configure the content safety provider.
   */
  contentSafety?: ContentSafetyProvider;
  /**
   * Runs the default content safety validator
   * to prevent prompt injection.
   */
  detectPromptInjection?: "always" | "available" | boolean;
}

 interface PromptSystemSafetyOptions {
  /**
   * Policy to inject builtin system prompts. See to `false` prevent automatically injecting.
   */
  systemSafety?: "default" | boolean;
}

 interface SecretDetectionOptions {
  /**
   * Policy to disable secret scanning when communicating with the LLM.
   * Set to `false` to disable.
   */
  secretScanning?: boolean;
}

 interface DefOptions
  extends FenceOptions,
    ContextExpansionOptions,
    DataFilter,
    RangeOptions,
    FileFilterOptions,
    ContentSafetyOptions {
  /**
   * By default, throws an error if the value in def is empty.
   */
  ignoreEmpty?: boolean;

  /**
   * The content of the def is a predicted output.
   * This setting disables line numbers.
   */
  prediction?: boolean;
}

/**
 * Options for the `defDiff` command.
 */
 interface DefDiffOptions
  extends ContextExpansionOptions,
    FenceFormatOptions,
    LineNumberingOptions {}

 interface ImageTransformOptions {
  /**
   * Crops the image to the specified region.
   */
  crop?: { x?: number; y?: number; w?: number; h?: number };
  /**
   * Auto cropping same color on the edges of the image
   */
  autoCrop?: boolean;
  /**
   * Applies a scaling factor to the image after cropping.
   */
  scale?: number;
  /**
   * Rotates the image by the specified number of degrees.
   */
  rotate?: number;
  /**
   * Maximum width of the image. Applied after rotation.
   */
  maxWidth?: number;
  /**
   * Maximum height of the image. Applied after rotation.
   */
  maxHeight?: number;
  /**
   * Removes colors from the image using ITU Rec 709 luminance values
   */
  greyscale?: boolean;

  /**
   * Flips the image horizontally and/or vertically.
   */
  flip?: { horizontal?: boolean; vertical?: boolean };

  /**
   * Output mime
   */
  mime?: "image/jpeg" | "image/png";
}

 interface DefImagesOptions extends ImageTransformOptions {
  /**
   * A "low" detail image is always downsampled to 512x512 pixels.
   */
  detail?: "high" | "low";
  /**
   * Selects the first N elements from the data
   */
  sliceHead?: number;
  /**
   * Selects the last N elements from the data
   */
  sliceTail?: number;
  /**
   * Selects the a random sample of N items in the collection.
   */
  sliceSample?: number;
  /**
   * Renders all images in a single tiled image
   */
  tiled?: boolean;

  /**
   * By default, throws an error if no images are passed.
   */
  ignoreEmpty?: boolean;
}

 type JSONSchemaTypeName =
  | "string"
  | "number"
  | "integer"
  | "boolean"
  | "object"
  | "array"
  | "null";

 type JSONSchemaSimpleType =
  | JSONSchemaString
  | JSONSchemaNumber
  | JSONSchemaBoolean
  | JSONSchemaObject
  | JSONSchemaArray;

 type JSONSchemaType = JSONSchemaSimpleType | JSONSchemaAnyOf | null;

 interface JSONSchemaAnyOf {
  anyOf: JSONSchemaType[];
  uiGroup?: string;
}

 interface JSONSchemaDescribed {
  /**
   * A short description of the property
   */
  title?: string;
  /**
   * A clear description of the property.
   */
  description?: string;

  /**
   * Moves the field to a sub-group in the form, potentially collapsed
   */
  uiGroup?: string;
}

 interface JSONSchemaString extends JSONSchemaDescribed {
  type: "string";
  uiType?: "textarea";
  uiSuggestions?: string[];
  enum?: string[];
  default?: string;
  pattern?: string;
}

 interface JSONSchemaNumber extends JSONSchemaDescribed {
  type: "number" | "integer";
  default?: number;
  minimum?: number;
  exclusiveMinimum?: number;
  maximum?: number;
  exclusiveMaximum?: number;
}

 interface JSONSchemaBoolean extends JSONSchemaDescribed {
  type: "boolean";
  uiType?: "runOption";
  default?: boolean;
}

 interface JSONSchemaObject extends JSONSchemaDescribed {
  $schema?: string;
  type: "object";
  properties?: {
    [key: string]: JSONSchemaType;
  };
  required?: string[];
  additionalProperties?: boolean;

  default?: object;
}

 interface JSONSchemaArray extends JSONSchemaDescribed {
  $schema?: string;
  type: "array";
  items?: JSONSchemaType;

  default?: any[];
}

 type JSONSchema = JSONSchemaObject | JSONSchemaArray;

 interface FileEditValidation {
  /**
   * JSON schema
   */
  schema?: JSONSchema;
  /**
   * Error while validating the JSON schema
   */
  schemaError?: string;
  /**
   * The path was validated with a file output (defFileOutput)
   */
  pathValid?: boolean;
}

 interface DataFrame {
  schema?: string;
  data: unknown;
  validation?: FileEditValidation;
}

 interface Logprob {
  /**
   * Token text
   */
  token: string;
  /**
   * Log probably of the generated token
   */
  logprob: number;
  /**
   * Logprob value converted to %
   */
  probPercent?: number;
  /**
   * Normalized entropy
   */
  entropy?: number;
  /**
   * Other top tokens considered by the LLM
   */
  topLogprobs?: { token: string; logprob: number }[];
}

 interface RunPromptUsage {
  /**
   * Estimated cost in $ of the generation
   */
  cost?: number;
  /**
   * Estimated duration of the generation
   * including multiple rounds with tools
   */
  duration?: number;
  /**
   * Number of tokens in the generated completion.
   */
  completion: number;

  /**
   * Number of tokens in the prompt.
   */
  prompt: number;
  /**
   * Total number of tokens used in the request (prompt + completion).
   */
  total: number;
}

 interface RunPromptResult {
  messages: ChatMessage[];
  text: string;
  reasoning?: string;
  annotations?: Diagnostic[];
  fences?: Fenced[];
  frames?: DataFrame[];
  json?: any;
  error?: SerializedError;
  schemas?: Record<string, JSONSchema>;
  finishReason: "stop" | "length" | "tool_calls" | "content_filter" | "cancel" | "fail";
  fileEdits?: Record<string, FileUpdate>;
  edits?: Edits[];
  changelogs?: string[];
  model?: ModelType;
  choices?: Logprob[];
  logprobs?: Logprob[];
  perplexity?: number;
  uncertainty?: number;
  usage?: RunPromptUsage;
}

/**
 * Path manipulation functions.
 */
 interface Path {
  parse(path: string): {
    /**
     * The root of the path such as '/' or 'c:\'
     */
    root: string;
    /**
     * The full directory path such as '/home/user/dir' or 'c:\path\dir'
     */
    dir: string;
    /**
     * The file name including extension (if any) such as 'index.html'
     */
    base: string;
    /**
     * The file extension (if any) such as '.html'
     */
    ext: string;
    /**
     * The file name without extension (if any) such as 'index'
     */
    name: string;
  };

  /**
   * Returns the last portion of a path. Similar to the Unix basename command.
   * @param path
   */
  dirname(path: string): string;

  /**
   * Returns the extension of the path, from the last '.' to end of string in the last portion of the path.
   * @param path
   */
  extname(path: string): string;

  /**
   * Returns the last portion of a path, similar to the Unix basename command.
   */
  basename(path: string, suffix?: string): string;

  /**
   * The path.join() method joins all given path segments together using the platform-specific separator as a delimiter, then normalizes the resulting path.
   * @param paths
   */
  join(...paths: string[]): string;

  /**
   * The path.normalize() method normalizes the given path, resolving '..' and '.' segments.
   */
  normalize(...paths: string[]): string;

  /**
   * The path.relative() method returns the relative path from from to to based on the current working directory. If from and to each resolve to the same path (after calling path.resolve() on each), a zero-length string is returned.
   */
  relative(from: string, to: string): string;

  /**
   * The path.resolve() method resolves a sequence of paths or path segments into an absolute path.
   * @param pathSegments
   */
  resolve(...pathSegments: string[]): string;

  /**
   * Determines whether the path is an absolute path.
   * @param path
   */
  isAbsolute(path: string): boolean;

  /**
   * Change the extension of a path
   * @param path
   * @param ext
   */
  changeext(path: string, ext: string): string;

  /**
   * Converts a file://... to a path
   * @param fileUrl
   */
  resolveFileURL(fileUrl: string): string;

  /**
   * Sanitize a string to be safe for use as a filename by removing directory paths and invalid characters.
   * @param path file path
   */
  sanitize(path: string): string;
}

 interface Fenced {
  label: string;
  language?: string;
  content: string;
  args?: { schema?: string } & Record<string, string>;

  validation?: FileEditValidation;
}

 interface XMLParseOptions extends JSONSchemaValidationOptions {
  allowBooleanAttributes?: boolean;
  ignoreAttributes?: boolean;
  ignoreDeclaration?: boolean;
  ignorePiTags?: boolean;
  parseAttributeValue?: boolean;
  removeNSPrefix?: boolean;
  unpairedTags?: string[];
}

 interface ParsePDFOptions {
  /**
   * Disable removing trailing spaces in text
   */
  disableCleanup?: boolean;
  /**
   * Render each page as an image
   */
  renderAsImage?: boolean;
  /**
   * Zoom scaling with rendering pages and figures
   */
  scale?: number;
  /**
   * Disable caching with cache: false
   */
  cache?: boolean;
  /**
   * Force system fonts use
   */
  useSystemFonts?: boolean;
}

 interface HTMLToTextOptions {
  /**
   * After how many chars a line break should follow in `p` elements.
   *
   * Set to `null` or `false` to disable word-wrapping.
   */
  wordwrap?: number | false | null | undefined;
}

 interface ParseXLSXOptions {
  // specific worksheet name
  sheet?: string;
  // Use specified range (A1-style bounded range string)
  range?: string;
}

 interface WorkbookSheet {
  name: string;
  rows: object[];
}

 interface ParseZipOptions {
  glob?: string;
}

 type TokenEncoder = (text: string) => number[];
 type TokenDecoder = (lines: Iterable<number>) => string;

 interface Tokenizer {
  model: string;
  /**
   * Number of tokens
   */
  size?: number;
  encode: TokenEncoder;
  decode: TokenDecoder;
}

 interface CSVParseOptions extends JSONSchemaValidationOptions {
  delimiter?: string;
  headers?: string[];
  repair?: boolean;
}

 interface TextChunk extends WorkspaceFile {
  lineStart: number;
  lineEnd: number;
}

 interface TextChunkerConfig extends LineNumberingOptions {
  model?: ModelType;
  chunkSize?: number;
  chunkOverlap?: number;
  docType?: OptionsOrString<
    | "cpp"
    | "python"
    | "py"
    | "java"
    | "go"
    | "c#"
    | "c"
    | "cs"
    | "ts"
    | "js"
    | "tsx"
    | "typescript"
    | "js"
    | "jsx"
    | "javascript"
    | "php"
    | "md"
    | "mdx"
    | "markdown"
    | "rst"
    | "rust"
  >;
}

 interface Tokenizers {
  /**
   * Estimates the number of tokens in the content. May not be accurate
   * @param model
   * @param text
   */
  count(text: string, options?: { model?: ModelType; approximate?: boolean }): Promise<number>;

  /**
   * Truncates the text to a given number of tokens, approximation.
   * @param model
   * @param text
   * @param maxTokens
   * @param options
   */
  truncate(
    text: string,
    maxTokens: number,
    options?: { model?: ModelType; last?: boolean },
  ): Promise<string>;

  /**
   * Tries to resolve a tokenizer for a given model. Defaults to gpt-4o if not found.
   * @param model
   */
  resolve(model?: ModelType): Promise<Tokenizer>;

  /**
   * Chunk the text into smaller pieces based on a token limit and chunking strategy.
   * @param text
   * @param options
   */
  chunk(file: Awaitable<string | WorkspaceFile>, options?: TextChunkerConfig): Promise<TextChunk[]>;
}

 interface HashOptions {
  /**
   * Algorithm used for hashing
   */
  algorithm?: "sha-256";
  /**
   * Trim hash to this number of character
   */
  length?: number;
  /**
   * Include genaiscript version in the hash
   */
  version?: boolean;
  /**
   * Optional salting of the hash
   */
  salt?: string;
  /**
   * Read the content of workspace files object into the hash
   */
  readWorkspaceFiles?: boolean;
}

 interface VideoProbeResult {
  streams: {
    index: number;
    codec_name: string;
    codec_long_name: string;
    profile: string;
    codec_type: string;
    codec_tag_string: string;
    codec_tag: string;
    width?: number;
    height?: number;
    coded_width?: number;
    coded_height?: number;
    closed_captions?: number;
    film_grain?: number;
    has_b_frames?: number;
    sample_aspect_ratio?: string;
    display_aspect_ratio?: string;
    pix_fmt?: string;
    level?: number;
    color_range?: string;
    color_space?: string;
    color_transfer?: string;
    color_primaries?: string;
    chroma_location?: string;
    field_order?: string;
    refs?: number;
    is_avc?: string;
    nal_length_size?: number;
    id: string;
    r_frame_rate: string;
    avg_frame_rate: string;
    time_base: string;
    start_pts: number;
    start_time: number;
    duration_ts: number;
    duration: number;
    bit_rate: number;
    max_bit_rate: string;
    bits_per_raw_sample: number | string;
    nb_frames: number | string;
    nb_read_frames?: string;
    nb_read_packets?: string;
    extradata_size?: number;
    tags?: {
      creation_time: string;
      language?: string;
      handler_name: string;
      vendor_id?: string;
      encoder?: string;
    };
    disposition?: {
      default: number;
      dub: number;
      original: number;
      comment: number;
      lyrics: number;
      karaoke: number;
      forced: number;
      hearing_impaired: number;
      visual_impaired: number;
      clean_effects: number;
      attached_pic: number;
      timed_thumbnails: number;
      captions: number;
      descriptions: number;
      metadata: number;
      dependent: number;
      still_image: number;
    };
    sample_fmt?: string;
    sample_rate?: number;
    channels?: number;
    channel_layout?: string;
    bits_per_sample?: number | string;
  }[];
  format: {
    filename: string;
    nb_streams: number;
    nb_programs: number;
    format_name: string;
    format_long_name: string;
    start_time: number;
    duration: number;
    size: number;
    bit_rate: number;
    probe_score: number;
    tags: {
      major_brand: string;
      minor_version: string;
      compatible_brands: string;
      creation_time: string;
    };
  };
}

 interface PDFPageImage extends WorkspaceFile {
  id: string;
  width: number;
  height: number;
}

 interface PDFPage {
  index: number;
  content: string;
  image?: string;
  figures?: PDFPageImage[];
}

 interface DocxParseOptions extends CacheOptions {
  /**
   * Desired output format
   */
  format?: "markdown" | "text" | "html";
}

 interface EncodeIDsOptions {
  matcher?: RegExp;
  prefix?: string;
  open?: string;
  close?: string;
}

 type GitIgnorer = (files: readonly (string | WorkspaceFile)[]) => string[];

 interface Parsers {
  /**
   * Parses text as a JSON5 payload
   */
  JSON5(
    content: string | WorkspaceFile,
    options?: { defaultValue?: any } & JSONSchemaValidationOptions,
  ): any | undefined;

  /**
   * Parses text generated by an LLM as JSON payload
   * @param content
   */
  JSONLLM(content: string): any | undefined;

  /**
   * Parses text or file as a JSONL payload. Empty lines are ignore, and JSON5 is used for parsing.
   * @param content
   */
  JSONL(content: string | WorkspaceFile): any[] | undefined;

  /**
   * Parses text as a YAML payload
   */
  YAML(
    content: string | WorkspaceFile,
    options?: { defaultValue?: any } & JSONSchemaValidationOptions,
  ): any | undefined;

  /**
   * Parses text as TOML payload
   * @param text text as TOML payload
   */
  TOML(
    content: string | WorkspaceFile,
    options?: { defaultValue?: any } & JSONSchemaValidationOptions,
  ): any | undefined;

  /**
   * Parses the front matter of a markdown file
   * @param content
   * @param defaultValue
   */
  frontmatter(
    content: string | WorkspaceFile,
    options?: {
      defaultValue?: any;
      format: "yaml" | "json" | "toml";
    } & JSONSchemaValidationOptions,
  ): any | undefined;

  /**
   * Parses a file or URL as PDF
   * @param content
   */
  PDF(
    content: string | WorkspaceFile,
    options?: ParsePDFOptions,
  ): Promise<
    | {
        /**
         * Reconstructed text content from page content
         */
        file: WorkspaceFile;
        /**
         * Page text content
         */
        pages: string[];
        /**
         * Rendered pages as images if `renderAsImage` is set
         */
        images?: string[];

        /**
         * Parse PDF content
         */
        data: PDFPage[];
      }
    | undefined
  >;

  /**
   * Parses a .docx file
   * @param content
   */
  DOCX(
    content: string | WorkspaceFile,
    options?: DocxParseOptions,
  ): Promise<{ file?: WorkspaceFile; error?: string }>;

  /**
   * Parses a CSV file or text
   * @param content
   */
  CSV(content: string | WorkspaceFile, options?: CSVParseOptions): object[] | undefined;

  /**
   * Parses a XLSX file and a given worksheet
   * @param content
   */
  XLSX(content: WorkspaceFile, options?: ParseXLSXOptions): Promise<WorkbookSheet[] | undefined>;

  /**
   * Parses a .env file
   * @param content
   */
  dotEnv(content: string | WorkspaceFile): Record<string, string>;

  /**
   * Parses a .ini file
   * @param content
   */
  INI(content: string | WorkspaceFile, options?: INIParseOptions): any | undefined;

  /**
   * Parses a .xml file
   * @param content
   */
  XML(
    content: string | WorkspaceFile,
    options?: { defaultValue?: any } & XMLParseOptions,
  ): any | undefined;

  /**
   * Parses .vtt or .srt transcription files
   * @param content
   */
  transcription(content: string | WorkspaceFile): TranscriptionSegment[];

  /**
   * Convert HTML to text
   * @param content html string or file
   * @param options
   */
  HTMLToText(content: string | WorkspaceFile, options?: HTMLToTextOptions): Promise<string>;

  /**
   * Convert HTML to markdown
   * @param content html string or file
   * @param options rendering options
   */
  HTMLToMarkdown(content: string | WorkspaceFile, options?: HTMLToMarkdownOptions): Promise<string>;

  /**
   * Extracts the contents of a zip archive file
   * @param file
   * @param options
   */
  unzip(file: WorkspaceFile, options?: ParseZipOptions): Promise<WorkspaceFile[]>;

  /**
   * Parses fenced code sections in a markdown text
   */
  fences(content: string | WorkspaceFile): Fenced[];

  /**
   * Parses various format of annotations (error, warning, ...)
   * @param content
   */
  annotations(content: string | WorkspaceFile): Diagnostic[];

  /**
   * Parses and evaluates a math expression
   * @param expression math expression compatible with mathjs
   * @param scope object to read/write variables
   */
  math(expression: string, scope?: object): Promise<string | number | undefined>;

  /**
   * Using the JSON schema, validates the content
   * @param schema JSON schema instance
   * @param content object to validate
   */
  validateJSON(schema: JSONSchema, content: any): FileEditValidation;

  /**
   * Renders a mustache template
   * @param text template text
   * @param data data to render
   */
  mustache(text: string | WorkspaceFile, data: Record<string, any>): string;

  /**
   * Renders a jinja template
   */
  jinja(text: string | WorkspaceFile, data: Record<string, any>): string;

  /**
   * Computes a diff between two files
   */
  diff(
    left: string | WorkspaceFile,
    right: string | WorkspaceFile,
    options?: DefDiffOptions,
  ): string;

  /**
   * Cleans up a dataset made of rows of data
   * @param rows
   * @param options
   */
  tidyData(rows: object[], options?: DataFilter): object[];

  /**
   * Applies a GROQ query to the data
   * @param data data object to filter
   * @param query query
   * @see https://groq.dev/
   */
  GROQ(query: string, data: any): Promise<any>;

  /**
   * Computes a sha1 that can be used for hashing purpose, not cryptographic.
   * @param content content to hash
   */
  hash(content: any, options?: HashOptions): Promise<string>;

  /**
   * Optionally removes a code fence section around the text
   * @param text
   * @param language
   */
  unfence(text: string, language?: ElementOrArray<string>): string;

  /**
   * Erase <think>...</think> tags
   * @param text
   */
  unthink(text: string): string;

  /**
   * Remove left indentation
   * @param text
   */
  dedent(templ: TemplateStringsArray | string, ...values: unknown[]): string;

  /**
   * Encodes ids in a text and returns the function to decode them
   * @param text
   * @param options
   */
  encodeIDs(
    text: string,
    options?: EncodeIDsOptions,
  ): {
    encoded: string;
    text: string;
    decode: (text: string) => string;
    matcher: RegExp;
    ids: Record<string, string>;
  };

  /**
   * Parses a prompty file
   * @param file
   */
  prompty(file: WorkspaceFile): Promise<PromptyDocument>;

  /**
   * Computes the Levenshtein distance between two strings or workspace files.
   */
  levenshtein(a: string | WorkspaceFile, b: string | WorkspaceFile): Promise<number>;

  /**
   * Create a file filter using the `.gitignore` format from the given filenames.
   * @param filenames
   */
  ignore(...filenames: string[]): Promise<GitIgnorer>;
}

 interface YAMLObject {
  /**
   * Parses a YAML string into a JavaScript object using JSON5.
   */
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  (strings: TemplateStringsArray, ...values: unknown[]): any;

  /**
   * Converts an object to its YAML representation
   * @param obj
   */
  stringify(obj: unknown): string;
  /**
   * Parses a YAML string to object
   */
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  parse(text: string | WorkspaceFile): any;
}

 interface PromptyFrontmatter {
  name?: string;
  description?: string;
  version?: string;
  authors?: string[];
  tags?: string[];
  sample?: Record<string, any> | string;
  inputs?: Record<
    string,
    | JSONSchemaArray
    | JSONSchemaNumber
    | JSONSchemaBoolean
    | JSONSchemaString
    | JSONSchemaObject
    | { type: "list" }
  >;
  outputs?: JSONSchemaObject;
  model?: {
    api?: "chat" | "completion";
    configuration?: {
      type?: string;
      name?: string;
      organization?: string;
      api_version?: string;
      azure_deployment: string;
      azure_endpoint: string;
    };
    parameters?: {
      response_format?: { type: "json_object" | "json_schema" };
      max_tokens?: number;
      temperature?: number;
      top_p?: number;
      n?: number;
      seed?: number;
      stream?: boolean; // ignored
      tools?: unknown[]; // ignored
    };
  };

  // unofficial
  files?: string | string[];
  tests?: PromptTest | PromptTest[];
}

 interface PromptyDocument {
  meta: PromptArgs;
  frontmatter: PromptyFrontmatter;
  content: string;
  messages: ChatMessage[];
}

 interface DiffFile {
  chunks: DiffChunk[];
  deletions: number;
  additions: number;
  from?: string;
  to?: string;
  oldMode?: string;
  newMode?: string;
  index?: string[];
  deleted?: true;
  new?: true;
}

 interface DiffChunk {
  content: string;
  changes: DiffChange[];
  oldStart: number;
  oldLines: number;
  newStart: number;
  newLines: number;
}

 interface DiffNormalChange {
  type: "normal";
  ln1: number;
  ln2: number;
  normal: true;
  content: string;
}

 interface DiffAddChange {
  type: "add";
  add: true;
  ln: number;
  content: string;
}

 interface DiffDeleteChange {
  type: "del";
  del: true;
  ln: number;
  content: string;
}

 type DiffChangeType = "normal" | "add" | "del";

 type DiffChange = DiffNormalChange | DiffAddChange | DiffDeleteChange;

 interface DIFFObject {
  /**
   * Parses a diff string into a structured object
   * @param input
   */
  parse(input: string): DiffFile[];

  /**
   * Given a filename and line number (0-based), finds the chunk in the diff
   * @param file
   * @param range line index or range [start, end] inclusive
   * @param diff
   */
  findChunk(
    file: string,
    range: number | [number, number] | number[],
    diff: ElementOrArray<DiffFile>,
  ): { file?: DiffFile; chunk?: DiffChunk } | undefined;

  /**
   * Creates a two file path
   * @param left
   * @param right
   * @param options
   */
  createPatch(
    left: string | WorkspaceFile,
    right: string | WorkspaceFile,
    options?: {
      context?: number;
      ignoreCase?: boolean;
      ignoreWhitespace?: boolean;
    },
  ): string;
}

 interface XMLObject {
  /**
   * Parses an XML payload to an object
   * @param text
   */
  parse(text: string | WorkspaceFile, options?: XMLParseOptions): Promise<any>;
}

 interface JSONSchemaUtilities {
  /**
   * Infers a JSON schema from an object
   * @param obj
   * @deprecated Use `fromParameters` instead
   */
  infer(obj: any): Promise<JSONSchema>;

  /**
   * Converts a parameters schema to a JSON schema
   * @param parameters
   */
  fromParameters(parameters: PromptParametersSchema | undefined): JSONSchema;
}

 interface HTMLTableToJSONOptions {
  useFirstRowForHeadings?: boolean;
  headers?: {
    from?: number;
    to: number;
    concatWith: string;
  };
  stripHtmlFromHeadings?: boolean;
  stripHtmlFromCells?: boolean;
  stripHtml?: boolean | null;
  forceIndexAsNumber?: boolean;
  countDuplicateHeadings?: boolean;
  ignoreColumns?: number[] | null;
  onlyColumns?: number[] | null;
  ignoreHiddenRows?: boolean;
  id?: string[] | null;
  headings?: string[] | null;
  containsClasses?: string[] | null;
  limitrows?: number | null;
}

 interface HTMLToMarkdownOptions {
  disableGfm?: boolean;
}

 interface HTMLObject {
  /**
   * Converts all HTML tables to JSON.
   * @param html
   * @param options
   */
  convertTablesToJSON(html: string, options?: HTMLTableToJSONOptions): Promise<object[][]>;
  /**
   * Converts HTML markup to plain text
   * @param html
   */
  convertToText(html: string): Promise<string>;
  /**
   * Converts HTML markup to markdown
   * @param html
   */
  convertToMarkdown(html: string, options?: HTMLToMarkdownOptions): Promise<string>;
}

 interface GitCommit {
  sha: string;
  date: string;
  author: string;
  message: string;
  files: string[];
}

 interface GitLogOptions {
  base?: string;
  head?: string;
  count?: number;
  merges?: boolean;
  author?: string;
  until?: string;
  after?: string;
  excludedGrep?: string | RegExp;
  paths?: ElementOrArray<string>;
  excludedPaths?: ElementOrArray<string>;
}

 interface GitWorktree {
  /**
   * Path to the worktree
   */
  path: string;
  /**
   * Branch name associated with the worktree
   */
  branch: string;
  /**
   * Commit SHA the worktree is checked out to
   */
  head: string;
  /**
   * Whether the worktree is bare
   */
  bare?: boolean;
  /**
   * Whether the worktree is detached (not on a branch)
   */
  detached?: boolean;
}

 interface GitWorktreeAddOptions {
  /**
   * Create a new branch with the worktree
   */
  branch?: string;
  /**
   * Force creation even if target exists
   */
  force?: boolean;
  /**
   * Checkout the branch into the worktree
   */
  checkout?: boolean;
  /**
   * Create an orphan branch
   */
  orphan?: boolean;
  /**
   * Detach HEAD at the commit
   */
  detach?: boolean;
}

 interface Git {
  /**
   * Current working directory
   */
  cwd: string;

  /**
   * Resolves the default branch for this repository
   */
  defaultBranch(): Promise<string>;

  /**
   * Gets the last tag in the repository
   */
  lastTag(): Promise<string>;

  /**
   * Gets the current branch of the repository
   */
  branch(): Promise<string>;

  /**
   * Executes a git command in the repository and returns the stdout
   * @param cmd
   */
  exec(
    args: string[] | string,
    options?: {
      label?: string;
    },
  ): Promise<string>;

  /**
   * Git fetches the remote repository
   * @param options
   */
  fetch(
    remote?: OptionsOrString<"origin">,
    branchOrSha?: string,
    options?: {
      prune?: boolean;
      all?: boolean;
    },
  ): Promise<string>;

  /**
   * Git pull the remote repository
   * @param options
   */
  pull(options?: { ff?: boolean }): Promise<string>;

  /**
   * Lists the branches in the git repository
   */
  listBranches(): Promise<string[]>;

  /**
   * Finds specific files in the git repository.
   * By default, work
   * @param options
   */
  listFiles(
    scope?: "modified-base" | "staged" | "modified",
    options?: {
      base?: string;
      /**
       * Ask the user to stage the changes if the diff is empty.
       */
      askStageOnEmpty?: boolean;
      paths?: ElementOrArray<string>;
      excludedPaths?: ElementOrArray<string>;
    },
  ): Promise<WorkspaceFile[]>;

  /**
   *
   * @param options
   */
  diff(options?: {
    staged?: boolean;
    /**
     * Ask the user to stage the changes if the diff is empty.
     */
    askStageOnEmpty?: boolean;
    base?: string;
    head?: string;
    paths?: ElementOrArray<string>;
    excludedPaths?: ElementOrArray<string>;
    unified?: number;
    nameOnly?: boolean;
    algorithm?: "patience" | "minimal" | "histogram" | "myers";
    ignoreSpaceChange?: boolean;
    extras?: string[];
    /**
     * Modifies the diff to be in a more LLM friendly format
     */
    llmify?: boolean;
    /**
     * Maximum of tokens before returning a name-only diff
     */
    maxTokensFullDiff?: number;
  }): Promise<string>;

  /**
   * Lists the commits in the git repository
   */
  log(options?: GitLogOptions): Promise<GitCommit[]>;

  /**
   * Run git blame on a file, line
   * @param filename
   * @param line
   */
  blame(filename: string, line: number): Promise<string>;

  /**
   * Returns a list of files that have changed in the git repository
   * @param options
   */
  changedFiles(options?: GitLogOptions & { readText?: string }): Promise<WorkspaceFile[]>;

  /**
   * Create a shallow git clone
   * @param repository URL of the remote repository
   * @param options various clone options
   * @returns the path to the cloned repository
   */
  shallowClone(
    repository: string,
    options?: {
      /**
       * Branch to clone
       */
      branch?: string;

      /**
       * Do not reuse previous clone
       */
      force?: boolean;

      /**
       * Runs install command after cloning
       */
      install?: boolean;

      /**
       * Number of commits to fetch
       */
      depth?: number;
    },
  ): Promise<Git>;

  /**
   * Open a git client on a different directory
   * @param cwd working directory
   */
  client(cwd: string): Git;

  /**
   * List all git worktrees
   */
  listWorktrees(): Promise<GitWorktree[]>;

  /**
   * Add a new git worktree
   * @param path path where the worktree should be created
   * @param commitish commit, branch, or tag to checkout
   * @param options additional options for worktree creation
   * @returns Git client opened at the worktree path
   */
  addWorktree(path: string, commitish?: string, options?: GitWorktreeAddOptions): Promise<Git>;

  /**
   * Remove a git worktree
   * @param path path to the worktree to remove
   * @param options removal options
   */
  removeWorktree(
    path: string,
    options?: {
      force?: boolean;
    },
  ): Promise<void>;
}

/**
 * A ffmpeg command builder. This instance is a minimal ffmpeg command builder.
 */
 interface FfmpegCommandBuilder {
  seekInput(startTime: number | string): FfmpegCommandBuilder;
  duration(duration: number | string): FfmpegCommandBuilder;
  noVideo(): FfmpegCommandBuilder;
  noAudio(): FfmpegCommandBuilder;
  audioCodec(codec: string): FfmpegCommandBuilder;
  audioBitrate(bitrate: string | number): FfmpegCommandBuilder;
  audioChannels(channels: number): FfmpegCommandBuilder;
  audioFrequency(freq: number): FfmpegCommandBuilder;
  audioQuality(quality: number): FfmpegCommandBuilder;
  audioFilters(filters: string | string[] /* | AudioVideoFilter[]*/): FfmpegCommandBuilder;
  toFormat(format: string): FfmpegCommandBuilder;

  videoCodec(codec: string): FfmpegCommandBuilder;
  videoBitrate(bitrate: string | number, constant?: boolean): FfmpegCommandBuilder;
  videoFilters(filters: string | string[]): FfmpegCommandBuilder;
  outputFps(fps: number): FfmpegCommandBuilder;
  frames(frames: number): FfmpegCommandBuilder;
  keepDisplayAspectRatio(): FfmpegCommandBuilder;
  size(size: string): FfmpegCommandBuilder;
  aspectRatio(aspect: string | number): FfmpegCommandBuilder;
  autopad(pad?: boolean, color?: string): FfmpegCommandBuilder;

  inputOptions(...options: string[]): FfmpegCommandBuilder;
  outputOptions(...options: string[]): FfmpegCommandBuilder;
}

 interface FFmpegCommandOptions extends CacheOptions {
  inputOptions?: ElementOrArray<string>;
  outputOptions?: ElementOrArray<string>;
  /**
   * For video conversion, output size as `wxh`
   */
  size?: string;
}

 interface VideoExtractFramesOptions extends FFmpegCommandOptions {
  /**
   * A set of seconds or timestamps (`[[hh:]mm:]ss[.xxx]`)
   */
  timestamps?: number[] | string[];
  /**
   * Number of frames to extract
   */
  count?: number;
  /**
   * Extract frames on the start of each transcript segment
   */
  transcript?: TranscriptionResult | string;
  /**
   * Extract Intra frames (keyframes). This is a efficient and fast decoding.
   */
  keyframes?: boolean;
  /**
   * Picks frames that exceed scene threshold (between 0 and 1), typically between 0.2, and 0.5.
   * This is computationally intensive.
   */
  sceneThreshold?: number;
  /**
   * Output of the extracted frames
   */
  format?: OptionsOrString<"jpeg" | "png">;
}

 interface VideoExtractClipOptions extends FFmpegCommandOptions {
  /**
   * Start time of the clip in seconds or timestamp (`[[hh:]mm:]ss[.xxx]`)
   */
  start: number | string;
  /**
   * Duration of the clip in seconds or timestamp (`[[hh:]mm:]ss[.xxx]`).
   * You can also specify `end`.
   */
  duration?: number | string;
  /**
   * End time of the clip in seconds or timestamp (`[[hh:]mm:]ss[.xxx]`).
   * You can also specify `duration`.
   */
  end?: number | string;
}

 interface VideoExtractAudioOptions extends FFmpegCommandOptions {
  /**
   * Optimize for speech-to-text transcription. Default is true.
   */
  transcription?: boolean;

  forceConversion?: boolean;
}

 interface Ffmpeg {
  /**
   * Extracts metadata information from a video file using ffprobe
   * @param filename
   */
  probe(file: string | WorkspaceFile, options?: FFmpegCommandOptions): Promise<VideoProbeResult>;

  /**
   * Extracts frames from a video file
   * @param options
   */
  extractFrames(
    file: string | WorkspaceFile,
    options?: VideoExtractFramesOptions,
  ): Promise<string[]>;

  /**
   * Extracts a clip from a video. Returns the generated video file path.
   */
  extractClip(file: string | WorkspaceFile, options: VideoExtractClipOptions): Promise<string>;

  /**
   * Extract the audio track from a video
   * @param videoPath
   */
  extractAudio(file: string | WorkspaceFile, options?: VideoExtractAudioOptions): Promise<string>;

  /**
   * Runs a ffmpeg command and returns the list of generated file names
   * @param input
   * @param builder manipulates the ffmpeg command and returns the output name
   */
  run(
    input: string | WorkspaceFile,
    builder: (
      cmd: FfmpegCommandBuilder,
      options?: { input: string; dir: string },
    ) => Awaitable<string>,
    options?: FFmpegCommandOptions,
  ): Promise<string[]>;
}

 interface TranscriptionSegment {
  id?: string;
  start: number;
  end?: number;
  text: string;
}

 interface GitHubOptions {
  owner: string;
  repo: string;
  baseUrl?: string;
  auth?: string;
  ref?: string;
  refName?: string;
  issueNumber?: number;
  runId?: string;
  runUrl?: string;
}

 type GitHubWorkflowRunStatus =
  | "completed"
  | "action_required"
  | "cancelled"
  | "failure"
  | "neutral"
  | "skipped"
  | "stale"
  | "success"
  | "timed_out"
  | "in_progress"
  | "queued"
  | "requested"
  | "waiting"
  | "pending";

 interface GitHubNode {
  id: number;
  node_id: string;
}

 interface GitHubWorkflowRun extends GitHubNode {
  run_number: number;
  name?: string;
  display_title: string;
  status: string;
  conclusion: string;
  html_url: string;
  created_at: string;
  head_branch: string;
  head_sha: string;
  workflow_id: number;
  run_started_at?: string;
}

 interface GitHubWorkflowJob extends GitHubNode {
  run_id: number;
  status: string;
  conclusion: string;
  name: string;
  html_url: string;
  logs_url: string;
  logs: string;
  started_at: string;
  completed_at: string;
  content: string;
}

 interface GitHubIssue extends GitHubNode {
  body?: string;
  title: string;
  number: number;
  state: string;
  state_reason?: "completed" | "reopened" | "not_planned" | null;
  html_url: string;
  draft?: boolean;
  reactions?: GitHubReactions;
  user: GitHubUser;
  assignee?: GitHubUser;
  labels?: (string | { name?: string })[];
  created_at: string;
  updated_at?: string;
  closed_at?: string;
}

 type GitHubReactionType =
  | "eyes"
  | "hooray"
  | "heart"
  | "rocket"
  | "confused"
  | "laugh"
  | "+1"
  | "-1";

 interface GitHubRef {
  ref: string;
  url: string;
}

 interface GitHubReactions {
  url: string;
  total_count: number;
  "+1": number;
  "-1": number;
  laugh: number;
  confused: number;
  heart: number;
  hooray: number;
  eyes: number;
  rocket: number;
}

 interface GitHubReaction {
  id: number;
  user: GitHubUser;
  content: GitHubReactionType;
  created_at: string;
}

 interface GitHubComment extends GitHubNode {
  body?: string;
  user: GitHubUser;
  created_at: string;
  updated_at: string;
  html_url: string;
  reactions?: GitHubReactions;
}

 interface GitHubPullRequest extends GitHubIssue {
  head: {
    ref: string;
  };
  base: {
    ref: string;
  };
}

 interface GitHubCodeSearchResult {
  name: string;
  path: string;
  sha: string;
  html_url: string;
  score: number;
  repository: string;
}

 interface GitHubWorkflow extends GitHubNode {
  name: string;
  path: string;
}

 interface GitHubPaginationOptions {
  /**
   * Default number of items to fetch, default is 50.
   */
  count?: number;
}

 interface GitHubFile extends WorkspaceFile {
  type: "file" | "dir" | "submodule" | "symlink";
  size: number;
}

 interface GitHubUser {
  login: string;
}

 interface GitHubRelease {
  id: number;
  tag_name: string;
  name: string;
  draft?: boolean;
  prerelease?: boolean;
  html_url: string;
  published_at: string;
  body?: string;
}

 interface GitHubGist {
  id: string;
  description?: string;
  created_at?: string;
  files: WorkspaceFile[];
}

 interface GitHubArtifact {
  id: number;
  name: string;
  size_in_bytes: number;
  url: string;
  archive_download_url: string;
  expires_at: string;
}

 interface GitHubIssueUpdateOptions {
  title?: string;
  body?: string;
  assignee?: string;
  state?: "open" | "closed";
  assignees?: string[];
  labels?: string[];
}

 interface GitHubIssueCreateOptions {
  labels?: string[];
  /**
   * Parent issue number to add this issue as a sub-issue
   */
  parentIssue?: number | string;
}

 interface GitHubLabel {
  name: string;
  color?: string;
  description?: string;
}

 interface GitHub {
  /**
   * Gets connection information for octokit
   */
  info(): Promise<GitHubOptions | undefined>;

  /**
   * Gets the details of a GitHub workflow
   * @param workflowId
   */
  workflow(workflowId: number | string): Promise<GitHubWorkflow>;

  /**
   * Lists workflows in a GitHub repository
   */
  listWorkflows(options?: GitHubPaginationOptions): Promise<GitHubWorkflow[]>;

  /**
   * Lists workflow runs for a given workflow
   * @param workflowId
   * @param options
   */
  listWorkflowRuns(
    workflow_id: string | number,
    options?: {
      branch?: string;
      event?: string;
      status?: GitHubWorkflowRunStatus;
    } & GitHubPaginationOptions,
  ): Promise<GitHubWorkflowRun[]>;

  /**
   * Gets the details of a GitHub Action workflow run
   * @param runId
   */
  workflowRun(runId: number | string): Promise<GitHubWorkflowRun>;

  /**
   * List artifacts for a given workflow run
   * @param runId
   */
  listWorkflowRunArtifacts(
    runId: number | string,
    options?: GitHubPaginationOptions,
  ): Promise<GitHubArtifact[]>;

  /**
   * Gets the details of a GitHub Action workflow run artifact
   * @param artifactId
   */
  artifact(artifactId: number | string): Promise<GitHubArtifact>;

  /**
   * Downloads and unzips archive files from a GitHub Action Artifact
   * @param artifactId
   */
  downloadArtifactFiles(artifactId: number | string): Promise<WorkspaceFile[]>;

  /**
   * Downloads a GitHub Action workflow run log
   * @param runId
   */
  listWorkflowJobs(runId: number, options?: GitHubPaginationOptions): Promise<GitHubWorkflowJob[]>;

  /**
   * Downloads a GitHub Action workflow run log
   * @param jobId
   */
  downloadWorkflowJobLog(jobId: number, options?: { llmify?: boolean }): Promise<string>;

  /**
   * Diffs two GitHub Action workflow job logs
   */
  diffWorkflowJobLogs(job_id: number, other_job_id: number): Promise<string>;

  /**
   * List labels in repository
   */
  listIssueLabels(issueNumber?: string | number): Promise<GitHubLabel[]>;

  /**
   * Lists issues for a given repository
   * @param options
   */
  listIssues(
    options?: {
      state?: "open" | "closed" | "all";
      labels?: string;
      sort?: "created" | "updated" | "comments";
      direction?: "asc" | "desc";
      creator?: string;
      assignee?: string;
      since?: string;
      mentioned?: string;
    } & GitHubPaginationOptions,
  ): Promise<GitHubIssue[]>;

  /**
   * Lists gists for a given user
   */
  listGists(): Promise<GitHubGist[]>;

  /**
   * Gets the files of a gist
   * @param gist_id
   */
  getGist(gist_id: string): Promise<GitHubGist | undefined>;

  /**
   * Gets the details of a GitHub issue
   * @param issueNumber issue number (not the issue id!). If undefined, reads value from GITHUB_ISSUE environment variable.
   */
  getIssue(issueNumber?: number | string): Promise<GitHubIssue>;

  /**
   * Assigns an existing issue to a bot user. Defaults to copilot user.
   */
  assignIssueToBot(
    issue_number: number | string,
    options?: { bot?: string },
  ): Promise<{ id: string; title: string }>;

  /**
   * Creates a new issue or pull request on GitHub
   */
  createIssue(
    title: string,
    body: string,
    options?: GitHubIssueCreateOptions,
  ): Promise<GitHubIssue>;

  /**
   * Updates an issue or pull request on GitHub
   * @param issueNumber
   * @param options
   */
  updateIssue(
    issueNumber: number | string,
    options: GitHubIssueUpdateOptions,
  ): Promise<GitHubIssue>;

  /**
   * Create a GitHub issue comment
   * @param issueNumber issue number (not the issue id!). If undefined, reads value from GITHUB_ISSUE environment variable.
   * @param body the body of the comment as Github Flavored markdown
   */
  createIssueComment(issueNumber: number | string, body: string): Promise<GitHubComment>;

  /**
   * Lists comments for a given issue
   * @param issue_number
   * @param options
   */
  listIssueComments(
    issue_number: number | string,
    options?: GitHubPaginationOptions,
  ): Promise<GitHubComment[]>;

  /**
   * Updates a comment on a GitHub issue
   * @param comment_id
   * @param body the updated comment body
   */
  updateIssueComment(
    comment_id: number | string,
    body: string,
    options?: GitHubAIDisclaimerOptions,
  ): Promise<GitHubComment>;

  createReaction(
    type: "issue" | "issueComment" | "pullRequestReviewComment",
    id: number | string,
    reaction: GitHubReactionType,
  ): Promise<GitHubReaction>;

  /**
   * Lists pull requests for a given repository
   * @param options
   */
  listPullRequests(
    options?: {
      state?: "open" | "closed" | "all";
      sort?: "created" | "updated" | "popularity" | "long-running";
      direction?: "asc" | "desc";
    } & GitHubPaginationOptions,
  ): Promise<GitHubPullRequest[]>;

  /**
   * Gets the details of a GitHub pull request
   * @param pull_number pull request number. Default resolves the pull request for the current branch.
   */
  getPullRequest(pull_number?: number | string): Promise<GitHubPullRequest>;

  /**
   * Lists comments for a given pull request
   * @param pull_number
   * @param options
   */
  listPullRequestReviewComments(
    pull_number: number,
    options?: GitHubPaginationOptions,
  ): Promise<GitHubComment[]>;

  /**
   * Gets the content of a file from a GitHub repository
   * @param filepath
   * @param options
   */
  getFile(
    filepath: string,
    /**
     * commit sha, branch name or tag name
     */
    ref: string,
  ): Promise<WorkspaceFile>;

  /**
   * Searches code in a GitHub repository
   */
  searchCode(query: string, options?: GitHubPaginationOptions): Promise<GitHubCodeSearchResult[]>;

  /**
   * Lists branches in a GitHub repository
   */
  listBranches(options?: GitHubPaginationOptions): Promise<string[]>;

  /**
   * Lists tags in a GitHub repository
   */
  listRepositoryLanguages(): Promise<Record<string, number>>;

  /**
   * List latest releases in a GitHub repository
   * @param options
   */
  listReleases(options?: GitHubPaginationOptions): Promise<GitHubRelease[]>;

  /**
   * Lists tags in a GitHub repository
   */
  getRepositoryContent(
    path?: string,
    options?: {
      ref?: string;
      glob?: string;
      downloadContent?: boolean;
      maxDownloadSize?: number;
      type?: GitHubFile["type"];
    },
  ): Promise<GitHubFile[]>;

  /**
   * Uploads a file to an orphaned branch in the repository and returns the raw url
   * Uploads a single copy of the file using hash as the name.
   * @param file file or data to upload
   * @param options
   */
  uploadAsset(
    file: BufferLike,
    options?: {
      branchName?: string;
    },
  ): Promise<string>;

  /**
   * Resolves user uploaded assets to a short lived URL with access token. Returns undefined if the asset is not found.
   */
  resolveAssetUrl(url: string): Promise<string | undefined>;

  /**
   * Executes a GraphQL query against the GitHub API. By default, injects the `owner`, `repo`, `ref` variables.
   * @param query
   * @param variables
   */
  graphql<T = any>(query: string, variables?: Record<string, any>): Promise<T>;

  /**
   * Gets the underlying Octokit client
   */
  api(): Promise<any>;

  /**
   * Opens a client to a different repository
   * @param owner
   * @param repo
   */
  client(owner: string, repo: string): GitHub;

  /**
   * Create a worktree for a specific GitHub pull request
   * @param pullNumber pull request number
   * @param path path where the worktree should be created
   * @param options additional options
   * @returns Git client opened at the worktree path
   */
  addWorktreeForPullRequest(
    pullNumber: number | string,
    path?: string,
    options?: GitWorktreeAddOptions,
  ): Promise<Git>;

  /**
   * Creates a URL that opens GitHub's new issue form with pre-filled title, body, and assignees
   * @param title The issue title
   * @param body The issue body content (optional)
   * @param assignees Optional array of GitHub usernames to assign to the issue
   * @returns GitHub URL for creating a new issue with pre-filled data
   */
  createIssueUrl(title: string, body?: string, assignees?: string[]): Promise<string>;
}

 interface MDObject {
  /**
   * Parses front matter from markdown
   * @param text
   */
  frontmatter(text: string | WorkspaceFile, format?: "yaml" | "json" | "toml" | "text"): any;

  /**
   * Removes the front matter from the markdown text
   */
  content(text: string | WorkspaceFile): string;

  /**
   * Merges frontmatter with the existing text
   * @param text
   * @param frontmatter
   * @param format
   */
  updateFrontmatter(text: string, frontmatter: unknown, format?: "yaml" | "json"): string;

  /**
   * Attempts to chunk markdown in text section in a way that does not splitting the heading structure.
   * @param text
   * @param options
   */
  chunk(
    text: string | WorkspaceFile,
    options?: { maxTokens?: number; model?: string; pageSeparator?: string },
  ): Promise<TextChunk[]>;

  /**
   * Pretty prints object to markdown
   * @param value
   */
  stringify(
    value: unknown,
    options?: {
      quoteValues?: boolean;
      headings?: number;
      headingLevel?: number;
    },
  ): string;
}

 interface GitHubAIDisclaimerOptions extends Record<string, unknown> {}

 interface JSONLObject {
  /**
   * Parses a JSONL string to an array of objects
   * @param text
   */
  parse(text: string | WorkspaceFile): any[];
  /**
   * Converts objects to JSONL format
   * @param objs
   */
  stringify(objs: unknown[]): string;

  /**
   * Appends an object to a JSONL file
   * @param filename
   * @param obj
   */
  append(name: string, objs: ElementOrArray<unknown>, meta?: any): Promise<void>;
}

 interface INIObject {
  /**
   * Parses a .ini file
   * @param text
   */
  parse(text: string | WorkspaceFile): any;

  /**
   * Converts an object to.ini string
   * @param value
   */
  stringify(value: any): string;
}

 interface JSON5Object {
  /**
   * Parses a JSON/YAML/XML string to an object
   * @param text
   */
  parse(text: string | WorkspaceFile): any;

  /**
   * Renders an object to a JSON5-LLM friendly string
   * @param value
   */
  stringify(value: any): string;
}

 interface CSVStringifyOptions {
  delimiter?: string;
  header?: boolean;
}

/**
 * Interface representing CSV operations.
 */
 interface CSVObject {
  /**
   * Parses a CSV string to an array of objects.
   *
   * @param text - The CSV string to parse.
   * @param options - Optional settings for parsing.
   * @param options.delimiter - The delimiter used in the CSV string. Defaults to ','.
   * @param options.headers - An array of headers to use. If not provided, headers will be inferred from the first row.
   * @returns An array of objects representing the parsed CSV data.
   */
  parse(text: string | WorkspaceFile, options?: CSVParseOptions): object[];

  /**
   * Converts an array of objects to a CSV string.
   *
   * @param csv - The array of objects to convert.
   * @param options - Optional settings for stringifying.
   * @param options.headers - An array of headers to use. If not provided, headers will be inferred from the object keys.
   * @returns A CSV string representing the data.
   */
  stringify(csv: object[], options?: CSVStringifyOptions): string;

  /**
   * Converts an array of objects that represents a data table to a markdown table.
   *
   * @param csv - The array of objects to convert.
   * @param options - Optional settings for markdown conversion.
   * @param options.headers - An array of headers to use. If not provided, headers will be inferred from the object keys.
   * @returns A markdown string representing the data table.
   */
  markdownify(csv: object[], options?: { headers?: string[] }): string;

  /**
   * Splits the original array into chunks of the specified size.
   * @param csv
   * @param rows
   */
  chunk(csv: object[], size: number): { chunkStartIndex: number; rows: object[] }[];
}

/**
 * Provide service for responsible.
 */
 interface ContentSafety {
  /**
   * Service identifier
   */
  id: string;

  /**
   * Scans text for the risk of a User input attack on a Large Language Model.
   * If not supported, the method is not defined.
   */
  detectPromptInjection?(
    content: Awaitable<ElementOrArray<string> | ElementOrArray<WorkspaceFile>>,
  ): Promise<{ attackDetected: boolean; filename?: string; chunk?: string }>;
  /**
   * Analyzes text for harmful content.
   * If not supported, the method is not defined.
   * @param content
   */
  detectHarmfulContent?(
    content: Awaitable<ElementOrArray<string> | ElementOrArray<WorkspaceFile>>,
  ): Promise<{
    harmfulContentDetected: boolean;
    filename?: string;
    chunk?: string;
  }>;
}

 interface HighlightOptions {
  maxLength?: number;
}

 interface WorkspaceFileIndex {
  /**
   * Gets the index name
   */
  name: string;
  /**
   * Uploads or merges files into the index
   */
  insertOrUpdate: (file: ElementOrArray<WorkspaceFile>) => Promise<void>;
  /**
   * Searches the index
   */
  search: (
    query: string,
    options?: { topK?: number; minScore?: number },
  ) => Promise<WorkspaceFileWithScore[]>;
}

 interface VectorIndexOptions extends EmbeddingsModelOptions {
  /**
   * Type of database implementation.
   * - `local` uses a local database using embeddingsModel
   * - `azure_ai_search` uses Azure AI Search
   */
  type?: "local" | "azure_ai_search";
  version?: number;
  deleteIfExists?: boolean;
  chunkSize?: number;
  chunkOverlap?: number;

  /**
   * Max tokens in a request
   */
  maxTokens?: number;

  /**
   * Embeddings vector size
   */
  vectorSize?: number;
  /**
   * Override default embeddings cache name
   */
  cacheName?: string;
  /**
   * Cache salt to invalidate cache entries
   */
  cacheSalt?: string;
}

 interface VectorSearchOptions extends VectorIndexOptions {
  /**
   * Maximum number of embeddings to use
   */
  topK?: number;
  /**
   * Minimum similarity score
   */
  minScore?: number;
  /**
   * Index to use
   */
  indexName?: string;
}

 interface FuzzSearchOptions {
  /**
   * Controls whether to perform prefix search. It can be a simple boolean, or a
   * function.
   *
   * If a boolean is passed, prefix search is performed if true.
   *
   * If a function is passed, it is called upon search with a search term, the
   * positional index of that search term in the tokenized search query, and the
   * tokenized search query.
   */
  prefix?: boolean;
  /**
   * Controls whether to perform fuzzy search. It can be a simple boolean, or a
   * number, or a function.
   *
   * If a boolean is given, fuzzy search with a default fuzziness parameter is
   * performed if true.
   *
   * If a number higher or equal to 1 is given, fuzzy search is performed, with
   * a maximum edit distance (Levenshtein) equal to the number.
   *
   * If a number between 0 and 1 is given, fuzzy search is performed within a
   * maximum edit distance corresponding to that fraction of the term length,
   * approximated to the nearest integer. For example, 0.2 would mean an edit
   * distance of 20% of the term length, so 1 character in a 5-characters term.
   * The calculated fuzziness value is limited by the `maxFuzzy` option, to
   * prevent slowdown for very long queries.
   */
  fuzzy?: boolean | number;
  /**
   * Controls the maximum fuzziness when using a fractional fuzzy value. This is
   * set to 6 by default. Very high edit distances usually don't produce
   * meaningful results, but can excessively impact search performance.
   */
  maxFuzzy?: number;
  /**
   * Maximum number of results to return
   */
  topK?: number;
  /**
   * Minimum score
   */
  minScore?: number;
}

 interface Retrieval {
  /**
   * Executers a web search with Tavily or Bing Search.
   * @param query
   */
  webSearch(
    query: string,
    options?: {
      count?: number;
      provider?: "tavily" | "bing";
      /**
       * Return undefined when no web search providers are present
       */
      ignoreMissingProvider?: boolean;
    },
  ): Promise<WorkspaceFile[]>;

  /**
   * Search using similarity distance on embeddings
   */
  vectorSearch(
    query: string,
    files: (string | WorkspaceFile) | (string | WorkspaceFile)[],
    options?: VectorSearchOptions,
  ): Promise<WorkspaceFile[]>;

  /**
   * Loads or creates a file index using a vector index
   * @param options
   */
  index(id: string, options?: VectorIndexOptions): Promise<WorkspaceFileIndex>;

  /**
   * Performs a fuzzy search over the files
   * @param query keywords to search
   * @param files list of files
   * @param options fuzzing configuration
   */
  fuzzSearch(
    query: string,
    files: WorkspaceFile | WorkspaceFile[],
    options?: FuzzSearchOptions,
  ): Promise<WorkspaceFile[]>;
}

 interface ArrayFilter {
  /**
   * Selects the first N elements from the data
   */
  sliceHead?: number;
  /**
   * Selects the last N elements from the data
   */
  sliceTail?: number;
  /**
   * Selects the a random sample of N items in the collection.
   */
  sliceSample?: number;
}

 interface DataFilter extends ArrayFilter {
  /**
   * The keys to select from the object.
   * If a key is prefixed with -, it will be removed from the object.
   */
  headers?: ElementOrArray<string>;
  /**
   * Removes items with duplicate values for the specified keys.
   */
  distinct?: ElementOrArray<string>;
  /**
   * Sorts the data by the specified key(s)
   */
  sort?: ElementOrArray<string>;
}

 interface DefDataOptions
  extends Omit<ContextExpansionOptions, "maxTokens">,
    FenceFormatOptions,
    DataFilter,
    ContentSafetyOptions {
  /**
   * Output format in the prompt. Defaults to Markdown table rendering.
   */
  format?: "json" | "yaml" | "csv";

  /**
   * GROQ query to filter the data
   * @see https://groq.dev/
   */
  query?: string;
}

 interface DefSchemaOptions {
  /**
   * Output format in the prompt.
   */
  format?: "typescript" | "json" | "yaml";
}

 type ChatFunctionArgs = { context: ToolCallContext } & Record<string, any>;
 type ChatFunctionHandler = (args: ChatFunctionArgs) => Awaitable<ToolCallOutput>;
 type ChatMessageRole = "user" | "assistant" | "system";

 interface HistoryMessageUser {
  role: "user";
  content: string;
}

 interface HistoryMessageAssistant {
  role: "assistant";
  name?: string;
  content: string;
}

 interface WriteTextOptions extends ContextExpansionOptions {
  /**
   * Append text to the assistant response. This feature is not supported by all models.
   * @deprecated
   */
  assistant?: boolean;
  /**
   * Specifies the message role. Default is user
   */
  role?: ChatMessageRole;
}

 type PromptGenerator = (ctx: ChatGenerationContext) => Awaitable<unknown>;

 interface PromptGeneratorOptions
  extends ModelOptions,
    PromptSystemOptions,
    ContentSafetyOptions,
    SecretDetectionOptions,
    MetadataOptions {
  /**
   * Label for trace
   */
  label?: string;

  /**
   * Write file edits to the file system
   */
  applyEdits?: boolean;

  /**
   * Throws if the generation is not successful
   */
  throwOnError?: boolean;
}

 interface FileOutputOptions {
  /**
   * Schema identifier to validate the generated file
   */
  schema?: string;
}

 interface FileOutput {
  pattern: string[];
  description?: string;
  options?: FileOutputOptions;
}

 interface ImportTemplateOptions {
  /**
   * Ignore unknown arguments
   */
  allowExtraArguments?: boolean;

  /**
   * Template engine syntax
   */
  format?: "mustache" | "jinja";
}

 interface PromptTemplateString {
  /**
   * Set a priority similar to CSS z-index
   * to control the trimming of the prompt when the context is full
   * @param priority
   */
  priority(value: number): PromptTemplateString;
  /**
   * Sets the context layout flex weight
   */
  flex(value: number): PromptTemplateString;
  /**
   * Applies jinja template to the string lazily
   * @param data jinja data
   */
  jinja(data: Record<string, any>): PromptTemplateString;
  /**
   * Applies mustache template to the string lazily
   * @param data mustache data
   */
  mustache(data: Record<string, any>): PromptTemplateString;
  /**
   * Sets the max tokens for this string
   * @param tokens
   */
  maxTokens(tokens: number): PromptTemplateString;

  /**
   * Updates the role of the message
   */
  role(role: ChatMessageRole): PromptTemplateString;

  /**
   * Configure the cacheability of the prompt.
   * @param value cache control type
   */
  cacheControl(value: PromptCacheControlType): PromptTemplateString;
}

 type ImportTemplateArgumentType =
  | Awaitable<string | number | boolean>
  | (() => Awaitable<string | number | boolean>);

/**
 * Represents the context for generating a chat turn in a prompt template.
 * Provides methods for importing templates, writing text, adding assistant responses,
 * creating template strings, fencing code blocks, defining variables, and logging.
 */
 interface ChatTurnGenerationContext {
  importTemplate(
    files: ElementOrArray<string | WorkspaceFile>,
    templateArguments?: Record<string, ImportTemplateArgumentType>,
    options?: ImportTemplateOptions,
  ): void;
  writeText(body: Awaitable<string>, options?: WriteTextOptions): void;
  assistant(text: Awaitable<string>, options?: Omit<WriteTextOptions, "assistant">): void;
  $(strings: TemplateStringsArray, ...args: any[]): PromptTemplateString;
  fence(body: StringLike, options?: FenceOptions): void;
  def(
    name: string,
    body: string | WorkspaceFile | WorkspaceFile[] | ShellOutput | Fenced | RunPromptResult,
    options?: DefOptions,
  ): string;
  defImages(files: ElementOrArray<BufferLike>, options?: DefImagesOptions): void;
  defData(name: string, data: Awaitable<object[] | object>, options?: DefDataOptions): string;
  defDiff<T extends string | WorkspaceFile>(
    name: string,
    left: T,
    right: T,
    options?: DefDiffOptions,
  ): string;
  console: PromptGenerationConsole;
}

 interface FileUpdate {
  before: string;
  after: string;
  validation?: FileEditValidation;
}

 interface RunPromptResultPromiseWithOptions extends Promise<RunPromptResult> {
  options(values?: PromptGeneratorOptions): RunPromptResultPromiseWithOptions;
}

 interface DefToolOptions extends ContentSafetyOptions {
  /**
   * Maximum number of tokens per tool content response
   */
  maxTokens?: number;

  /**
   * Suffix to identify the variant instantiation of the tool
   */
  variant?: string;

  /**
   * Updated description for the variant
   */
  variantDescription?: string;

  /**
   * Intent of the tool that will be used for LLM judge validation of the output.
   * `description` uses the tool description as the intent.
   * If the intent is a function, it must build a LLM-as-Judge prompt that emits OK/ERR categories.
   */
  intent?:
    | OptionsOrString<"description">
    | ((options: {
        tool: ToolDefinition;
        args: any;
        result: string;
        generator: ChatGenerationContext;
      }) => Awaitable<void>);
}

 interface DefAgentOptions extends Omit<PromptGeneratorOptions, "label">, DefToolOptions {
  /**
   * Excludes agent conversation from agent memory
   */
  disableMemory?: boolean;

  /**
   * Disable memory query on each query (let the agent call the tool)
   */
  disableMemoryQuery?: boolean;
}

 type ChatAgentHandler = (
  ctx: ChatGenerationContext,
  args: ChatFunctionArgs,
) => Awaitable<unknown>;

 interface McpToolSpecification {
  /**
   * Tool identifier
   */
  id: string;
  /**
   * The high level intent of the tool, which can be used for LLM judge validation.
   * `description` uses the tool description as the intent.
   */
  intent?: DefToolOptions["intent"];
}

 interface McpServerConfig extends ContentSafetyOptions {
  /**
   * The executable to run to start the server.
   * Required for stdio transport, not used for URL-based transports.
   */
  command?: OptionsOrString<"npx" | "uv" | "uvx" | "dotnet" | "docker" | "cargo">;
  /**
   * Command line arguments to pass to the executable.
   * Required for stdio transport, not used for URL-based transports.
   */
  args?: string[];
  /**
   * The URL to connect to for HTTP/WebSocket/SSE transports.
   * When provided, command and args are ignored.
   */
  url?: string;
  /**
   * The transport type to use. If not specified, will be inferred from the configuration.
   * - "stdio": Use StdioClientTransport (requires command and args)
   * - "http": Use StreamableHTTPClientTransport (requires url)
   * - "sse": Use SSEClientTransport (requires url)
   */
  type?: "stdio" | "http" | "sse";
  /**
   * The server version
   */
  version?: string;
  /**
   * The environment to use when spawning the process.
   *
   * If not specified, the result of getDefaultEnvironment() will be used.
   * Only used for stdio transport.
   */
  env?: Record<string, string>;
  /**
   * The working directory to use when spawning the process.
   *
   * If not specified, the current working directory will be inherited.
   * Only used for stdio transport.
   */
  cwd?: string;

  /**
   * Do not prepend client identifier with the tool id.
   */
  disableToolIdMangling?: boolean;

  id: string;
  options?: DefToolOptions;

  /**
   * A list of allowed tools and their specifications. This filtering is applied
   * before computing the sha signature.
   */
  tools?: ElementOrArray<string | McpToolSpecification>;

  /**
   * The sha signature of the tools returned by the server.
   * If set, the tools will be validated against this sha.
   * This is used to ensure that the tools are not modified by the server.
   */
  toolsSha?: string;

  /**
   * Validates that each tool has responses related to their description.
   */
  intent?: DefToolOptions["intent"];

  generator?: ChatGenerationContext;
}

 type McpServersConfig = Record<string, Omit<McpServerConfig, "id" | "options">> | string;

 interface McpAgentServerConfig extends McpServerConfig {
  description: string;
  instructions?: string;
  /**
   * Maximum number of tokens per tool content response
   */
  maxTokens?: number;
}

 type McpAgentServersConfig =
  | Record<string, Omit<McpAgentServerConfig, "id" | "options">>
  | string;

 type ZodTypeLike = { _def: any; safeParse: any; refine: any };

 type BufferLike =
  | string
  | WorkspaceFile
  | Buffer
  | Blob
  | ArrayBuffer
  | Uint8Array
  | ReadableStream
  | SharedArrayBuffer;

 type TranscriptionModelType = OptionsOrString<
  "openai:whisper-1" | "openai:gpt-4o-transcribe" | "whisperasr:default"
>;

 interface ImageGenerationOptions extends ImageTransformOptions, RetryOptions {
  model?: OptionsOrString<ModelImageGenerationType>;
  /**
   * The quality of the image that will be generated.
   * auto (default value) will automatically select the best quality for the given model.
   * high, medium and low are supported for gpt-image-1.
   * high is supported for dall-e-3.
   * dall-e-2 ignores this flag
   */
  quality?: "auto" | "low" | "medium" | "high";
  /**
   * Image size.
   * For gpt-image-1: 1024x1024, 1536x1024 (landscape), 1024x1536 (portrait), or auto (default value)
   * For dall-e: 256x256, 512x512, or 1024x1024 for dall-e-2, and one of 1024x1024, 1792x1024.
   */
  size?: OptionsOrString<
    | "auto"
    | "landscape"
    | "portrait"
    | "square"
    | "1536x1024"
    | "1024x1536"
    | "256x256"
    | "512x512"
    | "1024x1024"
    | "1024x1792"
    | "1792x1024"
  >;
  /**
   * Only used for DALL-E 3
   */
  style?: OptionsOrString<"vivid" | "natural">;

  /**
   * For gpt-image-1 only, the type of image format to generate.
   */
  outputFormat?: "png" | "jpeg" | "webp";

  /**
   * Generation mode. Defaults to "generate".
   * - "generate": Create new images from text prompts
   * - "edit": Edit existing images using text prompts and optional masks
   */
  mode?: "generate" | "edit";

  /**
   * Input image for edit mode.
   * Required for "edit" mode.
   */
  image?: BufferLike;

  /**
   * Mask image for edit mode (optional).
   * Used to specify which parts of the image to edit.
   * Only applicable in "edit" mode.
   */
  mask?: BufferLike;
}

 interface TranscriptionOptions extends CacheOptions, RetryOptions {
  /**
   * Model to use for transcription. By default uses the `transcribe` alias.
   */
  model?: TranscriptionModelType;

  /**
   * Translate to English.
   */
  translate?: boolean;

  /**
   * Input language in iso-639-1 format.
   * @see https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes
   */
  language?: string;

  /**
   * The sampling temperature, between 0 and 1.
   * Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
   */
  temperature?: number;
}

 interface TranscriptionResult {
  /**
   * Complete transcription text
   */
  text: string;
  /**
   * Error if any
   */
  error?: SerializedError;

  /**
   * SubRip subtitle string from segments
   */
  srt?: string;

  /**
   * WebVTT subtitle string from segments
   */
  vtt?: string;

  /**
   * Individual segments
   */
  segments?: (TranscriptionSegment & {
    /**
     * Seek offset of the segment
     */
    seek?: number;
    /**
     * Temperature used for the generation of the segment
     */
    temperature?: number;
  })[];
}

 type SpeechModelType = OptionsOrString<
  "openai:tts-1-hd" | "openai:tts-1" | "openai:gpt-4o-mini-tts"
>;

 type SpeechVoiceType = OptionsOrString<
  | "alloy"
  | "ash"
  | "coral"
  | "echo"
  | "fable"
  | "onyx"
  | "nova"
  | "sage"
  | "shimmer"
  | "verse"
  | "ballad"
>;

 interface SpeechOptions extends CacheOptions, RetryOptions {
  /**
   * Speech to text model
   */
  model?: SpeechModelType;

  /**
   * Voice to use (model-specific)
   */
  voice?: SpeechVoiceType;

  /**
   * Control the voice of your generated audio with additional instructions. Does not work with tts-1 or tts-1-hd.
   */
  instructions?: string;
}

 interface SpeechResult {
  /**
   * Generate audio-buffer file
   */
  filename?: string;
  /**
   * Error if any
   */
  error?: SerializedError;
}

 interface ChatGenerationContext extends ChatTurnGenerationContext {
  env: ExpansionVariables;
  defSchema(name: string, schema: JSONSchema | ZodTypeLike, options?: DefSchemaOptions): string;
  defTool(
    tool: Omit<ToolCallback, "generator"> | McpServersConfig | McpClient,
    options?: DefToolOptions,
  ): void;
  defTool(
    name: string,
    description: string,
    parameters: PromptParametersSchema | JSONSchema,
    fn: ChatFunctionHandler,
    options?: DefToolOptions,
  ): void;
  defAgent(
    name: string,
    description: string,
    fn: string | ChatAgentHandler,
    options?: DefAgentOptions,
  ): void;
  defChatParticipant(participant: ChatParticipantHandler, options?: ChatParticipantOptions): void;
  defFileOutput(
    pattern: ElementOrArray<string | WorkspaceFile>,
    description: string,
    options?: FileOutputOptions,
  ): void;
  runPrompt(
    generator: string | PromptGenerator,
    options?: PromptGeneratorOptions,
  ): Promise<RunPromptResult>;
  prompt(strings: TemplateStringsArray, ...args: any[]): RunPromptResultPromiseWithOptions;
  defFileMerge(fn: FileMergeHandler): void;
  defOutputProcessor(fn: PromptOutputProcessorHandler): void;
  transcribe(
    audio: string | WorkspaceFile,
    options?: TranscriptionOptions,
  ): Promise<TranscriptionResult>;
  speak(text: string, options?: SpeechOptions): Promise<SpeechResult>;
  generateImage(
    prompt: string,
    options?: ImageGenerationOptions,
  ): Promise<{ image: WorkspaceFile; revisedPrompt?: string }>;
}

 interface ChatGenerationContextOptions {
  /**
   * Prompt generation context
   */
  generator?: ChatGenerationContext;
}

 interface GenerationOutput {
  /**
   * full chat history
   */
  messages: ChatMessage[];

  /**
   * LLM output.
   */
  text: string;

  /**
   * Reasoning produced by model
   */
  reasoning?: string;

  /**
   * Parsed fence sections
   */
  fences: Fenced[];

  /**
   * Parsed data sections
   */
  frames: DataFrame[];

  /**
   * A map of file updates
   */
  fileEdits: Record<string, FileUpdate>;

  /**
   * Generated annotations
   */
  annotations: Diagnostic[];

  /**
   * Schema definition used in the generation
   */
  schemas: Record<string, JSONSchema>;

  /**
   * Output as JSON if parsable
   */
  json?: any;

  /**
   * Usage stats
   */
  usage?: RunPromptUsage;
}

 type Point = {
  row: number;
  column: number;
};

 interface DebugLogger {
  /**
   * Creates a debug logging function. Debug uses printf-style formatting. Below are the officially supported formatters:
   * - `%O`	Pretty-print an Object on multiple lines.
   * - `%o`	Pretty-print an Object all on a single line.
   * - `%s`	String.
   * - `%d`	Number (both integer and float).
   * - `%j`	JSON. Replaced with the string '[Circular]' if the argument contains circular references.
   * - `%%`	Single percent sign ('%'). This does not consume an argument.
   * @param category
   * @see https://www.npmjs.com/package/debug
   */
  (formatter: any, ...args: any[]): void;
  /**
   * Indicates if this logger is enabled
   */
  enabled: boolean;
  /**
   * The namespace of the logger provided when calling 'host.logger'
   */
  namespace: string;
}

 interface LoggerHost {
  /**
   * Creates a debug logging function. Debug uses printf-style formatting. Below are the officially supported formatters:
   * - `%O`	Pretty-print an Object on multiple lines.
   * - `%o`	Pretty-print an Object all on a single line.
   * - `%s`	String.
   * - `%d`	Number (both integer and float).
   * - `%j`	JSON. Replaced with the string '[Circular]' if the argument contains circular references.
   * - `%%`	Single percent sign ('%'). This does not consume an argument.
   * @param category
   * @see https://www.npmjs.com/package/debug
   */
  logger(category: string): DebugLogger;
}

 interface ShellOptions {
  cwd?: string;

  stdin?: string;

  /**
   * Process timeout in  milliseconds, default is 60s
   */
  timeout?: number;
  /**
   * trace label
   */
  label?: string;

  /**
   * Ignore exit code errors
   */
  ignoreError?: boolean;

  /**
   * Additional environment variables to set for the process.
   */
  env?: Record<string, string>;

  /**
   * Inject the content of 'env' exclusively
   */
  isolateEnv?: boolean;
}

 interface ShellOutput {
  stdout?: string;
  stderr?: string;
  exitCode: number;
  failed?: boolean;
}

 interface TimeoutOptions {
  /**
   * Maximum time in milliseconds. Default to no timeout
   */
  timeout?: number;
}

 interface ShellSelectOptions {}

 interface ShellSelectChoice {
  name?: string;
  value: string;
  description?: string;
}

 interface ShellInputOptions {
  required?: boolean;
}

 interface ShellConfirmOptions {
  default?: boolean;
}

 interface ShellHost {
  /**
   * Executes a shell command
   * @param command
   * @param args
   * @param options
   */
  exec(commandWithArgs: string, options?: ShellOptions): Promise<ShellOutput>;
  exec(command: string, args: string[], options?: ShellOptions): Promise<ShellOutput>;
}

 interface McpToolReference {
  name: string;
  description?: string;
  inputSchema?: JSONSchema;
}

 interface McpResourceReference {
  name?: string;
  description?: string;
  uri: string;
  mimeType?: string;
}

 interface McpServerToolResultTextPart {
  type: "text";
  text: string;
}

 interface McpServerToolResultImagePart {
  type: "image";
  data: string;
  mimeType: string;
}

 interface McpServerToolResourcePart {
  type: "resource";
  text?: string;
  uri?: string;
  mimeType?: string;
  blob?: string;
}

 type McpServerToolResultPart =
  | McpServerToolResultTextPart
  | McpServerToolResultImagePart
  | McpServerToolResourcePart;

 interface McpServerToolResult {
  isError?: boolean;
  content: McpServerToolResultPart[];
  text?: string;
}

 interface McpClient extends AsyncDisposable {
  /**
   * Configuration of the server
   */
  readonly config: McpServerConfig;

  /**
   * Pings the server
   */
  ping(): Promise<void>;

  /**
   * List all available MCP tools
   */
  listTools(): Promise<McpToolReference[]>;

  /**
   * Returns a list of tools that can be used in a chat session
   */
  listToolCallbacks(): Promise<ToolCallback[]>;

  /**
   * List resources available in the server
   */
  listResources(): Promise<McpResourceReference[]>;

  /**
   * Reads the resource content
   */
  readResource(uri: string): Promise<WorkspaceFile[]>;

  /**
   *
   * @param name Call the MCP tool
   * @param args
   */
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  callTool(name: string, args: Record<string, any>): Promise<McpServerToolResult>;

  /**
   * Closes clients and server.
   */
  dispose(): Promise<void>;
}

 interface McpHost {
  /**
   * Starts a Model Context Protocol server and returns a client.
   */
  mcpServer(config: McpServerConfig): Promise<McpClient>;
}

 interface ResourceReference {
  uri: string; // Unique identifier for the resource
  name: string; // Human-readable name
  description?: string; // Optional description
  mimeType?: string; // Optional MIME type
}

 interface ResourceHost {
  /**
   * Publishes a resource that will be exposed through the MCP server protocol.
   * @param content
   */
  publishResource(
    name: string,
    content: BufferLike,
    options?: Partial<Pick<ResourceReference, "description" | "mimeType">> & SecretDetectionOptions,
  ): Promise<string>;

  /**
   * List available resource references
   */
  resources(): Promise<ResourceReference[]>;

  /**
   * Tries to resolve a resource from a URL.
   * @param url - The URL to resolve.
   * @returns A promise that resolves to an object containing the parsed URI and resolved files, or undefined if resolution fails.
   */
  resolveResource(url: string): Promise<{ uri: URL; files: WorkspaceFile[] } | undefined>;
}

 interface UserInterfaceHost {
  /**
   * Asks the user to select between options
   * @param message question to ask
   * @param options options to select from
   */
  select(
    message: string,
    choices: (string | ShellSelectChoice)[],
    options?: ShellSelectOptions,
  ): Promise<string>;

  /**
   * Asks the user to input a text
   * @param message message to ask
   */
  input(message: string, options?: ShellInputOptions): Promise<string>;

  /**
   * Asks the user to confirm a message
   * @param message message to ask
   */
  confirm(message: string, options?: ShellConfirmOptions): Promise<boolean>;
}

 interface ContainerPortBinding {
  containerPort: OptionsOrString<"8000/tcp">;
  hostPort: string | number;
}

 interface ContainerOptions {
  /**
   * Container image names.
   * @example python:alpine python:slim python
   * @see https://hub.docker.com/_/python/
   */
  image?: OptionsOrString<"python:alpine" | "python:slim" | "python" | "node" | "gcc">;

  /**
   * Enable networking in container (disabled by default)
   */
  networkEnabled?: boolean;

  /**
   * Environment variables in container. A null/undefined variable is removed from the environment.
   */
  env?: Record<string, string>;

  /**
   * Assign the specified name to the container. Must match [a-zA-Z0-9_-]+.
   */
  name?: string;

  /**
   * Disable automatic purge of container and volume directory and potentially reuse with same name, configuration.
   */
  persistent?: boolean;

  /**
   * List of exposed TCP ports
   */
  ports?: ElementOrArray<ContainerPortBinding>;

  /**
   * Commands to executes after the container is created
   */
  postCreateCommands?: ElementOrArray<string>;

  /**
   * Container operating system type. Determines path separator used for working directories.
   * Defaults to "unix" for compatibility with most Linux-based containers.
   */
  osType?: "unix" | "windows";
}

 interface PromiseQueue {
  /**
   * Adds a new promise to the queue
   * @param fn
   */
  add<Arguments extends unknown[], ReturnType>(
    function_: (...arguments_: Arguments) => Awaitable<ReturnType>,
    ...arguments_: Arguments
  ): Promise<ReturnType>;

  /**
   * Runs all the functions in the queue with limited concurrency
   * @param fns
   */
  all<T = any>(fns: (() => Awaitable<T>)[]): Promise<T[]>;

  /**
   * Applies a function to all the values in the queue with limited concurrency
   * @param values
   * @param fn
   */
  mapAll<T extends unknown, Arguments extends unknown[], ReturnType>(
    values: T[],
    fn: (value: T, ...arguments_: Arguments) => Awaitable<ReturnType>,
    ...arguments_: Arguments
  ): Promise<ReturnType[]>;
}

 interface LanguageModelReference {
  provider: ModelProviderType;
  model: ModelType;
  modelId: string;
}

 interface LanguageModelInfo {
  id: ModelType;
  details?: string;
  url?: string;
  version?: string;
  /**
   * Base model name
   */
  family?: string;
}

 interface LanguageModelProviderInfo {
  id: ModelProviderType;
  version?: string;
  error?: string;
  models: LanguageModelInfo[];
  base?: string;
  token?: string; // Optional token for the provider
}

 interface LanguageModelHost {
  /**
   * Resolve a language model alias to a provider and model based on the current configuration
   * @param modelId
   */
  resolveLanguageModel(modelId?: ModelType): Promise<LanguageModelReference>;

  /**
   * Returns the status of the model provider and list of models if available
   */
  resolveLanguageModelProvider(
    provider: ModelProviderType,
    options?: {
      // If true, returns the list of models available in the provider
      listModels?: boolean;
      // If true, return the token
      token?: boolean;
    },
  ): Promise<LanguageModelProviderInfo>;
}

 type ContentSafetyProvider = "azure";

 interface ContentSafetyHost {
  /**
   * Resolve a content safety client
   * @param id safety detection project
   */
  contentSafety(id?: ContentSafetyProvider): Promise<ContentSafety>;
}

 interface RetryOptions {
  retryOn?: number[]; // HTTP status codes to retry on
  retries?: number; // Number of retry attempts
  retryDelay?: number; // Initial delay between retries
  maxDelay?: number; // Maximum delay between retries
  maxRetryAfter?: number; // Maximum retry-after in milliseconds before giving up
}

 interface CacheOptions {
  /**
   * By default, LLM queries are not cached.
   * If true, the LLM request will be cached. Use a string to override the default cache name
   */
  cache?: boolean | string;
}

 type FetchOptions = RequestInit & RetryOptions;

 type FetchTextOptions = Omit<FetchOptions, "body" | "signal" | "window"> & {
  convert?: "markdown" | "text" | "tables";
};

 interface FetchHost {
  /**
   * A fetch wrapper with proxy, retry and timeout handling.
   */
  fetch(input: string | URL | globalThis.Request, init?: FetchOptions): Promise<Response>;

  /**
   * A function that fetches text from a URL or a file
   * @param url
   * @param options
   */
  fetchText(
    url: string | WorkspaceFile,
    options?: FetchTextOptions,
  ): Promise<{
    ok: boolean;
    status: number;
    text?: string;
    file?: WorkspaceFile;
  }>;
}

 interface PromptHost
  extends ShellHost,
    LoggerHost,
    McpHost,
    ResourceHost,
    UserInterfaceHost,
    LanguageModelHost,
    ContentSafetyHost,
    FetchHost {
  /**
   * Opens a in-memory key-value cache for the given cache name. Entries are dropped when the cache grows too large.
   * @param cacheName
   */
  cache<K = any, V = any>(cacheName: string): Promise<WorkspaceFileCache<K, V>>;

  /**
   * Starts a container
   * @param options container creation options
   */
  container(options?: ContainerOptions): Promise<ContainerHost>;

  /**
   * Create a new promise queue to run async functions with limited concurrency
   */
  promiseQueue(concurrency: number): PromiseQueue;

  /**
   * Gets a client to a Microsoft Teams channel from a share link URL;
   * uses `GENAISCRIPT_TEAMS_CHANNEL_URL` environment variable if `shareUrl` is not provided.
   * Uses Azure CLI login for authentication.
   * @param url
   */
  teamsChannel(shareUrl?: string): Promise<MessageChannelClient>;
}

 interface WorkspaceFileWithDescription extends WorkspaceFile {
  /**
   * File description used for videos.
   */
  description?: string;
}

/**
 * A client to a messaging channel
 */
 interface MessageChannelClient {
  /**
   * Posts a message with attachments to the channel
   * @param message
   * @param options
   */
  postMessage(
    message: string,
    options?: {
      /**
       * File attachments that will be added in the channel folder
       */
      files?: (string | WorkspaceFileWithDescription)[];
      /**
       * Sets to false to remove AI generated disclaimer
       */
      disclaimer?: boolean | string;
    },
  ): Promise<string>;
}

 interface ContainerHost extends ShellHost {
  /**
   * Container unique identifier in provider
   */
  id: string;

  /**
   * Name assigned to the container. For persistent containers, also contains the sha of the options
   */
  name: string;

  /**
   * Disable automatic purge of container and volume directory
   */
  persistent: boolean;

  /**
   * Path to the volume mounted in the host
   */
  hostPath: string;

  /**
   * Writes a file as text to the container file system
   * @param path
   * @param content
   */
  writeText(path: string, content: string): Promise<void>;

  /**
   * Reads a file as text from the container mounted volume
   * @param path
   */
  readText(path: string): Promise<string>;

  /**
   * Copies a set of files into the container
   * @param fromHost glob matching files
   * @param toContainer directory in the container
   */
  copyTo(
    fromHost: string | string[],
    toContainer: string,
    options?: Omit<FindFilesOptions, "readText">,
  ): Promise<string[]>;

  /**
   * List files in a directory in the container
   * @param dir
   */
  listFiles(dir: string): Promise<string[]>;

  /**
   * Stops and cleans out the container
   */
  stop(): Promise<void>;

  /**
   * Pause container
   */
  pause(): Promise<void>;

  /**
   * Resume execution of the container
   */
  resume(): Promise<void>;

  /**
   * Force disconnect network
   */
  disconnect(): Promise<void>;

  /**
   * A promise queue of concurrency 1 to run serialized functions against the container
   */
  scheduler: PromiseQueue;
}

 interface PromptContext extends ChatGenerationContext {
  script(options: PromptArgs): void;
  system(options: PromptSystemArgs): void;
  path: Path;
  retrieval: Retrieval;
  workspace: WorkspaceFileSystem;
  host: PromptHost;
}

 type RuntimePromptContext = Pick<
  PromptContext,
  | "host"
  | "env"
  | "workspace"
  | "retrieval"
  | "prompt"
  | "runPrompt"
  | "generateImage"
  | "transcribe"
  | "speak"
>;
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// keep in sync with PromptContext!

/**
 * Console functions
 */
declare let console: PromptGenerationConsole;

/**
 * Setup prompt title and other parameters.
 * Exactly one call should be present on top of .genai.mts file.
 */
declare function script(options: PromptArgs): void;

/**
 * Equivalent of script() for system prompts.
 */
declare function system(options: PromptSystemArgs): void;

/**
 * Imports template prompt file and expands arguments in it.
 * @param files
 * @param arguments
 */
declare function importTemplate(
  files: ElementOrArray<string | WorkspaceFile>,
  arguments?: Record<string, ImportTemplateArgumentType>,
  options?: ImportTemplateOptions,
): void;

/**
 * Append given string to the prompt. It automatically appends "\n".
 * Typically best to use `` $`...` ``-templates instead.
 */
declare function writeText(body: Awaitable<string>, options?: WriteTextOptions): void;

/**
 * Append given string to the prompt as an assistant message.
 */
declare function assistant(
  text: Awaitable<string>,
  options?: Omit<WriteTextOptions, "assistant">,
): void;

/**
 * Append given string to the prompt. It automatically appends "\n".
 * `` $`foo` `` is the same as `text("foo")`.
 */
declare function $(strings: TemplateStringsArray, ...args: any[]): PromptTemplateString;

/**
 * Appends given (often multi-line) string to the prompt, surrounded in fences.
 * Similar to `text(env.fence); text(body); text(env.fence)`
 *
 * @param body string to be fenced
 */
declare function fence(body: StringLike, options?: FenceOptions): void;

/**
 * Defines `name` to be the (often multi-line) string `body`.
 * Similar to `text(name + ":"); fence(body, language)`
 *
 * @param name name of defined entity, eg. "NOTE" or "This is text before NOTE"
 * @param body string to be fenced/defined
 * @returns variable name
 */
declare function def(
  name: string,
  body: string | WorkspaceFile | WorkspaceFile[] | ShellOutput | Fenced | RunPromptResult,
  options?: DefOptions,
): string;

/**
 * Declares a file that is expected to be generated by the LLM
 * @param pattern file name or glob-like path
 * @param description description of the file, used by the model to choose when and how to call the function
 * @param options expectations about the generated file content
 */
declare function defFileOutput(
  pattern: ElementOrArray<string | WorkspaceFile>,
  description?: string,
  options?: FileOutputOptions,
): void;

/**
 * Declares a tool that can be called from the prompt.
 * @param tool Agentic tool function.
 * @param name The name of the tool to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
 * @param description A description of what the function does, used by the model to choose when and how to call the function.
 * @param parameters The parameters the tool accepts, described as a JSON Schema object.
 * @param fn callback invoked when the LLM requests to run this function
 */
declare function defTool(
  tool: Omit<ToolCallback, "generator"> | McpServersConfig,
  options?: DefToolOptions,
): void;
declare function defTool(
  name: string,
  description: string,
  parameters: PromptParametersSchema | JSONSchema,
  fn: ChatFunctionHandler,
  options?: DefToolOptions,
): void;

/**
 * Declares a LLM agent tool that can be called from the prompt.
 * @param name name of the agent, do not prefix with agent
 * @param description description of the agent, used by the model to choose when and how to call the agent
 * @param fn prompt generation context
 * @param options additional options for the agent LLM
 */
declare function defAgent(
  name: string,
  description: string,
  fn: string | ChatAgentHandler,
  options?: DefAgentOptions,
): void;

/**
 * Registers a callback to be called when a file is being merged
 * @param fn
 */
declare function defFileMerge(fn: FileMergeHandler): void;

/**
 * Variables coming from the fragment on which the prompt is operating.
 */
declare let env: ExpansionVariables;

/**
 * Path manipulation functions.
 */
declare let path: Path;

/**
 * A set of parsers for well-known file formats
 */
declare let parsers: Parsers;

/**
 * Retrieval Augmented Generation services
 */
declare let retrieval: Retrieval;

/**
 * Access to the workspace file system.
 */
declare let workspace: WorkspaceFileSystem;

/**
 * YAML parsing and stringifying functions.
 */
declare let YAML: YAMLObject;

/**
 * INI parsing and stringifying.
 */
declare let INI: INIObject;

/**
 * CSV parsing and stringifying.
 */
declare let CSV: CSVObject;

/**
 * XML parsing and stringifying.
 */
declare let XML: XMLObject;

/**
 * HTML parsing
 */
declare let HTML: HTMLObject;

/**
 * Markdown and frontmatter parsing.
 */
declare let MD: MDObject;

/**
 * JSONL parsing and stringifying.
 */
declare let JSONL: JSONLObject;

/**
 * JSON5 parsing
 */
declare let JSON5: JSON5Object;

/**
 * JSON Schema utilities
 */
declare let JSONSchema: JSONSchemaUtilities;

/**
 * Diff utilities
 */
declare let DIFF: DIFFObject;

/**
 * Access to current LLM chat session information
 */
declare let host: PromptHost;

/**
 * Access to GitHub queries for the current repository
 */
declare let github: GitHub;

/**
 * Access to Git operations for the current repository
 */
declare let git: Git;

/**
 * Access to ffmpeg operations
 */
declare let ffmpeg: Ffmpeg;

/**
 * Computation around tokens
 */
declare let tokenizers: Tokenizers;

/**
 * @deprecated use `host.fetchText` instead
 */
declare function fetchText(
  url: string | WorkspaceFile,
  options?: FetchTextOptions,
): Promise<{ ok: boolean; status: number; text?: string; file?: WorkspaceFile }>;

/**
 * Declares a JSON schema variable.
 * @param name name of the variable
 * @param schema JSON schema instance
 * @returns variable name
 */
declare function defSchema(
  name: string,
  schema: JSONSchema | ZodTypeLike,
  options?: DefSchemaOptions,
): string;

/**
 * Adds images to the prompt
 * @param files
 * @param options
 */
declare function defImages(files: ElementOrArray<BufferLike>, options?: DefImagesOptions): void;

/**
 * Renders a table or object in the prompt
 * @param name
 * @param data
 * @param options
 * @returns variable name
 */
declare function defData(
  name: string,
  data: Awaitable<object[] | object>,
  options?: DefDataOptions,
): string;

/**
 * Renders a diff of the two given values
 * @param left
 * @param right
 * @param options
 */
declare function defDiff<T extends string | WorkspaceFile>(
  name: string,
  left: T,
  right: T,
  options?: DefDiffOptions,
): string;

/**
 * Cancels the current prompt generation/execution with the given reason.
 * @param reason
 */
declare function cancel(reason?: string): void;

/**
 * Expands and executes prompt
 * @param generator
 */
declare function runPrompt(
  generator: string | PromptGenerator,
  options?: PromptGeneratorOptions,
): Promise<RunPromptResult>;

/**
 * Expands and executes the prompt
 */
declare function prompt(
  strings: TemplateStringsArray,
  ...args: any[]
): RunPromptResultPromiseWithOptions;

/**
 * Registers a callback to process the LLM output
 * @param fn
 */
declare function defOutputProcessor(fn: PromptOutputProcessorHandler): void;

/**
 * Registers a chat participant
 * @param participant
 */
declare function defChatParticipant(
  participant: ChatParticipantHandler,
  options?: ChatParticipantOptions,
): void;

/**
 * Transcribes audio to text.
 * @param audio An audio file to transcribe.
 * @param options
 */
declare function transcribe(
  audio: string | WorkspaceFile,
  options?: TranscriptionOptions,
): Promise<TranscriptionResult>;

/**
 * Converts text to speech.
 * @param text
 * @param options
 */
declare function speak(text: string, options?: SpeechOptions): Promise<SpeechResult>;

/**
 * Generate an image and return the workspace file.
 * @param prompt
 * @param options
 */
declare function generateImage(
  prompt: string,
  options?: ImageGenerationOptions,
): Promise<{ image: WorkspaceFile; revisedPrompt?: string }>;

```

## LoadedVibes/lv_artifacts/genaiscript/phases/jsconfig.json
```json
{
    "compilerOptions": {
        "lib": [
            "ES2024"
        ],
        "target": "ES2024",
        "module": "ES2022",
        "moduleDetection": "force",
        "checkJs": true,
        "allowJs": true,
        "skipLibCheck": true
    },
    "include": [
        "*.js",
        "./genaiscript.d.ts"
    ]
}
```

## LoadedVibes/lv_artifacts/genaiscript/phases/scaffolding.genai.js
```js
// @ts-nocheck

import {
  loadManifest,
  resolveFromGenai,
  loadCoreDocuments,
  readOptional,
} from '../shared/context.js';
import { readFile } from 'fs/promises';

script({
  title: 'Loaded Vibes Phase Runner',
  description:
    'Executes any DevCycle using instructions + toolsets defined in the manifest (legacy file path maintained for backward compatibility).',
  parameters: {
    phase: {
      type: 'string',
      description: 'DevCycle key to execute (e.g., scaffolding, testing).',
    },
    mode: {
      type: 'string',
      description: 'plan-only | plan-first | execute | validate',
      default: 'plan-first',
    },
    task: {
      type: 'string',
      description: 'Optional task description scoped to this DevCycle.',
    },
    autoExecute: {
      type: 'boolean',
      description: 'Override to force implementation after planning.',
      default: false,
    },
  },
  tools: ['filesystem/*', 'memory/*', 'sequentialthinking/*', 'runTests', 'todos', 'runSubagent'],
});

const MAX_SNIPPET_LENGTH = 4000;

function snippet(value) {
  return (value || '').slice(0, MAX_SNIPPET_LENGTH);
}

const phaseKey = (env.vars.phase || '').toLowerCase();
if (!phaseKey) {
  throw new Error('Phase runner requires `phase` input (e.g., scaffolding).');
}

const manifest = await loadManifest();
const entry = manifest[phaseKey];
if (!entry) {
  throw new Error(`Phase '${phaseKey}' is not defined in devcycles.config.json.`);
}

const instructionsPath = resolveFromGenai(entry.instructions);
const promptPath = resolveFromGenai(entry.prompt);
const toolsetPath = resolveFromGenai(entry.toolset);

const [instructionsText, promptTemplate, toolsetText, coreDocs] = await Promise.all([
  readFile(instructionsPath, 'utf8'),
  readFile(promptPath, 'utf8'),
  readFile(toolsetPath, 'utf8'),
  loadCoreDocuments(),
]);

const additionalContexts = [];
for (const relativePath of entry.contexts || []) {
  const resolved = resolveFromGenai(relativePath);
  const contents = await readOptional(resolved);
  if (contents) {
    additionalContexts.push({ path: relativePath, contents });
  }
}

const modeParam = (env.vars.mode || entry.defaultMode || 'plan-first').toLowerCase();
const shouldExecute =
  env.vars.autoExecute === 'true' || modeParam === 'execute' || modeParam === 'validate';
const focusTask = env.vars.task || 'Execute the standard DevCycle scope.';

const planResponse = await runPrompt((_) => {
  _.system.text(
    'You are the Loaded Vibes automation engine. Follow Spec-Driven Workflow (Analyze → Design → Implement → Validate → Reflect/Handoff).'
  );
  _.system.text(
    `DevCycle: ${entry.label}. Mode: ${modeParam}. Checkpoints: ${
      entry.checkpoints?.join(', ') || 'analyze, design, implement, validate, handoff'
    }.`
  );
  _.user.text('## DevCycle Instructions\n' + snippet(instructionsText));
  _.user.text('## Prompt Template\n' + snippet(promptTemplate));
  _.user.text('## Toolset Definition\n' + snippet(toolsetText));
  _.user.text('## Core Documents Snapshot\n' + snippet(coreDocs.prd));
  _.user.text('## Technical Requirements Snapshot\n' + snippet(coreDocs.tech));
  if (coreDocs.todo) {
    _.user.text('## TODO.md Snapshot\n' + snippet(coreDocs.todo));
  }
  if (coreDocs.changelog) {
    _.user.text('## CHANGELOG.md Snapshot\n' + snippet(coreDocs.changelog));
  }
  for (const ctx of additionalContexts) {
    _.user.text(`## Context: ${ctx.path}\n${snippet(ctx.contents)}`);
  }
  _.user.text(
    `## Task\nFocus Task: ${focusTask}. Respond with JSON {"requirements":[],"plan":[],"risks":[],"approvals":[],"citations":[]}.`
  );
});

let parsedPlan;
try {
  parsedPlan = JSON.parse(planResponse.text);
} catch (error) {
  parsedPlan = null;
}

console.log('📋 DevCycle Plan Generated:');
console.log(parsedPlan || planResponse.text);

if (!shouldExecute) {
  console.log(
    'Mode is plan-first/plan-only. Review the plan, obtain approval, then rerun with --mode execute to apply changes.'
  );
} else {
  const implementationResponse = await runPrompt((_) => {
    _.system.text(
      'Implementation step: derive concrete actions from the approved plan. Reference the toolset and cite PRD/TechReq paragraphs.'
    );
    _.user.text(
      `Plan JSON:\n${parsedPlan ? JSON.stringify(parsedPlan, null, 2) : planResponse.text}`
    );
    _.user.text('Instructions:\n' + instructionsText);
    _.user.text(
      'Return Markdown with sections: ##ImplementationSteps, ##FileOperations, ##ToolingCommands, ##RiskMitigations, ##ChangelogHooks.'
    );
  });

  console.log('🛠 Implementation Guidance:');
  console.log(implementationResponse.text);

  if (modeParam === 'validate') {
    const validationResponse = await runPrompt((_) => {
      _.system.text('Validation step: list tests, manual checks, and acceptance evidence.');
      _.user.text('Re-use the plan + implementation summaries.');
      _.user.text(
        'Respond with ##AutomatedTests, ##ManualChecks, ##AcceptanceCriteria, ##FollowUps. Reference toolset commands for each test.'
      );
    });
    console.log('✅ Validation Guidance:');
    console.log(validationResponse.text);
  }
}

```

## LoadedVibes/lv_artifacts/genaiscript/shared/context.js
```js
// @ts-nocheck

import path from 'path';
import { fileURLToPath } from 'url';
import { readFile, writeFile, access, mkdir } from 'fs/promises';

const CURRENT_DIR = path.dirname(fileURLToPath(import.meta.url));
const GENAI_ROOT = path.resolve(CURRENT_DIR, '..');
const ARTIFACTS_ROOT = path.resolve(GENAI_ROOT, '..');
const REPO_ROOT = path.resolve(ARTIFACTS_ROOT, '..');
const MANIFEST_PATH = path.resolve(GENAI_ROOT, 'devcycles.config.json');
const STATE_DIR = path.resolve(GENAI_ROOT, 'state');
const STATE_PATH = path.resolve(STATE_DIR, 'state.json');

async function readOptional(filePath) {
  try {
    await access(filePath);
    return await readFile(filePath, 'utf8');
  } catch (error) {
    return '';
  }
}

async function loadManifest() {
  const raw = await readFile(MANIFEST_PATH, 'utf8');
  return JSON.parse(raw);
}

function resolveFromGenai(relativePath) {
  return path.resolve(GENAI_ROOT, relativePath);
}

async function loadCoreDocuments() {
  const prd = await readOptional(path.resolve(REPO_ROOT, 'docs', 'PRD.md'));
  const tech = await readOptional(path.resolve(REPO_ROOT, 'docs', 'TECH_REQUIREMENTS.md'));
  const readme = await readOptional(path.resolve(REPO_ROOT, 'README.md'));
  const changelog = await readOptional(path.resolve(REPO_ROOT, 'CHANGELOG.md'));
  const todoLower = await readOptional(path.resolve(REPO_ROOT, 'todo.md'));
  const todoUpper = await readOptional(path.resolve(REPO_ROOT, 'TODO.md'));

  return {
    prd,
    tech,
    readme,
    changelog,
    todo: todoLower || todoUpper,
  };
}

async function loadState() {
  try {
    await access(STATE_PATH);
    const raw = await readFile(STATE_PATH, 'utf8');
    return JSON.parse(raw);
  } catch (error) {
    return {
      lastPhase: null,
      completedPhases: [],
      history: [],
    };
  }
}

async function saveState(state) {
  await mkdir(STATE_DIR, { recursive: true });
  const serialized = JSON.stringify(state, null, 2);
  await writeFile(STATE_PATH, serialized, 'utf8');
}

export {
  loadManifest,
  resolveFromGenai,
  loadCoreDocuments,
  loadState,
  saveState,
  readOptional,
  GENAI_ROOT,
  ARTIFACTS_ROOT,
  REPO_ROOT,
};

```

## LoadedVibes/lv_artifacts/genaiscript/state/state.json
```json
{
  "lastPhase": null,
  "completedPhases": [],
  "history": []
}

```

## LoadedVibes/lv_artifacts/genaiscript/.gitignore
```gitignore
genaiscript.d.ts
tsconfig.json
jsconfig.json
```

## LoadedVibes/lv_artifacts/genaiscript/devcycles.config.json
```json
{
  "initialization": {
    "label": "Initialization",
    "description": "Bootstrap environment readiness, verify prerequisites, and surface blockers.",
    "instructions": "../.github/instructions/initialization.instructions.md",
    "toolset": "../.github/toolsets/initialization.toolset.jsonc",
    "prompt": "../.github/prompts/initialization.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../README.md"
    ],
    "checkpoints": ["analyze", "design", "implement", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "scaffolding": {
    "label": "Scaffolding",
    "description": "Translate requirements into project topology and baseline files.",
    "instructions": "../.github/instructions/scaffolding.instructions.md",
    "toolset": "../.github/toolsets/scaffolding.toolset.jsonc",
    "prompt": "../.github/prompts/scaffolding.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "design", "implement", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "configuration": {
    "label": "Configuration",
    "description": "Wire up linting, formatting, testing, and workspace automation.",
    "instructions": "../.github/instructions/configuration.instructions.md",
    "toolset": "../.github/toolsets/configuration.toolset.jsonc",
    "prompt": "../.github/prompts/configuration.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "design", "implement", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "verification": {
    "label": "Verification",
    "description": "Execute static checks, detect config drift, and confirm structural soundness.",
    "instructions": "../.github/instructions/verification.instructions.md",
    "toolset": "../.github/toolsets/verification.toolset.jsonc",
    "prompt": "../.github/prompts/verification.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "design", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "data": {
    "label": "Data",
    "description": "Design Prisma schema, migrations, and safety checks.",
    "instructions": "../.github/instructions/data.instructions.md",
    "toolset": "../.github/toolsets/data.toolset.jsonc",
    "prompt": "../.github/prompts/data.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "design", "implement", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "auth": {
    "label": "Auth",
    "description": "Integrate Clerk, ABAC/RBAC, and session flows.",
    "instructions": "../.github/instructions/auth.instructions.md",
    "toolset": "../.github/toolsets/auth.toolset.jsonc",
    "prompt": "../.github/prompts/auth.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "design", "implement", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "testing": {
    "label": "Testing",
    "description": "Configure Vitest/Playwright, author plans, and ensure coverage hooks.",
    "instructions": "../.github/instructions/testing.instructions.md",
    "toolset": "../.github/toolsets/testing.toolset.jsonc",
    "prompt": "../.github/prompts/testing.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "design", "implement", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "validation": {
    "label": "Validation",
    "description": "Confirm business logic + UX alignment with PRD intent.",
    "instructions": "../.github/instructions/validation.instructions.md",
    "toolset": "../.github/toolsets/validation.toolset.jsonc",
    "prompt": "../.github/prompts/validation.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "design", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "features": {
    "label": "Features",
    "description": "Implement modules, components, and workflows with budgets.",
    "instructions": "../.github/instructions/features.instructions.md",
    "toolset": "../.github/toolsets/features.toolset.jsonc",
    "prompt": "../.github/prompts/features.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "design", "implement", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "debug": {
    "label": "Debug",
    "description": "Resolve defects, stabilize, and collaborate with observability/perf.",
    "instructions": "../.github/instructions/debug.instructions.md",
    "toolset": "../.github/toolsets/debug.toolset.jsonc",
    "prompt": "../.github/prompts/debug.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "implement", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "security": {
    "label": "Security",
    "description": "Apply CSP, HSTS, AI permissions, and data-protection guardrails.",
    "instructions": "../.github/instructions/security.instructions.md",
    "toolset": "../.github/toolsets/security.toolset.jsonc",
    "prompt": "../.github/prompts/security.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "design", "implement", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "performance": {
    "label": "Performance",
    "description": "Optimize bundle size, DB queries, and dependencies.",
    "instructions": "../.github/instructions/performance.instructions.md",
    "toolset": "../.github/toolsets/performance.toolset.jsonc",
    "prompt": "../.github/prompts/performance.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "design", "implement", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "observability": {
    "label": "Observability",
    "description": "Integrate telemetry, logs, alerts, and dashboards.",
    "instructions": "../.github/instructions/observability.instructions.md",
    "toolset": "../.github/toolsets/observability.toolset.jsonc",
    "prompt": "../.github/prompts/observability.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "design", "implement", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "code-review": {
    "label": "Code Review",
    "description": "Perform PR analysis, static checks, and gate policies.",
    "instructions": "../.github/instructions/code-review.instructions.md",
    "toolset": "../.github/toolsets/code-review.toolset.jsonc",
    "prompt": "../.github/prompts/code-review.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "documentation": {
    "label": "Documentation",
    "description": "Generate and update README, CONTRIBUTING, SECURITY, etc.",
    "instructions": "../.github/instructions/documentation.instructions.md",
    "toolset": "../.github/toolsets/documentation.toolset.jsonc",
    "prompt": "../.github/prompts/documentation.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "design", "implement", "handoff"],
    "defaultMode": "plan-first"
  },
  "ci-cd": {
    "label": "CI/CD",
    "description": "Define GitHub Actions, pipelines, and automation policies.",
    "instructions": "../.github/instructions/ci-cd.instructions.md",
    "toolset": "../.github/toolsets/ci-cd.toolset.jsonc",
    "prompt": "../.github/prompts/ci-cd.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "design", "implement", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "deploy": {
    "label": "Deploy",
    "description": "Execute deployments, smoke tests, and rollback strategies.",
    "instructions": "../.github/instructions/deploy.instructions.md",
    "toolset": "../.github/toolsets/deploy.toolset.jsonc",
    "prompt": "../.github/prompts/deploy.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "design", "implement", "validate", "handoff"],
    "defaultMode": "plan-first"
  },
  "updates": {
    "label": "Updates",
    "description": "Ship post-launch fixes, QoL improvements, and patch notes.",
    "instructions": "../.github/instructions/updates.instructions.md",
    "toolset": "../.github/toolsets/updates.toolset.jsonc",
    "prompt": "../.github/prompts/updates.prompt.md",
    "contexts": [
      "../../docs/PRD.md",
      "../../docs/TECH_REQUIREMENTS.md",
      "../../CHANGELOG.md"
    ],
    "checkpoints": ["analyze", "design", "implement", "validate", "handoff"],
    "defaultMode": "plan-first"
  }
}

```

## LoadedVibes/lv_artifacts/genaiscript/genaiscript.d.ts
```ts
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

/**
 * GenAIScript Ambient Type Definition File
 * @version 2.5.1
 */
 type OptionsOrString<TOptions extends string> = (string & {}) | TOptions;

 type ElementOrArray<T> = T | T[];

 interface PromptGenerationConsole {
  log(...data: any[]): void;
  warn(...data: any[]): void;
  debug(...data: any[]): void;
  error(...data: any[]): void;
}

 type DiagnosticSeverity = "error" | "warning" | "info";

 interface Diagnostic {
  filename: string;
  range: CharRange;
  severity: DiagnosticSeverity;
  message: string;
  /**
   * suggested fix
   */
  suggestion?: string;
  /**
   * error or warning code
   */
  code?: string;
}

 type Awaitable<T> = T | PromiseLike<T>;

 interface SerializedError {
  name?: string;
  message?: string;
  stack?: string;
  cause?: unknown;
  code?: string;
  line?: number;
  column?: number;
}

/**
 * A color and icon to associate with the script.
 * @see https://actions-cool.github.io/github-action-branding/
 */
 interface PromptBranding {
  /**
   * Marketplace and web site branding
   */
  branding?: {
    /**
     * The background color of the badge.
     */
    color?:
      | "white"
      | "black"
      | "yellow"
      | "blue"
      | "green"
      | "orange"
      | "red"
      | "purple"
      | "gray-dark";
    /**
     * Name of the Feather icon to use.
     * @see https://actions-cool.github.io/github-action-branding/
     */
    icon?: string;
  };
}

 interface PromptDefinition {
  /**
   * Based on file name.
   */
  id: string;

  /**
   * Something like "Summarize children", show in UI.
   */
  title?: string;

  /**
   * Longer description of the prompt. Shows in UI grayed-out.
   */
  description?: string;

  /**
   * Groups template in UI
   */
  group?: string;

  /**
   * List of tools defined in the script
   */
  defTools?: { id: string; description: string; kind: "tool" | "agent" }[];
}

 interface PromptLike extends PromptDefinition {
  /**
   * File where the prompt comes from (if any).
   */
  filename?: string;

  /**
   * The actual text of the prompt template.
   * Only used for system prompts.
   */
  text?: string;

  /**
   * The text of the prompt JS source code.
   */
  jsSource?: string;

  /**
   * Resolved system ids
   */
  resolvedSystem?: SystemPromptInstance[];

  /**
   * Inferred input schema for parameters
   */
  inputSchema?: JSONSchemaObject;
}

 type SystemPromptId = OptionsOrString<
    | "system"
    | "system.agent_data"
    | "system.agent_docs"
    | "system.agent_fs"
    | "system.agent_git"
    | "system.agent_github"
    | "system.agent_interpreter"
    | "system.agent_mcp"
    | "system.agent_planner"
    | "system.agent_user_input"
    | "system.agent_video"
    | "system.agent_web"
    | "system.agent_z3"
    | "system.annotations"
    | "system.assistant"
    | "system.chain_of_draft"
    | "system.changelog"
    | "system.cooperation"
    | "system.cpp"
    | "system.diagrams"
    | "system.diff"
    | "system.do_not_explain"
    | "system.english"
    | "system.explanations"
    | "system.fetch"
    | "system.files"
    | "system.files_schema"
    | "system.fs_ask_file"
    | "system.fs_data_query"
    | "system.fs_diff_files"
    | "system.fs_find_files"
    | "system.fs_read_file"
    | "system.fs_write_file"
    | "system.git"
    | "system.git_diff"
    | "system.git_info"
    | "system.github_actions"
    | "system.github_files"
    | "system.github_info"
    | "system.github_issues"
    | "system.github_pulls"
    | "system.go"
    | "system.java"
    | "system.math"
    | "system.mcp"
    | "system.md_find_files"
    | "system.md_frontmatter"
    | "system.meta_prompt"
    | "system.meta_schema"
    | "system.node_info"
    | "system.node_test"
    | "system.output_ini"
    | "system.output_json"
    | "system.output_markdown"
    | "system.output_plaintext"
    | "system.output_yaml"
    | "system.php"
    | "system.planner"
    | "system.python"
    | "system.python_code_interpreter"
    | "system.python_types"
    | "system.resources"
    | "system.retrieval_fuzz_search"
    | "system.retrieval_vector_search"
    | "system.retrieval_web_search"
    | "system.ruby"
    | "system.rust"
    | "system.safety_canary_word"
    | "system.safety_harmful_content"
    | "system.safety_jailbreak"
    | "system.safety_protected_material"
    | "system.safety_ungrounded_content_summarization"
    | "system.safety_validate_harmful_content"
    | "system.schema"
    | "system.tasks"
    | "system.technical"
    | "system.think"
    | "system.today"
    | "system.tool_calls"
    | "system.tools"
    | "system.transcribe"
    | "system.typescript"
    | "system.user_input"
    | "system.video"
    | "system.vision_ask_images"
    | "system.zero_shot_cot"
>;

 type SystemPromptInstance = {
  id: SystemPromptId;
  parameters?: Record<string, string | boolean | number | object | any>;
  vars?: Record<string, string | boolean | number | object | any>;
};

 type SystemToolId = OptionsOrString<
    | "agent_data"
    | "agent_docs"
    | "agent_fs"
    | "agent_git"
    | "agent_github"
    | "agent_interpreter"
    | "agent_planner"
    | "agent_user_input"
    | "agent_video"
    | "agent_web"
    | "agent_z3"
    | "fetch"
    | "fs_ask_file"
    | "fs_data_query"
    | "fs_diff_files"
    | "fs_find_files"
    | "fs_read_file"
    | "fs_write_file"
    | "git_branch_current"
    | "git_branch_default"
    | "git_branch_list"
    | "git_diff"
    | "git_last_tag"
    | "git_list_commits"
    | "git_status"
    | "github_actions_job_logs_diff"
    | "github_actions_job_logs_get"
    | "github_actions_jobs_list"
    | "github_actions_workflows_list"
    | "github_files_get"
    | "github_files_list"
    | "github_issues_comments_list"
    | "github_issues_get"
    | "github_issues_list"
    | "github_pulls_get"
    | "github_pulls_list"
    | "github_pulls_review_comments_list"
    | "math_eval"
    | "md_find_files"
    | "md_read_frontmatter"
    | "meta_prompt"
    | "meta_schema"
    | "node_test"
    | "python_code_interpreter_copy_files_to_container"
    | "python_code_interpreter_read_file"
    | "python_code_interpreter_run"
    | "resource_list"
    | "resource_read"
    | "retrieval_fuzz_search"
    | "retrieval_vector_search"
    | "retrieval_web_search"
    | "think"
    | "transcribe"
    | "user_input_confirm"
    | "user_input_select"
    | "user_input_text"
    | "video_extract_audio"
    | "video_extract_clip"
    | "video_extract_frames"
    | "video_probe"
    | "vision_ask_images"
>;

 type FileMergeHandler = (
  filename: string,
  label: string,
  before: string,
  generated: string,
) => Awaitable<string>;

 interface PromptOutputProcessorResult {
  /**
   * Updated text
   */
  text?: string;
  /**
   * Generated files from the output
   */
  files?: Record<string, string>;

  /**
   * User defined errors
   */
  annotations?: Diagnostic[];
}

 type PromptOutputProcessorHandler = (
  output: GenerationOutput,
) =>
  | PromptOutputProcessorResult
  | Promise<PromptOutputProcessorResult>
  | undefined
  | Promise<undefined>
  | void
  | Promise<void>;

 type PromptTemplateResponseType =
  | "text"
  | "json"
  | "yaml"
  | "markdown"
  | "json_object"
  | "json_schema"
  | undefined;

 type ModelType = OptionsOrString<
  | "large"
  | "small"
  | "tiny"
  | "long"
  | "vision"
  | "vision_small"
  | "reasoning"
  | "reasoning_small"
  | "openai:gpt-4.1"
  | "openai:gpt-4.1-mini"
  | "openai:gpt-4.1-nano"
  | "openai:gpt-4o"
  | "openai:gpt-4o-mini"
  | "openai:gpt-3.5-turbo"
  | "openai:o3-mini"
  | "openai:o3-mini:low"
  | "openai:o3-mini:medium"
  | "openai:o3-mini:high"
  | "openai:o1"
  | "openai:o1-mini"
  | "openai:o1-preview"
  | "github:openai/gpt-4.1"
  | "github:openai/gpt-4o"
  | "github:openai/gpt-4o-mini"
  | "github:openai/o1"
  | "github:openai/o1-mini"
  | "github:openai/o3-mini"
  | "github:openai/o3-mini:low"
  | "github:microsoft/mai-ds-r1"
  | "github:deepseek/deepseek-v3"
  | "github:deepseek/deepseek-r1"
  | "github:microsoft/phi-4"
  | "github_copilot_chat:current"
  | "github_copilot_chat:gpt-4.1"
  | "github_copilot_chat:o1"
  | "github_copilot_chat:o1:low"
  | "github_copilot_chat:o1:medium"
  | "github_copilot_chat:o1:high"
  | "github_copilot_chat:o3-mini"
  | "github_copilot_chat:o3-mini:low"
  | "github_copilot_chat:o3-mini:medium"
  | "github_copilot_chat:o3-mini:high"
  | "azure:gpt-4o"
  | "azure:gpt-4o-mini"
  | "azure:o1"
  | "azure:o1-mini"
  | "azure:o3-mini"
  | "azure:o3-mini:low"
  | "azure:o3-mini:medium"
  | "azure:o3-mini:high"
  | "azure_ai_inference:gpt-4.1"
  | "azure_ai_inference:gpt-4o"
  | "azure_ai_inference:gpt-4o-mini"
  | "azure_ai_inference:o1"
  | "azure_ai_inference:o1-mini"
  | "azure_ai_inference:o3-mini"
  | "azure_ai_inference:o3-mini:low"
  | "azure_ai_inference:o3-mini:medium"
  | "azure_ai_inference:o3-mini:high"
  | "azure_ai_inference:deepSeek-v3"
  | "azure_ai_inference:deepseek-r1"
  | "ollama:gemma3:4b"
  | "ollama:llama3.2"
  | "ollama:command-r7b:7b"
  | "ollama:gpt-oss:20b"
  | "anthropic:claude-opus-4-0"
  | "anthropic:claude-sonnet-4-0"
  | "anthropic:claude-sonnet-4-0:low"
  | "anthropic:claude-sonnet-4-0:medium"
  | "anthropic:claude-sonnet-4-0:high"
  | "anthropic:claude-3-7-sonnet-latest"
  | "anthropic:claude-3-7-sonnet-latest:low"
  | "anthropic:claude-3-7-sonnet-latest:medium"
  | "anthropic:claude-3-7-sonnet-latest:high"
  | "anthropic_bedrock:anthropic.claude-3-7-sonnet-20250219-v1:0"
  | "anthropic_bedrock:anthropic.claude-3-7-sonnet-20250219-v1:0:low"
  | "anthropic_bedrock:anthropic.claude-3-7-sonnet-20250219-v1:0:medium"
  | "anthropic_bedrock:anthropic.claude-3-7-sonnet-20250219-v1:0:high"
  | "huggingface:microsoft/Phi-3-mini-4k-instruct"
  | "jan:llama3.2-3b-instruct"
  | "google:gemini-2.0-flash-exp"
  | "llamafile"
  | "sglang"
  | "vllm"
  | "echo"
  | "none"
>;

 type EmbeddingsModelType = OptionsOrString<
  | "openai:text-embedding-3-small"
  | "openai:text-embedding-3-large"
  | "openai:text-embedding-ada-002"
  | "github:text-embedding-3-small"
  | "github:text-embedding-3-large"
  | "azure:text-embedding-3-small"
  | "azure:text-embedding-3-large"
  | "azure_ai_inference:text-embedding-3-small"
  | "azure_ai_inference:text-embedding-3-large"
  | "ollama:nomic-embed-text"
  | "google:text-embedding-004"
  | "huggingface:nomic-ai/nomic-embed-text-v1.5"
>;

 type ModelSmallType = OptionsOrString<
  | "openai:gpt-4o-mini"
  | "github:openai/gpt-4o-mini"
  | "azure:gpt-4o-mini"
  | "github:microsoft/phi-4"
>;

 type ModelVisionType = OptionsOrString<
  "openai:gpt-4o" | "github:openai/gpt-4o" | "azure:gpt-4o" | "azure:gpt-4o-mini"
>;

 type ModelImageGenerationType = OptionsOrString<
  "openai:gpt-image-1" | "openai:dall-e-2" | "openai:dall-e-3"
>;

 type ModelProviderType = OptionsOrString<
  | "openai"
  | "azure"
  | "azure_serverless"
  | "azure_serverless_models"
  | "anthropic"
  | "anthropic_bedrock"
  | "google"
  | "huggingface"
  | "mistral"
  | "alibaba"
  | "github"
  | "transformers"
  | "ollama"
  | "lmstudio"
  | "jan"
  | "sglang"
  | "vllm"
  | "llamafile"
  | "litellm"
  | "github_copilot_chat"
  | "deepseek"
  | "whisperasr"
  | "echo"
>;

 interface ModelConnectionOptions {
  /**
   * Which LLM model by default or for the `large` alias.
   */
  model?: ModelType;
}

 interface ModelAliasesOptions extends ModelConnectionOptions {
  /**
   * Configure the `small` model alias.
   */
  smallModel?: ModelSmallType;

  /**
   * Configure the `vision` model alias.
   */
  visionModel?: ModelVisionType;

  /**
   * A list of model aliases to use.
   */
  modelAliases?: Record<string, string>;
}

 type ReasoningEffortType = "high" | "medium" | "low";

 type ChatToolChoice =
  | "none"
  | "auto"
  | "required"
  | {
      /**
       * The name of the function to call.
       */
      name: string;
    };

 interface ModelOptions
  extends ModelConnectionOptions,
    ModelTemplateOptions,
    CacheOptions,
    RetryOptions {
  /**
   * Temperature to use. Higher temperature means more hallucination/creativity.
   * Range 0.0-2.0.
   *
   * @default 0.2
   */
  temperature?: number;

  /**
   * Enables fallback tools mode
   */
  fallbackTools?: boolean;

  /**
   * OpenAI o* reasoning models support a reasoning effort parameter.
   * For Clause, these are mapped to thinking budget tokens
   */
  reasoningEffort?: ReasoningEffortType;

  /**
   * A list of keywords that should be found in the output.
   */
  choices?: ElementOrArray<string | { token: string | number; weight?: number }>;

  /**
   * Returns the log probabilities of the each tokens. Not supported in all models.
   */
  logprobs?: boolean;

  /**
   * Number of alternate token logprobs to generate, up to 5. Enables logprobs.
   */
  topLogprobs?: number;

  /**
   * Specifies the type of output. Default is plain text.
   * - `text` enables plain text mode (through system prompts)
   * - `json` enables JSON mode (through system prompts)
   * - `yaml` enables YAML mode (through system prompts)
   * - `json_object` enables JSON mode (native)
   * - `json_schema` enables structured outputs (native)
   * Use `responseSchema` to specify an output schema.
   */
  responseType?: PromptTemplateResponseType;

  /**
   * JSON object schema for the output. Enables the `json_object` output mode by default.
   */
  responseSchema?: PromptParametersSchema | JSONSchema;

  /**
   * “Top_p” or nucleus sampling is a setting that decides how many possible words to consider.
   * A high “top_p” value means the model looks at more possible words, even the less likely ones,
   * which makes the generated text more diverse.
   */
  topP?: number;

  /**
   * Maximum number of completion tokens
   *
   */
  maxTokens?: number;

  /**
   * Tool selection strategy. Default is 'auto'.
   */
  toolChoice?: ChatToolChoice;

  /**
   * Maximum number of tool calls to make.
   */
  maxToolCalls?: number;

  /**
   * Maximum number of data repairs to attempt.
   */
  maxDataRepairs?: number;

  /**
   * A deterministic integer seed to use for the model.
   */
  seed?: number;

  /**
   * A list of model ids and their maximum number of concurrent requests.
   */
  modelConcurrency?: Record<string, number>;
}

 interface EmbeddingsModelOptions {
  /**
   * LLM model to use for embeddings.
   */
  embeddingsModel?: EmbeddingsModelType;
}

 interface PromptSystemOptions extends PromptSystemSafetyOptions {
  /**
   * List of system script ids used by the prompt.
   */
  system?: ElementOrArray<SystemPromptId | SystemPromptInstance>;

  /**
   * List of tools used by the prompt.
   */
  tools?: ElementOrArray<SystemToolId>;

  /**
   * List of system to exclude from the prompt.
   */
  excludedSystem?: ElementOrArray<SystemPromptId>;

  /**
   * Keywords that will 'activate' the system script. When these keywords are found in the prompt source,
   * the system script will be automatically imported.
   */
  activation?: ElementOrArray<string>;

  /**
   * MCP server configuration. The tools will be injected into the prompt.
   */
  mcpServers?: McpServersConfig;

  /**
   * MCP agent configuration. Each mcp server will be wrapped with an agent.
   */
  mcpAgentServers?: McpAgentServersConfig;
}

 interface ScriptRuntimeOptions extends LineNumberingOptions {
  /**
   * Secrets required by the prompt
   */
  secrets?: string[];
}

 type PromptJSONParameterType<T> = T & { required?: boolean };

 type PromptParameterType =
  | string
  | number
  | boolean
  | object
  | PromptJSONParameterType<JSONSchemaNumber>
  | PromptJSONParameterType<JSONSchemaString>
  | PromptJSONParameterType<JSONSchemaBoolean>;
 type PromptParametersSchema = Record<string, PromptParameterType | [PromptParameterType]>;
 type PromptParameters = Record<string, string | number | boolean | object>;

 type PromptAssertion = {
  // How heavily to weigh the assertion. Defaults to 1.0
  weight?: number;
  /**
   * The transformation to apply to the output before checking the assertion.
   */
  transform?: string;
} & (
  | {
      // type of assertion
      type:
        | "icontains"
        | "not-icontains"
        | "equals"
        | "not-equals"
        | "starts-with"
        | "not-starts-with";
      // The expected value
      value: string;
    }
  | {
      // type of assertion
      type:
        | "contains-all"
        | "not-contains-all"
        | "contains-any"
        | "not-contains-any"
        | "icontains-all"
        | "not-icontains-all";
      // The expected values
      value: string[];
    }
  | {
      // type of assertion
      type: "levenshtein" | "not-levenshtein";
      // The expected value
      value: string;
      // The threshold value
      threshold?: number;
    }
);

 interface PromptTest {
  /**
   * Short name of the test
   */
  name?: string;
  /**
   * Description of the test.
   */
  description?: string;
  /**
   * List of files to apply the test to.
   */
  files?: ElementOrArray<string>;
  /**
   * List of in-memory files to apply the test to.
   */
  workspaceFiles?: ElementOrArray<WorkspaceFile>;
  /**
   * Extra set of variables for this scenario
   */
  vars?: Record<string, string | boolean | number>;
  /**
   * LLM output matches a given rubric, using a Language Model to grade output.
   */
  rubrics?: ElementOrArray<string>;
  /**
   * LLM output adheres to the given facts, using Factuality method from OpenAI evaluation.
   */
  facts?: ElementOrArray<string>;
  /**
   * List of keywords that should be contained in the LLM output.
   */
  keywords?: ElementOrArray<string>;
  /**
   * List of keywords that should not be contained in the LLM output.
   */
  forbidden?: ElementOrArray<string>;
  /**
   * Additional deterministic assertions.
   */
  asserts?: ElementOrArray<PromptAssertion>;

  /**
   * Determines what kind of output is sent back to the test engine. Default is "text".
   */
  format?: "text" | "json";
}

/**
 * Configure promptfoo redteam plugins
 */
 interface PromptRedteam {
  /**
   * The `purpose` property is used to guide the attack generation process. It should be as clear and specific as possible.
   * Include the following information:
   * - Who the user is and their relationship to the company
   * - What data the user has access to
   * - What data the user does not have access to
   * - What actions the user can perform
   * - What actions the user cannot perform
   * - What systems the agent has access to
   * @link https://www.promptfoo.dev/docs/red-team/troubleshooting/attack-generation/
   */
  purpose: string;

  /**
   * Redteam identifier used for reporting purposes
   */
  label?: string;

  /**
   * Default number of inputs to generate for each plugin.
   * The total number of tests will be `(numTests * plugins.length * (1 + strategies.length) * languages.length)`
   * Languages.length is 1 by default, but is added when the multilingual strategy is used.
   */
  numTests?: number;

  /**
   * List of languages to target. Default is English.
   */
  language?: string;

  /**
   * Red team plugin list
   * @link https://www.promptfoo.dev/docs/red-team/owasp-llm-top-10/
   */
  plugins?: ElementOrArray<string>;

  /**
   * Adversary prompt generation strategies
   */
  strategies?: ElementOrArray<string>;
}

/**
 * Different ways to render a fence block.
 */
 type FenceFormat = "markdown" | "xml" | "none";

 interface FenceFormatOptions {
  /**
   * Formatting of code sections
   */
  fenceFormat?: FenceFormat;
}

 interface ModelTemplateOptions extends FenceFormatOptions {
  /**
   * Budget of tokens to apply the prompt flex renderer.
   */
  flexTokens?: number;
}

 interface McpToolAnnotations {
  /**
   * Annotations for MCP tools
   * @link https://modelcontextprotocol.io/docs/concepts/tools#available-tool-annotations
   */
  annotations?: {
    /**
     * If true, indicates the tool does not modify its environment
     */
    readOnlyHint?: boolean;
    /**
     * If true, the tool may perform destructive updates (only meaningful when readOnlyHint is false)
     */
    destructiveHint?: boolean;
    /**
     * If true, calling the tool repeatedly with the same arguments has no additional effect (only meaningful when readOnlyHint is false)
     */
    idempotentHint?: boolean;
    /**
     * If true, the tool may interact with an “open world” of external entities
     */
    openWorldHint?: boolean;
  };
}

 interface MetadataOptions {
  /**
   * Set of 16 key-value pairs that can be attached to an object.
   * This can be useful for storing additional information about the object in a structured format, and querying for objects via API or the dashboard.
   * Keys are strings with a maximum length of 64 characters. Values are strings with a maximum length of 512 characters.
   */
  metadata?: Record<string, string>;
}

 interface TerminalOptions {
  /**
   * Disable generation of run trace.
   */
  disableTrace?: boolean;

  /**
   * Disables rendering a preview of the chat messages
   */
  disableChatPreview?: boolean;
}

 interface PromptScript
  extends PromptLike,
    PromptBranding,
    ModelOptions,
    ModelAliasesOptions,
    PromptSystemOptions,
    EmbeddingsModelOptions,
    ContentSafetyOptions,
    SecretDetectionOptions,
    GitIgnoreFilterOptions,
    ScriptRuntimeOptions,
    McpToolAnnotations,
    MetadataOptions,
    TerminalOptions {
  /**
   * Which provider to prefer when picking a model.
   */
  provider?: ModelProviderType;

  /**
   * Additional template parameters that will populate `env.vars`
   */
  parameters?: PromptParametersSchema;

  /**
   * A file path or list of file paths or globs.
   * The content of these files will be by the files selected in the UI by the user or the cli arguments.
   */
  files?: ElementOrArray<string>;

  /**
   * A comma separated list of file extensions to accept.
   */
  accept?: OptionsOrString<".md,.mdx" | "none">;

  /**
   * Extra variable values that can be used to configure system prompts.
   */
  vars?: Record<string, string>;

  /**
   * Tests to validate this script.
   */
  tests?: ElementOrArray<string | PromptTest>;

  /**
   * Models to use with tests
   */
  testModels?: ElementOrArray<ModelType | ModelAliasesOptions>;

  /**
   * LLM vulnerability checks
   */
  redteam?: PromptRedteam;

  /**
   * Don't show it to the user in lists. Template `system.*` are automatically unlisted.
   */
  unlisted?: boolean;

  /**
   * Set if this is a system prompt.
   */
  isSystem?: boolean;

  /**
   * List of allowed domains (with wildcard support) for HTTPS resource resolution and fetchText.
   * If specified, overrides the global allowedDomains configuration for this script.
   * Supports glob patterns like "*.github.com".
   */
  allowedDomains?: ElementOrArray<string>;
}
/**
 * Represent a workspace file and optional content.
 */
 interface WorkspaceFile {
  /**
   * Name of the file, relative to project root.
   */
  filename: string;

  /**
   * Content mime-type if known
   */
  type?: string;

  /**
   * Encoding of the content
   */
  encoding?: "base64";

  /**
   * Content of the file.
   */
  content?: string;

  /**
   * Size in bytes if known
   */
  size?: number;
}

 interface WorkspaceFileWithScore extends WorkspaceFile {
  /**
   * Score allocated by search algorithm
   */
  score?: number;
}

 interface ToolDefinition {
  /**
   * The name of the function to be called. Must be a-z, A-Z, 0-9, or contain
   * underscores and dashes, with a maximum length of 64.
   */
  name: string;

  /**
   * A description of what the function does, used by the model to choose when and
   * how to call the function.
   */
  description?: string;

  /**
   * The parameters the functions accepts, described as a JSON Schema object. See the
   * [guide](https://platform.openai.com/docs/guides/text-generation/function-calling)
   * for examples, and the
   * [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for
   * documentation about the format.
   *
   * Omitting `parameters` defines a function with an empty parameter list.
   */
  parameters?: JSONSchema;
}

/**
 * Interface representing an output trace with various logging and tracing methods.
 * Extends the `ToolCallTrace` interface.
 */
 interface OutputTrace extends ToolCallTrace {
  /**
   * Logs a heading message at the specified level.
   * @param level - The level of the heading.
   * @param message - The heading message.
   */
  heading(level: number, message: string): void;

  /**
   * Logs an image with an optional caption.
   * @param url - The URL of the image.
   * @param caption - The optional caption for the image.
   */
  image(url: BufferLike, caption?: string): Promise<void>;

  /**
   * Logs a markdown table
   * @param rows
   */
  table(rows: object[]): void;

  /**
   * Computes and renders diff between two files.
   */
  diff(
    left: string | WorkspaceFile,
    right: string | WorkspaceFile,
    options?: { context?: number },
  ): void;

  /**
   * Logs a result item with a boolean value and a message.
   * @param value - The boolean value of the result item.
   * @param message - The message for the result item.
   */
  resultItem(value: boolean, message: string): void;

  /**
   * Starts a trace with details in markdown format.
   * @param title - The title of the trace.
   * @param options - Optional settings for the trace.
   * @returns A `MarkdownTrace` instance.
   */
  startTraceDetails(title: string, options?: { expanded?: boolean }): OutputTrace;

  /**
   * Appends content to the trace.
   * @param value - The content to append.
   */
  appendContent(value: string): void;

  /**
   * Starts a details section in the trace.
   * @param title - The title of the details section.
   * @param options - Optional settings for the details section.
   */
  startDetails(title: string, options?: { success?: boolean; expanded?: boolean }): void;

  /**
   * Ends the current details section in the trace.
   */
  endDetails(): void;

  /**
   * Logs a video with a name, file path, and optional alt text.
   * @param name - The name of the video.
   * @param filepath - The file path of the video.
   * @param alt - The optional alt text for the video.
   */
  video(name: string, filepath: string, alt?: string): void;

  /**
   * Logs an audio file
   * @param name
   * @param filepath
   * @param alt
   */
  audio(name: string, filepath: string, alt?: string): void;

  /**
   * Logs a details section with a title and body.
   * @param title - The title of the details section.
   * @param body - The body content of the details section, can be a string or an object.
   * @param options - Optional settings for the details section.
   */
  details(
    title: string,
    body: string | object,
    options?: { success?: boolean; expanded?: boolean },
  ): void;

  /**
   * Logs a fenced details section with a title, body, and optional content type.
   * @param title - The title of the details section.
   * @param body - The body content of the details section, can be a string or an object.
   * @param contentType - The optional content type of the body.
   * @param options - Optional settings for the details section.
   */
  detailsFenced(
    title: string,
    body: string | object,
    contentType?: string,
    options?: { expanded?: boolean },
  ): void;

  /**
   * Logs an item with a name, value, and optional unit.
   * @param name - The name of the item.
   * @param value - The value of the item.
   * @param unit - The optional unit of the value.
   */
  itemValue(name: string, value: any, unit?: string): void;

  /**
   * Adds a url link item
   * @param name name url
   * @param url url. If missing, name is treated as the url.
   */
  itemLink(name: string, url?: string | URL, title?: string): void;

  /**
   * Writes a paragraph of text with empty lines before and after.
   * @param text paragraph to write
   */
  p(text: string): void;

  /**
   * Logs a warning message.
   * @param msg - The warning message to log.
   */
  warn(msg: string): void;

  /**
   * Logs a caution message.
   * @param msg - The caution message to log.
   */
  caution(msg: string): void;

  /**
   * Logs a note message.
   * @param msg - The note message to log.
   */
  note(msg: string): void;

  /**
   * Logs an error object
   * @param err
   */
  error(message: string, error?: unknown): void;
}

/**
 * Interface representing a tool call trace for logging various types of messages.
 */
 interface ToolCallTrace {
  /**
   * Logs a general message.
   * @param message - The message to log.
   */
  log(message: string): void;

  /**
   * Logs an item message.
   * @param message - The item message to log.
   */
  item(message: string): void;

  /**
   * Logs a tip message.
   * @param message - The tip message to log.
   */
  tip(message: string): void;

  /**
   * Logs a fenced message, optionally specifying the content type.
   * @param message - The fenced message to log.
   * @param contentType - The optional content type of the message.
   */
  fence(message: string | unknown, contentType?: string): void;
}

/**
 * Position (line, character) in a file. Both are 0-based.
 */
 type CharPosition = [number, number];

/**
 * Describes a run of text.
 */
 type CharRange = [CharPosition, CharPosition];

/**
 * 0-based line numbers.
 */
 type LineRange = [number, number];

 interface FileEdit {
  type: string;
  filename: string;
  label?: string;
  validated?: boolean;
}

 interface ReplaceEdit extends FileEdit {
  type: "replace";
  range: CharRange | LineRange;
  text: string;
}

 interface InsertEdit extends FileEdit {
  type: "insert";
  pos: CharPosition | number;
  text: string;
}

 interface DeleteEdit extends FileEdit {
  type: "delete";
  range: CharRange | LineRange;
}

 interface CreateFileEdit extends FileEdit {
  type: "createfile";
  overwrite?: boolean;
  ignoreIfExists?: boolean;
  text: string;
}

 type Edits = InsertEdit | ReplaceEdit | DeleteEdit | CreateFileEdit;

 interface ToolCallContent {
  type?: "content";
  content: string;
  edits?: Edits[];
}

 type ToolCallOutput =
  | string
  | number
  | boolean
  | ToolCallContent
  | ShellOutput
  | WorkspaceFile
  | RunPromptResult
  | SerializedError
  | undefined;

 interface WorkspaceFileCache<K, V> {
  /**
   * Name of the cache
   */
  name: string;
  /**
   * Gets the value associated with the key, or undefined if there is none.
   * @param key
   */
  get(key: K): Promise<V | undefined>;
  /**
   * Sets the value associated with the key.
   * @param key
   * @param value
   */
  set(key: K, value: V): Promise<void>;

  /**
   * List the values in the cache.
   */
  values(): Promise<V[]>;

  /**
   * Gets the sha of the key
   * @param key
   */
  getSha(key: K): Promise<string>;

  /**
   * Gets an existing value or updates it with the updater function.
   */
  getOrUpdate(
    key: K,
    updater: () => Promise<V>,
    validator?: (val: V) => boolean,
  ): Promise<{ key: string; value: V; cached?: boolean }>;
}

 interface WorkspaceGrepOptions extends FilterGitFilesOptions {
  /**
   * List of paths to
   */
  path?: ElementOrArray<string>;
  /**
   * list of filename globs to search. !-prefixed globs are excluded. ** are not supported.
   */
  glob?: ElementOrArray<string>;
  /**
   * Read file content. default is true.
   */
  readText?: boolean;

  /**
   * Enable grep logging to discover what files are searched.
   */
  debug?: boolean;
}

 interface WorkspaceGrepResult {
  files: WorkspaceFile[];
  matches: WorkspaceFile[];
}

 interface INIParseOptions extends JSONSchemaValidationOptions {
  defaultValue?: any;
}

 interface FilterGitFilesOptions {
  /**
   * Ignore workspace .gitignore instructions
   */
  applyGitIgnore?: false | undefined;
}

 interface FindFilesOptions extends FilterGitFilesOptions {
  /** Glob patterns to ignore */
  ignore?: ElementOrArray<string>;

  /**
   * Set to false to skip read text content. True by default
   */
  readText?: boolean;
}

 interface FileStats {
  /**
   * Size of the file in bytes
   */
  size: number;
  mode: number;
}

 interface JSONSchemaValidationOptions {
  schema?: JSONSchema;
  throwOnValidationError?: boolean;
}

 interface WorkspaceFileSystem {
  /**
   * The root folder path of the workspace.
   */
  root(): string;

  /**
   * Searches for files using the glob pattern and returns a list of files.
   * Ignore `.env` files and apply `.gitignore` if present.
   * @param glob
   */
  findFiles(glob: ElementOrArray<string>, options?: FindFilesOptions): Promise<WorkspaceFile[]>;

  /**
   * Performs a grep search over the files in the workspace using ripgrep.
   * @param pattern A string to match or a regex pattern.
   * @param options Options for the grep search.
   */
  grep(pattern: string | RegExp, options?: WorkspaceGrepOptions): Promise<WorkspaceGrepResult>;
  grep(
    pattern: string | RegExp,
    glob: string,
    options?: Omit<WorkspaceGrepOptions, "path" | "glob">,
  ): Promise<WorkspaceGrepResult>;

  /**
   * Reads metadata information about the file. Returns undefined if the file does not exist.
   * @param filename
   */
  stat(filename: string): Promise<FileStats>;

  /**
   * Reads the content of a file as text
   * @param path
   */
  readText(path: string | Awaitable<WorkspaceFile>): Promise<WorkspaceFile>;

  /**
   * Reads the content of a file and parses to JSON, using the JSON5 parser.
   * @param path
   */
  readJSON(
    path: string | Awaitable<WorkspaceFile>,
    options?: JSONSchemaValidationOptions,
  ): Promise<any>;

  /**
   * Reads the content of a file and parses to YAML.
   * @param path
   */
  readYAML(
    path: string | Awaitable<WorkspaceFile>,
    options?: JSONSchemaValidationOptions,
  ): Promise<any>;

  /**
   * Reads the content of a file and parses to XML, using the XML parser.
   */
  readXML(path: string | Awaitable<WorkspaceFile>, options?: XMLParseOptions): Promise<any>;

  /**
   * Reads the content of a CSV file.
   * @param path
   */
  readCSV<T extends object>(
    path: string | Awaitable<WorkspaceFile>,
    options?: CSVParseOptions,
  ): Promise<T[]>;

  /**
   * Reads the content of a file and parses to INI
   */
  readINI(path: string | Awaitable<WorkspaceFile>, options?: INIParseOptions): Promise<any>;

  /**
   * Reads the content of a file and attempts to parse it as data.
   * @param path
   * @param options
   */
  readData(
    path: string | Awaitable<WorkspaceFile>,
    options?: CSVParseOptions & INIParseOptions & XMLParseOptions & JSONSchemaValidationOptions,
  ): Promise<any>;

  /**
   * Appends text to a file as text to the file system. Creates the file if needed.
   * @param path
   * @param content
   */
  appendText(path: string, content: string): Promise<void>;

  /**
   * Writes a file as text to the file system
   * @param path
   * @param content
   */
  writeText(path: string, content: string): Promise<void>;

  /**
   * Caches a buffer to file and returns the unique file name
   * @param bytes
   */
  writeCached(
    bytes: BufferLike,
    options?: {
      scope?: "workspace" | "run";
      /**
       * Filename extension
       */
      ext?: string;
    },
  ): Promise<string>;

  /**
   * Writes one or more files to the workspace
   * @param file a in-memory file or list of files
   */
  writeFiles(file: ElementOrArray<WorkspaceFile>): Promise<void>;

  /**
   * Copies a file between two paths
   * @param source
   * @param destination
   */
  copyFile(source: string, destination: string): Promise<void>;

  /**
   * Opens a file-backed key-value cache for the given cache name.
   * The cache is persisted across runs of the script. Entries are dropped when the cache grows too large.
   * @param cacheName
   */
  cache<K = any, V = any>(cacheName: string): Promise<WorkspaceFileCache<K, V>>;
}

 interface ToolCallContext {
  log(message: string): void;
  debug(message: string): void;
  trace: ToolCallTrace;
}

 interface ToolCallback {
  spec: ToolDefinition;
  options?: DefToolOptions;
  generator?: ChatGenerationContext;
  impl: (args: { context: ToolCallContext } & Record<string, any>) => Awaitable<ToolCallOutput>;
}

 interface ChatContentPartText {
  /**
   * The text content.
   */
  text: string;

  /**
   * The type of the content part.
   */
  type: "text";
}

 interface ChatContentPartImage {
  image_url: {
    /**
     * Either a URL of the image or the base64 encoded image data.
     */
    url: string;

    /**
     * Specifies the detail level of the image. Learn more in the
     * [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
     */
    detail?: "auto" | "low" | "high";
  };

  /**
   * The type of the content part.
   */
  type: "image_url";
}

 interface ChatContentPartInputAudio {
  input_audio: {
    /**
     * Base64 encoded audio data.
     */
    data: string;

    /**
     * The format of the encoded audio data. Currently supports "wav" and "mp3".
     */
    format: "wav" | "mp3";
  };

  /**
   * The type of the content part. Always `input_audio`.
   */
  type: "input_audio";
}

 interface ChatContentPartFile {
  file: {
    /**
     * The base64 encoded file data, used when passing the file to the model as a
     * string.
     */
    file_data?: string;

    /**
     * The ID of an uploaded file to use as input.
     */
    file_id?: string;

    /**
     * The name of the file, used when passing the file to the model as a string.
     */
    filename?: string;
  };

  /**
   * The type of the content part. Always `file`.
   */
  type: "file";
}

 interface ChatContentPartRefusal {
  /**
   * The refusal message generated by the model.
   */
  refusal: string;

  /**
   * The type of the content part.
   */
  type: "refusal";
}

 interface ChatSystemMessage {
  /**
   * The contents of the system message.
   */
  content: string | ChatContentPartText[];

  /**
   * The role of the messages author, in this case `system`.
   */
  role: "system";

  /**
   * An optional name for the participant. Provides the model information to
   * differentiate between participants of the same role.
   */
  name?: string;
}

/**
 * @deprecated
 */
 interface ChatFunctionMessage {
  content: string;
  name: string;
  role: "function";
}

 interface ChatToolMessage {
  /**
   * The contents of the tool message.
   */
  content: string | ChatContentPartText[];

  /**
   * The role of the messages author, in this case `tool`.
   */
  role: "tool";

  /**
   * Tool call that this message is responding to.
   */
  tool_call_id: string;
}

 interface ChatMessageToolCall {
  /**
   * The ID of the tool call.
   */
  id: string;

  /**
   * The function that the model called.
   */
  function: {
    /**
     * The arguments to call the function with, as generated by the model in JSON
     * format. Note that the model does not always generate valid JSON, and may
     * hallucinate parameters not defined by your function schema. Validate the
     * arguments in your code before calling your function.
     */
    arguments: string;

    /**
     * The name of the function to call.
     */
    name: string;
  };

  /**
   * The type of the tool. Currently, only `function` is supported.
   */
  type: "function";
}

 interface ChatAssistantMessage {
  /**
   * The role of the messages author, in this case `assistant`.
   */
  role: "assistant";

  /**
   * The contents of the assistant message. Required unless `tool_calls` or
   * `function_call` is specified.
   */
  content?: string | (ChatContentPartText | ChatContentPartRefusal)[];

  /**
   * An optional name for the participant. Provides the model information to
   * differentiate between participants of the same role.
   */
  name?: string;

  /**
   * The refusal message by the assistant.
   */
  refusal?: string | null;

  /**
   * The tool calls generated by the model, such as function calls.
   */
  tool_calls?: ChatMessageToolCall[];

  /**
   * The reasoning of the model
   */
  reasoning?: string;
}

 type ChatContentPart =
  | ChatContentPartText
  | ChatContentPartImage
  | ChatContentPartInputAudio
  | ChatContentPartFile;

 interface ChatUserMessage {
  /**
   * The contents of the user message.
   */
  content: string | ChatContentPart[];

  /**
   * The role of the messages author, in this case `user`.
   */
  role: "user";

  /**
   * An optional name for the participant. Provides the model information to
   * differentiate between participants of the same role.
   */
  name?: string;
}

 type ChatMessage =
  | ChatSystemMessage
  | ChatUserMessage
  | ChatAssistantMessage
  | ChatToolMessage
  | ChatFunctionMessage;

 type ChatParticipantHandler = (
  /**
   * Prompt generation context to create a new message in the conversation
   */
  context: ChatTurnGenerationContext,
  /**
   * Chat conversation messages
   */
  messages: ChatMessage[],
  /**
   * The last assistant text, without
   * reasoning sections.
   */
  assistantText: string,
) => Awaitable<{ messages?: ChatMessage[] } | undefined | void>;

 interface ChatParticipantOptions {
  label?: string;
}

 interface ChatParticipant {
  generator: ChatParticipantHandler;
  options: ChatParticipantOptions;
}

/**
 * A set of text extracted from the context of the prompt execution
 */
 interface ExpansionVariables
  extends Required<Pick<ChatGenerationContextOptions, "generator">> {
  /**
   * Directory where the prompt is executed
   */
  dir: string;

  /**
   * Directory where output files (trace, output) are created
   */
  runDir: string;

  /**
   * Unique identifier for the run
   */
  runId: string;

  /**
   * List of linked files parsed in context
   */
  files: WorkspaceFile[];

  /**
   * User defined variables
   */
  vars: Record<string, string | boolean | number | object | any> & {
    /**
     * When running in GitHub Copilot Chat, the current user prompt
     */
    question?: string;
    /**
     * When running in GitHub Copilot Chat, the current chat history
     */
    "copilot.history"?: (HistoryMessageUser | HistoryMessageAssistant)[];
    /**
     * When running in GitHub Copilot Chat, the current editor content
     */
    "copilot.editor"?: string;
    /**
     * When running in GitHub Copilot Chat, the current selection
     */
    "copilot.selection"?: string;
    /**
     * When running in GitHub Copilot Chat, the current terminal content
     */
    "copilot.terminalSelection"?: string;
    /**
     * Selected model identifier in GitHub Copilot Chat
     */
    "copilot.model"?: string;
    /**
     * selected text in active text editor
     */
    "editor.selectedText"?: string;
  };

  /**
   * List of secrets used by the prompt, must be registered in `genaiscript`.
   */
  secrets: Record<string, string>;

  /**
   * Output trace builder
   */
  output: OutputTrace;

  /**
   * Resolved metadata
   */
  meta: PromptDefinition & ModelConnectionOptions;

  /**
   * The script debugger logger
   */
  dbg: DebugLogger;
}

 type MakeOptional<T, P extends keyof T> = Partial<Pick<T, P>> & Omit<T, P>;

 type PromptArgs = Omit<
  PromptScript,
  "text" | "id" | "jsSource" | "defTools" | "resolvedSystem"
>;

 type PromptSystemArgs = Omit<
  PromptArgs,
  | "model"
  | "embeddingsModel"
  | "temperature"
  | "topP"
  | "maxTokens"
  | "seed"
  | "tests"
  | "responseLanguage"
  | "responseType"
  | "responseSchema"
  | "files"
  | "modelConcurrency"
  | "redteam"
  | "metadata"
>;

 type StringLike = string | WorkspaceFile | WorkspaceFile[];

 interface LineNumberingOptions {
  /**
   * Prepend each line with a line numbers. Helps with generating diffs.
   */
  lineNumbers?: boolean;

  /**
   * Offset when number lines in output
   */
  lineNumbersStart?: number;
}

 interface FenceOptions extends LineNumberingOptions, FenceFormatOptions {
  /**
   * Language of the fenced code block. Defaults to "markdown".
   */
  language?:
    | "markdown"
    | "json"
    | "yaml"
    | "javascript"
    | "typescript"
    | "python"
    | "shell"
    | "toml"
    | string;

  /**
   * JSON schema identifier
   */
  schema?: string;
}

 type PromptCacheControlType = "ephemeral";

 interface ContextExpansionOptions {
  /**
   * Specifies an maximum of estimated tokens for this entry; after which it will be truncated.
   */
  maxTokens?: number;

  /*
   * Value that is conceptually similar to a zIndex (higher number == higher priority).
   * If a rendered prompt has more message tokens than can fit into the available context window, the prompt renderer prunes messages with the lowest priority from the ChatMessages result, preserving the order in which they were declared. This means your extension code can safely declare TSX components for potentially large pieces of context like conversation history and codebase context.
   */
  priority?: number;

  /**
   * Controls the proportion of tokens allocated from the container's budget to this element.
   * It defaults to 1 on all elements.
   */
  flex?: number;

  /**
   * Caching policy for this text. `ephemeral` means the prefix can be cached for a short amount of time.
   */
  cacheControl?: PromptCacheControlType;
}

 interface RangeOptions {
  /**
   * The inclusive start of the line range, with a 1-based index
   */
  lineStart?: number;
  /**
   * The inclusive end of the line range, with a 1-based index
   */
  lineEnd?: number;
  /**
   * Center line number around which the file will be truncated.
   * Dynamically calculates the range around this line.
   * This is different from lineStart/lineEnd as it specifies a center point.
   */
  line?: number;
  /**
   * Maximum token budget for the extracted range when using line option.
   * If specified, the range will be computed to fit within this token limit.
   */
  maxTokens?: number;
}

 interface GitIgnoreFilterOptions {
  /**
   * Disable filtering files based on the `.gitignore` file.
   */
  ignoreGitIgnore?: true | undefined;
}

 interface FileFilterOptions extends GitIgnoreFilterOptions {
  /**
   * Filename filter based on file suffix. Case insensitive.
   */
  endsWith?: ElementOrArray<string>;

  /**
   * Filename filter using glob syntax.
   */
  glob?: ElementOrArray<string>;
}

 interface ContentSafetyOptions {
  /**
   * Configure the content safety provider.
   */
  contentSafety?: ContentSafetyProvider;
  /**
   * Runs the default content safety validator
   * to prevent prompt injection.
   */
  detectPromptInjection?: "always" | "available" | boolean;
}

 interface PromptSystemSafetyOptions {
  /**
   * Policy to inject builtin system prompts. See to `false` prevent automatically injecting.
   */
  systemSafety?: "default" | boolean;
}

 interface SecretDetectionOptions {
  /**
   * Policy to disable secret scanning when communicating with the LLM.
   * Set to `false` to disable.
   */
  secretScanning?: boolean;
}

 interface DefOptions
  extends FenceOptions,
    ContextExpansionOptions,
    DataFilter,
    RangeOptions,
    FileFilterOptions,
    ContentSafetyOptions {
  /**
   * By default, throws an error if the value in def is empty.
   */
  ignoreEmpty?: boolean;

  /**
   * The content of the def is a predicted output.
   * This setting disables line numbers.
   */
  prediction?: boolean;
}

/**
 * Options for the `defDiff` command.
 */
 interface DefDiffOptions
  extends ContextExpansionOptions,
    FenceFormatOptions,
    LineNumberingOptions {}

 interface ImageTransformOptions {
  /**
   * Crops the image to the specified region.
   */
  crop?: { x?: number; y?: number; w?: number; h?: number };
  /**
   * Auto cropping same color on the edges of the image
   */
  autoCrop?: boolean;
  /**
   * Applies a scaling factor to the image after cropping.
   */
  scale?: number;
  /**
   * Rotates the image by the specified number of degrees.
   */
  rotate?: number;
  /**
   * Maximum width of the image. Applied after rotation.
   */
  maxWidth?: number;
  /**
   * Maximum height of the image. Applied after rotation.
   */
  maxHeight?: number;
  /**
   * Removes colors from the image using ITU Rec 709 luminance values
   */
  greyscale?: boolean;

  /**
   * Flips the image horizontally and/or vertically.
   */
  flip?: { horizontal?: boolean; vertical?: boolean };

  /**
   * Output mime
   */
  mime?: "image/jpeg" | "image/png";
}

 interface DefImagesOptions extends ImageTransformOptions {
  /**
   * A "low" detail image is always downsampled to 512x512 pixels.
   */
  detail?: "high" | "low";
  /**
   * Selects the first N elements from the data
   */
  sliceHead?: number;
  /**
   * Selects the last N elements from the data
   */
  sliceTail?: number;
  /**
   * Selects the a random sample of N items in the collection.
   */
  sliceSample?: number;
  /**
   * Renders all images in a single tiled image
   */
  tiled?: boolean;

  /**
   * By default, throws an error if no images are passed.
   */
  ignoreEmpty?: boolean;
}

 type JSONSchemaTypeName =
  | "string"
  | "number"
  | "integer"
  | "boolean"
  | "object"
  | "array"
  | "null";

 type JSONSchemaSimpleType =
  | JSONSchemaString
  | JSONSchemaNumber
  | JSONSchemaBoolean
  | JSONSchemaObject
  | JSONSchemaArray;

 type JSONSchemaType = JSONSchemaSimpleType | JSONSchemaAnyOf | null;

 interface JSONSchemaAnyOf {
  anyOf: JSONSchemaType[];
  uiGroup?: string;
}

 interface JSONSchemaDescribed {
  /**
   * A short description of the property
   */
  title?: string;
  /**
   * A clear description of the property.
   */
  description?: string;

  /**
   * Moves the field to a sub-group in the form, potentially collapsed
   */
  uiGroup?: string;
}

 interface JSONSchemaString extends JSONSchemaDescribed {
  type: "string";
  uiType?: "textarea";
  uiSuggestions?: string[];
  enum?: string[];
  default?: string;
  pattern?: string;
}

 interface JSONSchemaNumber extends JSONSchemaDescribed {
  type: "number" | "integer";
  default?: number;
  minimum?: number;
  exclusiveMinimum?: number;
  maximum?: number;
  exclusiveMaximum?: number;
}

 interface JSONSchemaBoolean extends JSONSchemaDescribed {
  type: "boolean";
  uiType?: "runOption";
  default?: boolean;
}

 interface JSONSchemaObject extends JSONSchemaDescribed {
  $schema?: string;
  type: "object";
  properties?: {
    [key: string]: JSONSchemaType;
  };
  required?: string[];
  additionalProperties?: boolean;

  default?: object;
}

 interface JSONSchemaArray extends JSONSchemaDescribed {
  $schema?: string;
  type: "array";
  items?: JSONSchemaType;

  default?: any[];
}

 type JSONSchema = JSONSchemaObject | JSONSchemaArray;

 interface FileEditValidation {
  /**
   * JSON schema
   */
  schema?: JSONSchema;
  /**
   * Error while validating the JSON schema
   */
  schemaError?: string;
  /**
   * The path was validated with a file output (defFileOutput)
   */
  pathValid?: boolean;
}

 interface DataFrame {
  schema?: string;
  data: unknown;
  validation?: FileEditValidation;
}

 interface Logprob {
  /**
   * Token text
   */
  token: string;
  /**
   * Log probably of the generated token
   */
  logprob: number;
  /**
   * Logprob value converted to %
   */
  probPercent?: number;
  /**
   * Normalized entropy
   */
  entropy?: number;
  /**
   * Other top tokens considered by the LLM
   */
  topLogprobs?: { token: string; logprob: number }[];
}

 interface RunPromptUsage {
  /**
   * Estimated cost in $ of the generation
   */
  cost?: number;
  /**
   * Estimated duration of the generation
   * including multiple rounds with tools
   */
  duration?: number;
  /**
   * Number of tokens in the generated completion.
   */
  completion: number;

  /**
   * Number of tokens in the prompt.
   */
  prompt: number;
  /**
   * Total number of tokens used in the request (prompt + completion).
   */
  total: number;
}

 interface RunPromptResult {
  messages: ChatMessage[];
  text: string;
  reasoning?: string;
  annotations?: Diagnostic[];
  fences?: Fenced[];
  frames?: DataFrame[];
  json?: any;
  error?: SerializedError;
  schemas?: Record<string, JSONSchema>;
  finishReason: "stop" | "length" | "tool_calls" | "content_filter" | "cancel" | "fail";
  fileEdits?: Record<string, FileUpdate>;
  edits?: Edits[];
  changelogs?: string[];
  model?: ModelType;
  choices?: Logprob[];
  logprobs?: Logprob[];
  perplexity?: number;
  uncertainty?: number;
  usage?: RunPromptUsage;
}

/**
 * Path manipulation functions.
 */
 interface Path {
  parse(path: string): {
    /**
     * The root of the path such as '/' or 'c:\'
     */
    root: string;
    /**
     * The full directory path such as '/home/user/dir' or 'c:\path\dir'
     */
    dir: string;
    /**
     * The file name including extension (if any) such as 'index.html'
     */
    base: string;
    /**
     * The file extension (if any) such as '.html'
     */
    ext: string;
    /**
     * The file name without extension (if any) such as 'index'
     */
    name: string;
  };

  /**
   * Returns the last portion of a path. Similar to the Unix basename command.
   * @param path
   */
  dirname(path: string): string;

  /**
   * Returns the extension of the path, from the last '.' to end of string in the last portion of the path.
   * @param path
   */
  extname(path: string): string;

  /**
   * Returns the last portion of a path, similar to the Unix basename command.
   */
  basename(path: string, suffix?: string): string;

  /**
   * The path.join() method joins all given path segments together using the platform-specific separator as a delimiter, then normalizes the resulting path.
   * @param paths
   */
  join(...paths: string[]): string;

  /**
   * The path.normalize() method normalizes the given path, resolving '..' and '.' segments.
   */
  normalize(...paths: string[]): string;

  /**
   * The path.relative() method returns the relative path from from to to based on the current working directory. If from and to each resolve to the same path (after calling path.resolve() on each), a zero-length string is returned.
   */
  relative(from: string, to: string): string;

  /**
   * The path.resolve() method resolves a sequence of paths or path segments into an absolute path.
   * @param pathSegments
   */
  resolve(...pathSegments: string[]): string;

  /**
   * Determines whether the path is an absolute path.
   * @param path
   */
  isAbsolute(path: string): boolean;

  /**
   * Change the extension of a path
   * @param path
   * @param ext
   */
  changeext(path: string, ext: string): string;

  /**
   * Converts a file://... to a path
   * @param fileUrl
   */
  resolveFileURL(fileUrl: string): string;

  /**
   * Sanitize a string to be safe for use as a filename by removing directory paths and invalid characters.
   * @param path file path
   */
  sanitize(path: string): string;
}

 interface Fenced {
  label: string;
  language?: string;
  content: string;
  args?: { schema?: string } & Record<string, string>;

  validation?: FileEditValidation;
}

 interface XMLParseOptions extends JSONSchemaValidationOptions {
  allowBooleanAttributes?: boolean;
  ignoreAttributes?: boolean;
  ignoreDeclaration?: boolean;
  ignorePiTags?: boolean;
  parseAttributeValue?: boolean;
  removeNSPrefix?: boolean;
  unpairedTags?: string[];
}

 interface ParsePDFOptions {
  /**
   * Disable removing trailing spaces in text
   */
  disableCleanup?: boolean;
  /**
   * Render each page as an image
   */
  renderAsImage?: boolean;
  /**
   * Zoom scaling with rendering pages and figures
   */
  scale?: number;
  /**
   * Disable caching with cache: false
   */
  cache?: boolean;
  /**
   * Force system fonts use
   */
  useSystemFonts?: boolean;
}

 interface HTMLToTextOptions {
  /**
   * After how many chars a line break should follow in `p` elements.
   *
   * Set to `null` or `false` to disable word-wrapping.
   */
  wordwrap?: number | false | null | undefined;
}

 interface ParseXLSXOptions {
  // specific worksheet name
  sheet?: string;
  // Use specified range (A1-style bounded range string)
  range?: string;
}

 interface WorkbookSheet {
  name: string;
  rows: object[];
}

 interface ParseZipOptions {
  glob?: string;
}

 type TokenEncoder = (text: string) => number[];
 type TokenDecoder = (lines: Iterable<number>) => string;

 interface Tokenizer {
  model: string;
  /**
   * Number of tokens
   */
  size?: number;
  encode: TokenEncoder;
  decode: TokenDecoder;
}

 interface CSVParseOptions extends JSONSchemaValidationOptions {
  delimiter?: string;
  headers?: string[];
  repair?: boolean;
}

 interface TextChunk extends WorkspaceFile {
  lineStart: number;
  lineEnd: number;
}

 interface TextChunkerConfig extends LineNumberingOptions {
  model?: ModelType;
  chunkSize?: number;
  chunkOverlap?: number;
  docType?: OptionsOrString<
    | "cpp"
    | "python"
    | "py"
    | "java"
    | "go"
    | "c#"
    | "c"
    | "cs"
    | "ts"
    | "js"
    | "tsx"
    | "typescript"
    | "js"
    | "jsx"
    | "javascript"
    | "php"
    | "md"
    | "mdx"
    | "markdown"
    | "rst"
    | "rust"
  >;
}

 interface Tokenizers {
  /**
   * Estimates the number of tokens in the content. May not be accurate
   * @param model
   * @param text
   */
  count(text: string, options?: { model?: ModelType; approximate?: boolean }): Promise<number>;

  /**
   * Truncates the text to a given number of tokens, approximation.
   * @param model
   * @param text
   * @param maxTokens
   * @param options
   */
  truncate(
    text: string,
    maxTokens: number,
    options?: { model?: ModelType; last?: boolean },
  ): Promise<string>;

  /**
   * Tries to resolve a tokenizer for a given model. Defaults to gpt-4o if not found.
   * @param model
   */
  resolve(model?: ModelType): Promise<Tokenizer>;

  /**
   * Chunk the text into smaller pieces based on a token limit and chunking strategy.
   * @param text
   * @param options
   */
  chunk(file: Awaitable<string | WorkspaceFile>, options?: TextChunkerConfig): Promise<TextChunk[]>;
}

 interface HashOptions {
  /**
   * Algorithm used for hashing
   */
  algorithm?: "sha-256";
  /**
   * Trim hash to this number of character
   */
  length?: number;
  /**
   * Include genaiscript version in the hash
   */
  version?: boolean;
  /**
   * Optional salting of the hash
   */
  salt?: string;
  /**
   * Read the content of workspace files object into the hash
   */
  readWorkspaceFiles?: boolean;
}

 interface VideoProbeResult {
  streams: {
    index: number;
    codec_name: string;
    codec_long_name: string;
    profile: string;
    codec_type: string;
    codec_tag_string: string;
    codec_tag: string;
    width?: number;
    height?: number;
    coded_width?: number;
    coded_height?: number;
    closed_captions?: number;
    film_grain?: number;
    has_b_frames?: number;
    sample_aspect_ratio?: string;
    display_aspect_ratio?: string;
    pix_fmt?: string;
    level?: number;
    color_range?: string;
    color_space?: string;
    color_transfer?: string;
    color_primaries?: string;
    chroma_location?: string;
    field_order?: string;
    refs?: number;
    is_avc?: string;
    nal_length_size?: number;
    id: string;
    r_frame_rate: string;
    avg_frame_rate: string;
    time_base: string;
    start_pts: number;
    start_time: number;
    duration_ts: number;
    duration: number;
    bit_rate: number;
    max_bit_rate: string;
    bits_per_raw_sample: number | string;
    nb_frames: number | string;
    nb_read_frames?: string;
    nb_read_packets?: string;
    extradata_size?: number;
    tags?: {
      creation_time: string;
      language?: string;
      handler_name: string;
      vendor_id?: string;
      encoder?: string;
    };
    disposition?: {
      default: number;
      dub: number;
      original: number;
      comment: number;
      lyrics: number;
      karaoke: number;
      forced: number;
      hearing_impaired: number;
      visual_impaired: number;
      clean_effects: number;
      attached_pic: number;
      timed_thumbnails: number;
      captions: number;
      descriptions: number;
      metadata: number;
      dependent: number;
      still_image: number;
    };
    sample_fmt?: string;
    sample_rate?: number;
    channels?: number;
    channel_layout?: string;
    bits_per_sample?: number | string;
  }[];
  format: {
    filename: string;
    nb_streams: number;
    nb_programs: number;
    format_name: string;
    format_long_name: string;
    start_time: number;
    duration: number;
    size: number;
    bit_rate: number;
    probe_score: number;
    tags: {
      major_brand: string;
      minor_version: string;
      compatible_brands: string;
      creation_time: string;
    };
  };
}

 interface PDFPageImage extends WorkspaceFile {
  id: string;
  width: number;
  height: number;
}

 interface PDFPage {
  index: number;
  content: string;
  image?: string;
  figures?: PDFPageImage[];
}

 interface DocxParseOptions extends CacheOptions {
  /**
   * Desired output format
   */
  format?: "markdown" | "text" | "html";
}

 interface EncodeIDsOptions {
  matcher?: RegExp;
  prefix?: string;
  open?: string;
  close?: string;
}

 type GitIgnorer = (files: readonly (string | WorkspaceFile)[]) => string[];

 interface Parsers {
  /**
   * Parses text as a JSON5 payload
   */
  JSON5(
    content: string | WorkspaceFile,
    options?: { defaultValue?: any } & JSONSchemaValidationOptions,
  ): any | undefined;

  /**
   * Parses text generated by an LLM as JSON payload
   * @param content
   */
  JSONLLM(content: string): any | undefined;

  /**
   * Parses text or file as a JSONL payload. Empty lines are ignore, and JSON5 is used for parsing.
   * @param content
   */
  JSONL(content: string | WorkspaceFile): any[] | undefined;

  /**
   * Parses text as a YAML payload
   */
  YAML(
    content: string | WorkspaceFile,
    options?: { defaultValue?: any } & JSONSchemaValidationOptions,
  ): any | undefined;

  /**
   * Parses text as TOML payload
   * @param text text as TOML payload
   */
  TOML(
    content: string | WorkspaceFile,
    options?: { defaultValue?: any } & JSONSchemaValidationOptions,
  ): any | undefined;

  /**
   * Parses the front matter of a markdown file
   * @param content
   * @param defaultValue
   */
  frontmatter(
    content: string | WorkspaceFile,
    options?: {
      defaultValue?: any;
      format: "yaml" | "json" | "toml";
    } & JSONSchemaValidationOptions,
  ): any | undefined;

  /**
   * Parses a file or URL as PDF
   * @param content
   */
  PDF(
    content: string | WorkspaceFile,
    options?: ParsePDFOptions,
  ): Promise<
    | {
        /**
         * Reconstructed text content from page content
         */
        file: WorkspaceFile;
        /**
         * Page text content
         */
        pages: string[];
        /**
         * Rendered pages as images if `renderAsImage` is set
         */
        images?: string[];

        /**
         * Parse PDF content
         */
        data: PDFPage[];
      }
    | undefined
  >;

  /**
   * Parses a .docx file
   * @param content
   */
  DOCX(
    content: string | WorkspaceFile,
    options?: DocxParseOptions,
  ): Promise<{ file?: WorkspaceFile; error?: string }>;

  /**
   * Parses a CSV file or text
   * @param content
   */
  CSV(content: string | WorkspaceFile, options?: CSVParseOptions): object[] | undefined;

  /**
   * Parses a XLSX file and a given worksheet
   * @param content
   */
  XLSX(content: WorkspaceFile, options?: ParseXLSXOptions): Promise<WorkbookSheet[] | undefined>;

  /**
   * Parses a .env file
   * @param content
   */
  dotEnv(content: string | WorkspaceFile): Record<string, string>;

  /**
   * Parses a .ini file
   * @param content
   */
  INI(content: string | WorkspaceFile, options?: INIParseOptions): any | undefined;

  /**
   * Parses a .xml file
   * @param content
   */
  XML(
    content: string | WorkspaceFile,
    options?: { defaultValue?: any } & XMLParseOptions,
  ): any | undefined;

  /**
   * Parses .vtt or .srt transcription files
   * @param content
   */
  transcription(content: string | WorkspaceFile): TranscriptionSegment[];

  /**
   * Convert HTML to text
   * @param content html string or file
   * @param options
   */
  HTMLToText(content: string | WorkspaceFile, options?: HTMLToTextOptions): Promise<string>;

  /**
   * Convert HTML to markdown
   * @param content html string or file
   * @param options rendering options
   */
  HTMLToMarkdown(content: string | WorkspaceFile, options?: HTMLToMarkdownOptions): Promise<string>;

  /**
   * Extracts the contents of a zip archive file
   * @param file
   * @param options
   */
  unzip(file: WorkspaceFile, options?: ParseZipOptions): Promise<WorkspaceFile[]>;

  /**
   * Parses fenced code sections in a markdown text
   */
  fences(content: string | WorkspaceFile): Fenced[];

  /**
   * Parses various format of annotations (error, warning, ...)
   * @param content
   */
  annotations(content: string | WorkspaceFile): Diagnostic[];

  /**
   * Parses and evaluates a math expression
   * @param expression math expression compatible with mathjs
   * @param scope object to read/write variables
   */
  math(expression: string, scope?: object): Promise<string | number | undefined>;

  /**
   * Using the JSON schema, validates the content
   * @param schema JSON schema instance
   * @param content object to validate
   */
  validateJSON(schema: JSONSchema, content: any): FileEditValidation;

  /**
   * Renders a mustache template
   * @param text template text
   * @param data data to render
   */
  mustache(text: string | WorkspaceFile, data: Record<string, any>): string;

  /**
   * Renders a jinja template
   */
  jinja(text: string | WorkspaceFile, data: Record<string, any>): string;

  /**
   * Computes a diff between two files
   */
  diff(
    left: string | WorkspaceFile,
    right: string | WorkspaceFile,
    options?: DefDiffOptions,
  ): string;

  /**
   * Cleans up a dataset made of rows of data
   * @param rows
   * @param options
   */
  tidyData(rows: object[], options?: DataFilter): object[];

  /**
   * Applies a GROQ query to the data
   * @param data data object to filter
   * @param query query
   * @see https://groq.dev/
   */
  GROQ(query: string, data: any): Promise<any>;

  /**
   * Computes a sha1 that can be used for hashing purpose, not cryptographic.
   * @param content content to hash
   */
  hash(content: any, options?: HashOptions): Promise<string>;

  /**
   * Optionally removes a code fence section around the text
   * @param text
   * @param language
   */
  unfence(text: string, language?: ElementOrArray<string>): string;

  /**
   * Erase <think>...</think> tags
   * @param text
   */
  unthink(text: string): string;

  /**
   * Remove left indentation
   * @param text
   */
  dedent(templ: TemplateStringsArray | string, ...values: unknown[]): string;

  /**
   * Encodes ids in a text and returns the function to decode them
   * @param text
   * @param options
   */
  encodeIDs(
    text: string,
    options?: EncodeIDsOptions,
  ): {
    encoded: string;
    text: string;
    decode: (text: string) => string;
    matcher: RegExp;
    ids: Record<string, string>;
  };

  /**
   * Parses a prompty file
   * @param file
   */
  prompty(file: WorkspaceFile): Promise<PromptyDocument>;

  /**
   * Computes the Levenshtein distance between two strings or workspace files.
   */
  levenshtein(a: string | WorkspaceFile, b: string | WorkspaceFile): Promise<number>;

  /**
   * Create a file filter using the `.gitignore` format from the given filenames.
   * @param filenames
   */
  ignore(...filenames: string[]): Promise<GitIgnorer>;
}

 interface YAMLObject {
  /**
   * Parses a YAML string into a JavaScript object using JSON5.
   */
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  (strings: TemplateStringsArray, ...values: unknown[]): any;

  /**
   * Converts an object to its YAML representation
   * @param obj
   */
  stringify(obj: unknown): string;
  /**
   * Parses a YAML string to object
   */
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  parse(text: string | WorkspaceFile): any;
}

 interface PromptyFrontmatter {
  name?: string;
  description?: string;
  version?: string;
  authors?: string[];
  tags?: string[];
  sample?: Record<string, any> | string;
  inputs?: Record<
    string,
    | JSONSchemaArray
    | JSONSchemaNumber
    | JSONSchemaBoolean
    | JSONSchemaString
    | JSONSchemaObject
    | { type: "list" }
  >;
  outputs?: JSONSchemaObject;
  model?: {
    api?: "chat" | "completion";
    configuration?: {
      type?: string;
      name?: string;
      organization?: string;
      api_version?: string;
      azure_deployment: string;
      azure_endpoint: string;
    };
    parameters?: {
      response_format?: { type: "json_object" | "json_schema" };
      max_tokens?: number;
      temperature?: number;
      top_p?: number;
      n?: number;
      seed?: number;
      stream?: boolean; // ignored
      tools?: unknown[]; // ignored
    };
  };

  // unofficial
  files?: string | string[];
  tests?: PromptTest | PromptTest[];
}

 interface PromptyDocument {
  meta: PromptArgs;
  frontmatter: PromptyFrontmatter;
  content: string;
  messages: ChatMessage[];
}

 interface DiffFile {
  chunks: DiffChunk[];
  deletions: number;
  additions: number;
  from?: string;
  to?: string;
  oldMode?: string;
  newMode?: string;
  index?: string[];
  deleted?: true;
  new?: true;
}

 interface DiffChunk {
  content: string;
  changes: DiffChange[];
  oldStart: number;
  oldLines: number;
  newStart: number;
  newLines: number;
}

 interface DiffNormalChange {
  type: "normal";
  ln1: number;
  ln2: number;
  normal: true;
  content: string;
}

 interface DiffAddChange {
  type: "add";
  add: true;
  ln: number;
  content: string;
}

 interface DiffDeleteChange {
  type: "del";
  del: true;
  ln: number;
  content: string;
}

 type DiffChangeType = "normal" | "add" | "del";

 type DiffChange = DiffNormalChange | DiffAddChange | DiffDeleteChange;

 interface DIFFObject {
  /**
   * Parses a diff string into a structured object
   * @param input
   */
  parse(input: string): DiffFile[];

  /**
   * Given a filename and line number (0-based), finds the chunk in the diff
   * @param file
   * @param range line index or range [start, end] inclusive
   * @param diff
   */
  findChunk(
    file: string,
    range: number | [number, number] | number[],
    diff: ElementOrArray<DiffFile>,
  ): { file?: DiffFile; chunk?: DiffChunk } | undefined;

  /**
   * Creates a two file path
   * @param left
   * @param right
   * @param options
   */
  createPatch(
    left: string | WorkspaceFile,
    right: string | WorkspaceFile,
    options?: {
      context?: number;
      ignoreCase?: boolean;
      ignoreWhitespace?: boolean;
    },
  ): string;
}

 interface XMLObject {
  /**
   * Parses an XML payload to an object
   * @param text
   */
  parse(text: string | WorkspaceFile, options?: XMLParseOptions): Promise<any>;
}

 interface JSONSchemaUtilities {
  /**
   * Infers a JSON schema from an object
   * @param obj
   * @deprecated Use `fromParameters` instead
   */
  infer(obj: any): Promise<JSONSchema>;

  /**
   * Converts a parameters schema to a JSON schema
   * @param parameters
   */
  fromParameters(parameters: PromptParametersSchema | undefined): JSONSchema;
}

 interface HTMLTableToJSONOptions {
  useFirstRowForHeadings?: boolean;
  headers?: {
    from?: number;
    to: number;
    concatWith: string;
  };
  stripHtmlFromHeadings?: boolean;
  stripHtmlFromCells?: boolean;
  stripHtml?: boolean | null;
  forceIndexAsNumber?: boolean;
  countDuplicateHeadings?: boolean;
  ignoreColumns?: number[] | null;
  onlyColumns?: number[] | null;
  ignoreHiddenRows?: boolean;
  id?: string[] | null;
  headings?: string[] | null;
  containsClasses?: string[] | null;
  limitrows?: number | null;
}

 interface HTMLToMarkdownOptions {
  disableGfm?: boolean;
}

 interface HTMLObject {
  /**
   * Converts all HTML tables to JSON.
   * @param html
   * @param options
   */
  convertTablesToJSON(html: string, options?: HTMLTableToJSONOptions): Promise<object[][]>;
  /**
   * Converts HTML markup to plain text
   * @param html
   */
  convertToText(html: string): Promise<string>;
  /**
   * Converts HTML markup to markdown
   * @param html
   */
  convertToMarkdown(html: string, options?: HTMLToMarkdownOptions): Promise<string>;
}

 interface GitCommit {
  sha: string;
  date: string;
  author: string;
  message: string;
  files: string[];
}

 interface GitLogOptions {
  base?: string;
  head?: string;
  count?: number;
  merges?: boolean;
  author?: string;
  until?: string;
  after?: string;
  excludedGrep?: string | RegExp;
  paths?: ElementOrArray<string>;
  excludedPaths?: ElementOrArray<string>;
}

 interface GitWorktree {
  /**
   * Path to the worktree
   */
  path: string;
  /**
   * Branch name associated with the worktree
   */
  branch: string;
  /**
   * Commit SHA the worktree is checked out to
   */
  head: string;
  /**
   * Whether the worktree is bare
   */
  bare?: boolean;
  /**
   * Whether the worktree is detached (not on a branch)
   */
  detached?: boolean;
}

 interface GitWorktreeAddOptions {
  /**
   * Create a new branch with the worktree
   */
  branch?: string;
  /**
   * Force creation even if target exists
   */
  force?: boolean;
  /**
   * Checkout the branch into the worktree
   */
  checkout?: boolean;
  /**
   * Create an orphan branch
   */
  orphan?: boolean;
  /**
   * Detach HEAD at the commit
   */
  detach?: boolean;
}

 interface Git {
  /**
   * Current working directory
   */
  cwd: string;

  /**
   * Resolves the default branch for this repository
   */
  defaultBranch(): Promise<string>;

  /**
   * Gets the last tag in the repository
   */
  lastTag(): Promise<string>;

  /**
   * Gets the current branch of the repository
   */
  branch(): Promise<string>;

  /**
   * Executes a git command in the repository and returns the stdout
   * @param cmd
   */
  exec(
    args: string[] | string,
    options?: {
      label?: string;
    },
  ): Promise<string>;

  /**
   * Git fetches the remote repository
   * @param options
   */
  fetch(
    remote?: OptionsOrString<"origin">,
    branchOrSha?: string,
    options?: {
      prune?: boolean;
      all?: boolean;
    },
  ): Promise<string>;

  /**
   * Git pull the remote repository
   * @param options
   */
  pull(options?: { ff?: boolean }): Promise<string>;

  /**
   * Lists the branches in the git repository
   */
  listBranches(): Promise<string[]>;

  /**
   * Finds specific files in the git repository.
   * By default, work
   * @param options
   */
  listFiles(
    scope?: "modified-base" | "staged" | "modified",
    options?: {
      base?: string;
      /**
       * Ask the user to stage the changes if the diff is empty.
       */
      askStageOnEmpty?: boolean;
      paths?: ElementOrArray<string>;
      excludedPaths?: ElementOrArray<string>;
    },
  ): Promise<WorkspaceFile[]>;

  /**
   *
   * @param options
   */
  diff(options?: {
    staged?: boolean;
    /**
     * Ask the user to stage the changes if the diff is empty.
     */
    askStageOnEmpty?: boolean;
    base?: string;
    head?: string;
    paths?: ElementOrArray<string>;
    excludedPaths?: ElementOrArray<string>;
    unified?: number;
    nameOnly?: boolean;
    algorithm?: "patience" | "minimal" | "histogram" | "myers";
    ignoreSpaceChange?: boolean;
    extras?: string[];
    /**
     * Modifies the diff to be in a more LLM friendly format
     */
    llmify?: boolean;
    /**
     * Maximum of tokens before returning a name-only diff
     */
    maxTokensFullDiff?: number;
  }): Promise<string>;

  /**
   * Lists the commits in the git repository
   */
  log(options?: GitLogOptions): Promise<GitCommit[]>;

  /**
   * Run git blame on a file, line
   * @param filename
   * @param line
   */
  blame(filename: string, line: number): Promise<string>;

  /**
   * Returns a list of files that have changed in the git repository
   * @param options
   */
  changedFiles(options?: GitLogOptions & { readText?: string }): Promise<WorkspaceFile[]>;

  /**
   * Create a shallow git clone
   * @param repository URL of the remote repository
   * @param options various clone options
   * @returns the path to the cloned repository
   */
  shallowClone(
    repository: string,
    options?: {
      /**
       * Branch to clone
       */
      branch?: string;

      /**
       * Do not reuse previous clone
       */
      force?: boolean;

      /**
       * Runs install command after cloning
       */
      install?: boolean;

      /**
       * Number of commits to fetch
       */
      depth?: number;
    },
  ): Promise<Git>;

  /**
   * Open a git client on a different directory
   * @param cwd working directory
   */
  client(cwd: string): Git;

  /**
   * List all git worktrees
   */
  listWorktrees(): Promise<GitWorktree[]>;

  /**
   * Add a new git worktree
   * @param path path where the worktree should be created
   * @param commitish commit, branch, or tag to checkout
   * @param options additional options for worktree creation
   * @returns Git client opened at the worktree path
   */
  addWorktree(path: string, commitish?: string, options?: GitWorktreeAddOptions): Promise<Git>;

  /**
   * Remove a git worktree
   * @param path path to the worktree to remove
   * @param options removal options
   */
  removeWorktree(
    path: string,
    options?: {
      force?: boolean;
    },
  ): Promise<void>;
}

/**
 * A ffmpeg command builder. This instance is a minimal ffmpeg command builder.
 */
 interface FfmpegCommandBuilder {
  seekInput(startTime: number | string): FfmpegCommandBuilder;
  duration(duration: number | string): FfmpegCommandBuilder;
  noVideo(): FfmpegCommandBuilder;
  noAudio(): FfmpegCommandBuilder;
  audioCodec(codec: string): FfmpegCommandBuilder;
  audioBitrate(bitrate: string | number): FfmpegCommandBuilder;
  audioChannels(channels: number): FfmpegCommandBuilder;
  audioFrequency(freq: number): FfmpegCommandBuilder;
  audioQuality(quality: number): FfmpegCommandBuilder;
  audioFilters(filters: string | string[] /* | AudioVideoFilter[]*/): FfmpegCommandBuilder;
  toFormat(format: string): FfmpegCommandBuilder;

  videoCodec(codec: string): FfmpegCommandBuilder;
  videoBitrate(bitrate: string | number, constant?: boolean): FfmpegCommandBuilder;
  videoFilters(filters: string | string[]): FfmpegCommandBuilder;
  outputFps(fps: number): FfmpegCommandBuilder;
  frames(frames: number): FfmpegCommandBuilder;
  keepDisplayAspectRatio(): FfmpegCommandBuilder;
  size(size: string): FfmpegCommandBuilder;
  aspectRatio(aspect: string | number): FfmpegCommandBuilder;
  autopad(pad?: boolean, color?: string): FfmpegCommandBuilder;

  inputOptions(...options: string[]): FfmpegCommandBuilder;
  outputOptions(...options: string[]): FfmpegCommandBuilder;
}

 interface FFmpegCommandOptions extends CacheOptions {
  inputOptions?: ElementOrArray<string>;
  outputOptions?: ElementOrArray<string>;
  /**
   * For video conversion, output size as `wxh`
   */
  size?: string;
}

 interface VideoExtractFramesOptions extends FFmpegCommandOptions {
  /**
   * A set of seconds or timestamps (`[[hh:]mm:]ss[.xxx]`)
   */
  timestamps?: number[] | string[];
  /**
   * Number of frames to extract
   */
  count?: number;
  /**
   * Extract frames on the start of each transcript segment
   */
  transcript?: TranscriptionResult | string;
  /**
   * Extract Intra frames (keyframes). This is a efficient and fast decoding.
   */
  keyframes?: boolean;
  /**
   * Picks frames that exceed scene threshold (between 0 and 1), typically between 0.2, and 0.5.
   * This is computationally intensive.
   */
  sceneThreshold?: number;
  /**
   * Output of the extracted frames
   */
  format?: OptionsOrString<"jpeg" | "png">;
}

 interface VideoExtractClipOptions extends FFmpegCommandOptions {
  /**
   * Start time of the clip in seconds or timestamp (`[[hh:]mm:]ss[.xxx]`)
   */
  start: number | string;
  /**
   * Duration of the clip in seconds or timestamp (`[[hh:]mm:]ss[.xxx]`).
   * You can also specify `end`.
   */
  duration?: number | string;
  /**
   * End time of the clip in seconds or timestamp (`[[hh:]mm:]ss[.xxx]`).
   * You can also specify `duration`.
   */
  end?: number | string;
}

 interface VideoExtractAudioOptions extends FFmpegCommandOptions {
  /**
   * Optimize for speech-to-text transcription. Default is true.
   */
  transcription?: boolean;

  forceConversion?: boolean;
}

 interface Ffmpeg {
  /**
   * Extracts metadata information from a video file using ffprobe
   * @param filename
   */
  probe(file: string | WorkspaceFile, options?: FFmpegCommandOptions): Promise<VideoProbeResult>;

  /**
   * Extracts frames from a video file
   * @param options
   */
  extractFrames(
    file: string | WorkspaceFile,
    options?: VideoExtractFramesOptions,
  ): Promise<string[]>;

  /**
   * Extracts a clip from a video. Returns the generated video file path.
   */
  extractClip(file: string | WorkspaceFile, options: VideoExtractClipOptions): Promise<string>;

  /**
   * Extract the audio track from a video
   * @param videoPath
   */
  extractAudio(file: string | WorkspaceFile, options?: VideoExtractAudioOptions): Promise<string>;

  /**
   * Runs a ffmpeg command and returns the list of generated file names
   * @param input
   * @param builder manipulates the ffmpeg command and returns the output name
   */
  run(
    input: string | WorkspaceFile,
    builder: (
      cmd: FfmpegCommandBuilder,
      options?: { input: string; dir: string },
    ) => Awaitable<string>,
    options?: FFmpegCommandOptions,
  ): Promise<string[]>;
}

 interface TranscriptionSegment {
  id?: string;
  start: number;
  end?: number;
  text: string;
}

 interface GitHubOptions {
  owner: string;
  repo: string;
  baseUrl?: string;
  auth?: string;
  ref?: string;
  refName?: string;
  issueNumber?: number;
  runId?: string;
  runUrl?: string;
}

 type GitHubWorkflowRunStatus =
  | "completed"
  | "action_required"
  | "cancelled"
  | "failure"
  | "neutral"
  | "skipped"
  | "stale"
  | "success"
  | "timed_out"
  | "in_progress"
  | "queued"
  | "requested"
  | "waiting"
  | "pending";

 interface GitHubNode {
  id: number;
  node_id: string;
}

 interface GitHubWorkflowRun extends GitHubNode {
  run_number: number;
  name?: string;
  display_title: string;
  status: string;
  conclusion: string;
  html_url: string;
  created_at: string;
  head_branch: string;
  head_sha: string;
  workflow_id: number;
  run_started_at?: string;
}

 interface GitHubWorkflowJob extends GitHubNode {
  run_id: number;
  status: string;
  conclusion: string;
  name: string;
  html_url: string;
  logs_url: string;
  logs: string;
  started_at: string;
  completed_at: string;
  content: string;
}

 interface GitHubIssue extends GitHubNode {
  body?: string;
  title: string;
  number: number;
  state: string;
  state_reason?: "completed" | "reopened" | "not_planned" | null;
  html_url: string;
  draft?: boolean;
  reactions?: GitHubReactions;
  user: GitHubUser;
  assignee?: GitHubUser;
  labels?: (string | { name?: string })[];
  created_at: string;
  updated_at?: string;
  closed_at?: string;
}

 type GitHubReactionType =
  | "eyes"
  | "hooray"
  | "heart"
  | "rocket"
  | "confused"
  | "laugh"
  | "+1"
  | "-1";

 interface GitHubRef {
  ref: string;
  url: string;
}

 interface GitHubReactions {
  url: string;
  total_count: number;
  "+1": number;
  "-1": number;
  laugh: number;
  confused: number;
  heart: number;
  hooray: number;
  eyes: number;
  rocket: number;
}

 interface GitHubReaction {
  id: number;
  user: GitHubUser;
  content: GitHubReactionType;
  created_at: string;
}

 interface GitHubComment extends GitHubNode {
  body?: string;
  user: GitHubUser;
  created_at: string;
  updated_at: string;
  html_url: string;
  reactions?: GitHubReactions;
}

 interface GitHubPullRequest extends GitHubIssue {
  head: {
    ref: string;
  };
  base: {
    ref: string;
  };
}

 interface GitHubCodeSearchResult {
  name: string;
  path: string;
  sha: string;
  html_url: string;
  score: number;
  repository: string;
}

 interface GitHubWorkflow extends GitHubNode {
  name: string;
  path: string;
}

 interface GitHubPaginationOptions {
  /**
   * Default number of items to fetch, default is 50.
   */
  count?: number;
}

 interface GitHubFile extends WorkspaceFile {
  type: "file" | "dir" | "submodule" | "symlink";
  size: number;
}

 interface GitHubUser {
  login: string;
}

 interface GitHubRelease {
  id: number;
  tag_name: string;
  name: string;
  draft?: boolean;
  prerelease?: boolean;
  html_url: string;
  published_at: string;
  body?: string;
}

 interface GitHubGist {
  id: string;
  description?: string;
  created_at?: string;
  files: WorkspaceFile[];
}

 interface GitHubArtifact {
  id: number;
  name: string;
  size_in_bytes: number;
  url: string;
  archive_download_url: string;
  expires_at: string;
}

 interface GitHubIssueUpdateOptions {
  title?: string;
  body?: string;
  assignee?: string;
  state?: "open" | "closed";
  assignees?: string[];
  labels?: string[];
}

 interface GitHubIssueCreateOptions {
  labels?: string[];
  /**
   * Parent issue number to add this issue as a sub-issue
   */
  parentIssue?: number | string;
}

 interface GitHubLabel {
  name: string;
  color?: string;
  description?: string;
}

 interface GitHub {
  /**
   * Gets connection information for octokit
   */
  info(): Promise<GitHubOptions | undefined>;

  /**
   * Gets the details of a GitHub workflow
   * @param workflowId
   */
  workflow(workflowId: number | string): Promise<GitHubWorkflow>;

  /**
   * Lists workflows in a GitHub repository
   */
  listWorkflows(options?: GitHubPaginationOptions): Promise<GitHubWorkflow[]>;

  /**
   * Lists workflow runs for a given workflow
   * @param workflowId
   * @param options
   */
  listWorkflowRuns(
    workflow_id: string | number,
    options?: {
      branch?: string;
      event?: string;
      status?: GitHubWorkflowRunStatus;
    } & GitHubPaginationOptions,
  ): Promise<GitHubWorkflowRun[]>;

  /**
   * Gets the details of a GitHub Action workflow run
   * @param runId
   */
  workflowRun(runId: number | string): Promise<GitHubWorkflowRun>;

  /**
   * List artifacts for a given workflow run
   * @param runId
   */
  listWorkflowRunArtifacts(
    runId: number | string,
    options?: GitHubPaginationOptions,
  ): Promise<GitHubArtifact[]>;

  /**
   * Gets the details of a GitHub Action workflow run artifact
   * @param artifactId
   */
  artifact(artifactId: number | string): Promise<GitHubArtifact>;

  /**
   * Downloads and unzips archive files from a GitHub Action Artifact
   * @param artifactId
   */
  downloadArtifactFiles(artifactId: number | string): Promise<WorkspaceFile[]>;

  /**
   * Downloads a GitHub Action workflow run log
   * @param runId
   */
  listWorkflowJobs(runId: number, options?: GitHubPaginationOptions): Promise<GitHubWorkflowJob[]>;

  /**
   * Downloads a GitHub Action workflow run log
   * @param jobId
   */
  downloadWorkflowJobLog(jobId: number, options?: { llmify?: boolean }): Promise<string>;

  /**
   * Diffs two GitHub Action workflow job logs
   */
  diffWorkflowJobLogs(job_id: number, other_job_id: number): Promise<string>;

  /**
   * List labels in repository
   */
  listIssueLabels(issueNumber?: string | number): Promise<GitHubLabel[]>;

  /**
   * Lists issues for a given repository
   * @param options
   */
  listIssues(
    options?: {
      state?: "open" | "closed" | "all";
      labels?: string;
      sort?: "created" | "updated" | "comments";
      direction?: "asc" | "desc";
      creator?: string;
      assignee?: string;
      since?: string;
      mentioned?: string;
    } & GitHubPaginationOptions,
  ): Promise<GitHubIssue[]>;

  /**
   * Lists gists for a given user
   */
  listGists(): Promise<GitHubGist[]>;

  /**
   * Gets the files of a gist
   * @param gist_id
   */
  getGist(gist_id: string): Promise<GitHubGist | undefined>;

  /**
   * Gets the details of a GitHub issue
   * @param issueNumber issue number (not the issue id!). If undefined, reads value from GITHUB_ISSUE environment variable.
   */
  getIssue(issueNumber?: number | string): Promise<GitHubIssue>;

  /**
   * Assigns an existing issue to a bot user. Defaults to copilot user.
   */
  assignIssueToBot(
    issue_number: number | string,
    options?: { bot?: string },
  ): Promise<{ id: string; title: string }>;

  /**
   * Creates a new issue or pull request on GitHub
   */
  createIssue(
    title: string,
    body: string,
    options?: GitHubIssueCreateOptions,
  ): Promise<GitHubIssue>;

  /**
   * Updates an issue or pull request on GitHub
   * @param issueNumber
   * @param options
   */
  updateIssue(
    issueNumber: number | string,
    options: GitHubIssueUpdateOptions,
  ): Promise<GitHubIssue>;

  /**
   * Create a GitHub issue comment
   * @param issueNumber issue number (not the issue id!). If undefined, reads value from GITHUB_ISSUE environment variable.
   * @param body the body of the comment as Github Flavored markdown
   */
  createIssueComment(issueNumber: number | string, body: string): Promise<GitHubComment>;

  /**
   * Lists comments for a given issue
   * @param issue_number
   * @param options
   */
  listIssueComments(
    issue_number: number | string,
    options?: GitHubPaginationOptions,
  ): Promise<GitHubComment[]>;

  /**
   * Updates a comment on a GitHub issue
   * @param comment_id
   * @param body the updated comment body
   */
  updateIssueComment(
    comment_id: number | string,
    body: string,
    options?: GitHubAIDisclaimerOptions,
  ): Promise<GitHubComment>;

  createReaction(
    type: "issue" | "issueComment" | "pullRequestReviewComment",
    id: number | string,
    reaction: GitHubReactionType,
  ): Promise<GitHubReaction>;

  /**
   * Lists pull requests for a given repository
   * @param options
   */
  listPullRequests(
    options?: {
      state?: "open" | "closed" | "all";
      sort?: "created" | "updated" | "popularity" | "long-running";
      direction?: "asc" | "desc";
    } & GitHubPaginationOptions,
  ): Promise<GitHubPullRequest[]>;

  /**
   * Gets the details of a GitHub pull request
   * @param pull_number pull request number. Default resolves the pull request for the current branch.
   */
  getPullRequest(pull_number?: number | string): Promise<GitHubPullRequest>;

  /**
   * Lists comments for a given pull request
   * @param pull_number
   * @param options
   */
  listPullRequestReviewComments(
    pull_number: number,
    options?: GitHubPaginationOptions,
  ): Promise<GitHubComment[]>;

  /**
   * Gets the content of a file from a GitHub repository
   * @param filepath
   * @param options
   */
  getFile(
    filepath: string,
    /**
     * commit sha, branch name or tag name
     */
    ref: string,
  ): Promise<WorkspaceFile>;

  /**
   * Searches code in a GitHub repository
   */
  searchCode(query: string, options?: GitHubPaginationOptions): Promise<GitHubCodeSearchResult[]>;

  /**
   * Lists branches in a GitHub repository
   */
  listBranches(options?: GitHubPaginationOptions): Promise<string[]>;

  /**
   * Lists tags in a GitHub repository
   */
  listRepositoryLanguages(): Promise<Record<string, number>>;

  /**
   * List latest releases in a GitHub repository
   * @param options
   */
  listReleases(options?: GitHubPaginationOptions): Promise<GitHubRelease[]>;

  /**
   * Lists tags in a GitHub repository
   */
  getRepositoryContent(
    path?: string,
    options?: {
      ref?: string;
      glob?: string;
      downloadContent?: boolean;
      maxDownloadSize?: number;
      type?: GitHubFile["type"];
    },
  ): Promise<GitHubFile[]>;

  /**
   * Uploads a file to an orphaned branch in the repository and returns the raw url
   * Uploads a single copy of the file using hash as the name.
   * @param file file or data to upload
   * @param options
   */
  uploadAsset(
    file: BufferLike,
    options?: {
      branchName?: string;
    },
  ): Promise<string>;

  /**
   * Resolves user uploaded assets to a short lived URL with access token. Returns undefined if the asset is not found.
   */
  resolveAssetUrl(url: string): Promise<string | undefined>;

  /**
   * Executes a GraphQL query against the GitHub API. By default, injects the `owner`, `repo`, `ref` variables.
   * @param query
   * @param variables
   */
  graphql<T = any>(query: string, variables?: Record<string, any>): Promise<T>;

  /**
   * Gets the underlying Octokit client
   */
  api(): Promise<any>;

  /**
   * Opens a client to a different repository
   * @param owner
   * @param repo
   */
  client(owner: string, repo: string): GitHub;

  /**
   * Create a worktree for a specific GitHub pull request
   * @param pullNumber pull request number
   * @param path path where the worktree should be created
   * @param options additional options
   * @returns Git client opened at the worktree path
   */
  addWorktreeForPullRequest(
    pullNumber: number | string,
    path?: string,
    options?: GitWorktreeAddOptions,
  ): Promise<Git>;

  /**
   * Creates a URL that opens GitHub's new issue form with pre-filled title, body, and assignees
   * @param title The issue title
   * @param body The issue body content (optional)
   * @param assignees Optional array of GitHub usernames to assign to the issue
   * @returns GitHub URL for creating a new issue with pre-filled data
   */
  createIssueUrl(title: string, body?: string, assignees?: string[]): Promise<string>;
}

 interface MDObject {
  /**
   * Parses front matter from markdown
   * @param text
   */
  frontmatter(text: string | WorkspaceFile, format?: "yaml" | "json" | "toml" | "text"): any;

  /**
   * Removes the front matter from the markdown text
   */
  content(text: string | WorkspaceFile): string;

  /**
   * Merges frontmatter with the existing text
   * @param text
   * @param frontmatter
   * @param format
   */
  updateFrontmatter(text: string, frontmatter: unknown, format?: "yaml" | "json"): string;

  /**
   * Attempts to chunk markdown in text section in a way that does not splitting the heading structure.
   * @param text
   * @param options
   */
  chunk(
    text: string | WorkspaceFile,
    options?: { maxTokens?: number; model?: string; pageSeparator?: string },
  ): Promise<TextChunk[]>;

  /**
   * Pretty prints object to markdown
   * @param value
   */
  stringify(
    value: unknown,
    options?: {
      quoteValues?: boolean;
      headings?: number;
      headingLevel?: number;
    },
  ): string;
}

 interface GitHubAIDisclaimerOptions extends Record<string, unknown> {}

 interface JSONLObject {
  /**
   * Parses a JSONL string to an array of objects
   * @param text
   */
  parse(text: string | WorkspaceFile): any[];
  /**
   * Converts objects to JSONL format
   * @param objs
   */
  stringify(objs: unknown[]): string;

  /**
   * Appends an object to a JSONL file
   * @param filename
   * @param obj
   */
  append(name: string, objs: ElementOrArray<unknown>, meta?: any): Promise<void>;
}

 interface INIObject {
  /**
   * Parses a .ini file
   * @param text
   */
  parse(text: string | WorkspaceFile): any;

  /**
   * Converts an object to.ini string
   * @param value
   */
  stringify(value: any): string;
}

 interface JSON5Object {
  /**
   * Parses a JSON/YAML/XML string to an object
   * @param text
   */
  parse(text: string | WorkspaceFile): any;

  /**
   * Renders an object to a JSON5-LLM friendly string
   * @param value
   */
  stringify(value: any): string;
}

 interface CSVStringifyOptions {
  delimiter?: string;
  header?: boolean;
}

/**
 * Interface representing CSV operations.
 */
 interface CSVObject {
  /**
   * Parses a CSV string to an array of objects.
   *
   * @param text - The CSV string to parse.
   * @param options - Optional settings for parsing.
   * @param options.delimiter - The delimiter used in the CSV string. Defaults to ','.
   * @param options.headers - An array of headers to use. If not provided, headers will be inferred from the first row.
   * @returns An array of objects representing the parsed CSV data.
   */
  parse(text: string | WorkspaceFile, options?: CSVParseOptions): object[];

  /**
   * Converts an array of objects to a CSV string.
   *
   * @param csv - The array of objects to convert.
   * @param options - Optional settings for stringifying.
   * @param options.headers - An array of headers to use. If not provided, headers will be inferred from the object keys.
   * @returns A CSV string representing the data.
   */
  stringify(csv: object[], options?: CSVStringifyOptions): string;

  /**
   * Converts an array of objects that represents a data table to a markdown table.
   *
   * @param csv - The array of objects to convert.
   * @param options - Optional settings for markdown conversion.
   * @param options.headers - An array of headers to use. If not provided, headers will be inferred from the object keys.
   * @returns A markdown string representing the data table.
   */
  markdownify(csv: object[], options?: { headers?: string[] }): string;

  /**
   * Splits the original array into chunks of the specified size.
   * @param csv
   * @param rows
   */
  chunk(csv: object[], size: number): { chunkStartIndex: number; rows: object[] }[];
}

/**
 * Provide service for responsible.
 */
 interface ContentSafety {
  /**
   * Service identifier
   */
  id: string;

  /**
   * Scans text for the risk of a User input attack on a Large Language Model.
   * If not supported, the method is not defined.
   */
  detectPromptInjection?(
    content: Awaitable<ElementOrArray<string> | ElementOrArray<WorkspaceFile>>,
  ): Promise<{ attackDetected: boolean; filename?: string; chunk?: string }>;
  /**
   * Analyzes text for harmful content.
   * If not supported, the method is not defined.
   * @param content
   */
  detectHarmfulContent?(
    content: Awaitable<ElementOrArray<string> | ElementOrArray<WorkspaceFile>>,
  ): Promise<{
    harmfulContentDetected: boolean;
    filename?: string;
    chunk?: string;
  }>;
}

 interface HighlightOptions {
  maxLength?: number;
}

 interface WorkspaceFileIndex {
  /**
   * Gets the index name
   */
  name: string;
  /**
   * Uploads or merges files into the index
   */
  insertOrUpdate: (file: ElementOrArray<WorkspaceFile>) => Promise<void>;
  /**
   * Searches the index
   */
  search: (
    query: string,
    options?: { topK?: number; minScore?: number },
  ) => Promise<WorkspaceFileWithScore[]>;
}

 interface VectorIndexOptions extends EmbeddingsModelOptions {
  /**
   * Type of database implementation.
   * - `local` uses a local database using embeddingsModel
   * - `azure_ai_search` uses Azure AI Search
   */
  type?: "local" | "azure_ai_search";
  version?: number;
  deleteIfExists?: boolean;
  chunkSize?: number;
  chunkOverlap?: number;

  /**
   * Max tokens in a request
   */
  maxTokens?: number;

  /**
   * Embeddings vector size
   */
  vectorSize?: number;
  /**
   * Override default embeddings cache name
   */
  cacheName?: string;
  /**
   * Cache salt to invalidate cache entries
   */
  cacheSalt?: string;
}

 interface VectorSearchOptions extends VectorIndexOptions {
  /**
   * Maximum number of embeddings to use
   */
  topK?: number;
  /**
   * Minimum similarity score
   */
  minScore?: number;
  /**
   * Index to use
   */
  indexName?: string;
}

 interface FuzzSearchOptions {
  /**
   * Controls whether to perform prefix search. It can be a simple boolean, or a
   * function.
   *
   * If a boolean is passed, prefix search is performed if true.
   *
   * If a function is passed, it is called upon search with a search term, the
   * positional index of that search term in the tokenized search query, and the
   * tokenized search query.
   */
  prefix?: boolean;
  /**
   * Controls whether to perform fuzzy search. It can be a simple boolean, or a
   * number, or a function.
   *
   * If a boolean is given, fuzzy search with a default fuzziness parameter is
   * performed if true.
   *
   * If a number higher or equal to 1 is given, fuzzy search is performed, with
   * a maximum edit distance (Levenshtein) equal to the number.
   *
   * If a number between 0 and 1 is given, fuzzy search is performed within a
   * maximum edit distance corresponding to that fraction of the term length,
   * approximated to the nearest integer. For example, 0.2 would mean an edit
   * distance of 20% of the term length, so 1 character in a 5-characters term.
   * The calculated fuzziness value is limited by the `maxFuzzy` option, to
   * prevent slowdown for very long queries.
   */
  fuzzy?: boolean | number;
  /**
   * Controls the maximum fuzziness when using a fractional fuzzy value. This is
   * set to 6 by default. Very high edit distances usually don't produce
   * meaningful results, but can excessively impact search performance.
   */
  maxFuzzy?: number;
  /**
   * Maximum number of results to return
   */
  topK?: number;
  /**
   * Minimum score
   */
  minScore?: number;
}

 interface Retrieval {
  /**
   * Executers a web search with Tavily or Bing Search.
   * @param query
   */
  webSearch(
    query: string,
    options?: {
      count?: number;
      provider?: "tavily" | "bing";
      /**
       * Return undefined when no web search providers are present
       */
      ignoreMissingProvider?: boolean;
    },
  ): Promise<WorkspaceFile[]>;

  /**
   * Search using similarity distance on embeddings
   */
  vectorSearch(
    query: string,
    files: (string | WorkspaceFile) | (string | WorkspaceFile)[],
    options?: VectorSearchOptions,
  ): Promise<WorkspaceFile[]>;

  /**
   * Loads or creates a file index using a vector index
   * @param options
   */
  index(id: string, options?: VectorIndexOptions): Promise<WorkspaceFileIndex>;

  /**
   * Performs a fuzzy search over the files
   * @param query keywords to search
   * @param files list of files
   * @param options fuzzing configuration
   */
  fuzzSearch(
    query: string,
    files: WorkspaceFile | WorkspaceFile[],
    options?: FuzzSearchOptions,
  ): Promise<WorkspaceFile[]>;
}

 interface ArrayFilter {
  /**
   * Selects the first N elements from the data
   */
  sliceHead?: number;
  /**
   * Selects the last N elements from the data
   */
  sliceTail?: number;
  /**
   * Selects the a random sample of N items in the collection.
   */
  sliceSample?: number;
}

 interface DataFilter extends ArrayFilter {
  /**
   * The keys to select from the object.
   * If a key is prefixed with -, it will be removed from the object.
   */
  headers?: ElementOrArray<string>;
  /**
   * Removes items with duplicate values for the specified keys.
   */
  distinct?: ElementOrArray<string>;
  /**
   * Sorts the data by the specified key(s)
   */
  sort?: ElementOrArray<string>;
}

 interface DefDataOptions
  extends Omit<ContextExpansionOptions, "maxTokens">,
    FenceFormatOptions,
    DataFilter,
    ContentSafetyOptions {
  /**
   * Output format in the prompt. Defaults to Markdown table rendering.
   */
  format?: "json" | "yaml" | "csv";

  /**
   * GROQ query to filter the data
   * @see https://groq.dev/
   */
  query?: string;
}

 interface DefSchemaOptions {
  /**
   * Output format in the prompt.
   */
  format?: "typescript" | "json" | "yaml";
}

 type ChatFunctionArgs = { context: ToolCallContext } & Record<string, any>;
 type ChatFunctionHandler = (args: ChatFunctionArgs) => Awaitable<ToolCallOutput>;
 type ChatMessageRole = "user" | "assistant" | "system";

 interface HistoryMessageUser {
  role: "user";
  content: string;
}

 interface HistoryMessageAssistant {
  role: "assistant";
  name?: string;
  content: string;
}

 interface WriteTextOptions extends ContextExpansionOptions {
  /**
   * Append text to the assistant response. This feature is not supported by all models.
   * @deprecated
   */
  assistant?: boolean;
  /**
   * Specifies the message role. Default is user
   */
  role?: ChatMessageRole;
}

 type PromptGenerator = (ctx: ChatGenerationContext) => Awaitable<unknown>;

 interface PromptGeneratorOptions
  extends ModelOptions,
    PromptSystemOptions,
    ContentSafetyOptions,
    SecretDetectionOptions,
    MetadataOptions {
  /**
   * Label for trace
   */
  label?: string;

  /**
   * Write file edits to the file system
   */
  applyEdits?: boolean;

  /**
   * Throws if the generation is not successful
   */
  throwOnError?: boolean;
}

 interface FileOutputOptions {
  /**
   * Schema identifier to validate the generated file
   */
  schema?: string;
}

 interface FileOutput {
  pattern: string[];
  description?: string;
  options?: FileOutputOptions;
}

 interface ImportTemplateOptions {
  /**
   * Ignore unknown arguments
   */
  allowExtraArguments?: boolean;

  /**
   * Template engine syntax
   */
  format?: "mustache" | "jinja";
}

 interface PromptTemplateString {
  /**
   * Set a priority similar to CSS z-index
   * to control the trimming of the prompt when the context is full
   * @param priority
   */
  priority(value: number): PromptTemplateString;
  /**
   * Sets the context layout flex weight
   */
  flex(value: number): PromptTemplateString;
  /**
   * Applies jinja template to the string lazily
   * @param data jinja data
   */
  jinja(data: Record<string, any>): PromptTemplateString;
  /**
   * Applies mustache template to the string lazily
   * @param data mustache data
   */
  mustache(data: Record<string, any>): PromptTemplateString;
  /**
   * Sets the max tokens for this string
   * @param tokens
   */
  maxTokens(tokens: number): PromptTemplateString;

  /**
   * Updates the role of the message
   */
  role(role: ChatMessageRole): PromptTemplateString;

  /**
   * Configure the cacheability of the prompt.
   * @param value cache control type
   */
  cacheControl(value: PromptCacheControlType): PromptTemplateString;
}

 type ImportTemplateArgumentType =
  | Awaitable<string | number | boolean>
  | (() => Awaitable<string | number | boolean>);

/**
 * Represents the context for generating a chat turn in a prompt template.
 * Provides methods for importing templates, writing text, adding assistant responses,
 * creating template strings, fencing code blocks, defining variables, and logging.
 */
 interface ChatTurnGenerationContext {
  importTemplate(
    files: ElementOrArray<string | WorkspaceFile>,
    templateArguments?: Record<string, ImportTemplateArgumentType>,
    options?: ImportTemplateOptions,
  ): void;
  writeText(body: Awaitable<string>, options?: WriteTextOptions): void;
  assistant(text: Awaitable<string>, options?: Omit<WriteTextOptions, "assistant">): void;
  $(strings: TemplateStringsArray, ...args: any[]): PromptTemplateString;
  fence(body: StringLike, options?: FenceOptions): void;
  def(
    name: string,
    body: string | WorkspaceFile | WorkspaceFile[] | ShellOutput | Fenced | RunPromptResult,
    options?: DefOptions,
  ): string;
  defImages(files: ElementOrArray<BufferLike>, options?: DefImagesOptions): void;
  defData(name: string, data: Awaitable<object[] | object>, options?: DefDataOptions): string;
  defDiff<T extends string | WorkspaceFile>(
    name: string,
    left: T,
    right: T,
    options?: DefDiffOptions,
  ): string;
  console: PromptGenerationConsole;
}

 interface FileUpdate {
  before: string;
  after: string;
  validation?: FileEditValidation;
}

 interface RunPromptResultPromiseWithOptions extends Promise<RunPromptResult> {
  options(values?: PromptGeneratorOptions): RunPromptResultPromiseWithOptions;
}

 interface DefToolOptions extends ContentSafetyOptions {
  /**
   * Maximum number of tokens per tool content response
   */
  maxTokens?: number;

  /**
   * Suffix to identify the variant instantiation of the tool
   */
  variant?: string;

  /**
   * Updated description for the variant
   */
  variantDescription?: string;

  /**
   * Intent of the tool that will be used for LLM judge validation of the output.
   * `description` uses the tool description as the intent.
   * If the intent is a function, it must build a LLM-as-Judge prompt that emits OK/ERR categories.
   */
  intent?:
    | OptionsOrString<"description">
    | ((options: {
        tool: ToolDefinition;
        args: any;
        result: string;
        generator: ChatGenerationContext;
      }) => Awaitable<void>);
}

 interface DefAgentOptions extends Omit<PromptGeneratorOptions, "label">, DefToolOptions {
  /**
   * Excludes agent conversation from agent memory
   */
  disableMemory?: boolean;

  /**
   * Disable memory query on each query (let the agent call the tool)
   */
  disableMemoryQuery?: boolean;
}

 type ChatAgentHandler = (
  ctx: ChatGenerationContext,
  args: ChatFunctionArgs,
) => Awaitable<unknown>;

 interface McpToolSpecification {
  /**
   * Tool identifier
   */
  id: string;
  /**
   * The high level intent of the tool, which can be used for LLM judge validation.
   * `description` uses the tool description as the intent.
   */
  intent?: DefToolOptions["intent"];
}

 interface McpServerConfig extends ContentSafetyOptions {
  /**
   * The executable to run to start the server.
   * Required for stdio transport, not used for URL-based transports.
   */
  command?: OptionsOrString<"npx" | "uv" | "uvx" | "dotnet" | "docker" | "cargo">;
  /**
   * Command line arguments to pass to the executable.
   * Required for stdio transport, not used for URL-based transports.
   */
  args?: string[];
  /**
   * The URL to connect to for HTTP/WebSocket/SSE transports.
   * When provided, command and args are ignored.
   */
  url?: string;
  /**
   * The transport type to use. If not specified, will be inferred from the configuration.
   * - "stdio": Use StdioClientTransport (requires command and args)
   * - "http": Use StreamableHTTPClientTransport (requires url)
   * - "sse": Use SSEClientTransport (requires url)
   */
  type?: "stdio" | "http" | "sse";
  /**
   * The server version
   */
  version?: string;
  /**
   * The environment to use when spawning the process.
   *
   * If not specified, the result of getDefaultEnvironment() will be used.
   * Only used for stdio transport.
   */
  env?: Record<string, string>;
  /**
   * The working directory to use when spawning the process.
   *
   * If not specified, the current working directory will be inherited.
   * Only used for stdio transport.
   */
  cwd?: string;

  /**
   * Do not prepend client identifier with the tool id.
   */
  disableToolIdMangling?: boolean;

  id: string;
  options?: DefToolOptions;

  /**
   * A list of allowed tools and their specifications. This filtering is applied
   * before computing the sha signature.
   */
  tools?: ElementOrArray<string | McpToolSpecification>;

  /**
   * The sha signature of the tools returned by the server.
   * If set, the tools will be validated against this sha.
   * This is used to ensure that the tools are not modified by the server.
   */
  toolsSha?: string;

  /**
   * Validates that each tool has responses related to their description.
   */
  intent?: DefToolOptions["intent"];

  generator?: ChatGenerationContext;
}

 type McpServersConfig = Record<string, Omit<McpServerConfig, "id" | "options">> | string;

 interface McpAgentServerConfig extends McpServerConfig {
  description: string;
  instructions?: string;
  /**
   * Maximum number of tokens per tool content response
   */
  maxTokens?: number;
}

 type McpAgentServersConfig =
  | Record<string, Omit<McpAgentServerConfig, "id" | "options">>
  | string;

 type ZodTypeLike = { _def: any; safeParse: any; refine: any };

 type BufferLike =
  | string
  | WorkspaceFile
  | Buffer
  | Blob
  | ArrayBuffer
  | Uint8Array
  | ReadableStream
  | SharedArrayBuffer;

 type TranscriptionModelType = OptionsOrString<
  "openai:whisper-1" | "openai:gpt-4o-transcribe" | "whisperasr:default"
>;

 interface ImageGenerationOptions extends ImageTransformOptions, RetryOptions {
  model?: OptionsOrString<ModelImageGenerationType>;
  /**
   * The quality of the image that will be generated.
   * auto (default value) will automatically select the best quality for the given model.
   * high, medium and low are supported for gpt-image-1.
   * high is supported for dall-e-3.
   * dall-e-2 ignores this flag
   */
  quality?: "auto" | "low" | "medium" | "high";
  /**
   * Image size.
   * For gpt-image-1: 1024x1024, 1536x1024 (landscape), 1024x1536 (portrait), or auto (default value)
   * For dall-e: 256x256, 512x512, or 1024x1024 for dall-e-2, and one of 1024x1024, 1792x1024.
   */
  size?: OptionsOrString<
    | "auto"
    | "landscape"
    | "portrait"
    | "square"
    | "1536x1024"
    | "1024x1536"
    | "256x256"
    | "512x512"
    | "1024x1024"
    | "1024x1792"
    | "1792x1024"
  >;
  /**
   * Only used for DALL-E 3
   */
  style?: OptionsOrString<"vivid" | "natural">;

  /**
   * For gpt-image-1 only, the type of image format to generate.
   */
  outputFormat?: "png" | "jpeg" | "webp";

  /**
   * Generation mode. Defaults to "generate".
   * - "generate": Create new images from text prompts
   * - "edit": Edit existing images using text prompts and optional masks
   */
  mode?: "generate" | "edit";

  /**
   * Input image for edit mode.
   * Required for "edit" mode.
   */
  image?: BufferLike;

  /**
   * Mask image for edit mode (optional).
   * Used to specify which parts of the image to edit.
   * Only applicable in "edit" mode.
   */
  mask?: BufferLike;
}

 interface TranscriptionOptions extends CacheOptions, RetryOptions {
  /**
   * Model to use for transcription. By default uses the `transcribe` alias.
   */
  model?: TranscriptionModelType;

  /**
   * Translate to English.
   */
  translate?: boolean;

  /**
   * Input language in iso-639-1 format.
   * @see https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes
   */
  language?: string;

  /**
   * The sampling temperature, between 0 and 1.
   * Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
   */
  temperature?: number;
}

 interface TranscriptionResult {
  /**
   * Complete transcription text
   */
  text: string;
  /**
   * Error if any
   */
  error?: SerializedError;

  /**
   * SubRip subtitle string from segments
   */
  srt?: string;

  /**
   * WebVTT subtitle string from segments
   */
  vtt?: string;

  /**
   * Individual segments
   */
  segments?: (TranscriptionSegment & {
    /**
     * Seek offset of the segment
     */
    seek?: number;
    /**
     * Temperature used for the generation of the segment
     */
    temperature?: number;
  })[];
}

 type SpeechModelType = OptionsOrString<
  "openai:tts-1-hd" | "openai:tts-1" | "openai:gpt-4o-mini-tts"
>;

 type SpeechVoiceType = OptionsOrString<
  | "alloy"
  | "ash"
  | "coral"
  | "echo"
  | "fable"
  | "onyx"
  | "nova"
  | "sage"
  | "shimmer"
  | "verse"
  | "ballad"
>;

 interface SpeechOptions extends CacheOptions, RetryOptions {
  /**
   * Speech to text model
   */
  model?: SpeechModelType;

  /**
   * Voice to use (model-specific)
   */
  voice?: SpeechVoiceType;

  /**
   * Control the voice of your generated audio with additional instructions. Does not work with tts-1 or tts-1-hd.
   */
  instructions?: string;
}

 interface SpeechResult {
  /**
   * Generate audio-buffer file
   */
  filename?: string;
  /**
   * Error if any
   */
  error?: SerializedError;
}

 interface ChatGenerationContext extends ChatTurnGenerationContext {
  env: ExpansionVariables;
  defSchema(name: string, schema: JSONSchema | ZodTypeLike, options?: DefSchemaOptions): string;
  defTool(
    tool: Omit<ToolCallback, "generator"> | McpServersConfig | McpClient,
    options?: DefToolOptions,
  ): void;
  defTool(
    name: string,
    description: string,
    parameters: PromptParametersSchema | JSONSchema,
    fn: ChatFunctionHandler,
    options?: DefToolOptions,
  ): void;
  defAgent(
    name: string,
    description: string,
    fn: string | ChatAgentHandler,
    options?: DefAgentOptions,
  ): void;
  defChatParticipant(participant: ChatParticipantHandler, options?: ChatParticipantOptions): void;
  defFileOutput(
    pattern: ElementOrArray<string | WorkspaceFile>,
    description: string,
    options?: FileOutputOptions,
  ): void;
  runPrompt(
    generator: string | PromptGenerator,
    options?: PromptGeneratorOptions,
  ): Promise<RunPromptResult>;
  prompt(strings: TemplateStringsArray, ...args: any[]): RunPromptResultPromiseWithOptions;
  defFileMerge(fn: FileMergeHandler): void;
  defOutputProcessor(fn: PromptOutputProcessorHandler): void;
  transcribe(
    audio: string | WorkspaceFile,
    options?: TranscriptionOptions,
  ): Promise<TranscriptionResult>;
  speak(text: string, options?: SpeechOptions): Promise<SpeechResult>;
  generateImage(
    prompt: string,
    options?: ImageGenerationOptions,
  ): Promise<{ image: WorkspaceFile; revisedPrompt?: string }>;
}

 interface ChatGenerationContextOptions {
  /**
   * Prompt generation context
   */
  generator?: ChatGenerationContext;
}

 interface GenerationOutput {
  /**
   * full chat history
   */
  messages: ChatMessage[];

  /**
   * LLM output.
   */
  text: string;

  /**
   * Reasoning produced by model
   */
  reasoning?: string;

  /**
   * Parsed fence sections
   */
  fences: Fenced[];

  /**
   * Parsed data sections
   */
  frames: DataFrame[];

  /**
   * A map of file updates
   */
  fileEdits: Record<string, FileUpdate>;

  /**
   * Generated annotations
   */
  annotations: Diagnostic[];

  /**
   * Schema definition used in the generation
   */
  schemas: Record<string, JSONSchema>;

  /**
   * Output as JSON if parsable
   */
  json?: any;

  /**
   * Usage stats
   */
  usage?: RunPromptUsage;
}

 type Point = {
  row: number;
  column: number;
};

 interface DebugLogger {
  /**
   * Creates a debug logging function. Debug uses printf-style formatting. Below are the officially supported formatters:
   * - `%O`	Pretty-print an Object on multiple lines.
   * - `%o`	Pretty-print an Object all on a single line.
   * - `%s`	String.
   * - `%d`	Number (both integer and float).
   * - `%j`	JSON. Replaced with the string '[Circular]' if the argument contains circular references.
   * - `%%`	Single percent sign ('%'). This does not consume an argument.
   * @param category
   * @see https://www.npmjs.com/package/debug
   */
  (formatter: any, ...args: any[]): void;
  /**
   * Indicates if this logger is enabled
   */
  enabled: boolean;
  /**
   * The namespace of the logger provided when calling 'host.logger'
   */
  namespace: string;
}

 interface LoggerHost {
  /**
   * Creates a debug logging function. Debug uses printf-style formatting. Below are the officially supported formatters:
   * - `%O`	Pretty-print an Object on multiple lines.
   * - `%o`	Pretty-print an Object all on a single line.
   * - `%s`	String.
   * - `%d`	Number (both integer and float).
   * - `%j`	JSON. Replaced with the string '[Circular]' if the argument contains circular references.
   * - `%%`	Single percent sign ('%'). This does not consume an argument.
   * @param category
   * @see https://www.npmjs.com/package/debug
   */
  logger(category: string): DebugLogger;
}

 interface ShellOptions {
  cwd?: string;

  stdin?: string;

  /**
   * Process timeout in  milliseconds, default is 60s
   */
  timeout?: number;
  /**
   * trace label
   */
  label?: string;

  /**
   * Ignore exit code errors
   */
  ignoreError?: boolean;

  /**
   * Additional environment variables to set for the process.
   */
  env?: Record<string, string>;

  /**
   * Inject the content of 'env' exclusively
   */
  isolateEnv?: boolean;
}

 interface ShellOutput {
  stdout?: string;
  stderr?: string;
  exitCode: number;
  failed?: boolean;
}

 interface TimeoutOptions {
  /**
   * Maximum time in milliseconds. Default to no timeout
   */
  timeout?: number;
}

 interface ShellSelectOptions {}

 interface ShellSelectChoice {
  name?: string;
  value: string;
  description?: string;
}

 interface ShellInputOptions {
  required?: boolean;
}

 interface ShellConfirmOptions {
  default?: boolean;
}

 interface ShellHost {
  /**
   * Executes a shell command
   * @param command
   * @param args
   * @param options
   */
  exec(commandWithArgs: string, options?: ShellOptions): Promise<ShellOutput>;
  exec(command: string, args: string[], options?: ShellOptions): Promise<ShellOutput>;
}

 interface McpToolReference {
  name: string;
  description?: string;
  inputSchema?: JSONSchema;
}

 interface McpResourceReference {
  name?: string;
  description?: string;
  uri: string;
  mimeType?: string;
}

 interface McpServerToolResultTextPart {
  type: "text";
  text: string;
}

 interface McpServerToolResultImagePart {
  type: "image";
  data: string;
  mimeType: string;
}

 interface McpServerToolResourcePart {
  type: "resource";
  text?: string;
  uri?: string;
  mimeType?: string;
  blob?: string;
}

 type McpServerToolResultPart =
  | McpServerToolResultTextPart
  | McpServerToolResultImagePart
  | McpServerToolResourcePart;

 interface McpServerToolResult {
  isError?: boolean;
  content: McpServerToolResultPart[];
  text?: string;
}

 interface McpClient extends AsyncDisposable {
  /**
   * Configuration of the server
   */
  readonly config: McpServerConfig;

  /**
   * Pings the server
   */
  ping(): Promise<void>;

  /**
   * List all available MCP tools
   */
  listTools(): Promise<McpToolReference[]>;

  /**
   * Returns a list of tools that can be used in a chat session
   */
  listToolCallbacks(): Promise<ToolCallback[]>;

  /**
   * List resources available in the server
   */
  listResources(): Promise<McpResourceReference[]>;

  /**
   * Reads the resource content
   */
  readResource(uri: string): Promise<WorkspaceFile[]>;

  /**
   *
   * @param name Call the MCP tool
   * @param args
   */
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  callTool(name: string, args: Record<string, any>): Promise<McpServerToolResult>;

  /**
   * Closes clients and server.
   */
  dispose(): Promise<void>;
}

 interface McpHost {
  /**
   * Starts a Model Context Protocol server and returns a client.
   */
  mcpServer(config: McpServerConfig): Promise<McpClient>;
}

 interface ResourceReference {
  uri: string; // Unique identifier for the resource
  name: string; // Human-readable name
  description?: string; // Optional description
  mimeType?: string; // Optional MIME type
}

 interface ResourceHost {
  /**
   * Publishes a resource that will be exposed through the MCP server protocol.
   * @param content
   */
  publishResource(
    name: string,
    content: BufferLike,
    options?: Partial<Pick<ResourceReference, "description" | "mimeType">> & SecretDetectionOptions,
  ): Promise<string>;

  /**
   * List available resource references
   */
  resources(): Promise<ResourceReference[]>;

  /**
   * Tries to resolve a resource from a URL.
   * @param url - The URL to resolve.
   * @returns A promise that resolves to an object containing the parsed URI and resolved files, or undefined if resolution fails.
   */
  resolveResource(url: string): Promise<{ uri: URL; files: WorkspaceFile[] } | undefined>;
}

 interface UserInterfaceHost {
  /**
   * Asks the user to select between options
   * @param message question to ask
   * @param options options to select from
   */
  select(
    message: string,
    choices: (string | ShellSelectChoice)[],
    options?: ShellSelectOptions,
  ): Promise<string>;

  /**
   * Asks the user to input a text
   * @param message message to ask
   */
  input(message: string, options?: ShellInputOptions): Promise<string>;

  /**
   * Asks the user to confirm a message
   * @param message message to ask
   */
  confirm(message: string, options?: ShellConfirmOptions): Promise<boolean>;
}

 interface ContainerPortBinding {
  containerPort: OptionsOrString<"8000/tcp">;
  hostPort: string | number;
}

 interface ContainerOptions {
  /**
   * Container image names.
   * @example python:alpine python:slim python
   * @see https://hub.docker.com/_/python/
   */
  image?: OptionsOrString<"python:alpine" | "python:slim" | "python" | "node" | "gcc">;

  /**
   * Enable networking in container (disabled by default)
   */
  networkEnabled?: boolean;

  /**
   * Environment variables in container. A null/undefined variable is removed from the environment.
   */
  env?: Record<string, string>;

  /**
   * Assign the specified name to the container. Must match [a-zA-Z0-9_-]+.
   */
  name?: string;

  /**
   * Disable automatic purge of container and volume directory and potentially reuse with same name, configuration.
   */
  persistent?: boolean;

  /**
   * List of exposed TCP ports
   */
  ports?: ElementOrArray<ContainerPortBinding>;

  /**
   * Commands to executes after the container is created
   */
  postCreateCommands?: ElementOrArray<string>;

  /**
   * Container operating system type. Determines path separator used for working directories.
   * Defaults to "unix" for compatibility with most Linux-based containers.
   */
  osType?: "unix" | "windows";
}

 interface PromiseQueue {
  /**
   * Adds a new promise to the queue
   * @param fn
   */
  add<Arguments extends unknown[], ReturnType>(
    function_: (...arguments_: Arguments) => Awaitable<ReturnType>,
    ...arguments_: Arguments
  ): Promise<ReturnType>;

  /**
   * Runs all the functions in the queue with limited concurrency
   * @param fns
   */
  all<T = any>(fns: (() => Awaitable<T>)[]): Promise<T[]>;

  /**
   * Applies a function to all the values in the queue with limited concurrency
   * @param values
   * @param fn
   */
  mapAll<T extends unknown, Arguments extends unknown[], ReturnType>(
    values: T[],
    fn: (value: T, ...arguments_: Arguments) => Awaitable<ReturnType>,
    ...arguments_: Arguments
  ): Promise<ReturnType[]>;
}

 interface LanguageModelReference {
  provider: ModelProviderType;
  model: ModelType;
  modelId: string;
}

 interface LanguageModelInfo {
  id: ModelType;
  details?: string;
  url?: string;
  version?: string;
  /**
   * Base model name
   */
  family?: string;
}

 interface LanguageModelProviderInfo {
  id: ModelProviderType;
  version?: string;
  error?: string;
  models: LanguageModelInfo[];
  base?: string;
  token?: string; // Optional token for the provider
}

 interface LanguageModelHost {
  /**
   * Resolve a language model alias to a provider and model based on the current configuration
   * @param modelId
   */
  resolveLanguageModel(modelId?: ModelType): Promise<LanguageModelReference>;

  /**
   * Returns the status of the model provider and list of models if available
   */
  resolveLanguageModelProvider(
    provider: ModelProviderType,
    options?: {
      // If true, returns the list of models available in the provider
      listModels?: boolean;
      // If true, return the token
      token?: boolean;
    },
  ): Promise<LanguageModelProviderInfo>;
}

 type ContentSafetyProvider = "azure";

 interface ContentSafetyHost {
  /**
   * Resolve a content safety client
   * @param id safety detection project
   */
  contentSafety(id?: ContentSafetyProvider): Promise<ContentSafety>;
}

 interface RetryOptions {
  retryOn?: number[]; // HTTP status codes to retry on
  retries?: number; // Number of retry attempts
  retryDelay?: number; // Initial delay between retries
  maxDelay?: number; // Maximum delay between retries
  maxRetryAfter?: number; // Maximum retry-after in milliseconds before giving up
}

 interface CacheOptions {
  /**
   * By default, LLM queries are not cached.
   * If true, the LLM request will be cached. Use a string to override the default cache name
   */
  cache?: boolean | string;
}

 type FetchOptions = RequestInit & RetryOptions;

 type FetchTextOptions = Omit<FetchOptions, "body" | "signal" | "window"> & {
  convert?: "markdown" | "text" | "tables";
};

 interface FetchHost {
  /**
   * A fetch wrapper with proxy, retry and timeout handling.
   */
  fetch(input: string | URL | globalThis.Request, init?: FetchOptions): Promise<Response>;

  /**
   * A function that fetches text from a URL or a file
   * @param url
   * @param options
   */
  fetchText(
    url: string | WorkspaceFile,
    options?: FetchTextOptions,
  ): Promise<{
    ok: boolean;
    status: number;
    text?: string;
    file?: WorkspaceFile;
  }>;
}

 interface PromptHost
  extends ShellHost,
    LoggerHost,
    McpHost,
    ResourceHost,
    UserInterfaceHost,
    LanguageModelHost,
    ContentSafetyHost,
    FetchHost {
  /**
   * Opens a in-memory key-value cache for the given cache name. Entries are dropped when the cache grows too large.
   * @param cacheName
   */
  cache<K = any, V = any>(cacheName: string): Promise<WorkspaceFileCache<K, V>>;

  /**
   * Starts a container
   * @param options container creation options
   */
  container(options?: ContainerOptions): Promise<ContainerHost>;

  /**
   * Create a new promise queue to run async functions with limited concurrency
   */
  promiseQueue(concurrency: number): PromiseQueue;

  /**
   * Gets a client to a Microsoft Teams channel from a share link URL;
   * uses `GENAISCRIPT_TEAMS_CHANNEL_URL` environment variable if `shareUrl` is not provided.
   * Uses Azure CLI login for authentication.
   * @param url
   */
  teamsChannel(shareUrl?: string): Promise<MessageChannelClient>;
}

 interface WorkspaceFileWithDescription extends WorkspaceFile {
  /**
   * File description used for videos.
   */
  description?: string;
}

/**
 * A client to a messaging channel
 */
 interface MessageChannelClient {
  /**
   * Posts a message with attachments to the channel
   * @param message
   * @param options
   */
  postMessage(
    message: string,
    options?: {
      /**
       * File attachments that will be added in the channel folder
       */
      files?: (string | WorkspaceFileWithDescription)[];
      /**
       * Sets to false to remove AI generated disclaimer
       */
      disclaimer?: boolean | string;
    },
  ): Promise<string>;
}

 interface ContainerHost extends ShellHost {
  /**
   * Container unique identifier in provider
   */
  id: string;

  /**
   * Name assigned to the container. For persistent containers, also contains the sha of the options
   */
  name: string;

  /**
   * Disable automatic purge of container and volume directory
   */
  persistent: boolean;

  /**
   * Path to the volume mounted in the host
   */
  hostPath: string;

  /**
   * Writes a file as text to the container file system
   * @param path
   * @param content
   */
  writeText(path: string, content: string): Promise<void>;

  /**
   * Reads a file as text from the container mounted volume
   * @param path
   */
  readText(path: string): Promise<string>;

  /**
   * Copies a set of files into the container
   * @param fromHost glob matching files
   * @param toContainer directory in the container
   */
  copyTo(
    fromHost: string | string[],
    toContainer: string,
    options?: Omit<FindFilesOptions, "readText">,
  ): Promise<string[]>;

  /**
   * List files in a directory in the container
   * @param dir
   */
  listFiles(dir: string): Promise<string[]>;

  /**
   * Stops and cleans out the container
   */
  stop(): Promise<void>;

  /**
   * Pause container
   */
  pause(): Promise<void>;

  /**
   * Resume execution of the container
   */
  resume(): Promise<void>;

  /**
   * Force disconnect network
   */
  disconnect(): Promise<void>;

  /**
   * A promise queue of concurrency 1 to run serialized functions against the container
   */
  scheduler: PromiseQueue;
}

 interface PromptContext extends ChatGenerationContext {
  script(options: PromptArgs): void;
  system(options: PromptSystemArgs): void;
  path: Path;
  retrieval: Retrieval;
  workspace: WorkspaceFileSystem;
  host: PromptHost;
}

 type RuntimePromptContext = Pick<
  PromptContext,
  | "host"
  | "env"
  | "workspace"
  | "retrieval"
  | "prompt"
  | "runPrompt"
  | "generateImage"
  | "transcribe"
  | "speak"
>;
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

// keep in sync with PromptContext!

/**
 * Console functions
 */
declare let console: PromptGenerationConsole;

/**
 * Setup prompt title and other parameters.
 * Exactly one call should be present on top of .genai.mts file.
 */
declare function script(options: PromptArgs): void;

/**
 * Equivalent of script() for system prompts.
 */
declare function system(options: PromptSystemArgs): void;

/**
 * Imports template prompt file and expands arguments in it.
 * @param files
 * @param arguments
 */
declare function importTemplate(
  files: ElementOrArray<string | WorkspaceFile>,
  arguments?: Record<string, ImportTemplateArgumentType>,
  options?: ImportTemplateOptions,
): void;

/**
 * Append given string to the prompt. It automatically appends "\n".
 * Typically best to use `` $`...` ``-templates instead.
 */
declare function writeText(body: Awaitable<string>, options?: WriteTextOptions): void;

/**
 * Append given string to the prompt as an assistant message.
 */
declare function assistant(
  text: Awaitable<string>,
  options?: Omit<WriteTextOptions, "assistant">,
): void;

/**
 * Append given string to the prompt. It automatically appends "\n".
 * `` $`foo` `` is the same as `text("foo")`.
 */
declare function $(strings: TemplateStringsArray, ...args: any[]): PromptTemplateString;

/**
 * Appends given (often multi-line) string to the prompt, surrounded in fences.
 * Similar to `text(env.fence); text(body); text(env.fence)`
 *
 * @param body string to be fenced
 */
declare function fence(body: StringLike, options?: FenceOptions): void;

/**
 * Defines `name` to be the (often multi-line) string `body`.
 * Similar to `text(name + ":"); fence(body, language)`
 *
 * @param name name of defined entity, eg. "NOTE" or "This is text before NOTE"
 * @param body string to be fenced/defined
 * @returns variable name
 */
declare function def(
  name: string,
  body: string | WorkspaceFile | WorkspaceFile[] | ShellOutput | Fenced | RunPromptResult,
  options?: DefOptions,
): string;

/**
 * Declares a file that is expected to be generated by the LLM
 * @param pattern file name or glob-like path
 * @param description description of the file, used by the model to choose when and how to call the function
 * @param options expectations about the generated file content
 */
declare function defFileOutput(
  pattern: ElementOrArray<string | WorkspaceFile>,
  description?: string,
  options?: FileOutputOptions,
): void;

/**
 * Declares a tool that can be called from the prompt.
 * @param tool Agentic tool function.
 * @param name The name of the tool to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
 * @param description A description of what the function does, used by the model to choose when and how to call the function.
 * @param parameters The parameters the tool accepts, described as a JSON Schema object.
 * @param fn callback invoked when the LLM requests to run this function
 */
declare function defTool(
  tool: Omit<ToolCallback, "generator"> | McpServersConfig,
  options?: DefToolOptions,
): void;
declare function defTool(
  name: string,
  description: string,
  parameters: PromptParametersSchema | JSONSchema,
  fn: ChatFunctionHandler,
  options?: DefToolOptions,
): void;

/**
 * Declares a LLM agent tool that can be called from the prompt.
 * @param name name of the agent, do not prefix with agent
 * @param description description of the agent, used by the model to choose when and how to call the agent
 * @param fn prompt generation context
 * @param options additional options for the agent LLM
 */
declare function defAgent(
  name: string,
  description: string,
  fn: string | ChatAgentHandler,
  options?: DefAgentOptions,
): void;

/**
 * Registers a callback to be called when a file is being merged
 * @param fn
 */
declare function defFileMerge(fn: FileMergeHandler): void;

/**
 * Variables coming from the fragment on which the prompt is operating.
 */
declare let env: ExpansionVariables;

/**
 * Path manipulation functions.
 */
declare let path: Path;

/**
 * A set of parsers for well-known file formats
 */
declare let parsers: Parsers;

/**
 * Retrieval Augmented Generation services
 */
declare let retrieval: Retrieval;

/**
 * Access to the workspace file system.
 */
declare let workspace: WorkspaceFileSystem;

/**
 * YAML parsing and stringifying functions.
 */
declare let YAML: YAMLObject;

/**
 * INI parsing and stringifying.
 */
declare let INI: INIObject;

/**
 * CSV parsing and stringifying.
 */
declare let CSV: CSVObject;

/**
 * XML parsing and stringifying.
 */
declare let XML: XMLObject;

/**
 * HTML parsing
 */
declare let HTML: HTMLObject;

/**
 * Markdown and frontmatter parsing.
 */
declare let MD: MDObject;

/**
 * JSONL parsing and stringifying.
 */
declare let JSONL: JSONLObject;

/**
 * JSON5 parsing
 */
declare let JSON5: JSON5Object;

/**
 * JSON Schema utilities
 */
declare let JSONSchema: JSONSchemaUtilities;

/**
 * Diff utilities
 */
declare let DIFF: DIFFObject;

/**
 * Access to current LLM chat session information
 */
declare let host: PromptHost;

/**
 * Access to GitHub queries for the current repository
 */
declare let github: GitHub;

/**
 * Access to Git operations for the current repository
 */
declare let git: Git;

/**
 * Access to ffmpeg operations
 */
declare let ffmpeg: Ffmpeg;

/**
 * Computation around tokens
 */
declare let tokenizers: Tokenizers;

/**
 * @deprecated use `host.fetchText` instead
 */
declare function fetchText(
  url: string | WorkspaceFile,
  options?: FetchTextOptions,
): Promise<{ ok: boolean; status: number; text?: string; file?: WorkspaceFile }>;

/**
 * Declares a JSON schema variable.
 * @param name name of the variable
 * @param schema JSON schema instance
 * @returns variable name
 */
declare function defSchema(
  name: string,
  schema: JSONSchema | ZodTypeLike,
  options?: DefSchemaOptions,
): string;

/**
 * Adds images to the prompt
 * @param files
 * @param options
 */
declare function defImages(files: ElementOrArray<BufferLike>, options?: DefImagesOptions): void;

/**
 * Renders a table or object in the prompt
 * @param name
 * @param data
 * @param options
 * @returns variable name
 */
declare function defData(
  name: string,
  data: Awaitable<object[] | object>,
  options?: DefDataOptions,
): string;

/**
 * Renders a diff of the two given values
 * @param left
 * @param right
 * @param options
 */
declare function defDiff<T extends string | WorkspaceFile>(
  name: string,
  left: T,
  right: T,
  options?: DefDiffOptions,
): string;

/**
 * Cancels the current prompt generation/execution with the given reason.
 * @param reason
 */
declare function cancel(reason?: string): void;

/**
 * Expands and executes prompt
 * @param generator
 */
declare function runPrompt(
  generator: string | PromptGenerator,
  options?: PromptGeneratorOptions,
): Promise<RunPromptResult>;

/**
 * Expands and executes the prompt
 */
declare function prompt(
  strings: TemplateStringsArray,
  ...args: any[]
): RunPromptResultPromiseWithOptions;

/**
 * Registers a callback to process the LLM output
 * @param fn
 */
declare function defOutputProcessor(fn: PromptOutputProcessorHandler): void;

/**
 * Registers a chat participant
 * @param participant
 */
declare function defChatParticipant(
  participant: ChatParticipantHandler,
  options?: ChatParticipantOptions,
): void;

/**
 * Transcribes audio to text.
 * @param audio An audio file to transcribe.
 * @param options
 */
declare function transcribe(
  audio: string | WorkspaceFile,
  options?: TranscriptionOptions,
): Promise<TranscriptionResult>;

/**
 * Converts text to speech.
 * @param text
 * @param options
 */
declare function speak(text: string, options?: SpeechOptions): Promise<SpeechResult>;

/**
 * Generate an image and return the workspace file.
 * @param prompt
 * @param options
 */
declare function generateImage(
  prompt: string,
  options?: ImageGenerationOptions,
): Promise<{ image: WorkspaceFile; revisedPrompt?: string }>;

```

## LoadedVibes/lv_artifacts/genaiscript/node-shims.d.ts
```ts
declare module 'path' {
  const path: {
    resolve: (...paths: string[]) => string;
    dirname: (path: string) => string;
    join: (...paths: string[]) => string;
  } & Record<string, any>;
  export default path;
}

declare module 'fs/promises' {
  const readFile: (...args: any[]) => Promise<any>;
  const writeFile: (...args: any[]) => Promise<any>;
  const access: (...args: any[]) => Promise<any>;
  const mkdir: (...args: any[]) => Promise<any>;
  const copyFile: (...args: any[]) => Promise<any>;
  export { readFile, writeFile, access, mkdir, copyFile };
}

declare module 'url' {
  function fileURLToPath(url: string | URL): string;
  export { fileURLToPath };
}

interface ImportMeta {
  url: string;
}

```

## LoadedVibes/lv_artifacts/genaiscript/jsconfig.json
```json
{
  "compilerOptions": {
    "lib": ["ES2024"],
    "target": "ES2024",
    "module": "ES2022",
    "moduleDetection": "force",
    "checkJs": true,
    "allowJs": true,
    "skipLibCheck": true
  },
  "include": ["**/*.js", "../scripts/*.genaiscript.ts", "./genaiscript.d.ts", "./node-shims.d.ts"]
}

```

## LoadedVibes/lv_artifacts/genaiscript/orchestrator.genai.js
```js
import { loadManifest, loadCoreDocuments, loadState, saveState } from './shared/context.js';

script({
  title: 'Loaded Vibes Orchestrator',
  description:
    'Coordinates DevCycles by pairing manifest metadata with the general phase runner, enforcing Spec-Driven Workflow gates.',
  parameters: {
    phase: {
      type: 'string',
      description: 'Optional DevCycle key. Defaults to next uncompleted phase.',
    },
    task: {
      type: 'string',
      description: 'Task description or ticket reference scoped to this DevCycle.',
    },
    mode: {
      type: 'string',
      description: 'plan-only | plan-first | execute | validate',
      default: 'plan-first',
    },
    chainNext: {
      type: 'boolean',
      description: 'Automatically display the next DevCycle recommendation.',
      default: false,
    },
    skipBootstrap: {
      type: 'boolean',
      description: 'Skip bootstrap preflight checks (not recommended).',
      default: false,
    },
    profilePath: {
      type: 'string',
      description: 'Override VS Code profile path for bootstrap validation.',
    },
  },
  tools: ['filesystem/*', 'memory/*', 'sequentialthinking/*', 'runTests', 'runSubagent', 'todos'],
});

async function runPromptWithVars(generatorPath, vars, options) {
  const previousVars = { ...env.vars };
  Object.assign(env.vars, vars);
  try {
    return await runPrompt(generatorPath, options);
  } finally {
    for (const key of Object.keys(env.vars)) {
      delete env.vars[key];
    }
    Object.assign(env.vars, previousVars);
  }
}

const manifest = await loadManifest();
const phaseOrder = Object.keys(manifest);
if (phaseOrder.length === 0) {
  throw new Error('No DevCycles found in devcycles.config.json.');
}

const state = await loadState();
const normalizedPhaseInput = (
  env.vars.phase ||
  state.nextPhase ||
  state.lastPhase ||
  phaseOrder[0]
).toLowerCase();
const modeParam = (env.vars.mode || 'plan-first').toLowerCase();

if (!manifest[normalizedPhaseInput]) {
  throw new Error(
    `Invalid phase '${normalizedPhaseInput}'. Allowed values: ${phaseOrder.join(', ')}`
  );
}

const selectedEntry = manifest[normalizedPhaseInput];
const nextIndex = phaseOrder.indexOf(normalizedPhaseInput) + 1;
const nextPhase = phaseOrder[nextIndex] || null;

if (env.vars.skipBootstrap !== 'true') {
  await runPromptWithVars('../scripts/bootstrapper.genaiscript.ts', {
    phase: normalizedPhaseInput,
    preflightOnly: 'true',
    ...(env.vars.profilePath ? { profilePath: env.vars.profilePath } : {}),
  });
}

const docs = await loadCoreDocuments();
console.log('📚 Context Loaded for DevCycle', selectedEntry.label);
console.log({
  phase: normalizedPhaseInput,
  mode: modeParam,
  task: env.vars.task || 'standard-scope',
  checkpoints: selectedEntry.checkpoints,
  prdExcerpt: docs.prd?.slice(0, 400),
  techExcerpt: docs.tech?.slice(0, 400),
});

await runPromptWithVars('./phases/scaffolding.genai.js', {
  phase: normalizedPhaseInput,
  mode: modeParam,
  autoExecute: modeParam === 'execute' || modeParam === 'validate' ? 'true' : 'false',
  ...(env.vars.task ? { task: env.vars.task } : {}),
});

const updatedState = {
  lastPhase: normalizedPhaseInput,
  completedPhases: Array.from(new Set([...(state.completedPhases || []), normalizedPhaseInput])),
  history: [
    ...(state.history || []),
    {
      phase: normalizedPhaseInput,
      mode: modeParam,
      task: env.vars.task || null,
      timestamp: new Date().toISOString(),
    },
  ],
  nextPhase,
};

await saveState(updatedState);

console.log('✅ DevCycle complete.');
console.log({
  lastPhase: updatedState.lastPhase,
  nextPhase: updatedState.nextPhase,
  totalCompleted: updatedState.completedPhases.length,
});

if (env.vars.chainNext === 'true' && nextPhase) {
  console.log(`🔁 Next recommended DevCycle: ${nextPhase}`);
  console.log(
    `Run: npx genaiscript run lv_artifacts/genaiscript/orchestrator.genai.js --phase ${nextPhase}`
  );
}

```

## LoadedVibes/lv_artifacts/scripts/bootstrapper.genaiscript.ts
```ts
// @ts-nocheck

import path from 'path';
import { access, copyFile } from 'fs/promises';
import { loadManifest, resolveFromGenai, ARTIFACTS_ROOT } from '../genaiscript/shared/context.js';

script({
  title: 'Loaded Vibes Bootstrapper',
  description:
    'Validates DevCycle manifest, tool wiring, and VS Code profile before running the orchestrator.',
  parameters: {
    phase: {
      type: 'string',
      description: 'Optional DevCycle key to validate specifically.',
    },
    profilePath: {
      type: 'string',
      description:
        'Path to the VS Code profile that should mirror lv_artifacts/.vscode/profile.jsonc',
    },
    preflightOnly: {
      type: 'boolean',
      description: 'Run validations without emitting user guidance messages.',
      default: false,
    },
    fixProfile: {
      type: 'boolean',
      description: 'Create/update the profile file if it is missing.',
      default: false,
    },
  },
  tools: ['filesystem/*', 'sequentialthinking/*'],
});

async function fileExists(candidate) {
  try {
    await access(candidate);
    return true;
  } catch (error) {
    return false;
  }
}

async function ensureProfile(targetPath) {
  const resolvedTarget = path.resolve(targetPath);
  if (await fileExists(resolvedTarget)) {
    return { created: false, path: resolvedTarget, exists: true };
  }

  const templatePath = path.resolve(ARTIFACTS_ROOT, '.vscode', 'profile.jsonc');
  if (!(await fileExists(templatePath))) {
    throw new Error('Profile template missing at lv_artifacts/.vscode/profile.jsonc');
  }

  await copyFile(templatePath, resolvedTarget);
  return { created: true, path: resolvedTarget, exists: true };
}

const manifest = await loadManifest();
const requestedPhase = env.vars.phase ? env.vars.phase.toLowerCase() : null;
const phaseEntries = requestedPhase ? { [requestedPhase]: manifest[requestedPhase] } : manifest;

if (requestedPhase && !manifest[requestedPhase]) {
  throw new Error(
    `Phase '${requestedPhase}' not found. Allowed values: ${Object.keys(manifest).join(', ')}`
  );
}

const validationResults = [];
for (const [phaseKey, entry] of Object.entries(phaseEntries)) {
  const missingArtifacts = [];
  for (const artifactKey of ['instructions', 'toolset', 'prompt']) {
    const relativePath = entry[artifactKey];
    const absolutePath = resolveFromGenai(relativePath);
    if (!(await fileExists(absolutePath))) {
      missingArtifacts.push({ artifactKey, relativePath, absolutePath });
    }
  }
  validationResults.push({ phase: phaseKey, missingArtifacts });
}

const hasBlockingIssues = validationResults.some((item) => item.missingArtifacts.length > 0);

const defaultProfilePath = path.resolve(ARTIFACTS_ROOT, '.vscode', 'profile.jsonc');
const profilePath = path.resolve(env.vars.profilePath || defaultProfilePath);
const profileStatus =
  env.vars.fixProfile === 'true'
    ? await ensureProfile(profilePath)
    : {
        created: false,
        path: profilePath,
        exists: await fileExists(profilePath),
      };

const report = {
  validatedPhases: validationResults.length,
  missingArtifacts: validationResults.filter((item) => item.missingArtifacts.length > 0),
  profile: profileStatus,
};

if (!env.vars.preflightOnly) {
  console.log('🧭 Bootstrap Report:');
  console.log(report);
}

if (hasBlockingIssues) {
  throw new Error(
    `Bootstrap validation failed. Missing artifacts detected: ${JSON.stringify(
      report.missingArtifacts,
      null,
      2
    )}`
  );
}

console.log(
  `Bootstrap validation succeeded for ${validationResults.length} phase(s). Profile located at ${profileStatus.path}.`
);

```

## LoadedVibes/lv_artifacts/scripts/bootstrapper.ps1
```ps1
<#!
  Loaded Vibes Bootstrapper Wrapper

  1. Runs the GenAIScript bootstrapper to validate manifest + profile health.
  2. Optionally executes the orchestrator for the requested DevCycle.
  3. Provides convenient PowerShell entry points for Windows contributors.
#>

param(
  [string]$Phase,
  [ValidateSet('plan-only','plan-first','execute','validate')]
  [string]$Mode = 'plan-first',
  [string]$ProfilePath = "..\\.vscode\\profile.jsonc",
  [string]$Task,
  [switch]$SkipBootstrap,
  [switch]$SkipOrchestrator,
  [switch]$PlanOnly
)

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$bootstrapperScript = Join-Path $scriptRoot "bootstrapper.genaiscript.ts"
$orchestratorScript = Join-Path $scriptRoot "..\\genaiscript\\orchestrator.genai.js"
$resolvedProfilePath = Resolve-Path -Path (Join-Path $scriptRoot $ProfilePath) -ErrorAction SilentlyContinue
if (-not $resolvedProfilePath) {
  $resolvedProfilePath = Join-Path $scriptRoot $ProfilePath
}

if (-not $SkipBootstrap) {
  Write-Host "🧭 Running bootstrap validations..."
  $bootstrapArgs = @("genaiscript", "run", $bootstrapperScript, "--profilePath", $resolvedProfilePath)
  if ($Phase) { $bootstrapArgs += @("--phase", $Phase) }
  $bootstrapArgs += @("--preflightOnly", "false")
  & npx @bootstrapArgs
  if ($LASTEXITCODE -ne 0) {
    throw "Bootstrap validation failed. See output above."
  }
}

if (-not $SkipOrchestrator -and $Phase) {
  $effectiveMode = if ($PlanOnly) { 'plan-only' } else { $Mode }
  Write-Host "🚀 Invoking orchestrator for phase '$Phase' (mode: $effectiveMode)..."
  $orchArgs = @("genaiscript", "run", $orchestratorScript, "--phase", $Phase, "--mode", $effectiveMode)
  if ($Task) { $orchArgs += @("--task", $Task) }
  & npx @orchArgs
  if ($LASTEXITCODE -ne 0) {
    throw "Orchestrator execution failed."
  }
} elseif (-not $Phase) {
  Write-Host "No phase specified. Completed bootstrap only."
}

Write-Host "✅ Bootstrapper finished."
```

## LoadedVibes/lv_artifacts/README.md
```md
# LV Artifacts

This folder contains all the files that are packaged and shipped as part of the Loaded Vibes framework when users create a new project using the CLI. These artifacts are designed to be copied into the user's development environment and provide the necessary structure, tools, and documentation for building applications with Loaded Vibes.

About

Bad Vibes, Clean Code, Solid Infra, Sharded Loads. An enterprise-grade Agentic TypeScript Web Development Framework.

loadedvibes.vercel.app/

Topics

react typescript web-development mcp nextjs copilot ai-agents prisma tailwindcss shad clerk gen-ai agentic-framework

```

## LoadedVibes/templates/bootstrapper_template.md
```md
---

## name: bootstrapper.template applyTo: "\*\*" description: Template for the Bootstrapper (PowerShell + GenAI automation).

# Bootstrapper Template

This file defines the structure and responsibilities of the **Bootstrapper**, which automates detection, creation, and modification of the project profile and configures the GenAI extension environment.

The Bootstrapper is implemented using **PowerShell** and **GenAI Script**, but its behavior is stack-agnostic.

## Purpose

- Detect the current VS Code environment and project state.
- Generate or update the project profile.
- Install or verify required extensions.
- Set up MCP servers.
- Register GenAI Script memory and cross-agent context.
- Prepare the workspace for DevCycle execution.

## Responsibilities

### 1. Detect Existing Profile

The Bootstrapper MUST:

- Check for an existing profile file.
- Validate required fields (settings, extensions, MCP servers, tasks).
- Load and normalize profile content.

### 2. Create or Update Profile

The Bootstrapper MUST generate or update profile information including:

- Workspace settings
- User settings overrides (where allowed)
- Required VS Code extensions
- MCP server definitions
- DevCycle automation tasks

### 3. Configure GenAI Script Extension

Configure the environment to support:

- Cross-agent memory
- Persistent context storage
- Access to instructions, prompts, and agents
- Automatic instruction file discovery

### 4. Detect and Register MCP Servers

Using PowerShell commands and `mcp.json`:

- Detect installed MCP server binaries
- Register missing servers
- Validate server availability

### 5. Generate Workspace Automation Tasks

Tasks SHOULD map to DevCycles, for example:

- `Initialize-Project`
- `Scaffold-Project`
- `Configure-Project`
- `Verify-Project`

These are invoked via VS Code tasks or the command palette.

## Structure (Pseudo PowerShell Example)

```powershell
# Detect existing profile
$profilePath = "./profile.jsonc"
if (Test-Path $profilePath) {
    $profile = Get-Content $profilePath -Raw | ConvertFrom-Json
} else {
    $profile = @{}
}

# Update settings
$profile.settings = @{ "editor.formatOnSave" = $true }

# Register extensions
$profile.extensions = @(
    "github.copilot",
    "modelcontextprotocol.mcp"
)

# Register MCP servers
$profile.mcpServers = @(
    @{ name = "filesystem"; command = "mcp-filesystem"; args = @() }
)

# Write file
$profile | ConvertTo-Json -Depth 10 | Set-Content -Path $profilePath
```

## Structure (GenAI Script Example)

```ts
import { defineBootstrapper } from "genaiscript";

export default defineBootstrapper(async ({ workspace, profile, mcp }) => {
  // Detect and merge profile
  const existing = await workspace.readJsonc("profile.jsonc");

  // Update with required extensions
  existing.extensions = [
    "github.copilot",
    "modelcontextprotocol.mcp",
  ];

  // Register MCP
  existing.mcpServers = mcp.detectDefaultServers();

  await workspace.writeJsonc("profile.jsonc", existing);
});
```

## Notes

- The Bootstrapper is the automation backbone of the framework.
- It guarantees the environment matches the project's expectations.
- It operates before any DevCycle begins.
- It ensures consistent, reproducible development experience.


```

## LoadedVibes/templates/custom_agent_template.md
```md
---
name: custom.agent
applyTo: "**"
description: Tech-stack–specific agent that applies architecture, patterns, and coding standards.
---

# Custom Agent Instructions

These instructions define the behavior of the **tech‑stack–specific agent**. This agent is responsible for implementing all development work using the conventions, architecture, and best practices of the declared technology stack.

Global instructions define the universal system. These agent instructions define how the chosen stack behaves during all DevCycles.

## 1. Purpose of This Agent
- Represent the project's declared technology stack.
- Enforce stack‑specific patterns, conventions, best practices, and architecture.
- Interpret PRD + TechReq through the lens of the stack.
- Execute DevCycle instructions using the allowed toolset.
- Maintain a consistent, predictable, and standards‑compliant codebase.

## 2. Agent Responsibilities
### 2.1 Operate Within the Framework
- Follow all global instructions.
- Operate only when triggered through a DevCycle prompt.
- Apply the correct DevCycle instruction file.
- Only use tools permitted by the phase's toolset.

### 2.2 Maintain Stack Standards
The agent MUST:
- Apply architectural patterns defined by the stack.
- Follow stack‑specific best practices and coding patterns.
- Generate code and configuration consistent with the stack norms.
- Use proper modules, abstractions, and conventions.
- Ensure consistency across the entire workspace.

### 2.3 Enforce Quality and Correctness
- Use stack‑appropriate linting, formatting, and validation methods.
- Detect anti‑patterns and correct them.
- Self‑audit for violations of stack rules.
- Suggest improvements where appropriate.

### 2.4 Apply Tooling Wisely
- Use the available tools declared in the phase's toolset.
- Respect security boundaries defined in the toolset.
- Invoke tools using the proper #tool syntax where necessary.
- Only access MCP servers defined for the current phase.

## 3. Inputs
The agent receives:
- PRD + TechReq (source of truth)
- Current DevCycle instruction file
- Toolset for the active phase
- Workspace state (file contents, directory structure)
- Developer feedback from human-in-the-loop

## 4. Outputs
The agent must produce:
- File updates
- Explanations of work performed
- Tasks to add to `todo.md` or GitHub Issues
- Updates to CHANGELOG based on completed tasks
- Next-step recommendations based on DevCycle flow

## 5. Human-in-the-Loop Requirements
The agent MUST:
- Surface decisions for approval
- Provide clear reasoning when deviating from standards
- Present tasks requiring review
- Pause work when human clarification is required

## 6. Contractual Obligations
The agent is contractually bound to:
- Follow global instructions
- Follow DevCycle instructions
- Use only the provided toolset
- Adhere to PRD + TechReq as final authority
- Maintain predictable, deterministic behavior

## 7. Error Handling
The agent must:
- Detect inconsistencies between PRD, TechReq, and generated work
- Flag invalid or missing dependencies
- Correct stack violations
- Surface failures immediately with actionable fixes

## 8. Completion Definition
A DevCycle phase is complete only when:
- All tasks in its instruction file have been fulfilled
- Tasks have been logged/updated
- Human approval is received
- CHANGELOG is updated accordingly

This custom agent file defines how the tech‑stack layer behaves inside the universal development framework.


```

## LoadedVibes/templates/devcycle_cicd_template.md
```md
---
name: ci-cd.instructions
applyTo: "**"
description: Instructions for the CI/CD DevCycle.
---

# CI/CD DevCycle Instructions

The **CI/CD** DevCycle defines how continuous integration and continuous deployment workflows are automated, validated, and aligned with the project's requirements. This DevCycle is universal and stack-agnostic.

## 1. Purpose
- Automate testing, building, and deployment.
- Ensure consistency across all project branches.
- Enforce quality and security requirements through automated workflows.

## 2. Responsibilities
### 2.1 Define CI Workflow Requirements
The agent MUST specify workflows for:
- Linting
- Type-checking (if applicable)
- Running unit tests
- Running integration tests
- Running E2E tests
- Building the project

### 2.2 Define CD Workflow Requirements
The agent MUST define:
- Preview deployment workflow
- Production deployment workflow
- Promotion and approval steps
- Rollback plan

### 2.3 Configure GitHub Actions
The agent MUST generate or update:
- `.github/workflows/*.yml` configuration files
- Reusable workflow blocks (if applicable)
- Secret references for environment variables

### 2.4 Enforce Constraints
The agent MUST:
- Follow global instructions
- Use only tools in the CI/CD toolset
- Use secure secret handling
- Enforce proper branching strategy

### 2.5 Validate Requirements
The agent MUST:
- Validate that the CI pipeline executes correctly
- Validate that the CD workflow aligns with PRD + TechReq
- Detect missing steps or insecure automations

## 3. Inputs
- PRD
- TechReq
- All prior DevCycle outputs
- Toolset for CI/CD phase

## 4. Outputs
- CI configuration files
- CD configuration files
- Deployment plan
- Tasks added to `todo.md`
- Changelog entry summarizing CI/CD creation or updates

## 5. Success Criteria
The CI/CD DevCycle is complete when:
- All workflows exist and run without errors
- Deployment flow aligns with project requirements
- Secrets and environment variables are properly referenced
- Human approves the CI/CD setup

## 6. Error Handling
The agent MUST:
- Halt if required workflows cannot be validated
- Flag insecure configurations
- Detect missing secrets or environment variables
- Provide corrective actions

These instructions define the complete behavior of the CI/CD DevCycle.


```

## LoadedVibes/templates/devcycle_code_review_template.md
```md
---
name: code-review.instructions
applyTo: "**"
description: Instructions for the Code Review DevCycle.
---

# Code Review DevCycle Instructions

The **Code Review** DevCycle provides systematic, structured oversight of code quality, correctness, maintainability, and alignment with the PRD + TechReq. This phase ensures that both humans and the agent enforce consistent standards.

This DevCycle is universal and stack-agnostic at the instruction level.

## 1. Purpose
- Evaluate and improve code quality.
- Ensure code adheres to global instructions, DevCycle instructions, and stack-specific agent rules.
- Validate that code matches PRD + TechReq intent.
- Provide actionable review, feedback, and corrections.

## 2. Responsibilities
### 2.1 Analyze Code Changes
The agent MUST:
- Review diffs in pull requests.
- Identify inconsistencies with architectural expectations.
- Detect code smells, anti-patterns, or unclear logic.

### 2.2 Validate Against Standards
The agent MUST:
- Enforce global instructions.
- Enforce DevCycle-specific rules.
- Enforce stack-specific best practices.
- Validate consistency in naming, structure, patterns, and documentation.

### 2.3 Run Static Review Tools
Using available tools in the toolset:
- Linting tooling
- Formatting checks
- Type-checking (if applicable)
- Security scanning tools

### 2.4 Evaluate Feature Completeness
The agent MUST:
- Cross-check code against PRD user stories.
- Validate acceptance criteria.
- Compare intended vs actual behavior.

### 2.5 Produce Actionable Feedback
Feedback MUST include:
- Comments on specific lines or modules
- Correction instructions
- Suggested refactors
- Required fixes before merging

## 3. Inputs
- PRD
- TechReq
- Feature implementation
- Toolset for Code Review phase
- Pull request diffs

## 4. Outputs
- Code review report
- Inline review comments (if applicable)
- List of required and optional changes
- Tasks added to `todo.md`
- Changelog entry for approved and merged changes

## 5. Success Criteria
Code Review DevCycle is complete when:
- All required changes have been addressed
- Standards are met
- Code aligns with PRD + TechReq
- Human approves the final review

## 6. Error Handling
The agent MUST:
- Halt if critical violations are detected
- Flag missing documentation or tests
- Identify incoherent or unstable logic
- Provide detailed remediation steps

These instructions define the complete behavior of the Code Review DevCycle.


```

## LoadedVibes/templates/devcycle_configuration_template.md
```md
---
name: configuration.instructions
applyTo: "**"
description: Instructions for the Configuration DevCycle.
---

# Configuration DevCycle Instructions

These instructions define the **Configuration** phase. Configuration finalizes project-level settings, tooling, and metadata required for reliable development. This phase remains language-agnostic; stack-specific implementation is handled by the custom agent.

## 1. Purpose
- Establish the project's configuration baseline.
- Set up formatting, linting, type systems, environment variables, and testing frameworks.
- Align project settings with the requirements of the PRD + TechReq.

## 2. Responsibilities
### 2.1 Apply Project Tooling
Configure necessary project-wide tools such as:
- Linters
- Formatters
- Type checkers
- Testing frameworks
- Documentation generators

The agent implements these based on the stack.

### 2.2 Generate Configuration Files
The agent MUST generate or update configuration files including:
- Formatting rules
- Linting configuration
- Test framework config
- Project metadata files

### 2.3 Establish Environment Variable Templates
- Create or update `.env.example` based on PRD + TechReq.
- Include required keys, secrets, or external service dependencies.

### 2.4 Align Workspace Settings
- Apply correct workspace configuration.
- Ensure settings support consistent development.

### 2.5 Ensure Consistency with PRD + TechReq
The agent MUST:
- Detect mismatches between configuration needs and specifications.
- Produce actionable corrections.
- Document all decisions.

## 3. Inputs
- PRD
- TechReq
- Scaffolded project
- Initialization findings
- Toolset for Configuration phase

## 4. Outputs
- Fully generated configuration files
- Updated `.env.example`
- Validated project toolchain
- Tasks added to `todo.md`
- Changelog entry summarizing configuration actions

## 5. Success Criteria
The Configuration DevCycle is complete when:
- All required config files exist and are valid
- Testing environment initializes without errors
- Linting/formatting tools run without issues
- Project is ready for verification
- Human approves the results

## 6. Error Handling
The agent MUST:
- Stop if critical config files fail validation
- Detect conflicting configurations
- Flag missing keys or unsupported files
- Produce fixes or recommendations

These instructions define the complete behavior of the Configuration DevCycle.


```

## LoadedVibes/templates/devcycle_data_template.md
```md
---
name: data.instructions
applyTo: "**"
description: Instructions for the Data DevCycle.
---

# Data DevCycle Instructions

The **Data** DevCycle establishes the project's data layer in a language-agnostic, framework-agnostic way. The stack-specific agent performs implementation based on these universal rules.

## 1. Purpose
- Translate PRD + TechReq data models into a structured, validated schema.
- Define migrations, data contracts, and seed data requirements.
- Ensure the data layer supports all planned application features.

## 2. Responsibilities
### 2.1 Interpret PRD + TechReq Data Requirements
- Extract all entities, relationships, constraints, and rules.
- Identify required identifiers, enums, metadata fields, and business rules.
- Validate completeness of the PRD's data modeling section.

### 2.2 Define Schema Requirements
The agent MUST define schema specifications such as:
- Entities / models
- Fields and field types
- Relationships
- Validation rules
- Indexes or query patterns when relevant
- Constraints and lifecycle events

### 2.3 Generate Migration Plan
- Define the list of migrations required to initialize the database.
- Ensure migration safety:
  - No destructive operations unless explicitly required.
  - Support for up/down migrations.

### 2.4 Define Seed Data Requirements
- Extract seed scenarios from the PRD.
- Define seed dataset:
  - Required baseline records
  - Example user accounts
  - Minimum viable dataset for testing and development

### 2.5 Enforce Constraints
- Schema must align perfectly with PRD + TechReq.
- Inconsistencies must stop the cycle.
- Agent must surface questions to the human when unclear.

## 3. Inputs
- PRD
- TechReq
- Verification summary
- Toolset for the Data phase

## 4. Outputs
- Data schema specification (agnostic)
- Migration plan summary
- Seed data specification
- Tasks added to `todo.md`
- Changelog entry summarizing data layer work

## 5. Success Criteria
The Data DevCycle is complete when:
- Schema requirements are fully defined
- Migrations are logically consistent
- Seed data requirements are documented
- All PRD-model-to-schema mappings are validated
- Human approves the data specification

## 6. Error Handling
The agent MUST:
- Halt if PRD + TechReq data definitions are incomplete
- Surface ambiguous entity relationships
- Flag conflicting field types or rules
- Provide corrective recommendations

These instructions define the complete behavior of the Data DevCycle.


```

## LoadedVibes/templates/devcycle_debug_template.md
```md
---
name: debug.instructions
applyTo: "**"
description: Instructions for the Debug DevCycle.
---

# Debug DevCycle Instructions

The **Debug** DevCycle focuses on identifying, diagnosing, and resolving defects across the system. Debugging occurs after or in parallel with feature development, testing, and validation. This phase is universal and stack-agnostic.

## 1. Purpose
- Detect and resolve issues uncovered during Testing, Validation, or runtime.
- Improve system correctness, stability, and reliability.
- Ensure the application is ready for security audits, performance passes, and deployment.

## 2. Responsibilities
### 2.1 Identify Defects
The agent MUST:
- Analyze Testing DevCycle output
- Analyze Validation DevCycle output
- Detect runtime, logic, or UX inconsistencies
- Identify broken integrations between features, data, and auth

### 2.2 Diagnose Issues
The agent MUST:
- Describe root causes
- Compare expected vs actual behavior
- Determine affected modules, data flows, or logic

### 2.3 Apply Fixes
The agent MUST:
- Generate patches or code corrections (stack-specific)
- Update affected logic, workflows, or data contracts
- Ensure no new regressions are introduced

### 2.4 Re-Test and Re-Validate
After each fix:
- Unit tests must pass
- Integration tests must pass
- E2E flows must be validated
- Business logic must match PRD/TechReq

### 2.5 Enforce Constraints
The agent MUST:
- Use only tools in the Debug toolset
- Follow DevCycle instructions
- Follow stack-specific agent rules
- Document every fix clearly

## 3. Inputs
- Testing DevCycle outputs
- Validation DevCycle outputs
- Feature modules
- Toolset for Debug phase

## 4. Outputs
- Corrected files
- Detailed defect report
- Tasks added to `todo.md`
- Changelog entry summarizing fixes

## 5. Success Criteria
The Debug DevCycle is complete when:
- All known defects are resolved
- All tests pass without regressions
- UX and business logic match PRD/TechReq
- Human approves the fix summaries

## 6. Error Handling
The agent MUST:
- Halt if a defect cannot be reproduced
- Flag contradictory requirements or logic loops
- Provide detailed clarification prompts

These instructions define the complete behavior of the Debug DevCycle.


```

## LoadedVibes/templates/devcycle_deploy_template.md
```md
---
name: deploy.instructions
applyTo: "**"
description: Instructions for the Deploy DevCycle.
---

# Deploy DevCycle Instructions

The **Deploy** DevCycle defines the universal workflow for releasing the application into a production environment. This phase ensures reliable shipping, post-deploy validation, and rollback readiness. It is fully stack-agnostic at the instruction level.

## 1. Purpose
- Deploy the application to the designated production environment.
- Validate successful release through smoke tests and minimal E2E flows.
- Ensure rollback capability in case of deployment issues.

## 2. Responsibilities
### 2.1 Prepare Deployment Artifacts
The agent MUST:
- Ensure the build artifacts from CI/CD are complete.
- Validate environment variable availability.
- Confirm all necessary secrets are configured.

### 2.2 Execute Deployment
The agent MUST:
- Trigger the production deployment process.
- Document deployment parameters.
- Ensure the correct branch/tag is being deployed.

### 2.3 Run Post-Deployment Validation
The agent MUST perform:
- Smoke tests
- Basic E2E validations
- Health checks

### 2.4 Verify Deployment Stability
The agent MUST:
- Validate logs and runtime behavior.
- Detect immediate regressions.
- Identify any deployment-related faults.

### 2.5 Rollback Readiness
The agent MUST confirm:
- A rollback strategy exists.
- Rollback triggers and conditions are defined.
- Rollback execution steps are ready.

## 3. Inputs
- CI/CD DevCycle outputs
- PRD
- TechReq
- Toolset for Deploy phase
- Build artifacts

## 4. Outputs
- Deployment report
- Smoke test results
- Updated logs and monitoring notes
- Tasks added to `todo.md`
- Changelog entry summarizing deployment

## 5. Success Criteria
Deploy DevCycle is complete when:
- Deployment executes successfully
- Validation tests pass
- No critical issues are detected
- Rollback plan is verified
- Human approves deployment state

## 6. Error Handling
The agent MUST:
- Halt deployment on missing artifacts or secrets
- Abort if critical smoke tests fail
- Provide rollback instructions when needed
- Document failures with actionable remediation steps

These instructions define the complete behavior of the Deploy DevCycle.


```

## LoadedVibes/templates/devcycle_features_template.md
```md
---
name: features.instructions
applyTo: "**"
description: Instructions for the Features DevCycle.
---

# Features DevCycle Instructions

The **Features** DevCycle defines how application functionality is implemented. This phase turns PRD + TechReq requirements into concrete feature modules and workflows. It is stack-agnostic at the instruction level; the custom agent performs the actual implementation.

## 1. Purpose
- Build out all required application features.
- Implement business logic, workflows, and module interactions.
- Translate PRD functional requirements into working components.

## 2. Responsibilities
### 2.1 Interpret PRD + TechReq Functional Requirements
The agent MUST:
- Extract feature definitions, user stories, and workflows.
- Identify required feature modules.
- Identify dependencies between features.

### 2.2 Define Feature Modules
For each feature, the agent MUST define:
- Inputs and outputs
- Dependencies (data, auth, other features)
- Internal logic
- Required UI or interaction elements

### 2.3 Implement Business Logic
The agent MUST:
- Implement logic based on PRD rules.
- Surface undefined or contradictory logic.
- Validate logic compatiblity with Data + Auth DevCycles.

### 2.4 Generate Supporting Files
The agent MUST produce:
- Utilities
- Helper logic
- Domain modules
- State or workflow logic (based on stack)

### 2.5 Enforce Constraints
The agent MUST:
- Follow DevCycle instructions
- Follow global instructions
- Follow agent (stack) instructions
- Use tools only within the phase toolset

## 3. Inputs
- PRD
- TechReq
- Validation outputs
- Testing strategy
- Toolset for Features phase

## 4. Outputs
- Feature modules
- Utilities
- Supporting files
- Tasks added to `todo.md`
- Changelog entry summarizing implemented features

## 5. Success Criteria
The Features DevCycle is complete when:
- All PRD-defined features have corresponding modules
- Logic aligns with PRD + TechReq
- Dependencies are satisfied
- No undefined behaviors remain
- Human approves the implementation plan

## 6. Error Handling
The agent MUST:
- Halt on incomplete or ambiguous feature definitions
- Flag missing business rules
- Report dependency mismatches
- Provide actionable corrections

These instructions define the complete behavior of the Features DevCycle.


```

## LoadedVibes/templates/devcycle_initialization_template.md
```md
---
name: initialization.instructions
applyTo: "**"
description: Instructions for the Initialization DevCycle.
---

# Initialization DevCycle Instructions

These instructions define the **Initialization** phase. This phase bootstraps the development environment, audits the workspace, and prepares the framework for predictable execution.

Initialization is language-agnostic and framework-agnostic. It does not generate code. It prepares the world model.

## 1. Purpose
- Establish the environment state.
- Validate the PRD + TechReq.
- Detect available tools, extensions, and MCP servers.
- Verify the workspace structure.
- Produce an "environment readiness" report.

## 2. Responsibilities
### 2.1 Audit VS Code Environment
Detect and document:
- Installed VS Code extensions
- User/workspace settings
- Configurations relevant to development workflow

### 2.2 Audit MCP Environment
Using #tool:mcp, detect and list all MCP servers:
- Filesystem
- Memory
- Sequential Thinking
- GitHub
- Prisma / database
- Clerk or auth tooling
- Any additional configured servers

### 2.3 Audit Workspace Structure
Check for the existence of:
- `global.instructions.md`
- `.github/copilot-instructions.md`
- `extensions.json`
- `mcp.json`
- `settings.json`
- `/prompts` directory
- `/instructions` directory
- `/toolsets` directory

### 2.4 Validate PRD + TechReq
- Ensure both are present.
- Ensure required sections exist:
  - Architecture
  - Data modeling
  - Services
  - Features
  - Branding
  - Roadmap
  - Security
  - Testing
  - Observability
  - Deployment
  - Updates
- Normalize formats if needed.

### 2.5 Detect Tool Availability
- Determine which tools the agent may use during subsequent cycles.
- Map them into a preliminary toolset definition.

## 3. Inputs
- PRD
- TechReq
- Workspace state
- Extensions
- MCP config
- Global instructions

## 4. Outputs
- Environment readiness summary
- Normalized PRD + TechReq
- Initial toolset inventory
- List of missing or invalid configuration

## 5. Success Criteria
The Initialization phase is complete when:
- All audits have been performed
- Required artifacts are present
- PRD + TechReq are validated
- Toolset availability is detected
- Human approves the environment readiness report

## 6. Error Handling
Initialization MUST:
- Stop on missing or malformed PRD/TechReq
- Report missing instructions files
- Report missing MCP servers
- Report extension mismatches
- Provide steps to correct missing infrastructure

These instructions define the complete behavior of the Initialization DevCycle.


```

## LoadedVibes/templates/devcycle_documentation_template.md
```md
---
name: documentation.instructions
applyTo: "**"
description: Instructions for the Documentation DevCycle.
---

# Documentation DevCycle Instructions

The **Documentation** DevCycle formalizes how project information is externalized for human understanding. This includes automatically generating README files, contributor guides, templates, and project metadata based on validated PRD + TechReq.

This DevCycle is fully agnostic of programming language and technology stack.

## 1. Purpose
- Produce human-readable documentation that reflects the current state of the project.
- Generate standardized GitHub repository files.
- Ensure documentation aligns with PRD + TechReq and completed DevCycles.

## 2. Responsibilities
### 2.1 Generate Core Project Documentation
The agent MUST generate or update:
- `README.md`
- `CONTRIBUTING.md`
- `SECURITY.md`
- `SUPPORT.md`
- `CODEOWNERS`
- `CODE_OF_CONDUCT.md`

### 2.2 Generate GitHub Templates
The agent MUST generate:
- Issue templates
- Pull request templates
- PRD template
- TechReq template

Each template MUST:
- Follow consistent formatting
- Support the established workflow
- Reference DevCycles where appropriate

### 2.3 Ensure Documentation Accuracy
The agent MUST:
- Use verified PRD + TechReq as the main source of truth
- Incorporate decisions from DevCycle outputs
- Reflect any changes validated during Code Review

### 2.4 Maintain Documentation Structure
The agent MUST:
- Keep documentation modular and comprehensible
- Use consistent headings, formatting, and tone
- Reference other files using correct relative links

### 2.5 Provide AI-Assistance Visibility
Documentation SHOULD:
- Clearly state where automation assists development
- Include overview of DevCycle-based workflow
- Clarify the role of the agent and human-in-the-loop

## 3. Inputs
- PRD
- TechReq
- Outputs from all DevCycles
- Toolset for Documentation phase

## 4. Outputs
- Complete set of repo documentation files
- GitHub templates for issues and PRs
- Updated contributor materials
- Tasks added to `todo.md`
- Changelog entry summarizing documentation updates

## 5. Success Criteria
Documentation DevCycle is complete when:
- All required documentation files exist
- Files accurately reflect the project
- Templates support the workflow
- Human approves the generated documentation

## 6. Error Handling
The agent MUST:
- Halt if documentation conflicts with PRD + TechReq
- Flag unclear or incomplete sections
- Detect missing links or metadata
- Provide corrective actions

These instructions define the complete behavior of the Documentation DevCycle.


```

## LoadedVibes/templates/devcycle_observability_template.md
```md
---
name: observability.instructions
applyTo: "**"
description: Instructions for the Observability DevCycle.
---

# Observability DevCycle Instructions

The **Observability** DevCycle defines how the system is monitored, logged, traced, and measured in real-world execution. This phase is stack-agnostic at the instruction level.

## 1. Purpose
- Ensure the system is fully observable during runtime.
- Provide monitoring, logging, tracing, and alerting capabilities.
- Align observability design with PRD + TechReq.

## 2. Responsibilities
### 2.1 Define Logging Strategy
The agent MUST:
- Identify what events should be logged.
- Define required metadata for logs.
- Define severity/level structure (info, warn, error, etc.).
- Ensure logs avoid PII exposure.

### 2.2 Define Metrics Strategy
The agent MUST specify:
- Key performance indicators (KPIs).
- Business-critical metrics.
- Operational metrics.
- Error rate metrics.

### 2.3 Define Tracing Strategy
- Establish basic request tracing.
- Identify multi-step workflows requiring trace spans.
- Map high-level architecture to traceable segments.

### 2.4 Define Alerts
The agent MUST:
- Identify critical failure conditions.
- Define alert triggers.
- Specify severity tiers.

### 2.5 Ensure Compliance with PRD + TechReq
The agent MUST:
- Validate observability requirements exist in specs.
- Surface missing monitoring or reporting expectations.

## 3. Inputs
- PRD
- TechReq
- Performance DevCycle outputs
- Toolset for Observability phase

## 4. Outputs
- Logging specification
- Metrics specification
- Tracing specification
- Alerts specification
- Tasks added to `todo.md`
- Changelog entry summarizing observability decisions

## 5. Success Criteria
Observability DevCycle is complete when:
- Logging rules are fully defined
- Metrics are mapped to system behaviors
- Tracing is logically planned
- Alert conditions cover critical scenarios
- Human approves the observability specification

## 6. Error Handling
The agent MUST:
- Halt if observability is insufficient to detect critical failures
- Detect missing or contradictory metrics
- Identify unclear workflow traces
- Provide corrective recommendations

These instructions define the complete behavior of the Observability DevCycle.


```

## LoadedVibes/templates/devcycle_performance_template.md
```md
---
name: performance.instructions
applyTo: "**"
description: Instructions for the Performance DevCycle.
---

# Performance DevCycle Instructions

The **Performance** DevCycle ensures that the system operates efficiently, meets performance expectations, and avoids technical degradation. This phase is stack-agnostic at the instruction level.

## 1. Purpose
- Optimize system performance across all layers.
- Identify and remediate bottlenecks.
- Ensure the system meets performance expectations from the PRD + TechReq.
- Audit dependencies and eliminate inefficiencies.

## 2. Responsibilities
### 2.1 Analyze Application Performance
The agent MUST:
- Review performance-related requirements from PRD + TechReq.
- Identify modules or workflows that may degrade system performance.
- Detect inefficient logic or patterns.

### 2.2 Optimize Code Paths
- Improve algorithmic efficiency where applicable.
- Refactor inefficient logic.
- Surface opportunities for caching or memoization.
- Reduce unnecessary operations.

### 2.3 Audit Dependencies
The agent MUST:
- Identify outdated or vulnerable packages.
- Identify unused dependencies.
- Surface heavy or unnecessary libraries.
- Recommend replacements or removal.

### 2.4 Memory & Resource Optimization
- Detect leaks or unnecessary allocations.
- Identify redundant computations.
- Recommend resource-efficient alternatives.

### 2.5 Enforce Constraints
The agent MUST:
- Use only tools defined in the Performance toolset.
- Follow global instructions.
- Follow stack-specific agent rules.
- Document all improvements.

## 3. Inputs
- Feature implementation
- Testing DevCycle outputs
- Debug DevCycle outputs
- Toolset for Performance phase
- PRD + TechReq performance requirements

## 4. Outputs
- Performance optimization report
- Dependency audit summary
- Refactored logic or recommendations
- Tasks added to `todo.md`
- Changelog entry summarizing performance changes

## 5. Success Criteria
Performance DevCycle is complete when:
- Known bottlenecks are resolved
- Dependency list is clean and up-to-date
- Performance meets PRD/TechReq requirements
- Human approves optimization report

## 6. Error Handling
The agent MUST:
- Halt if performance degradation is detected during optimization
- Detect contradictory requirements
- Flag dependency conflicts
- Surface detailed fixes

These instructions define the complete behavior of the Performance DevCycle.


```

## LoadedVibes/templates/devcycle_scaffolding_template.md
```md
---
name: scaffolding.instructions
applyTo: "**"
description: Instructions for the Scaffolding DevCycle.
---

# Scaffolding DevCycle Instructions

These instructions define the **Scaffolding** phase. Scaffolding transforms the validated PRD + TechReq into a concrete project structure using the rules of the project's technology stack. This phase remains language-agnostic at the instruction level; the stack-specific agent handles technical implementation.

## 1. Purpose
- Convert PRD + TechReq into an initial project skeleton.
- Establish high-level architecture, directory layout, and baseline files.
- Prepare the codebase for configuration and further DevCycles.

## 2. Responsibilities
### 2.1 Interpret PRD + TechReq
- Extract structural requirements.
- Identify modules, domains, features, and data flows.
- Identify required top-level project directories.

### 2.2 Define Core Project Structure
The agent MUST generate a coherent initial structure based on the stack, including:
- Top-level root folders
- Feature/module folders
- Libraries/utilities
- Public assets folder
- Basic entry points as defined by the stack

The specifics are implemented by the custom agent.

### 2.3 Establish Boilerplate Files
The agent prepares boilerplate files such as:
- Documentation placeholders
- Core configuration files
- Environment variable templates
- Minimal code files needed to begin configuration

### 2.4 Enforce Constraints
The agent MUST:
- Follow globalinstructions.md
- Follow all DevCycle instructions
- Follow stack conventions via custom agent
- Use only tools in the Scaffolding toolset

### 2.5 Generate Initial Project Map
The agent produces a project map describing:
- Directories created
- Files created
- Expected extensions in future DevCycles

## 3. Inputs
- PRD
- TechReq
- Initialization outputs
- Toolset for Scaffolding phase

## 4. Outputs
- Scaffolded project structure
- High-level architecture map
- Initial files and directories
- List of generated boilerplate
- Tasks added to todo.md
- Changelog entry summarizing actions

## 5. Success Criteria
Scaffolding is complete when:
- The base structure is created
- All expected directories exist
- Required boilerplate files exist
- The project can move to Configuration without errors
- Human approves the scaffold

## 6. Error Handling
The agent MUST:
- Stop on missing PRD/TechReq sections
- Report structural inconsistencies
- Flag illegal or unsupported architecture decisions
- Provide actionable corrections

These instructions define the complete behavior of the Scaffolding DevCycle.


```

## LoadedVibes/templates/devcycle_testing_template.md
```md
---
name: testing.instructions
applyTo: "**"
description: Instructions for the Testing DevCycle.
---

# Testing DevCycle Instructions

The **Testing** DevCycle establishes the universal rules for defining how correctness is verified across the project. This phase is technology-agnostic; implementation details are handled by the stack‑specific agent.

## 1. Purpose
- Define the complete testing strategy for the project.
- Establish unit, integration, and end‑to‑end (E2E) testing requirements.
- Determine how acceptance criteria from the PRD + TechReq translate into tests.

## 2. Responsibilities
### 2.1 Interpret PRD + TechReq Acceptance Criteria
- Extract user stories and acceptance criteria.
- Identify feature flows requiring test coverage.
- Identify integration points requiring validation.
- Determine system‑wide behaviors that require E2E coverage.

### 2.2 Define Unit Testing Requirements
Unit testing should:
- Validate utilities, helpers, small functions.
- Validate domain logic where applicable.
- Mock external dependencies when relevant.
- Produce repeatable, deterministic outcomes.

### 2.3 Define Integration Testing Requirements
Integration testing should:
- Validate interactions between components/modules.
- Validate server/client interactions (where relevant).
- Ensure the data layer, auth layer, and feature logic interoperate correctly.

### 2.4 Define E2E Testing Requirements
E2E testing should:
- Validate end‑to‑end user flows across the entire system.
- Validate auth, data access, navigation, and workflows.
- Follow acceptance criteria step‑by‑step.

### 2.5 Establish Test Folder Structure
The agent MUST define an agnostic folder structure such as:
- `/tests/unit`
- `/tests/integration`
- `/tests/e2e`

The stack‑specific agent determines file extensions and implementation.

### 2.6 Produce Test Plan Templates
The agent MUST generate:
- A unit test plan template
- An integration test plan template
- An E2E test plan template

Each template MUST include:
- Test description
- Input conditions
- Expected output/behavior
- Edge cases

## 3. Inputs
- PRD
- TechReq
- Data DevCycle outputs
- Auth DevCycle outputs
- Toolset for Testing phase

## 4. Outputs
- Testing strategy specification
- Folder structure plan
- Test plan templates
- Tasks added to `todo.md`
- Changelog entry summarizing testing preparation

## 5. Success Criteria
The Testing DevCycle is complete when:
- All test types are fully defined
- Coverage expectations align with PRD + TechReq
- All test templates are generated
- Folder structure is validated
- Human approves the testing specification

## 6. Error Handling
The agent MUST:
- Halt if acceptance criteria are missing or underspecified
- Detect inconsistent feature flows
- Flag contradictions between UI/UX and backend expectations
- Provide clarification requests for incomplete scenarios

These instructions define the complete behavior of the Testing DevCycle.


```

## LoadedVibes/templates/devcycle_security_template.md
```md
---
name: security.instructions
applyTo: "**"
description: Instructions for the Security DevCycle.
---

# Security DevCycle Instructions

The **Security** DevCycle enforces systemwide protection, privacy requirements, boundary controls, and safe operation rules. This phase ensures that the entire system—from auth to data to features—is hardened against misuse, exploitation, or accidental data exposure.

This phase is entirely stack-agnostic at the instruction level.

## 1. Purpose
- Secure the application across all layers.
- Validate compliance with PRD + TechReq security requirements.
- Enforce least-privilege access across tools, APIs, MCP servers, and features.
- Protect user data, session integrity, and system boundaries.

## 2. Responsibilities
### 2.1 Review Authentication & Authorization
The agent MUST:
- Validate that Auth DevCycle rules are enforced everywhere.
- Ensure privileged routes are protected.
- Detect privilege escalation opportunities.

### 2.2 Enforce Systemwide Security Headers
Define universal requirements for:
- Content-Security-Policy (CSP)
- HSTS
- X-XSS-Protection
- X-Frame-Options
- Referrer-Policy
- Permissions-Policy

Stack-specific agent decides implementation.

### 2.3 Protect Data Privacy
The agent MUST:
- Identify all PII fields in the Data DevCycle
- Ensure proper handling, redaction, and retention rules
- Validate logging does not expose sensitive fields

### 2.4 Restrict Access to Tools and MCP Servers
Toolset security boundaries MUST:
- Restrict access to only required servers
- Validate proper scoping of permissions
- Detect excessive capabilities

### 2.5 Evaluate External Integrations
For all external services or APIs:
- Validate secret handling
- Validate access scopes
- Detect insecure configurations

## 3. Inputs
- Auth DevCycle outputs
- Data DevCycle outputs
- Feature modules
- Toolset for Security phase
- PRD + TechReq security requirements

## 4. Outputs
- Security audit report
- Updated toolset restrictions
- Secured headers specification
- PII handling policy
- Tasks added to `todo.md`
- Changelog entry summarizing security improvements

## 5. Success Criteria
Security DevCycle is complete when:
- No unauthorized access paths exist
- All PII is properly protected
- Security headers are defined
- Toolset boundaries are correct
- Human approves the audit

## 6. Error Handling
The agent MUST:
- Halt if critical vulnerabilities exist
- Detect missing auth protection
- Surface insecure defaults
- Provide specific correction tasks

These instructions define the complete behavior of the Security DevCycle.


```

## LoadedVibes/templates/devcycle_updates_template.md
```md
---
name: updates.instructions
applyTo: "**"
description: Instructions for the Updates DevCycle.
---

# Updates DevCycle Instructions

The **Updates** DevCycle governs post-launch maintenance, incremental improvements, small feature additions, and quality-of-life changes. This phase ensures that ongoing development remains structured, traceable, and aligned with the PRD + TechReq.

This DevCycle is universal and stack-agnostic.

## 1. Purpose
- Maintain and refine the product after deployment.
- Apply patches, bug fixes, enhancements, and small features.
- Keep documentation, tasks, and changelogs in sync with changes.

## 2. Responsibilities
### 2.1 Identify Post-Launch Needs
The agent MUST:
- Review bug reports
- Review user feedback (if provided)
- Review backlog items derived from earlier DevCycles
- Detect refactor opportunities

### 2.2 Apply Updates
Updates may include:
- Bug fixes
- Minor feature enhancements
- UI/UX improvements
- Documentation improvements
- Performance refinements
- Dependency updates

### 2.3 Maintain Specification Alignment
The agent MUST:
- Reconcile changes with PRD + TechReq
- Update specifications if scope changes
- Flag when major feature updates require new DevCycles

### 2.4 Regenerate Artifacts When Needed
If PRD or TechReq changes:
- Regenerate impacted issues
- Regenerate documentation
- Regenerate templates if necessary

### 2.5 Enforce Constraints
The agent MUST:
- Use only tools defined in the Updates toolset
- Follow global and DevCycle instructions
- Follow stack-specific agent rules

## 3. Inputs
- PRD
- TechReq
- Deployment notes
- Bug reports and feedback
- Toolset for Updates phase

## 4. Outputs
- Updated files
- Patch notes
- Updated PRD/TechReq (if scope changes)
- Updated documentation and templates
- Tasks marked as completed
- Changelog entries for each update

## 5. Success Criteria
Updates DevCycle is complete when:
- Identified work is implemented
- Documentation and specs are aligned
- All relevant tasks are updated
- Human approves the changes

## 6. Error Handling
The agent MUST:
- Halt if update conflicts with PRD/TechReq
- Detect regressions introduced by fixes
- Flag incompatible dependency updates
- Provide corrective steps

These instructions define the complete behavior of the Updates DevCycle.


```

## LoadedVibes/templates/devcycle_validation_template.md
```md
---
name: validation.instructions
applyTo: "**"
description: Instructions for the Validation DevCycle.
---

# Validation DevCycle Instructions

The **Validation** DevCycle ensures that the system's behavior matches the intent, logic, UX, and business rules defined in the PRD + TechReq. This phase is distinct from Verification: Verification checks structure and configuration; Validation checks correctness of behavior.

Validation is universal, stack-agnostic, and does not generate code. It evaluates implementation quality and alignment.

## 1. Purpose
- Validate that all previous DevCycles resulted in behavior aligned with PRD + TechReq.
- Identify mismatches in business logic, UX flows, data flow, and permissions.
- Ensure cross-domain correctness.

## 2. Responsibilities
### 2.1 Validate Business Logic
The agent MUST:
- Compare implemented logic against PRD requirements.
- Detect logic deviations, missing rules, or contradictory flows.
- Check for unhandled edge cases or undefined conditions.

### 2.2 Validate UX and User Journeys
The agent MUST:
- Compare UX flows against PRD user journey descriptions.
- Validate screen order, navigation paths, and required user actions.
- Identify broken flows, missing screens, or incorrect branching.

### 2.3 Validate Auth & Permissions
The agent MUST:
- Validate that roles, permissions, and access rules implemented match the Auth DevCycle definitions.
- Check that protected features remain protected.
- Ensure no privilege escalation or access mismatch exists.

### 2.4 Validate Data Contracts
The agent MUST:
- Compare input/output shapes for data operations with PRD specifications.
- Validate against schema definitions from the Data DevCycle.
- Detect missing fields, mismatched types, or incomplete contracts.

### 2.5 Validate Feature Integration
The agent evaluates whether:
- Features depend correctly on data and auth layers.
- Workflows correctly use underlying logic.
- No circular or broken dependencies exist.

## 3. Inputs
- PRD
- TechReq
- Testing DevCycle outputs
- Auth DevCycle outputs
- Data DevCycle outputs
- Toolset for Validation phase

## 4. Outputs
- Validation report
- List of mismatches and required corrections
- Tasks added to `todo.md`
- Changelog entry summarizing validation results

## 5. Success Criteria
Validation is complete when:
- All mismatches have been documented
- No critical misalignment exists between implementation and PRD/TechReq
- Human approves the validation report

## 6. Error Handling
The agent MUST:
- Halt if critical validation failures are detected
- Identify missing logic, incorrect assumptions, or broken UX flows
- Provide clear requirements for fixes

These instructions define the complete behavior of the Validation DevCycle.


```

## LoadedVibes/templates/devcycle_verification_template.md
```md
---
name: verification.instructions
applyTo: "**"
description: Instructions for the Verification DevCycle.
---

# Verification DevCycle Instructions

The **Verification** DevCycle ensures that the project is structurally sound before any feature or logic implementation begins. This phase validates configuration, environment setup, and baseline project integrity.

Verification is language-agnostic and stack-agnostic. It does not generate code. It confirms the project is ready to proceed.

## 1. Purpose
- Perform static checks on project configuration and structure.
- Validate that previous DevCycles (Initialization, Scaffolding, Configuration) were completed correctly.
- Identify structural, configuration, or environment issues early.

## 2. Responsibilities
### 2.1 Validate Environment
- Confirm that configuration files generated in earlier phases exist and are valid.
- Validate workspace and user settings.
- Ensure the profile is active and recognized.

### 2.2 Validate Tools and MCP Servers
Using #tool:mcp:
- Confirm MCP connectivity.
- Validate required servers are active.
- Detect missing or misconfigured servers.

### 2.3 Validate Project Configuration
The agent MUST verify:
- Formatting configuration
- Linting configuration
- Testing framework configuration
- Environment variable templates
- Project metadata files

### 2.4 Run Static Analysis (Non-Execution)
The agent MUST run static checks such as:
- Linting dry run
- Type-check dry run (if applicable)
- Basic build dry run (stack-specific agent decides exact commands)

### 2.5 Report Issues
- List all configuration, structural, or tooling errors.
- Provide detailed remediation steps.
- Update `todo.md` with required fixes.

## 3. Inputs
- PRD
- TechReq
- Initialization findings
- Scaffolded project
- Configuration output
- Toolset for Verification phase

## 4. Outputs
- Verification summary report
- List of errors, warnings, and suggested fixes
- Updated tasks
- Changelog entry summarizing verification steps

## 5. Success Criteria
Verification is complete when:
- All static checks pass
- No critical configuration errors remain
- Tooling functions as expected
- MCP connections succeed
- Human approves the verification summary

## 6. Error Handling
The agent MUST:
- Halt progression on critical errors
- Report missing configs or corrupted files
- Detect incompatible tool versions
- Provide corrective instructions

These instructions define the complete behavior of the Verification DevCycle.


```

## LoadedVibes/templates/global_instructions_template.md
```md
---
name: global.instructions
applyTo: "**"
description: Universal framework rules and workflow orchestration
---

# Global Instructions

These instructions define the universal, language‑agnostic, framework‑agnostic behavior of the development system. They establish how DevCycles, prompts, instructions, toolsets, profiles, and the custom agent interact.

## 1. Single‑Agent Rule
- Only **one** agent is active during development.
- The specific agent used is determined by the project's declared tech stack.
- All execution flows through this single agent.

## 2. DevCycles (Canonical List)
The system recognizes the following development phases:
- initialization
- scaffolding
- configuration
- verification
- data
- auth
- testing
- validation
- features
- debug
- security
- performance
- observability
- code-review
- documentation
- ci-cd
- deploy
- updates

Global instructions **only** define their names. Their behaviors are defined in the DevCycle instruction files.

## 3. Artifact Types
The framework uses the following artifact categories:

### Prompts (Agnostic)
- Each DevCycle is triggered by a corresponding **prompt**.
- Prompts are agnostic and do not contain stack-specific logic.
- A prompt points to its associated instructions.

### Instructions (Agnostic)
- Each DevCycle has a corresponding **instruction file**.
- Instructions define:
  - the DevCycle's purpose
  - detailed requirements
  - goals and success metrics
  - security boundaries
  - constraints and expectations
  - the **toolset** used for that DevCycle
- Instructions are language-agnostic and framework-agnostic.

### Toolsets (Environment-Specific)
- Toolsets define which tools the agent may use during a DevCycle.
- Toolsets are generated from:
  - `extensions.json`
  - `mcp.json`
  - VS Code workspace/user settings
- Toolsets enforce:
  - capability limits
  - available MCP servers
  - security boundaries per phase

### Profile (Environment + Stack Specific)
- The profile includes:
  - VS Code settings
  - Extensions
  - MCP server configurations
  - Task automation

### Bootstrapper
- Automates creation and updating of the profile.
- Detects existing configuration and modifies or generates it.
- Configures GenAI Script extension behavior.
- Enables memory and cross-agent context.

### Custom Agent (Stack-Specific)
- Defines stack conventions, architecture patterns, coding rules.
- Strictly follows global instructions, DevCycle instructions, and toolsets.
- Maintains tech-stack best practices.

### PRD & TechReq
- Serve as the project source of truth.
- Define requirements, constraints, workflows, and acceptance criteria.

## 4. Framework Workflow
1. A prompt triggers a DevCycle.
2. The DevCycle's instructions become active.
3. Instructions define:
   - responsibilities
   - constraints
   - tasks
   - success metrics
   - toolset
4. The custom agent executes the DevCycle steps according to instructions.
5. Toolset determines which tools are available.
6. Agent keeps the human-in-the-loop throughout.

## 5. Human-in-the-Loop
- Tasks are derived from PRD + TechReq and tracked in:
  - `todo.md` or
  - GitHub Issues
- Completed tasks update:
  - CHANGELOG
  - project milestones
- Human approval or revision is required before progressing.

## 6. Universal Behavioral Rules
- All artifacts must follow:
  - deterministic execution
  - explicit inputs/outputs
  - bounded tasks
  - security-first workflow
  - incremental iteration
- Nothing proceeds unless the DevCycle is initiated via its prompt.

## 7. Delegation Model
- The global layer DOES NOT:
  - implement stack conventions
  - generate code
  - manage architecture
- The global layer DOES:
  - define system rules
  - define DevCycle boundaries
  - define how artifacts interact

These global instructions serve as the foundation for all other artifacts in the framework.


```

## LoadedVibes/templates/profile_template.md
```md
---

## name: profile.template applyTo: "\*\*" description: Template for project profile files (settings, extensions, MCP servers, tasks).

# Profile Template

This file defines the unified structure of a **project profile**, combining settings, extensions, MCP servers, and tasks into a single environment definition. The profile determines how the agent operates inside VS Code.

Profiles are environment-specific and stack-aware.

## Purpose

- Represent the active development environment.
- Declare all installed and required VS Code extensions.
- Define all MCP servers available for agents.
- Configure workspace and user settings.
- Provide automation tasks used by prompts and DevCycles.

## Structure (JSONC Example)

```jsonc
{
  "name": "project.profile",

  "settings": {
    "editor.formatOnSave": true,
    "files.exclude": {
      "node_modules": true,
      ".git": true
    }
  },

  "extensions": [
    "github.copilot",
    "modelcontextprotocol.mcp",
    "esbenp.prettier-vscode"
  ],

  "mcpServers": [
    {
      "name": "filesystem",
      "command": "mcp-filesystem",
      "args": []
    },
    {
      "name": "github",
      "command": "mcp-github",
      "args": []
    }
  ],

  "tasks": {
    "scaffold": "powershell ./scripts/scaffold.ps1",
    "configure": "powershell ./scripts/configure.ps1",
    "verify": "powershell ./scripts/verify.ps1"
  }
}
```

## Profile Generation Rules

- The Bootstrapper creates or updates the profile.
- The profile must merge user settings, workspace settings, and extension requirements.
- Only extensions listed in the environment are included.
- MCP server definitions must match `mcp.json`.
- Tasks should correspond to DevCycles.

## Profile Responsibilities

- Provide the agent with a stable environment configuration.
- Ensure all required tools and servers are available.
- Define how automation tasks are executed.
- Align with the active technology stack.

## Notes

- Profiles are JSONC files.
- The Bootstrapper updates profiles automatically.
- Profile changes may trigger DevCycle regeneration.


```

## LoadedVibes/templates/prompt_template.md
```md
---

## name: prompt.template applyTo: "\*\*/\*.prompt.md" description: Template for DevCycle prompt files.

# Prompt File Template

This file defines the standard structure and behavior of **DevCycle prompt files**. Prompts are the entry points to each DevCycle, triggering the agent to execute the correct instructions with the proper toolset.

Prompts are fully language‑agnostic and stack‑agnostic.

## Purpose

- Trigger a specific DevCycle.
- Load the corresponding instructions file.
- Bind the correct toolset to the agent.
- Route execution to the custom agent.
- Keep the workflow deterministic and predictable.

## Frontmatter Structure

Each prompt file uses YAML frontmatter:

```yaml
---
description: Short description of what this prompt triggers.
name: Human‑friendly prompt name.
argument-hint: Instruction shown in the chat input field.
agent: Name of the custom agent to run (default: agent).
model: Optional model override.
tools:
  - filesystem/*
  - github/*
---
```

## Body Structure

The body of the prompt contains the **exact instructions sent to the LLM** when the prompt is invoked.

### Required Elements

- Identify the DevCycle being initiated.
- Instruct the agent to load that DevCycle’s instruction file.
- Instruct the agent to use the corresponding toolset.
- Instruct the agent to keep the human in the loop.

### Example Template Body

```markdown
# ${name} DevCycle Prompt

You are starting the **${name}** DevCycle.

Follow these rules:
- Load the instructions file located at `../instructions/${name}.instructions.md`.
- Load the toolset file located at `../toolsets/${name}.toolset.jsonc`.
- Use only the tools declared in this DevCycle’s toolset.
- Follow global instructions.
- Follow the stack‑specific custom agent instructions.
- Surface decisions for human approval.

Output:
- Summary of planned actions
- Any clarification questions
- A breakdown of tasks derived from PRD + TechReq
```

## Prompt Responsibilities

- Provide clear DevCycle initiation.
- Point to the correct instruction file.
- Point to the correct toolset file.
- Activate the correct custom agent.
- Define behavior for deterministic execution.

## Notes

- Prompts are Markdown files.
- Prompts must reside in `/prompts`.
- Prompts do not include stack‑specific logic.
- Prompts must be one‑to‑one with DevCycles.


```

## LoadedVibes/templates/toolset_template.md
```md
---

## name: toolset.template applyTo: "\*\*" description: Template for environment-specific toolset files.

# Toolset Template

This file defines the structure used by all environment-specific toolset JSONC files. Individual toolsets are generated per DevCycle, based on detected VS Code extensions, MCP servers, and workspace settings.

## Purpose

- Provide the agent with a bounded set of tools for each DevCycle.
- Enforce security by limiting access to only required capabilities.
- Serve as the middleware layer between instructions and available tools.

## Structure (JSONC Example)

```jsonc
{
  // Name of the toolset (per DevCycle)
  "name": "initialization.toolset",

  // List of VS Code extensions relevant for this DevCycle
  "extensions": [
    "github.copilot",
    "modelcontextprotocol.mcp",
    "editorconfig"
  ],

  // MCP servers available during this DevCycle
  "mcpServers": [
    "filesystem/*",
    "github/*",
    "memory/*"
  ],

  // Built-in or contributed tools the agent may invoke
  "tools": [
    "terminal",
    "workspace",
    "editor",
    "githubRepo"
  ],

  // Optional security boundaries
  "security": {
    "allowFileWrite": true,
    "allowNetwork": false,
    "restrictedPaths": [
      "node_modules",
      ".git"
    ]
  }
}
```

## Toolset Generation Rules

- Every DevCycle gets its own toolset.
- Toolsets are built from the environment’s:
  - `extensions.json`
  - `mcp.json`
  - Workspace settings
  - User settings
- Only required tools for that DevCycle are included.
- Access to tools is minimized for security.

## Toolset Responsibilities

- Provide the agent with the correct tools.
- Enforce limitations per DevCycle.
- Guarantee safe execution.
- Maintain predictable capabilities.

## Notes

- Toolsets are JSONC, not Markdown.
- This template defines how real toolset files are structured.
- Actual toolsets will vary per project environment.


```

## LoadedVibes/.prettierrc
```prettierrc
{
  "tabWidth": 2,
  "singleQuote": true,
  "semi": true,
  "trailingComma": "es5",
  "printWidth": 100
}

```

## LoadedVibes/CHANGELOG.md
```md
# CHANGELOG

[Update][2025-11-24T15:45Z] Goal: Automate DevCycle prompt alignment → Action: Rebuilt `update_prompts.py` as PowerShell script and executed it to regenerate every prompt’s front matter, instructions/toolset references, and tool listings → Result: All prompts now share consistent metadata and guidance tied to the LoadedVibes stack agent → Next: Keep the script handy for future prompt changes and re-run after any template updates.

[Validation][2025-11-24T15:50Z] Goal: Confirm regenerated prompts retained correct focus/deliver content → Action: Spot-checked `lv_artifacts/.github/prompts/{initialization,features,security,deploy}.prompt.md` for accurate sections → Result: Focus and deliverables render cleanly with proper context reminders → Next: Expand validation to remaining DevCycles when their focus areas change.

[Update][2025-11-24T18:10Z] Goal: Consolidate product/technical specs and align governance assets → Action: Merged CLI + engine specs into `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md`, refreshed README + instructions, added required support/security/license/CODEOWNERS/etc., and tightened `.vscode/settings.json` ignores → Result: Single-source documentation + baseline repo hygiene match Spec-Driven Workflow expectations → Next: Implement CI guardrails for new required files and automate TODO/CHANGELOG updates per DevCycle.

```

## LoadedVibes/.gitignore
```gitignore
# Node / tooling
node_modules/
dist/
build/
temp/
.env
.env.local

# VS Code / workspace
.vscode/*.code-workspace
.vscode/.history
.history/
.DS_Store
Thumbs.db

# Loaded Vibes runtime mirrors
lv_artifacts/src/
**/.loaded-vibes/
.agent_work/

# Logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Coverage
coverage/
.nyc_output/

```

## LoadedVibes/CODEOWNERS
```codeowners
# Default owners
* @LoadedVibes/framework-maintainers

docs/* @LoadedVibes/spec-leads
lv_artifacts/** @LoadedVibes/release-engineering

```

## LoadedVibes/CODE_OF_CONDUCT.md
```md
# Contributor Covenant Code of Conduct (Short Form)

## Our Pledge

We pledge to make Loaded Vibes a harassment-free experience for everyone, regardless of age, body size, visible or invisible disability, ethnicity, gender identity and expression, experience level, education, socio-economic status, nationality, personal appearance, race, religion, or sexual identity/orientation.

## Our Standards

- Use welcoming and inclusive language.
- Respect differing viewpoints and experiences.
- Accept constructive criticism gracefully.
- Focus on what is best for the community and the Spec-Driven Workflow.
- Show empathy toward other community members.

Unacceptable behavior includes harassment, trolling, public or private insults, outing others without explicit permission, or any other conduct the maintainers deem inappropriate.

## Enforcement

- Report issues via `SECURITY.md` (for security incidents) or `SUPPORT.md` (for general conduct concerns).
- Maintainers may take any action they deem appropriate, including temporary or permanent bans.

## Attribution

This policy is adapted from the Contributor Covenant, version 2.0, available at https://www.contributor-covenant.org/version/2/0/code_of_conduct.html.

```

## LoadedVibes/eslint.json
```json
{
  "$schema": "https://json.schemastore.org/eslintrc",
  "root": true,
  "env": {
    "es2021": true,
    "node": true
  },
  "extends": ["eslint:recommended"],
  "parserOptions": {
    "ecmaVersion": 2021,
    "sourceType": "module"
  },
  "ignorePatterns": ["lv_artifacts/src/**", "**/.loaded-vibes/**"],
  "rules": {
    "no-unused-vars": ["warn", { "args": "none" }],
    "no-console": "off"
  }
}

```

## LoadedVibes/CONTRIBUTING.md
```md
# Contributing to Loaded Vibes

Thank you for investing in the Loaded Vibes framework! Follow the steps below to keep contributions aligned with the Spec-Driven Workflow.

## 1. Understand the Workflow

- Read `docs/PRD.md` (product requirements) and `docs/TECH_REQUIREMENTS.md` (technical/automation requirements).
- Review `.github/copilot-instructions.md` to understand how Copilot agents execute DevCycles.
- Familiarize yourself with `.github/instructions/*.md`, `.github/prompts/*.md`, and `.github/toolsets/*.jsonc` to avoid layer bleed.

## 2. Development Environment

1. Clone the repo to `D:/LoadedVibes` (Windows requirement).
2. Install VS Code with the recommended settings in `.vscode/settings.json` and ensure the GenAIScript extension is enabled.
3. Do **not** edit `lv_artifacts/src/**`; those are runtime outputs for end users.

## 3. Making Changes

- Use DevCycles via the retro CLI (`loaded-vibes devcycle <name>`) or orchestrator scripts to ensure Analyze → Handoff evidence is captured.
- Update `TODO.md` and `CHANGELOG.md` before marking work complete.
- Keep files ASCII unless explicit justification exists.
- Avoid destructive commands; prefer MCP or GenAIScript helpers over raw shell scripts.

## 4. Testing & Validation

- Run `pnpm lint`/`pnpm test` (or equivalents) plus `genaiscript test` for automation changes.
- Capture CLI/DevCycle logs for any user-visible change.
- Document manual verification steps when automated tests are unavailable.

## 5. Submitting Pull Requests

- Use `PULL_REQUEST_TEMPLATE.md` and link to the relevant PRD/Tech requirement.
- Include references to updated TODO/CHANGELOG entries.
- Request review from `@LoadedVibes/framework-maintainers`.

By following these guidelines, you help maintain deterministic DevCycles and a clean separation between authoring assets and shipped artifacts. We appreciate your contributions!

```

## LoadedVibes/LICENSE
```license
MIT License

Copyright (c) 2025 Loaded Vibes

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```

## LoadedVibes/README.md
```md
# Loaded Vibes Framework

This workspace contains everything required to _author_ the Loaded Vibes framework while keeping the **development environment** separate from the **shipped package** that customers install through `npx create-loaded-vibes` or the retro `loaded-vibes` CLI.

## 1. The Loaded Vibes Development Environment

The active development environment for Loaded Vibes is located at:
`D:\LoadedVibes`

Use these folders when you are improving the framework itself:

- `.github/` – Stack-specific Copilot instructions and governance for the development environment.
- `.vscode/` – Editor settings and extension recommendations scoped only to the framework authoring workspace.
- `docs/` – Architecture references, PRD, Tech Requirements, and developer guides.
- `templates/` – Reference files and templates used for developing the framework (not shipped directly).

### 1.1 Spec-Driven Workflow Artifacts

- `docs/PRD.md` – Consolidated product requirements, including CLI experience and distribution rules.
- `docs/TECH_REQUIREMENTS.md` – Consolidated technical, automation, manifest, and CLI implementation guidance.
- `TODO.md` & `CHANGELOG.md` – Rolling execution evidence that every DevCycle must update.
- `SUPPORT.md`, `SECURITY.md`, `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `CODEOWNERS`, `LICENSE` – Governance artifacts referenced by the PRD and Tech Requirements.

## 2. The Loaded Vibes Framework (Shipped Product)

Assets that are shipped with the Loaded Vibes project are in the following directory:
`D:\LoadedVibes\lv_artifacts\**`

This directory mirrors the files that get copied to the user's development environment (released under `.loaded-vibes/**` by the CLI). It includes:

- `lv_artifacts/.github/` – Agents, instructions, prompts, and toolsets for the end user.
- `lv_artifacts/.vscode/` – Settings, extensions, and MCP config for the end user.
- `lv_artifacts/docs/` – End-user documentation.
- `lv_artifacts/genaiscript/` – The core framework engine (orchestrator and tools) that runs in the end user's environment.
- `lv_artifacts/scripts/` – Bootstrapper scripts.
- `lv_artifacts/src/` – The output directory for generated user projects.

**Note:** `lv_artifacts` should be treated as the "shipped product". Do not use these files to configure the _framework's_ development environment—use `.github/` and `.vscode/` in this workspace instead.

## 3. End User Project Files

Loaded Vibes generates all assets for the end user inside:
`D:\LoadedVibes\lv_artifacts\src`

- These files are the output of the framework.
- They belong to the end user's application.
- They must **not** influence the Loaded Vibes development environment.
- The IDE should ignore `lv_artifacts/src` for linting and configuration purposes.

## Summary of Separation

| Scope               | Directory           | Purpose                                                                                      |
| :------------------ | :------------------ | :------------------------------------------------------------------------------------------- |
| **Dev Environment** | `D:\LoadedVibes`    | Where we build the framework. Configured by root `.vscode`, `.github`, `docs`, `templates`.  |
| **Shipped Product** | `lv_artifacts/`     | The artifacts delivered to users. Contains its own `.github`, `.vscode`, `genaiscript`, etc. |
| **User Project**    | `lv_artifacts/src/` | The generated application code. Ignored by framework tooling.                                |

## 4. Retro CLI Quickstart

1. Run `npx create-loaded-vibes my-app` (or `--attach ./existing`) to download the latest signed release and mirror `lv_artifacts/**` into `.loaded-vibes/`.
2. Allow the installer to run `loaded-vibes init`, which configures MCP endpoints, VS Code profile files, and Git hooks per the Tech Requirements.
3. Launch `loaded-vibes dashboard` to open the synthwave console with DevCycle queue, live logs, diagnostics, and TODO/CHANGELOG feeds.
4. Use `loaded-vibes devcycle <name>` to stream orchestrator events (Analyze → Handoff) with built-in pause/resume checkpoints and Bad Vibes Firewall prompts for risky actions.

Refer to `docs/PRD.md` §5 and `docs/TECH_REQUIREMENTS.md` §§5–10 whenever CLI behavior needs to change.

```

## LoadedVibes/renovate.json
```json
{
  "$schema": "https://docs.renovatebot.com/renovate-schema.json",
  "extends": ["config:base"],
  "rangeStrategy": "replace",
  "reviewers": ["@LoadedVibes/framework-maintainers"],
  "packageRules": [
    {
      "matchManagers": ["npm"],
      "groupName": "npm dependencies",
      "labels": ["dependencies", "npm"],
      "schedule": ["before 3am on monday"]
    }
  ]
}

```

## LoadedVibes/SECURITY.md
```md
# Security Policy

Loaded Vibes enforces strict separation between development assets, shipped artifacts, and runtime code. Follow these guidelines when reporting vulnerabilities:

## Supported Versions

The framework is distributed through tagged releases under `lv_artifacts/**` and the `create-loaded-vibes` CLI. We currently support the latest major release and the immediately preceding release.

## Reporting a Vulnerability

1. Email `security@loadedvibes.dev` (placeholder) or contact `@LoadedVibes/security-team` on GitHub with the following:
   - A detailed description of the vulnerability and the affected DevCycle/CLI command.
   - Steps to reproduce, including logs or sanitized `.loaded-vibes/logs/*.ndjson` excerpts.
   - Impact assessment (data exposure, privilege escalation, etc.).
2. Do **not** open a public issue until maintainers confirm the fix or provide disclosure instructions.
3. Encrypt sensitive details if possible; we can provide a PGP key on request.

## Response Process

- Acknowledge receipt within 24 hours.
- Provide initial assessment within 3 business days.
- Share remediation plan and target release window; critical issues may trigger out-of-band releases.

## Scope

- Workspace automation (`.github`, `.vscode`, `docs`, `templates`).
- Shipped assets (`lv_artifacts/**`, `.loaded-vibes/**`).
- Retro CLI commands and GenAIScript orchestrator scripts.

Out-of-scope: third-party dependencies outside our control (report upstream), and user-generated application code under `lv_artifacts/src/**`.

Thank you for helping keep Loaded Vibes secure.

```

## LoadedVibes/TODO.md
```md
# TODO

This backlog tracks Spec-Driven Workflow actions for the Loaded Vibes framework. Update this file at the end of every DevCycle per `docs/PRD.md` §2 and `docs/TECH_REQUIREMENTS.md` §10.

## Active Items

| Status | Item                                                                                                                                                                                                      | Source                                 |
| ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- |
| ☐      | Ship the `create-loaded-vibes` npm package with download/verification/extraction flow plus `loaded-vibes init` automation that mirrors `lv_artifacts/**` into `.loaded-vibes/` and logs install metadata. | PRD §5.1-5.3, CLI Spec §2              |
| ☐      | Implement retrofit/attach workflow (Mirror / Merge / Sandbox) with conflict detection for `.github`, `.vscode`, and `lv_artifacts/**`, writing results to `.loaded-vibes/logs/install-YYYYMMDD.md`.       | CLI Spec §2.4                          |
| ☐      | Build the retro dashboard (`loaded-vibes dashboard`) with DevCycle queue, live orchestrator logs, metrics pane, TODO/CHANGELOG feeds, notifications, and command palette actions.                         | PRD §5.2, Tech Requirements §5         |
| ☐      | Integrate DevCycle runner service that streams `genaiscript/orchestrator.genai.js` output into the CLI UI with pause/resume checkpoints and approval prompts.                                             | Tech Requirements §4.2, Engine Spec §4 |
| ☐      | Finish GenAIScript engine coverage: populate `devcycles.config.json` entries for all phases, author prompts/toolsets/instructions, and ensure phase scripts update TODO/CHANGELOG + state.                | Tech Requirements §4.1-4.3             |
| ☐      | Add reusable `tasks.json` entries for orchestrator runs, retro CLI smoke tests, lint/test shortcuts, and bootstrap validation.                                                                            | Tech Requirements §8                   |
| ☐      | Implement CI guard that ensures `.vscode/settings.json` only references `.github/copilot-instructions.md` (no shipped instructions) and blocks edits outside allowed directories.                         | Tech Requirements §11                  |
| ☐      | Capture and document CLI telemetry export format (JSON vs Markdown) then wire NDJSON log streaming + export commands.                                                                                     | Tech Requirements §11, CLI Spec §3.3   |
| ☐      | Harden bootstrapper (TS + PowerShell) to validate VS Code profiles, MCP endpoints, manifest coherence, and emit machine-readable status for CI + CLI.                                                     | Tech Requirements §4.4                 |
| ☐      | Implement automated security + safety gates: SHA256 verification of releases, "Bad Vibes Firewall" prompts, and sandboxed file writes confined to `.loaded-vibes/**`.                                     | PRD §5.5, Tech Requirements §5.4       |
| ☐      | Author end-user documentation (README quickstart, SUPPORT, SECURITY, CHANGELOG) that explains installation, dashboard usage, DevCycle governance, and troubleshooting workflows.                          | PRD §§2-4                              |

## Recently Completed

| Status | Item                                                               | Notes                    |
| ------ | ------------------------------------------------------------------ | ------------------------ |
| ☑      | Consolidated PRD + Tech Requirements to absorb CLI & engine specs. | Logged in `CHANGELOG.md` |

```

## LoadedVibes/SUPPORT.md
```md
# Support Policy

Loaded Vibes framework maintainers provide support for the authoring workspace and the shipped `lv_artifacts` payload under the Spec-Driven Workflow contract.

## Primary Channels

- **Issues:** Open a GitHub issue using the template in `.github/ISSUE_TEMPLATE.md` for bugs, feature requests, or documentation gaps.
- **Security Reports:** Follow `SECURITY.md` for responsible disclosure instructions before filing a public ticket.
- **Discussions:** For questions about DevCycles or automation, start a GitHub Discussion or contact the `@LoadedVibes/framework-maintainers` team.

## What to Include

1. Workspace path (`D:/LoadedVibes`) and whether the issue occurs in the dev workspace or a `.loaded-vibes/` consumer tree.
2. DevCycle name, prompt, or CLI command executed.
3. Relevant logs from `.loaded-vibes/logs/*.ndjson` or the VS Code GenAIScript output channel.
4. References to the governing requirement in `docs/PRD.md` or `docs/TECH_REQUIREMENTS.md`.

## Response Targets

| Severity | Example                                         | Target Response     |
| -------- | ----------------------------------------------- | ------------------- |
| Critical | Security regression, data loss, blocked release | < 24 hours          |
| High     | Broken DevCycle, CLI failure, automation drift  | < 2 business days   |
| Normal   | Documentation gaps, minor tooling issues        | < 5 business days   |
| Low      | Questions, enhancement ideas                    | As bandwidth allows |

## Self-Serve Resources

- `docs/PRD.md` and `docs/TECH_REQUIREMENTS.md` for canonical requirements.
- `README.md` for directory ownership guidance.
- Retro CLI `loaded-vibes doctor` command for diagnostics.
- `.genaiscript/instructions/llms-full.txt` plus `.github/instructions/genaiscript.instructions.md` for scripting questions.

Please reference this document whenever raising or triaging support requests to keep responses predictable and auditable.

```


````