---
title: 'The Hipster Stack™ Technology Stack\template\app\layout.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\template\app\layout.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.template.app.layout.tsx'
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
source_path: 'The Hipster Stack™ Technology Stack\template\app\layout.tsx'
source_file: 'layout.tsx'
source_sha256: 'f63a13a0fe60e52a6ac42635db5b24df9856f06c0231a1cc0a1062d2c52b6875'
generated: true
---

# `layout.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\template\app\layout.tsx`
> SHA-256: `f63a13a0fe60e52a6ac42635db5b24df9856f06c0231a1cc0a1062d2c52b6875`

```tsx
import type { Metadata, Viewport } from "next"
import { Archivo_Black, Bebas_Neue, JetBrains_Mono } from "next/font/google"
import type { ReactNode } from "react"

import { AppProviders } from "@/components/app/app-providers"
import { loadedVibesDesign } from "@/content/loadedvibes"
import { site } from "@/content/site"
import "./globals.css"

const archivoBlack = Archivo_Black({
  variable: "--font-brand",
  subsets: ["latin"],
  display: "swap",
  weight: "400",
})

const bebasNeue = Bebas_Neue({
  variable: "--font-display",
  subsets: ["latin"],
  display: "swap",
  weight: "400",
})

const jetBrainsMono = JetBrains_Mono({
  variable: "--font-mono",
  subsets: ["latin"],
  display: "swap",
  weight: ["400", "500", "600", "700", "800"],
})

const appUrl = process.env.NEXT_PUBLIC_APP_URL || "http://localhost:3000"

export const metadata: Metadata = {
  metadataBase: new URL(appUrl),
  applicationName: site.name,
  title: {
    default: site.name,
    template: `%s - ${site.name}`,
  },
  description: site.description,
  alternates: {
    canonical: "/",
  },
  robots: {
    index: true,
    follow: true,
  },
  icons: {
    icon: "/icon.svg",
  },
}

export const viewport: Viewport = {
  themeColor:
    loadedVibesDesign.theme === "paper"
      ? "#f7f5ef"
      : loadedVibesDesign.theme === "electric"
        ? "#10072b"
        : "#0a0a0a",
  colorScheme: loadedVibesDesign.mode === "system" ? "light dark" : loadedVibesDesign.mode,
  width: "device-width",
  initialScale: 1,
}

type RootLayoutProps = Readonly<{
  children: ReactNode
}>

export default function RootLayout({ children }: RootLayoutProps) {
  return (
    <html
      lang="en"
      className={`${archivoBlack.variable} ${bebasNeue.variable} ${jetBrainsMono.variable}`}
      data-theme={loadedVibesDesign.theme}
      data-mode={loadedVibesDesign.mode}
      data-radius={loadedVibesDesign.radius}
      data-density={loadedVibesDesign.density}
      suppressHydrationWarning
    >
      <body className="min-h-dvh overflow-x-hidden bg-background">
        <AppProviders>{children}</AppProviders>
      </body>
    </html>
  )
}

```