---
title: 'The Maximal Template™ Domain Library\components\ui\date-picker.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Maximal Template™ Domain Library\components\ui\date-picker.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-maximal-template-domain-library.components.ui.date-picker.tsx'
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
source_path: 'The Maximal Template™ Domain Library\components\ui\date-picker.tsx'
source_file: 'date-picker.tsx'
source_sha256: 'feec945e40fa6642465dca5673fa1747f4487bf1ac4ea48c5c16e14b36eab1ef'
generated: true
---

# `date-picker.tsx`

> [!info] Generated source mirror
> Original path: `The Maximal Template™ Domain Library\components\ui\date-picker.tsx`
> SHA-256: `feec945e40fa6642465dca5673fa1747f4487bf1ac4ea48c5c16e14b36eab1ef`

```tsx
"use client";

import * as React from "react";
import { format } from "date-fns";
import { CalendarIcon } from "lucide-react";
import { cn } from "@/lib/utils";
import { Button } from "@/components/ui/button";
import { Calendar } from "@/components/ui/calendar";
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover";

export interface DatePickerProps {
  value?: Date;
  onChange?: (date: Date | undefined) => void;
  placeholder?: string;
  /** date-fns format string for the trigger label. */
  dateFormat?: string;
  disabled?: boolean;
  className?: string;
}

/** A single-date picker: a button trigger that opens a calendar in a popover. */
export function DatePicker({
  value,
  onChange,
  placeholder = "Pick a date",
  dateFormat = "LLL dd, y",
  disabled,
  className,
}: DatePickerProps) {
  const [open, setOpen] = React.useState(false);
  const isControlled = value !== undefined;
  const [uncontrolled, setUncontrolled] = React.useState<Date | undefined>(
    value,
  );

  const selected = isControlled ? value : uncontrolled;

  const handleSelect = (date: Date | undefined) => {
    if (!isControlled) setUncontrolled(date);
    onChange?.(date);
    setOpen(false);
  };

  return (
    <Popover open={open} onOpenChange={setOpen}>
      <PopoverTrigger asChild>
        <Button
          variant="outline"
          disabled={disabled}
          className={cn(
            "w-[260px] justify-start gap-2 font-bold normal-case",
            !selected && "text-muted-foreground",
            className,
          )}
        >
          <CalendarIcon className="h-4 w-4" />
          {selected ? format(selected, dateFormat) : placeholder}
        </Button>
      </PopoverTrigger>
      <PopoverContent className="w-auto p-0" align="start">
        <Calendar
          mode="single"
          selected={selected}
          onSelect={handleSelect}
          autoFocus
        />
      </PopoverContent>
    </Popover>
  );
}

```