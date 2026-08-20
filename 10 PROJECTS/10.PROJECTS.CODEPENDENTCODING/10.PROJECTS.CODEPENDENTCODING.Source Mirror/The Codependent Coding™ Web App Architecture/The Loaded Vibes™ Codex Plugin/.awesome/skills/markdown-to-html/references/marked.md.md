---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\markdown-to-html\references\marked.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\markdown-to-html\references\marked.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.markdown-to-html.references.marked.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\markdown-to-html\references\marked.md'
source_file: 'marked.md'
source_sha256: '751ff133116f6e6c5bbe97ea2e68bf338b2cc6d7be66b21a157352ff316b38b4'
generated: true
---

# `marked.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\markdown-to-html\references\marked.md`
> SHA-256: `751ff133116f6e6c5bbe97ea2e68bf338b2cc6d7be66b21a157352ff316b38b4`

````markdown
# Marked

## Quick Conversion Methods

Expanded portions of `SKILL.md` at `### Quick Conversion Methods`.

### Method 1: CLI (Recommended for Single Files)

```bash
# Convert file to HTML
marked -i input.md -o output.html

# Convert string directly
marked -s "# Hello World"

# Output: <h1>Hello World</h1>
```

### Method 2: Node.js Script

```javascript
import { marked } from 'marked';
import { readFileSync, writeFileSync } from 'fs';

const markdown = readFileSync('input.md', 'utf-8');
const html = marked.parse(markdown);
writeFileSync('output.html', html);
```

### Method 3: Browser Usage

```html
<script src="https://cdn.jsdelivr.net/npm/marked/lib/marked.umd.js"></script>
<script>
  const html = marked.parse('# Markdown Content');
  document.getElementById('output').innerHTML = html;
</script>
```

---

## Step-by-Step Workflows

Expanded portions of `SKILL.md` at `### Step-by-Step Workflows`.

### Workflow 1: Single File Conversion

1. Ensure marked is installed: `npm install -g marked`
2. Run conversion: `marked -i README.md -o README.html`
3. Verify output file was created

### Workflow 2: Batch Conversion (Multiple Files)

Create a script `convert-all.js`:

```javascript
import { marked } from 'marked';
import { readFileSync, writeFileSync, readdirSync } from 'fs';
import { join, basename } from 'path';

const inputDir = './docs';
const outputDir = './html';

readdirSync(inputDir)
  .filter(file => file.endsWith('.md'))
  .forEach(file => {
    const markdown = readFileSync(join(inputDir, file), 'utf-8');
    const html = marked.parse(markdown);
    const outputFile = basename(file, '.md') + '.html';
    writeFileSync(join(outputDir, outputFile), html);
    console.log(`Converted: ${file} → ${outputFile}`);
  });
```

Run with: `node convert-all.js`

### Workflow 3: Conversion with Custom Options

```javascript
import { marked } from 'marked';

// Configure options
marked.setOptions({
  gfm: true,           // GitHub Flavored Markdown
  breaks: true,        // Convert \n to <br>
  pedantic: false,     // Don't conform to original markdown.pl
});

const html = marked.parse(markdownContent);
```

### Workflow 4: Complete HTML Document

Wrap converted content in a full HTML template:

```javascript
import { marked } from 'marked';
import { readFileSync, writeFileSync } from 'fs';

const markdown = readFileSync('input.md', 'utf-8');
const content = marked.parse(markdown);

const html = `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
    body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; max-width: 800px; margin: 0 auto; padding: 2rem; }
    pre { background: #f4f4f4; padding: 1rem; overflow-x: auto; }
    code { background: #f4f4f4; padding: 0.2rem 0.4rem; border-radius: 3px; }
  </style>
</head>
<body>
${content}
</body>
</html>`;

writeFileSync('output.html', html);
```

````