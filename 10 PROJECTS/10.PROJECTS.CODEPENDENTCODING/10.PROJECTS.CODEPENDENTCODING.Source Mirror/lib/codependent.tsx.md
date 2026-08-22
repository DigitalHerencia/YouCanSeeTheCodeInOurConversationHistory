---
title: 'The Hipster Stack™ Technology Stack\apps\web\lib\docs.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\apps\web\lib\docs.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.apps.web.lib.docs.tsx'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\apps\web\lib\docs.tsx'
source_file: 'docs.tsx'
source_sha256: '40fc98784df5961cf7a484958a288bb4cd8ef39a3544349f7fcbd24973c439f1'
generated: true
---

# `docs.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\apps\web\lib\docs.tsx`
> SHA-256: `40fc98784df5961cf7a484958a288bb4cd8ef39a3544349f7fcbd24973c439f1`

````tsx
import 'server-only';
import fs from 'node:fs';
import path from 'node:path';
import type { ReactNode } from 'react';

export const documentation = [
  { slug: [], title: 'Overview' },
  { slug: ['getting-started'], title: 'Getting started' },
  { slug: ['concepts', 'one-template'], title: 'One template' },
  { slug: ['concepts', 'configuration'], title: 'Configuration contract' },
  { slug: ['concepts', 'generated-project'], title: 'Generated project' },
  { slug: ['configuration', 'project'], title: 'Project' },
  { slug: ['configuration', 'optional-surfaces'], title: 'Optional surfaces' },
  { slug: ['configuration', 'integrations'], title: 'Integrations' },
  { slug: ['configuration', 'identity'], title: 'Identity' },
  { slug: ['configuration', 'design'], title: 'Design' },
  { slug: ['cli'], title: 'CLI reference' },
  { slug: ['cli', 'create'], title: 'Create' },
  { slug: ['cli', 'add'], title: 'Add' },
  { slug: ['cli', 'explain'], title: 'Explain' },
  { slug: ['cli', 'doctor'], title: 'Doctor' },
  { slug: ['troubleshooting'], title: 'Troubleshooting' },
] as const;

const docsRoot = path.resolve(process.cwd(), '../../docs');

export function readDocumentation(slug: readonly string[]): string | null {
  const entry = documentation.find(
    (candidate) => candidate.slug.join('/') === slug.join('/'),
  );
  if (!entry) return null;
  if (!entry.slug.length)
    return fs.readFileSync(path.join(docsRoot, 'index.md'), 'utf8');
  const stem = path.join(docsRoot, ...entry.slug);
  const file = fs.existsSync(stem) ? path.join(stem, 'index.md') : `${stem}.md`;
  return fs.readFileSync(file, 'utf8');
}

function inline(value: string): ReactNode[] {
  const parts = value.split(/(`[^`]+`|\[[^\]]+\]\([^)]+\))/g);
  return parts.map((part, index) => {
    const link = part.match(/^\[([^\]]+)\]\(([^)]+)\)$/);
    if (link)
      return (
        <a key={index} href={link[2]}>
          {link[1]}
        </a>
      );
    if (part.startsWith('`') && part.endsWith('`')) {
      return <code key={index}>{part.slice(1, -1)}</code>;
    }
    return part;
  });
}

export function renderDocumentation(source: string): ReactNode[] {
  const lines = source.replace(/\r\n/g, '\n').split('\n');
  const output: ReactNode[] = [];
  let index = 0;

  while (index < lines.length) {
    const line = lines[index]!;
    if (!line.trim()) {
      index += 1;
      continue;
    }
    if (line.startsWith('```')) {
      const language = line.slice(3);
      const code: string[] = [];
      index += 1;
      while (index < lines.length && !lines[index]!.startsWith('```')) {
        code.push(lines[index]!);
        index += 1;
      }
      output.push(
        <pre key={output.length} data-language={language}>
          <code>{code.join('\n')}</code>
        </pre>,
      );
      index += 1;
      continue;
    }
    const heading = line.match(/^(#{1,3})\s+(.+)$/);
    if (heading) {
      const content = inline(heading[2]!);
      const key = output.length;
      output.push(
        heading[1]!.length === 1 ? (
          <h1 key={key}>{content}</h1>
        ) : heading[1]!.length === 2 ? (
          <h2 key={key}>{content}</h2>
        ) : (
          <h3 key={key}>{content}</h3>
        ),
      );
      index += 1;
      continue;
    }
    if (line.startsWith('- ')) {
      const items: ReactNode[] = [];
      while (index < lines.length && lines[index]!.startsWith('- ')) {
        items.push(
          <li key={items.length}>{inline(lines[index]!.slice(2))}</li>,
        );
        index += 1;
      }
      output.push(<ul key={output.length}>{items}</ul>);
      continue;
    }
    const paragraph = [line];
    index += 1;
    while (
      index < lines.length &&
      lines[index]!.trim() &&
      !/^(#{1,3})\s|^- |^```/.test(lines[index]!)
    ) {
      paragraph.push(lines[index]!);
      index += 1;
    }
    output.push(<p key={output.length}>{inline(paragraph.join(' '))}</p>);
  }
  return output;
}

````