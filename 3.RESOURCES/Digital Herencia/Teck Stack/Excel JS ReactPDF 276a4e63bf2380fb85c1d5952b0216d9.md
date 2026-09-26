# Excel JS/ReactPDF

Category: File Handling
Type: Utility
Edited: December 18, 2025 8:05 PM
Docs Link: • pdf-lib
• @react-pdf/renderer
• ExcelJS
• Vercel Blob
Cover: https://images.unsplash.com/photo-1690585703267-de31ea667ef0?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&w=6000
Tags: Blob, ExcelJS, React-PDF

---

## Mental Models

- **Server-first processing**: all file creation, parsing, or transformation occurs server-side in **Server Actions**.
- **Client handles UI only**: uploading, previewing, and triggering downloads happen in client components.
- **Deterministic outputs**: same input → same output (PDF content, Excel sheets).
- **Security**: never trust client file paths; always generate signed URLs or temporary storage links.
- **Separation of concerns**:
    - **PDF/Excel generation** → server
    - **File uploads/downloads** → server-managed storage (Vercel Blob, S3, Upstash)

---

## Canonical Workflow

### 1. PDF Generation (React-PDF)

```tsx
// app/(dashboard)/reports/actions.ts
"use server"
import { PDFDocument, StandardFonts, rgb } from "pdf-lib"

export async function generateReportPDF(data: { title: string; content: string }) {
  const pdfDoc = await PDFDocument.create()
  const page = pdfDoc.addPage()
  const font = await pdfDoc.embedFont(StandardFonts.Helvetica)

  page.drawText(data.title, { x: 50, y: 750, font, size: 20, color: rgb(0, 0, 0) })
  page.drawText(data.content, { x: 50, y: 700, font, size: 12 })

  const pdfBytes = await pdfDoc.save()
  return pdfBytes
}

```

- Deterministic: same data always generates the same PDF.
- Entire process server-side ensures security.

---

### 2. Excel Generation (ExcelJS)

```tsx
// app/(dashboard)/reports/actions.ts
"use server"
import ExcelJS from "exceljs"

export async function generateProjectExcel(projects: Array<{ name: string; createdAt: Date }>) {
  const workbook = new ExcelJS.Workbook()
  const sheet = workbook.addWorksheet("Projects")

  sheet.columns = [
    { header: "Project Name", key: "name" },
    { header: "Created At", key: "createdAt" },
  ]

  projects.forEach(project => sheet.addRow({ name: project.name, createdAt: project.createdAt }))

  const buffer = await workbook.xlsx.writeBuffer()
  return buffer
}

```

- Type-safe rows → predictable Excel output.
- Processing entirely server-side ensures data privacy.

---

### 3. Blob Storage (Vercel)

```tsx
// lib/blob.ts
import { BlobServiceClient } from "@vercel/blob"

export const blob = new BlobServiceClient({ token: process.env.VERCEL_BLOB_TOKEN! })

export async function uploadFile(fileName: string, data: ArrayBuffer) {
  const container = await blob.getContainer("uploads")
  return container.putObject(fileName, data)
}

export async function getFileURL(fileName: string) {
  const container = await blob.getContainer("uploads")
  return container.getObjectURL(fileName)
}

```

- Server manages uploads/downloads.
- Signed URLs for temporary client access.
- Deterministic mapping: file name + folder structure consistent.

---

### 4. Client Upload & Preview

```tsx
// components/forms/FileUpload.tsx
"use client"
import { useState } from "react"

export function FileUpload({ onUpload }: { onUpload: (file: File) => void }) {
  const [file, setFile] = useState<File | null>(null)

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const selected = e.target.files?.[0]
    if (selected) {
      setFile(selected)
      onUpload(selected)
    }
  }

  return <input type="file" onChange={handleChange} />
}

```

- Client-only component for selecting files.
- All processing and storage handled via server actions.

---

## Best Practices

- **Server-first processing**: always generate and transform files server-side.
- **Use signed URLs**: never expose direct storage paths.
- **Keep deterministic outputs**: PDFs, Excel sheets should produce the same result for same input.
- **Type-safe transformations**: enforce TS types on input data for Excel/PDF.
- **Use ephemeral storage** if possible to minimize persistence of sensitive data.

---

## Docs & References

- [pdf-lib](https://pdf-lib.js.org/)
- [@react-pdf/renderer](https://react-pdf.org/)
- [ExcelJS](https://www.npmjs.com/package/exceljs)
- [Vercel Blob](https://vercel.com/docs/storage/blob)

---