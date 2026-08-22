---
title: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-frontmatter-schemas.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-frontmatter-schemas.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.scripts.validate-frontmatter-schemas.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-frontmatter-schemas.ts'
source_file: 'validate-frontmatter-schemas.ts'
source_sha256: '2e0d014dec987af6ff6a48745d56a344d76d17f88a1c1e53b06b84575a3dfe9c'
generated: true
---

# `validate-frontmatter-schemas.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\scripts\validate-frontmatter-schemas.ts`
> SHA-256: `2e0d014dec987af6ff6a48745d56a344d76d17f88a1c1e53b06b84575a3dfe9c`

```ts
#!/usr/bin/env npx tsx

// @ts-ignore: ajv may not be available to the type checker in some editors
import Ajv from "ajv";
import fs from "fs";
import path from "path";
import {
  AGENT_FILE_SUFFIX,
  AGENTS_DIR,
  INSTRUCTIONS_DIR,
  INSTRUCTIONS_FILE_SUFFIX,
  PROMPT_FILE_SUFFIX,
  PROMPTS_DIR,
  ROOT_FOLDER,
  SKILLS_DIR,
} from "./constants.js";
import { parseFrontmatter } from "./yaml-parser.js";

type AssetKind = "agent" | "prompt" | "instructions" | "skill";

interface SchemaBundle {
  kind: AssetKind;
  schemaPath: string;
}

const SCHEMAS_DIR = path.join(ROOT_FOLDER, ".schemas");

const SCHEMAS: SchemaBundle[] = [
  { kind: "agent", schemaPath: path.join(SCHEMAS_DIR, "agent.schema.json") },
  { kind: "prompt", schemaPath: path.join(SCHEMAS_DIR, "prompt.schema.json") },
  {
    kind: "instructions",
    schemaPath: path.join(SCHEMAS_DIR, "instructions.schema.json"),
  },
  { kind: "skill", schemaPath: path.join(SCHEMAS_DIR, "skill.schema.json") },
];

function readJson(filePath: string): unknown {
  return JSON.parse(fs.readFileSync(filePath, "utf8"));
}

function rel(p: string): string {
  return path.relative(process.cwd(), p);
}

function listFiles(dir: string, suffix: string): string[] {
  if (!fs.existsSync(dir)) return [];
  return fs
    .readdirSync(dir)
    .filter((f) => f.endsWith(suffix))
    .map((f) => path.join(dir, f))
    .sort();
}

function listSkillFiles(): string[] {
  if (!fs.existsSync(SKILLS_DIR)) return [];
  const entries = fs.readdirSync(SKILLS_DIR, { withFileTypes: true });
  return entries
    .filter((e) => e.isDirectory())
    .map((e) => path.join(SKILLS_DIR, e.name, "SKILL.md"))
    .filter((p) => fs.existsSync(p))
    .sort();
}

function getFilesForKind(kind: AssetKind): string[] {
  switch (kind) {
    case "agent":
      return listFiles(AGENTS_DIR, AGENT_FILE_SUFFIX);
    case "prompt":
      return listFiles(PROMPTS_DIR, PROMPT_FILE_SUFFIX);
    case "instructions":
      return listFiles(INSTRUCTIONS_DIR, INSTRUCTIONS_FILE_SUFFIX);
    case "skill":
      return listSkillFiles();
    default: {
      const _exhaustive: never = kind;
      return _exhaustive;
    }
  }
}

function formatAjvErrors(
  errors: any[] | null | undefined
): string[] {
  if (!errors || errors.length === 0) return ["(no further details)"];
  return errors.map((e) => {
    const where =
      e.instancePath && e.instancePath.length > 0 ? e.instancePath : "(root)";
    const msg = e.message ?? "invalid";
    const params =
      e.params && Object.keys(e.params).length > 0
        ? ` (${JSON.stringify(e.params)})`
        : "";
    return `${where}: ${msg}${params}`;
  });
}

function validateFrontmatterSchemas(): boolean {
  const ajv = new Ajv({ allErrors: true, strict: false });

  const validators = new Map<AssetKind, any>();

  for (const s of SCHEMAS) {
    if (!fs.existsSync(s.schemaPath)) {
      console.error(`❌ Missing schema file: ${rel(s.schemaPath)}`);
      return false;
    }
    validators.set(s.kind, ajv.compile(readJson(s.schemaPath) as any));
  }

  let hasErrors = false;

  for (const { kind } of SCHEMAS) {
    const files = getFilesForKind(kind);
    if (files.length === 0) {
      console.log(`No ${kind} files found - skipped`);
      continue;
    }

    console.log(
      `\nValidating ${files.length} ${kind} file(s) against schema...`
    );

    const validate = validators.get(kind);
    if (!validate) {
      console.error(`❌ Internal error: missing validator for ${kind}`);
      return false;
    }

    for (const filePath of files) {
      const fm = parseFrontmatter(filePath);
      if (!fm) {
        console.error(`❌ ${rel(filePath)}: failed to parse YAML frontmatter`);
        hasErrors = true;
        continue;
      }

      const ok = validate(fm);
      if (!ok) {
        console.error(`❌ ${rel(filePath)}: schema validation failed:`);
        for (const line of formatAjvErrors(validate.errors)) {
          console.error(`   - ${line}`);
        }
        hasErrors = true;
      } else {
        console.log(`✅ ${rel(filePath)}`);
      }
    }
  }

  return !hasErrors;
}

try {
  const ok = validateFrontmatterSchemas();
  if (!ok) {
    console.error("\n❌ Frontmatter schema validation failed");
    process.exit(1);
  }
  console.log("\n🎉 Frontmatter schema validation passed");
} catch (error) {
  const message = error instanceof Error ? error.message : String(error);
  console.error(`Error during frontmatter schema validation: ${message}`);
  if (error instanceof Error) console.error(error.stack);
  process.exit(1);
}

```