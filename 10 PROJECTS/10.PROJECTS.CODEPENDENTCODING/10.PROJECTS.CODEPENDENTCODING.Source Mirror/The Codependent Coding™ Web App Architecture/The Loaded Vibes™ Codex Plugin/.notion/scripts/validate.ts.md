---
title: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\validate.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\validate.ts'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.notion.scripts.validate.ts'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.notion\scripts\validate.ts'
source_file: 'validate.ts'
source_sha256: 'cdc889bde09765dcf4e0d2ff4fb0ab286970087de79c2b7af300bf88741d5e44'
generated: true
---

# `validate.ts`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.notion\scripts\validate.ts`
> SHA-256: `cdc889bde09765dcf4e0d2ff4fb0ab286970087de79c2b7af300bf88741d5e44`

```ts
#!/usr/bin/env npx tsx

import fs from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { z } from "zod";

import {
  Meeting,
  Project,
  Task,
  Team,
} from "../schemas.js";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.join(__dirname, "..");
const SNAPSHOT_DIR = path.join(ROOT, "snapshots", "notion");

const ExportShape = z.object({
  exportedAt: z.string(),
  rows: z.array(z.unknown()),
});

type Dataset = {
  name: string;
  file: string;
  schema: z.ZodTypeAny;
};

const DATASETS: Dataset[] = [
  { name: "projects", file: "projects.json", schema: Project },
  { name: "tasks", file: "tasks.json", schema: Task },
  { name: "meetings", file: "meetings.json", schema: Meeting },
  { name: "teams", file: "teams.json", schema: Team },
];

function rel(p: string): string {
  return path.relative(ROOT, p);
}

async function validateDataset(dataset: Dataset): Promise<number> {
  const filePath = path.join(SNAPSHOT_DIR, dataset.file);

  const raw = await fs.readFile(filePath, "utf8");
  const parsed = ExportShape.parse(JSON.parse(raw));
  const validated = parsed.rows.map((row, idx) => {
    try {
      return dataset.schema.parse(row);
    } catch (error) {
      throw new Error(`${dataset.name} row ${idx}: ${(error as Error).message}`);
    }
  });

  console.log(`✔ ${dataset.name}: ${validated.length} rows validated (${rel(filePath)})`);
  return validated.length;
}

async function main() {
  let total = 0;
  for (const dataset of DATASETS) {
    try {
      total += await validateDataset(dataset);
    } catch (error) {
      const message = error instanceof Error ? error.message : String(error);
      console.error(`✖ ${dataset.name}: ${message}`);
      process.exit(1);
    }
  }
  console.log(`\n✅ Validation finished (${total} total rows)`);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});

```