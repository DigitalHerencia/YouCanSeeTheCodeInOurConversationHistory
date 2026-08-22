---
title: 'The Maximal Template™ Domain Library\lib\utils\chartExport.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\utils\chartExport.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.utils.chartexport.ts'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-maximal-template-domain-library
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Maximal Template™ Domain Library\lib\utils\chartExport.ts'
source_file: 'chartExport.ts'
source_sha256: '349f10c422e9bd529738eb86c6fd66e91e98cf9390b314ee7c0824c81420a3e6'
generated: true
---

# `chartExport.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\utils\chartExport.ts`
> SHA-256: `349f10c422e9bd529738eb86c6fd66e91e98cf9390b314ee7c0824c81420a3e6`

```ts
function downloadBlob(blob: Blob, filename: string): void {
  const url = URL.createObjectURL(blob);
  const anchor = document.createElement("a");
  anchor.href = url;
  anchor.download = filename;
  anchor.click();
  URL.revokeObjectURL(url);
}

function csvCell(value: unknown): string {
  const text = value == null ? "" : String(value);
  return `"${text.replaceAll('"', '""')}"`;
}

export function downloadCSV(
  rows: Array<Record<string, unknown>>,
  filename: string,
): void {
  const columns = [...new Set(rows.flatMap((row) => Object.keys(row)))];
  const lines = [
    columns.map(csvCell).join(","),
    ...rows.map((row) => columns.map((key) => csvCell(row[key])).join(",")),
  ];
  downloadBlob(new Blob([lines.join("\n")], { type: "text/csv" }), filename);
}

function findSvg(container: HTMLElement): SVGSVGElement {
  const svg = container.querySelector("svg");
  if (!svg) throw new Error("No SVG chart was found in the export container.");
  return svg;
}

export function exportSVG(container: HTMLElement, filename: string): void {
  const markup = new XMLSerializer().serializeToString(findSvg(container));
  downloadBlob(new Blob([markup], { type: "image/svg+xml" }), filename);
}

export async function exportPNG(
  container: HTMLElement,
  filename: string,
): Promise<void> {
  const svg = findSvg(container);
  const markup = new XMLSerializer().serializeToString(svg);
  const source = URL.createObjectURL(
    new Blob([markup], { type: "image/svg+xml" }),
  );

  try {
    const image = new Image();
    image.src = source;
    await image.decode();
    const canvas = document.createElement("canvas");
    canvas.width = Math.max(svg.clientWidth, 1);
    canvas.height = Math.max(svg.clientHeight, 1);
    const context = canvas.getContext("2d");
    if (!context) throw new Error("Canvas export is unavailable.");
    context.drawImage(image, 0, 0, canvas.width, canvas.height);
    const blob = await new Promise<Blob>((resolve, reject) =>
      canvas.toBlob(
        (value) =>
          value ? resolve(value) : reject(new Error("PNG export failed.")),
        "image/png",
      ),
    );
    downloadBlob(blob, filename);
  } finally {
    URL.revokeObjectURL(source);
  }
}

export function toggleFullscreen(container: HTMLElement): void {
  if (document.fullscreenElement) {
    void document.exitFullscreen();
    return;
  }

  void container.requestFullscreen();
}

```