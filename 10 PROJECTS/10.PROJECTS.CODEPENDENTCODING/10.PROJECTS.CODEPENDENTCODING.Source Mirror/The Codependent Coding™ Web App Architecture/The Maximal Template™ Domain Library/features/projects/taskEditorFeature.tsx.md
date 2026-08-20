---
title: 'The Maximal Template™ Domain Library\features\projects\taskEditorFeature.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\features\projects\taskEditorFeature.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.features.projects.taskeditorfeature.tsx'
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
source_path: 'The Maximal Template™ Domain Library\features\projects\taskEditorFeature.tsx'
source_file: 'taskEditorFeature.tsx'
source_sha256: '77a61d25ecf98377467e428ff9cdce572d033200e293d0ec4cfa781d0c249850'
generated: true
---

# `taskEditorFeature.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\features\projects\taskEditorFeature.tsx`
> SHA-256: `77a61d25ecf98377467e428ff9cdce572d033200e293d0ec4cfa781d0c249850`

```tsx
"use client";

import { useState } from "react";
import { useForm } from "react-hook-form";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { createTask } from "@/lib/actions/projectsActions";

type TaskForm = { title: string; description: string; dueAt: string };

export function TaskEditorFeature({ projectId }: { projectId: string }) {
  const {
    register,
    handleSubmit,
    reset,
    formState: { isSubmitting },
  } = useForm<TaskForm>();
  const [error, setError] = useState<string | null>(null);
  const submit = handleSubmit(async (values) => {
    setError(null);
    try {
      await createTask({
        projectId,
        title: values.title,
        description: values.description || null,
        dueAt: values.dueAt || null,
      });
      reset();
    } catch (cause) {
      setError(
        cause instanceof Error ? cause.message : "Unable to create the task.",
      );
    }
  });
  return (
    <form
      onSubmit={(event) => void submit(event)}
      className="max-w-2xl space-y-4 border-3 border-foreground bg-card p-6"
    >
      <div className="space-y-2">
        <Label htmlFor="task-title">Title</Label>
        <Input id="task-title" {...register("title", { required: true })} />
      </div>
      <div className="space-y-2">
        <Label htmlFor="task-description">Description</Label>
        <Textarea id="task-description" {...register("description")} />
      </div>
      <div className="space-y-2">
        <Label htmlFor="task-due">Due date</Label>
        <Input id="task-due" type="date" {...register("dueAt")} />
      </div>
      {error ? (
        <p role="alert" className="text-sm font-bold text-destructive">
          {error}
        </p>
      ) : null}
      <Button type="submit" disabled={isSubmitting}>
        {isSubmitting ? "Saving…" : "Create task"}
      </Button>
    </form>
  );
}

```