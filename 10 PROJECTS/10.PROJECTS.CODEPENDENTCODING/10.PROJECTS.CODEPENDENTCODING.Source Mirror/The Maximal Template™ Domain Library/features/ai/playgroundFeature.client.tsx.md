---
title: 'The Maximal Template™ Domain Library\features\ai\playgroundFeature.client.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\ai\playgroundFeature.client.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.ai.playgroundfeature.client.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\ai\playgroundFeature.client.tsx'
source_file: 'playgroundFeature.client.tsx'
source_sha256: '96ebfc1dca4832238e8de9cfc1ce1ab55910e2717dd743820838c967ebe1f633'
generated: true
---

# `playgroundFeature.client.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\ai\playgroundFeature.client.tsx`
> SHA-256: `96ebfc1dca4832238e8de9cfc1ce1ab55910e2717dd743820838c967ebe1f633`

```tsx
"use client";

import { useState } from "react";
import { useForm } from "react-hook-form";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Textarea } from "@/components/ui/textarea";

export function PlaygroundFeatureClient({
  configured,
  model,
}: {
  configured: boolean;
  model: string;
}) {
  const [output, setOutput] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const {
    register,
    handleSubmit,
    formState: { isSubmitting },
  } = useForm<{ prompt: string }>();
  const submit = handleSubmit(async ({ prompt }) => {
    setError(null);
    setOutput(null);
    try {
      const response = await fetch("/api/ai/generate", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ prompt }),
      });
      const body = (await response.json()) as { text?: string; error?: string };
      if (!response.ok || !body.text)
        throw new Error(body.error ?? "Generation failed.");
      setOutput(body.text);
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Generation failed.");
    }
  });
  return (
    <div className="grid gap-6 lg:grid-cols-2">
      <Card>
        <CardHeader>
          <CardTitle>Prompt · {model}</CardTitle>
        </CardHeader>
        <CardContent>
          <form className="space-y-4" onSubmit={(event) => void submit(event)}>
            <Textarea
              rows={12}
              aria-label="Prompt"
              placeholder="Describe the output you need…"
              {...register("prompt", { required: true })}
            />
            {!configured ? (
              <p role="status" className="text-sm text-warning">
                The AI provider is not configured for this environment.
              </p>
            ) : null}
            {error ? (
              <p role="alert" className="text-sm text-destructive">
                {error}
              </p>
            ) : null}
            <Button type="submit" disabled={!configured || isSubmitting}>
              {isSubmitting ? "Generating…" : "Generate"}
            </Button>
          </form>
        </CardContent>
      </Card>
      <Card>
        <CardHeader>
          <CardTitle>Output</CardTitle>
        </CardHeader>
        <CardContent>
          <div aria-live="polite" className="min-h-48 whitespace-pre-wrap">
            {output ?? "The generated response will appear here."}
          </div>
        </CardContent>
      </Card>
    </div>
  );
}

```