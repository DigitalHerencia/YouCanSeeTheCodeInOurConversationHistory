---
title: "build-court-gesture"
type: reference
scope: vault
project:
domain: inbox
artifact: build.court.gesture
kind: source-code
namespace: inbox.source.build.court.gesture
status: review
authority: archive
parent: "[[devnotes.zettelkasten.map]]"
depends_on: []
supersedes: []
tags:
  - inbox
  - imports/source-code
  - status/review
created: 2026-05-27
updated: 2026-05-27
source_file: "00 ZETTELKASTEN/INBOX/build-court-gesture.ts"
source_hash: "DA30C72312743788E1D8B6C872A262FD8A1400F859C25946B6E2B6ABC43A11CD"
---
# build-court-gesture

```typescript
import * as fs from "node:fs";
import * as path from "node:path";

type Contract = {
  schemaVersion: number;
  name: string;
  paths: {
    data: string;
    output: string;
    source?: string;
  };
  document: {
    title: string;
    requiredFields: string[];
    sectionRequiredFields: string[];
    allowedTopLevelSections: string[];
    canonicalTopLevelOrder: string[];
    deterministicOrdering: boolean;
  };
  assembly: {
    normalizeFinalNewline: boolean;
  };
  validation: {
    failOnMissingRequiredFields: boolean;
    failOnUnknownTopLevelSections: boolean;
    failOnEmptySectionTitle: boolean;
  };
};

type CourtGestureSection = {
  title: string;
  sourceHeading?: string;
  headingLevel: number;
  bodyMarkdown: string;
};

type CourtGestureData = {
  schemaVersion: number;
  title: string;
  sections: CourtGestureSection[];
};

const CONTRACT_PATH = "_OPS/court-gesture.contract.yaml";

function readText(repoRoot: string, relativePath: string): string {
  return fs.readFileSync(path.join(repoRoot, relativePath), "utf8");
}

function parseScalar(value: string): unknown {
  const trimmed = value.trim();

  if (trimmed === "true") return true;
  if (trimmed === "false") return false;
  if (/^\d+$/.test(trimmed)) return Number(trimmed);

  if (
    (trimmed.startsWith("[") && trimmed.endsWith("]")) ||
    (trimmed.startsWith("{") && trimmed.endsWith("}"))
  ) {
    return JSON.parse(trimmed);
  }

  if (
    (trimmed.startsWith('"') && trimmed.endsWith('"')) ||
    (trimmed.startsWith("'") && trimmed.endsWith("'"))
  ) {
    return trimmed.slice(1, -1);
  }

  return trimmed;
}

/**
 * Minimal deterministic YAML reader for this repo-owned contract shape.
 * It intentionally supports only nested maps via indentation and inline JSON-style arrays.
 */
function parseContractYaml(yamlText: string): Contract {
  const root: Record<string, unknown> = {};
  const stack: Array<{ indent: number; target: Record<string, unknown> }> = [
    { indent: -1, target: root },
  ];

  for (const rawLine of yamlText.split(/\r?\n/)) {
    if (!rawLine.trim() || rawLine.trimStart().startsWith("#")) continue;

    const indent = rawLine.match(/^ */)?.[0].length ?? 0;
    const line = rawLine.trim();
    const separatorIndex = line.indexOf(":");

    if (separatorIndex === -1) {
      throw new Error(`Invalid YAML contract line: ${rawLine}`);
    }

    const key = line.slice(0, separatorIndex).trim();
    const rawValue = line.slice(separatorIndex + 1).trim();

    while (stack.length > 1 && indent <= stack[stack.length - 1].indent) {
      stack.pop();
    }

    const parent = stack[stack.length - 1].target;

    if (!rawValue) {
      const child: Record<string, unknown> = {};
      parent[key] = child;
      stack.push({ indent, target: child });
    } else {
      parent[key] = parseScalar(rawValue);
    }
  }

  return root as Contract;
}

function assertObject(value: unknown, label: string): asserts value is Record<string, unknown> {
  if (!value || typeof value !== "object" || Array.isArray(value)) {
    throw new Error(`${label} must be an object.`);
  }
}

function assertRequiredFields(
  value: Record<string, unknown>,
  requiredFields: string[],
  label: string,
): void {
  for (const field of requiredFields) {
    if (!(field in value)) {
      throw new Error(`${label} is missing required field: ${field}`);
    }
  }
}

function validateData(data: unknown, contract: Contract): asserts data is CourtGestureData {
  assertObject(data, "Data file");

  if (contract.validation.failOnMissingRequiredFields) {
    assertRequiredFields(data, contract.document.requiredFields, "Data file");
  }

  if (!Array.isArray(data.sections)) {
    throw new Error("Data file field `sections` must be an array.");
  }

  const allowed = new Set(contract.document.allowedTopLevelSections);

  data.sections.forEach((section, index) => {
    assertObject(section, `Section at index ${index}`);

    if (contract.validation.failOnMissingRequiredFields) {
      assertRequiredFields(
        section,
        contract.document.sectionRequiredFields,
        `Section at index ${index}`,
      );
    }

    if (contract.validation.failOnEmptySectionTitle && String(section.title).trim() === "") {
      throw new Error(`Section at index ${index} has an empty title.`);
    }

    if (contract.validation.failOnUnknownTopLevelSections && !allowed.has(String(section.title))) {
      throw new Error(`Unknown top-level section: ${String(section.title)}`);
    }
  });
}

function canonicalizeSections(
  sections: CourtGestureSection[],
  contract: Contract,
): CourtGestureSection[] {
  if (!contract.document.deterministicOrdering) return sections;

  const order = new Map(
    contract.document.canonicalTopLevelOrder.map((sectionTitle, index) => [sectionTitle, index]),
  );

  return [...sections].sort((a, b) => {
    const left = order.get(a.title) ?? Number.MAX_SAFE_INTEGER;
    const right = order.get(b.title) ?? Number.MAX_SAFE_INTEGER;

    if (left !== right) return left - right;
    return a.title.localeCompare(b.title);
  });
}

function assembleMarkdown(data: CourtGestureData, contract: Contract): string {
  const parts: string[] = [`# ${data.title}`];

  for (const section of canonicalizeSections(data.sections, contract)) {
    parts.push(`## ${section.title}`);

    const body = section.bodyMarkdown.trim();
    if (body) {
      parts.push(body);
    }
  }

  const markdown = parts.join("\n\n");
  return contract.assembly.normalizeFinalNewline ? `${markdown.trimEnd()}\n` : markdown;
}

function main(): void {
  const repoRoot = process.cwd();
  const contract = parseContractYaml(readText(repoRoot, CONTRACT_PATH));
  const dataPath = contract.paths.data;
  const outputPath = contract.paths.output;

  const data = JSON.parse(readText(repoRoot, dataPath)) as unknown;
  validateData(data, contract);

  const markdown = assembleMarkdown(data, contract);
  const absoluteOutputPath = path.join(repoRoot, outputPath);

  fs.mkdirSync(path.dirname(absoluteOutputPath), { recursive: true });
  fs.writeFileSync(absoluteOutputPath, markdown, "utf8");

  console.log(`Court Gesture markdown written to ${outputPath}`);
}

main();

```
