# ReCharts

Category: Data Visualization
Type: Library
Edited: December 18, 2025 8:02 PM
Docs Link: • Recharts
• Chart.js
• react-chartjs-2
• TanStack Table
• Next.js Server Actions
Cover: https://images.unsplash.com/photo-1560221328-12fe60f83ab8?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&w=6000
Tags: Chart.js, Recharts, Tables

---

# Data Visualization (Recharts + Chart.js + Tables)

## Mental Models

- **Client-side interactivity only**: charts and tables are interactive UI components (`use client`) but receive **server-fetched data** via Server Actions.
- **Server-first data**: all calculations, aggregations, or filtering happen server-side; client only renders and optionally sorts/filter locally.
- **Deterministic rendering**: the same input data always produces the same chart or table.
- **Separation of concerns**: charts for visualization, tables for exploration. Do not mix heavy business logic in the client.
- **Hybrid tables**: server supplies raw data, client enhances sorting, filtering, and pagination.

---

## Canonical Workflow

### 1. Server Action for Fetching Data

```tsx
// app/(dashboard)/analytics/actions.ts
"use server"
import { db } from "@/lib/db"
import { auth } from "@clerk/nextjs/server"

export async function getProjectStats() {
  const { userId } = auth()
  if (!userId) throw new Error("Unauthorized")

  return db.project.findMany({
    where: { ownerId: userId },
    select: { id: true, name: true, createdAt: true, tasks: true },
  })
}

```

- Always scope by authenticated `userId`.
- Deterministic: input → same data output every request.

---

### 2. Recharts Example

```tsx
// components/charts/ProjectsBarChart.tsx
"use client"
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer } from "recharts"

export function ProjectsBarChart({ data }: { data: Array<{ name: string; tasks: number }> }) {
  return (
    <ResponsiveContainer width="100%" height={300}>
      <BarChart data={data}>
        <XAxis dataKey="name" />
        <YAxis />
        <Tooltip />
        <Bar dataKey="tasks" fill="#3182ce" />
      </BarChart>
    </ResponsiveContainer>
  )
}

```

- Only runs in **client components**.
- Data comes from **server actions**, not local state.

---

### 3. Chart.js Example

```tsx
// components/charts/ProjectsLineChart.tsx
"use client"
import { Line } from "react-chartjs-2"
import { Chart as ChartJS, CategoryScale, LinearScale, LineElement, PointElement, Tooltip, Legend } from "chart.js"

ChartJS.register(CategoryScale, LinearScale, LineElement, PointElement, Tooltip, Legend)

export function ProjectsLineChart({ data }: { data: { labels: string[]; datasets: any[] } }) {
  return <Line data={data} options={{ responsive: true, plugins: { legend: { position: "top" } } }} />
}

```

- Flexible for multiple datasets and time-series data.
- Data preparation happens server-side for determinism.

---

### 4. Server + Client Table (TanStack Table)

```tsx
// components/tables/ProjectTable.tsx
"use client"
import { useReactTable, getCoreRowModel } from "@tanstack/react-table"

export function ProjectTable({ data }: { data: Array<{ name: string; createdAt: Date }> }) {
  const table = useReactTable({
    data,
    columns: [
      { accessorKey: "name", header: "Project Name" },
      { accessorKey: "createdAt", header: "Created At" },
    ],
    getCoreRowModel: getCoreRowModel(),
  })

  return (
    <table>
      <thead>
        {table.getHeaderGroups().map(headerGroup => (
          <tr key={headerGroup.id}>
            {headerGroup.headers.map(header => (
              <th key={header.id}>{header.column.columnDef.header}</th>
            ))}
          </tr>
        ))}
      </thead>
      <tbody>
        {table.getRowModel().rows.map(row => (
          <tr key={row.id}>
            {row.getVisibleCells().map(cell => (
              <td key={cell.id}>{cell.getValue()}</td>
            ))}
          </tr>
        ))}
      </tbody>
    </table>
  )
}

```

- Server provides data; client handles sorting, filtering, pagination.
- Deterministic rendering ensures predictable table structure.

---

## Best Practices

- **Always fetch data server-side**; charts/tables are purely visual clients.
- **Scope data by authenticated user** to enforce ABAC.
- **Keep charts & tables modular**: don’t mix business logic inside client components.
- **Use responsive containers** for mobile support.
- **Prepare data in server actions** (aggregation, counts, formatting).
- **Prefer type-safe outputs** (TS interfaces inferred from Prisma).

---

## Docs & References

- [Recharts](https://recharts.org/en-US)
- [Chart.js](https://www.chartjs.org/docs/latest/)
- [react-chartjs-2](https://react-chartjs-2.js.org/)
- [TanStack Table](https://tanstack.com/table/v8)
- [Next.js Server Actions](https://nextjs.org/docs/app/building-your-application/data-fetching/server-actions)

---