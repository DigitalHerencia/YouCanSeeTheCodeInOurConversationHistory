# Date FNS

Category: Date / Time
Type: Library
Edited: December 18, 2025 8:09 PM
Docs Link: • date-fns
• date-fns-tz
• react-datepicker
Cover: https://images.unsplash.com/photo-1516101922849-2bf0be616449?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&w=6000
Tags: date-fns, react-datepicker

## Mental Models

- **Server is source of truth**: all timestamps stored in UTC in the database.
- **Client adapts to user context**: localize UTC timestamps on render based on user’s timezone.
- **Deterministic formatting**: always use `date-fns` utilities, never ad hoc string manipulation.
- **Forms need controlled inputs**: date/time pickers are client components but must validate against UTC-normalized values before persisting.
- **Timezones are explicit**: user timezone stored in profile/session if needed for scheduling features.

---

## Canonical Workflow

### 1. Store & Retrieve Dates in UTC

```tsx
// lib/date.ts
import { formatISO, parseISO } from "date-fns"

export function toUTC(date: Date) {
  return formatISO(date, { representation: "complete" })
}

export function fromUTC(iso: string) {
  return parseISO(iso) // returns Date in UTC
}

```

- Always store **ISO 8601 strings** in DB.
- Deterministic parse/format avoids locale drift.

---

### 2. Format for Display

```tsx
import { format } from "date-fns"

const date = new Date("2025-09-22T12:00:00Z")

// User-friendly
format(date, "PPpp") // → "Sep 22, 2025 at 12:00 PM"

```

- Presentation format handled by `date-fns`.
- Use consistent format tokens for deterministic UX.

---

### 3. Date Picker Form Integration

```tsx
// components/forms/DatePickerForm.tsx
"use client"
import { useForm } from "react-hook-form"
import DatePicker from "react-datepicker"
import "react-datepicker/dist/react-datepicker.css"
import { toUTC } from "@/lib/date"

export function DatePickerForm() {
  const { register, setValue, handleSubmit } = useForm<{ start: string }>()

  const onSubmit = (data: { start: string }) => {
    console.log("UTC value to save:", data.start)
  }

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <DatePicker
        selected={new Date()}
        onChange={(date) => setValue("start", toUTC(date!))}
      />
      <button type="submit">Save</button>
    </form>
  )
}

```

- Client-only form, but values normalized to UTC before submission.
- Ensures deterministic server-side validation.

---

### 4. Timezone Handling

- **Default**: convert UTC → local using `date.toLocaleString()` or `date-fns-tz`.
- **User Preference**: store `timezone` in user profile (e.g. `"America/Los_Angeles"`).
- **Convert with date-fns-tz**:

```tsx
import { utcToZonedTime, format } from "date-fns-tz"

const utcDate = new Date("2025-09-22T12:00:00Z")
const timeZone = "America/Los_Angeles"
const zonedDate = utcToZonedTime(utcDate, timeZone)

format(zonedDate, "yyyy-MM-dd HH:mmXXX", { timeZone })
// → "2025-09-22 05:00-07:00"

```

- Deterministic conversion ensures correctness across users.

---

## Best Practices

- Store all timestamps in **UTC**.
- Convert to **zoned time** for display or scheduling.
- Use `date-fns` or `date-fns-tz` exclusively for determinism.
- Keep **user timezone preference** explicit in DB/session if needed.
- Normalize all form submissions to UTC before saving.

---

## Docs & References

- [date-fns](https://date-fns.org/)
- [date-fns-tz](https://github.com/marnusw/date-fns-tz)
- [react-datepicker](https://reactdatepicker.com/)

---