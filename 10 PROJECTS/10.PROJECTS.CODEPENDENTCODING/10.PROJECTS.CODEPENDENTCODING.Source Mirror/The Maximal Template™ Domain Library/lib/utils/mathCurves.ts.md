---
title: 'The Maximal Template™ Domain Library\lib\utils\mathCurves.ts'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\lib\utils\mathCurves.ts'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.lib.utils.mathcurves.ts'
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
source_path: 'The Maximal Template™ Domain Library\lib\utils\mathCurves.ts'
source_file: 'mathCurves.ts'
source_sha256: '0b9918081032568acf29b390e3bfc490e133f7a8a4e98a315dc567bc56120cc7'
generated: true
---

# `mathCurves.ts`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\lib\utils\mathCurves.ts`
> SHA-256: `0b9918081032568acf29b390e3bfc490e133f7a8a4e98a315dc567bc56120cc7`

```ts
export type LoaderCurveKey = "rose" | "spiral" | "lissajous";
export type ProgressCurveKey = LoaderCurveKey;
export type BackgroundCurveKey = LoaderCurveKey;

type Point = { x: number; y: number };

export function getPoint(
  curve: LoaderCurveKey,
  progress: number,
  detailScale = 1,
): Point {
  const t = Math.min(1, Math.max(0, progress)) * Math.PI * 2;

  if (curve === "spiral") {
    const radius = 7 + 32 * (t / (Math.PI * 2));
    return {
      x: 50 + radius * Math.cos(t * 2),
      y: 50 + radius * Math.sin(t * 2),
    };
  }

  if (curve === "lissajous") {
    return {
      x: 50 + 38 * Math.sin(3 * t),
      y: 50 + 38 * Math.sin(2 * t + Math.PI / 2),
    };
  }

  const radius = 34 * Math.cos(4 * t) * detailScale;
  return { x: 50 + radius * Math.cos(t), y: 50 + radius * Math.sin(t) };
}

export function getAngle(
  curve: LoaderCurveKey,
  progress: number,
  detailScale = 1,
): number {
  const current = getPoint(curve, progress, detailScale);
  const next = getPoint(curve, Math.min(progress + 0.002, 1), detailScale);
  return (Math.atan2(next.y - current.y, next.x - current.x) * 180) / Math.PI;
}

export function buildPath(curve: LoaderCurveKey, detailScale = 1): string {
  return Array.from({ length: 121 }, (_, index) => {
    const point = getPoint(curve, index / 120, detailScale);
    return `${index === 0 ? "M" : "L"} ${point.x.toFixed(2)} ${point.y.toFixed(2)}`;
  }).join(" ");
}

export function getDetailScale(now: number, duration: number): number {
  return 0.94 + 0.06 * (1 + Math.sin((now / duration) * Math.PI * 2));
}

export function getCurvePulseDuration(curve: LoaderCurveKey): number {
  return curve === "spiral" ? 2400 : curve === "lissajous" ? 3200 : 2800;
}

```