---
title: "codebase-context-2026-05-22"
type: reference
scope: vault
project:
domain: inbox
artifact: codebase.context.2026.05.22
kind: source-note
namespace: inbox.source.codebase.context.2026.05.22
status: review
authority: archive
parent: "[[devnotes.zettelkasten.map]]"
depends_on: []
supersedes: []
tags:
  - inbox
  - imports/source-note
  - status/review
created: 2026-05-27
updated: 2026-05-27
source_file: "00 ZETTELKASTEN/INBOX/codebase-context-2026-05-22.md"
source_hash: "609CC942E4A941556528A17949C8174D3CE67A56B2028E0B167FE2FF3A5634F6"
---
# codebase-context-2026-05-22

# Codebase Context

## Executive Summary

- **Total Files:** 187
- **Languages:** tsx, typescript, plaintext, css, javascript, json, markdown
- **Generated:** 5/22/2026, 1:15:30 PM

### File Types

- **tsx:** 96 files
- **ts:** 72 files
- **json:** 4 files
- **mjs:** 3 files
- **md:** 3 files
- **woff2:** 2 files
- **ico:** 1 files
- **css:** 1 files
- **png:** 1 files
- **gitignore:** 1 files
- **hintrc:** 1 files
- **prettierignore:** 1 files
- **js:** 1 files

### Directory Structure

- **court-jester-main:** 187 files

## Architecture Overview

# Architecture Overview

## court-jester-main/app/admin/dashboard/cases/[id]

- court-jester-main/app/admin/dashboard/cases/[id]/page.tsx
  - Imports: next/navigation, react, @/components/ui/button, @/components/ui/card, @/components/ui/tabs, @/components/ui/badge, next/link, lucide-react

## court-jester-main/app/admin/dashboard/cases

- court-jester-main/app/admin/dashboard/cases/page.tsx
  - Imports: react, @/components/ui/button, next/link, sonner

## court-jester-main/app/admin/dashboard/motions/[id]

- court-jester-main/app/admin/dashboard/motions/[id]/page.tsx
  - Imports: next/navigation, react, @/components/ui/button, @/components/ui/card, @/components/ui/badge, sonner, next/link, lucide-react

## court-jester-main/app/admin/dashboard/motions

- court-jester-main/app/admin/dashboard/motions/page.tsx
  - Imports: react, @/components/ui/button, @/components/ui/input, next/link, sonner

## court-jester-main/app/admin/dashboard/notifications

- court-jester-main/app/admin/dashboard/notifications/page.tsx
  - Imports: react, @/components/ui/button, sonner

## court-jester-main/app/admin/dashboard/offenders/[id]

- court-jester-main/app/admin/dashboard/offenders/[id]/page.tsx
  - Imports: next/navigation, react, @/components/ui/button, @/components/ui/card, next/link, next/image

## court-jester-main/app/admin/dashboard/offenders

- court-jester-main/app/admin/dashboard/offenders/page.tsx
  - Imports: react, @/components/ui/button, next/link, sonner

## court-jester-main/app/admin/dashboard/settings

- court-jester-main/app/admin/dashboard/settings/page.tsx
  - Imports: react, @/components/ui/button, @/components/ui/input, @/components/ui/switch, sonner

## court-jester-main/app/admin/dashboard/tools/case-upload

- court-jester-main/app/admin/dashboard/tools/case-upload/page.tsx
  - Imports: react, @/components/ui/button, @/components/ui/card, @/components/ui/input, @/components/ui/label, @/components/ui/tabs, @/components/ui/alert, @/components/ui/progress, lucide-react, sonner, @/components/ui/select, @/lib/case-parser

## court-jester-main/app/admin/dashboard/tools/database-reset

- court-jester-main/app/admin/dashboard/tools/database-reset/page.tsx
  - Imports: react, @/components/ui/button, @/components/ui/card, @/components/ui/input, sonner, @/components/ui/badge

## court-jester-main/app/admin/dashboard/tools/help

- court-jester-main/app/admin/dashboard/tools/help/page.tsx
  - Imports: @/components/ui/card, @/components/ui/tabs, @/components/ui/accordion, lucide-react

## court-jester-main/app/admin/dashboard/tools/motions-editor

- court-jester-main/app/admin/dashboard/tools/motions-editor/page.tsx
  - Imports: react, @/components/ui/button, @/components/ui/card, @/components/ui/input, @/components/ui/label, @/components/ui/textarea, @/components/ui/select, @/components/ui/dialog, lucide-react, sonner

## court-jester-main/app/admin/dashboard/tools/mugshot-upload

- court-jester-main/app/admin/dashboard/tools/mugshot-upload/page.tsx
  - Imports: react, next/navigation, @/components/ui/button, @/components/ui/card, sonner, next/image

## court-jester-main/app/admin/dashboard/tools/offender-profile

- court-jester-main/app/admin/dashboard/tools/offender-profile/page.tsx
  - Imports: react, next/navigation, @/components/ui/button, @/components/ui/card, @/components/ui/input, @/components/ui/label, @/components/ui/tabs, @/components/ui/separator, sonner, @/components/ui/select

## court-jester-main/app/admin/dashboard/tools

- court-jester-main/app/admin/dashboard/tools/loading.tsx
  - Imports: @/components/ui/skeleton
- court-jester-main/app/admin/dashboard/tools/page.tsx
  - Imports: @/components/ui/card, next/link, lucide-react

## court-jester-main/app/admin/dashboard

- court-jester-main/app/admin/dashboard/layout.tsx
  - Imports: react, next/headers, next/navigation, @/lib/auth, @/components/shared/dashboard-header, @/components/shared/dashboard-tabs
- court-jester-main/app/admin/dashboard/loading.tsx
  - Imports: react
- court-jester-main/app/admin/dashboard/page.tsx
  - Imports: next/navigation

## court-jester-main/app/api/admin/cases/search

- court-jester-main/app/api/admin/cases/search/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/admin/cases/upload

- court-jester-main/app/api/admin/cases/upload/route.ts
  - Imports: next/server, @/lib/auth, @/lib/db/db, @/lib/case-parser

## court-jester-main/app/api/admin/cases/[id]

- court-jester-main/app/api/admin/cases/[id]/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/admin/cases

- court-jester-main/app/api/admin/cases/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/admin/config

- court-jester-main/app/api/admin/config/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/admin/database/connection

- court-jester-main/app/api/admin/database/connection/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/admin/database/migrate

- court-jester-main/app/api/admin/database/migrate/route.ts
  - Imports: next/server, @/lib/db/db

## court-jester-main/app/api/admin/database/reset

- court-jester-main/app/api/admin/database/reset/route.ts
  - Imports: next/server, @/lib/auth, @/lib/db/db, @/lib/db/db-schema

## court-jester-main/app/api/admin/database/tables

- court-jester-main/app/api/admin/database/tables/route.ts
  - Imports: next/server, @/lib/auth, @/lib/db/db

## court-jester-main/app/api/admin/motions/[id]/generate-pdf

- court-jester-main/app/api/admin/motions/[id]/generate-pdf/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth, @/lib/pdf-generator, @vercel/blob

## court-jester-main/app/api/admin/motions/[id]

- court-jester-main/app/api/admin/motions/[id]/route.ts
  - Imports: next/server, @/lib/auth, @/lib/db/db

## court-jester-main/app/api/admin/motions

- court-jester-main/app/api/admin/motions/route.ts
  - Imports: next/server, @/lib/auth, @/lib/db/db

## court-jester-main/app/api/admin/notifications/mark-all-read

- court-jester-main/app/api/admin/notifications/mark-all-read/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/admin/notifications/[id]/read

- court-jester-main/app/api/admin/notifications/[id]/read/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/admin/notifications

- court-jester-main/app/api/admin/notifications/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/admin/offenders/search

- court-jester-main/app/api/admin/offenders/search/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/admin/offenders/[id]/mugshot

- court-jester-main/app/api/admin/offenders/[id]/mugshot/route.ts
  - Imports: next/server, @vercel/blob, @/lib/auth, @/lib/db/db

## court-jester-main/app/api/admin/offenders/[id]

- court-jester-main/app/api/admin/offenders/[id]/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/admin/offenders

- court-jester-main/app/api/admin/offenders/route.ts
  - Imports: next/server, @/lib/auth, @/lib/db/db

## court-jester-main/app/api/admin/settings/email/test

- court-jester-main/app/api/admin/settings/email/test/route.ts
  - Imports: next/server, @/lib/auth

## court-jester-main/app/api/admin/settings/email

- court-jester-main/app/api/admin/settings/email/route.ts
  - Imports: next/server, @/lib/auth, @/lib/db/db

## court-jester-main/app/api/admin/settings/system

- court-jester-main/app/api/admin/settings/system/route.ts
  - Imports: next/server, @/lib/auth

## court-jester-main/app/api/auth/confirm

- court-jester-main/app/api/auth/confirm/route.ts
  - Imports: next/server, @/lib/auth, @/lib/db/db

## court-jester-main/app/api/auth/login

- court-jester-main/app/api/auth/login/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth, next/headers

## court-jester-main/app/api/auth/logout

- court-jester-main/app/api/auth/logout/route.ts
  - Imports: next/server, next/headers, @/lib/auth, @/lib/db/db

## court-jester-main/app/api/notifications/check-court-dates

- court-jester-main/app/api/notifications/check-court-dates/route.ts
  - Imports: next/server, @/lib/db/db

## court-jester-main/app/api/offenders/me

- court-jester-main/app/api/offenders/me/route.ts
  - Imports: next/headers, @/lib/auth, next/server

## court-jester-main/app/api/offenders/[id]/cases/[caseId]/charges

- court-jester-main/app/api/offenders/[id]/cases/[caseId]/charges/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/offenders/[id]/cases/[caseId]

- court-jester-main/app/api/offenders/[id]/cases/[caseId]/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/offenders/[id]/cases

- court-jester-main/app/api/offenders/[id]/cases/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/offenders/[id]/court-dates

- court-jester-main/app/api/offenders/[id]/court-dates/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/offenders/[id]/delete-account

- court-jester-main/app/api/offenders/[id]/delete-account/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/offenders/[id]/hearings/notifications

- court-jester-main/app/api/offenders/[id]/hearings/notifications/route.ts
  - Imports: next/server, @/lib/db/db

## court-jester-main/app/api/offenders/[id]/hearings

- court-jester-main/app/api/offenders/[id]/hearings/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/offenders/[id]/motions/notifications

- court-jester-main/app/api/offenders/[id]/motions/notifications/route.ts
  - Imports: next/server, @/lib/db/db

## court-jester-main/app/api/offenders/[id]/motions/templates/[templateId]

- court-jester-main/app/api/offenders/[id]/motions/templates/[templateId]/route.ts
  - Imports: next/server, @/lib/auth, @/lib/db/db

## court-jester-main/app/api/offenders/[id]/motions/templates

- court-jester-main/app/api/offenders/[id]/motions/templates/route.ts
  - Imports: next/server, @/lib/auth, @/lib/db/db

## court-jester-main/app/api/offenders/[id]/motions/[motionId]/download-pdf

- court-jester-main/app/api/offenders/[id]/motions/[motionId]/download-pdf/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/offenders/[id]/motions/[motionId]

- court-jester-main/app/api/offenders/[id]/motions/[motionId]/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/offenders/[id]/motions

- court-jester-main/app/api/offenders/[id]/motions/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/offenders/[id]/mugshot

- court-jester-main/app/api/offenders/[id]/mugshot/route.ts
  - Imports: next/server, @/lib/auth, @/lib/db/db

## court-jester-main/app/api/offenders/[id]/notifications/preferences

- court-jester-main/app/api/offenders/[id]/notifications/preferences/route.ts
  - Imports: next/server, @/lib/db/db

## court-jester-main/app/api/offenders/[id]/notifications/unread-count

- court-jester-main/app/api/offenders/[id]/notifications/unread-count/route.ts
  - Imports: next/server, @/lib/auth, @/lib/db/db

## court-jester-main/app/api/offenders/[id]/notifications/[notificationId]/read

- court-jester-main/app/api/offenders/[id]/notifications/[notificationId]/read/route.ts
  - Imports: next/server, @/lib/auth, @/lib/db/db

## court-jester-main/app/api/offenders/[id]/notifications

- court-jester-main/app/api/offenders/[id]/notifications/route.ts
  - Imports: next/server, @/lib/auth, @/lib/db/db

## court-jester-main/app/api/offenders/[id]/profile

- court-jester-main/app/api/offenders/[id]/profile/route.ts
  - Imports: next/server, @/lib/auth, @/lib/db/db

## court-jester-main/app/api/offenders/[id]/request-update

- court-jester-main/app/api/offenders/[id]/request-update/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/api/offenders/[id]/settings

- court-jester-main/app/api/offenders/[id]/settings/route.ts
  - Imports: next/server, @/lib/db/db, @/lib/auth

## court-jester-main/app/confirmation

- court-jester-main/app/confirmation/page.tsx
  - Imports: react, next/navigation, @/components/ui/button, @/components/ui/card, next/image

## court-jester-main/app/offender/dashboard/[id]/cases/[caseId]

- court-jester-main/app/offender/dashboard/[id]/cases/[caseId]/loading.tsx
  - Imports: @/components/ui/card, @/components/ui/skeleton
- court-jester-main/app/offender/dashboard/[id]/cases/[caseId]/page.tsx
  - Imports: next/navigation, react, @/components/ui/badge, @/components/ui/card, @/components/ui/tabs, lucide-react, next/link

## court-jester-main/app/offender/dashboard/[id]/cases

- court-jester-main/app/offender/dashboard/[id]/cases/loading.tsx
  - Imports: @/components/ui/card, @/components/ui/skeleton
- court-jester-main/app/offender/dashboard/[id]/cases/page.tsx
  - Imports: react, next/link, @/components/ui/card, @/components/ui/badge, sonner, next/navigation

## court-jester-main/app/offender/dashboard/[id]/court-dates

- court-jester-main/app/offender/dashboard/[id]/court-dates/page.tsx
  - Imports: next/navigation, react, @/components/ui/calendar, @/components/ui/card, @/components/ui/button, sonner

## court-jester-main/app/offender/dashboard/[id]/motions/[motionId]

- court-jester-main/app/offender/dashboard/[id]/motions/[motionId]/page.tsx
  - Imports: next/navigation, react, @/components/ui/button, @/components/ui/card, @/components/ui/badge, sonner, next/link, lucide-react

## court-jester-main/app/offender/dashboard/[id]/motions

- court-jester-main/app/offender/dashboard/[id]/motions/page.tsx
  - Imports: react, @/components/ui/button, @/components/ui/card, @/components/ui/badge, next/link, lucide-react

## court-jester-main/app/offender/dashboard/[id]/notifications

- court-jester-main/app/offender/dashboard/[id]/notifications/page.tsx
  - Imports: next/navigation, react, lucide-react, @/components/ui/card, @/components/ui/button, @/components/ui/tabs, sonner

## court-jester-main/app/offender/dashboard/[id]/profile

- court-jester-main/app/offender/dashboard/[id]/profile/error.tsx
  - Imports: react, @/components/ui/button
- court-jester-main/app/offender/dashboard/[id]/profile/loading.tsx
- court-jester-main/app/offender/dashboard/[id]/profile/page.tsx
  - Imports: @/lib/hooks/useOffenderData, @/components/ui/button, next/image

## court-jester-main/app/offender/dashboard/[id]/settings

- court-jester-main/app/offender/dashboard/[id]/settings/page.tsx
  - Imports: react, @/components/ui/button, @/components/ui/input, @/components/ui/switch, @/components/ui/label, @/components/ui/card, sonner, @/components/shared/delete-account, @/components/shared/notification-permission, next/navigation, lucide-react

## court-jester-main/app/offender/dashboard/[id]

- court-jester-main/app/offender/dashboard/[id]/layout.tsx
  - Imports: @/components/shared/dashboard-header, @/components/shared/dashboard-tabs, next/navigation, next/headers, @/lib/auth, react
- court-jester-main/app/offender/dashboard/[id]/loading.tsx
  - Imports: react, lucide-react
- court-jester-main/app/offender/dashboard/[id]/page.tsx
  - Imports: next/navigation, next/headers, @/lib/auth

## court-jester-main/app

- court-jester-main/app/fonts.ts
  - Imports: next/font/google
- court-jester-main/app/favicon.ico
- court-jester-main/app/globals.css
- court-jester-main/app/layout.tsx
  - Imports: react, next, @/app/fonts, ./globals.css
- court-jester-main/app/page.tsx
  - Imports: react-hook-form, next/navigation, @/components/ui/button, next/image, sonner

## court-jester-main/components/shared

- court-jester-main/components/shared/dashboard-tabs.tsx
  - Imports: next/link, next/navigation, @/lib/utils/utils
- court-jester-main/components/shared/dashboard-header.tsx
  - Imports: next/navigation, ../ui/button, next/link
- court-jester-main/components/shared/delete-account.tsx
  - Imports: react, next/navigation, lucide-react, @/components/ui/button, @/components/ui/card, @/components/ui/dialog, @/components/ui/input, sonner
- court-jester-main/components/shared/notification-permission.tsx
  - Imports: react, lucide-react, @/components/ui/button, @/components/ui/card, @/lib/utils/notification-utils
- court-jester-main/components/shared/notification-manager.tsx
  - Imports: react, ./notification-permission, sonner, @/lib/utils/notification-utils, @/components/ui/card, @/components/ui/checkbox, @/components/ui/scroll-area

## court-jester-main/components/ui

- court-jester-main/components/ui/accordion.tsx
  - Imports: react, @radix-ui/react-accordion, lucide-react, @/lib/utils/utils
- court-jester-main/components/ui/alert-dialog.tsx
  - Imports: react, @radix-ui/react-alert-dialog, @/lib/utils/utils, @/components/ui/button
- court-jester-main/components/ui/alert.tsx
  - Imports: react, class-variance-authority, @/lib/utils/utils
- court-jester-main/components/ui/aspect-ratio.tsx
  - Imports: @radix-ui/react-aspect-ratio
- court-jester-main/components/ui/avatar.tsx
  - Imports: react, @radix-ui/react-avatar, @/lib/utils/utils
- court-jester-main/components/ui/button.tsx
  - Imports: react, @radix-ui/react-slot, class-variance-authority, @/lib/utils/utils
- court-jester-main/components/ui/badge.tsx
  - Imports: react, @radix-ui/react-slot, class-variance-authority, @/lib/utils/utils
- court-jester-main/components/ui/breadcrumb.tsx
  - Imports: react, @radix-ui/react-slot, lucide-react, @/lib/utils/utils
- court-jester-main/components/ui/calendar.tsx
  - Imports: react, lucide-react, react-day-picker, @/lib/utils/utils, @/components/ui/button
- court-jester-main/components/ui/card.tsx
  - Imports: react, @/lib/utils/utils
- court-jester-main/components/ui/chart.tsx
  - Imports: react, recharts, @/lib/utils/utils
- court-jester-main/components/ui/carousel.tsx
  - Imports: react, embla-carousel-react, lucide-react, @/lib/utils/utils, @/components/ui/button
- court-jester-main/components/ui/checkbox.tsx
  - Imports: react, @radix-ui/react-checkbox, lucide-react, @/lib/utils/utils
- court-jester-main/components/ui/collapsible.tsx
  - Imports: @radix-ui/react-collapsible
- court-jester-main/components/ui/context-menu.tsx
  - Imports: react, @radix-ui/react-context-menu, lucide-react, @/lib/utils/utils
- court-jester-main/components/ui/command.tsx
  - Imports: react, @radix-ui/react-dialog, cmdk, lucide-react, @/lib/utils/utils, @/components/ui/dialog
- court-jester-main/components/ui/dialog.tsx
  - Imports: react, @radix-ui/react-dialog, lucide-react, @/lib/utils/utils
- court-jester-main/components/ui/drawer.tsx
  - Imports: react, vaul, @/lib/utils/utils
- court-jester-main/components/ui/dropdown-menu.tsx
  - Imports: react, @radix-ui/react-dropdown-menu, lucide-react, @/lib/utils/utils
- court-jester-main/components/ui/form.tsx
  - Imports: react, @radix-ui/react-label, @radix-ui/react-slot, react-hook-form, @/lib/utils/utils, @/components/ui/label
- court-jester-main/components/ui/hover-card.tsx
  - Imports: react, @radix-ui/react-hover-card, @/lib/utils/utils
- court-jester-main/components/ui/input-otp.tsx
  - Imports: react, input-otp, lucide-react, @/lib/utils/utils
  - Used by: court-jester-main/components/ui/input-otp.tsx
- court-jester-main/components/ui/input.tsx
  - Imports: react, @/lib/utils/utils
- court-jester-main/components/ui/label.tsx
  - Imports: react, @radix-ui/react-label, @/lib/utils/utils
- court-jester-main/components/ui/menubar.tsx
  - Imports: react, @radix-ui/react-menubar, lucide-react, @/lib/utils/utils
- court-jester-main/components/ui/navigation-menu.tsx
  - Imports: react, @radix-ui/react-navigation-menu, class-variance-authority, lucide-react, @/lib/utils/utils
- court-jester-main/components/ui/pagination.tsx
  - Imports: react, lucide-react, @/lib/utils/utils, @/components/ui/button
- court-jester-main/components/ui/popover.tsx
  - Imports: react, @radix-ui/react-popover, @/lib/utils/utils
- court-jester-main/components/ui/progress.tsx
  - Imports: react, @radix-ui/react-progress, @/lib/utils/utils
- court-jester-main/components/ui/radio-group.tsx
  - Imports: react, @radix-ui/react-radio-group, lucide-react, @/lib/utils/utils
- court-jester-main/components/ui/resizable.tsx
  - Imports: lucide-react, react-resizable-panels, @/lib/utils/utils
- court-jester-main/components/ui/scroll-area.tsx
  - Imports: react, @radix-ui/react-scroll-area, @/lib/utils/utils
- court-jester-main/components/ui/select.tsx
  - Imports: react, @radix-ui/react-select, lucide-react, @/lib/utils/utils
- court-jester-main/components/ui/separator.tsx
  - Imports: react, @radix-ui/react-separator, @/lib/utils/utils
- court-jester-main/components/ui/sidebar.tsx
  - Imports: react, @radix-ui/react-slot, class-variance-authority, lucide-react, @/lib/hooks/use-mobile, @/lib/utils/utils, @/components/ui/button, @/components/ui/input, @/components/ui/separator, @/components/ui/sheet, @/components/ui/skeleton, @/components/ui/tooltip
- court-jester-main/components/ui/sheet.tsx
  - Imports: react, @radix-ui/react-dialog, lucide-react, @/lib/utils/utils
- court-jester-main/components/ui/skeleton.tsx
  - Imports: @/lib/utils/utils
- court-jester-main/components/ui/slider.tsx
  - Imports: react, @radix-ui/react-slider, @/lib/utils/utils
- court-jester-main/components/ui/sonner.tsx
  - Imports: react, next-themes, sonner
  - Used by: court-jester-main/app/admin/dashboard/cases/page.tsx, court-jester-main/app/admin/dashboard/motions/[id]/page.tsx, court-jester-main/app/admin/dashboard/motions/page.tsx, court-jester-main/app/admin/dashboard/notifications/page.tsx, court-jester-main/app/admin/dashboard/offenders/page.tsx, court-jester-main/app/admin/dashboard/settings/page.tsx, court-jester-main/app/admin/dashboard/tools/case-upload/page.tsx, court-jester-main/app/admin/dashboard/tools/database-reset/page.tsx, court-jester-main/app/admin/dashboard/tools/motions-editor/page.tsx, court-jester-main/app/admin/dashboard/tools/mugshot-upload/page.tsx, court-jester-main/app/admin/dashboard/tools/offender-profile/page.tsx, court-jester-main/app/offender/dashboard/[id]/cases/page.tsx, court-jester-main/app/offender/dashboard/[id]/court-dates/page.tsx, court-jester-main/app/offender/dashboard/[id]/motions/[motionId]/page.tsx, court-jester-main/app/offender/dashboard/[id]/notifications/page.tsx, court-jester-main/app/offender/dashboard/[id]/settings/page.tsx, court-jester-main/app/page.tsx, court-jester-main/components/shared/delete-account.tsx, court-jester-main/components/shared/notification-manager.tsx, court-jester-main/components/ui/sonner.tsx, court-jester-main/components/toast-provider.tsx
- court-jester-main/components/ui/switch.tsx
  - Imports: react, @radix-ui/react-switch, @/lib/utils/utils
- court-jester-main/components/ui/table.tsx
  - Imports: react, @/lib/utils/utils
- court-jester-main/components/ui/tabs.tsx
  - Imports: react, @radix-ui/react-tabs, @/lib/utils/utils
- court-jester-main/components/ui/textarea.tsx
  - Imports: react, @/lib/utils/utils
- court-jester-main/components/ui/toaster.tsx
  - Imports: @/lib/hooks/use-toast, @/components/ui/toast
- court-jester-main/components/ui/toast.tsx
  - Imports: react, @radix-ui/react-toast, class-variance-authority, lucide-react, @/lib/utils/utils
- court-jester-main/components/ui/toggle-group.tsx
  - Imports: react, @radix-ui/react-toggle-group, class-variance-authority, @/lib/utils/utils, @/components/ui/toggle
- court-jester-main/components/ui/toggle.tsx
  - Imports: react, @radix-ui/react-toggle, class-variance-authority, @/lib/utils/utils
- court-jester-main/components/ui/use-mobile.tsx
  - Imports: react
- court-jester-main/components/ui/use-toast.ts
  - Imports: react, @/components/ui/toast
- court-jester-main/components/ui/tooltip.tsx
  - Imports: react, @radix-ui/react-tooltip, @/lib/utils/utils

## court-jester-main/components

- court-jester-main/components/search-form.tsx
  - Imports: react, next/navigation, lucide-react, @/components/ui/button, @/components/ui/sidebar
- court-jester-main/components/theme-provider.tsx
  - Imports: next-themes
- court-jester-main/components/date-range-picker.tsx
  - Imports: react, date-fns, lucide-react, react-day-picker, @/lib/utils/utils, @/components/ui/button, @/components/ui/calendar, @/components/ui/popover
- court-jester-main/components/toast-provider.tsx
  - Imports: sonner

## court-jester-main/lib/db

- court-jester-main/lib/db/blob.ts
  - Imports: @vercel/blob
- court-jester-main/lib/db/db-schema.ts
  - Imports: ./db
- court-jester-main/lib/db/db.ts
  - Imports: pg

## court-jester-main/lib/hooks

- court-jester-main/lib/hooks/use-mobile.tsx
  - Imports: react
- court-jester-main/lib/hooks/use-mobile.ts
  - Imports: react
- court-jester-main/lib/hooks/useOffenderData.ts
  - Imports: react
- court-jester-main/lib/hooks/use-toast.ts
  - Imports: react, @/components/ui/toast

## court-jester-main/lib/utils

- court-jester-main/lib/utils/date-utils.ts
- court-jester-main/lib/utils/email-utils.ts
  - Imports: @/lib/db/db
- court-jester-main/lib/utils/case-utils.ts
- court-jester-main/lib/utils/notification-utils.ts
- court-jester-main/lib/utils/motion-utils.ts
- court-jester-main/lib/utils/pdf-utils.ts
- court-jester-main/lib/utils/utils.ts
  - Imports: clsx, tailwind-merge
- court-jester-main/lib/utils/push-notification-utils.ts
  - Imports: ./utils
- court-jester-main/lib/utils/validation-utils.ts

## court-jester-main/lib

- court-jester-main/lib/auth.ts
  - Imports: jsonwebtoken
- court-jester-main/lib/case-parser.ts
- court-jester-main/lib/pdf-generator.ts
  - Imports: pdf-lib
- court-jester-main/lib/profile-parser.ts
  - Imports: ./db/db

## court-jester-main/public/fonts

- court-jester-main/public/fonts/jacquard-24-charted.woff2
- court-jester-main/public/fonts/kings.woff2

## court-jester-main/public/icons

- court-jester-main/public/icons/homepage.png

## court-jester-main/public

- court-jester-main/public/notification-worker.ts

## court-jester-main

- court-jester-main/.gitignore
- court-jester-main/.hintrc
- court-jester-main/.prettierignore
- court-jester-main/.prettierrc.js
- court-jester-main/components.json
- court-jester-main/next.config.mjs
- court-jester-main/middleware.ts
  - Imports: next/server, jose
- court-jester-main/eslint.config.mjs
- court-jester-main/DESIGN.md
- court-jester-main/README.md
- court-jester-main/tsconfig.json
- court-jester-main/HELP.md
- court-jester-main/tailwind.config.ts
  - Imports: tailwindcss, tailwindcss-animate, @tailwindcss/typography
- court-jester-main/package.json
- court-jester-main/package-lock.json
- court-jester-main/postcss.config.mjs

## File Types Summary

- tsx: 96 files
- ts: 72 files
- ico: 1 files
- css: 1 files
- woff2: 2 files
- png: 1 files
- gitignore: 1 files
- hintrc: 1 files
- prettierignore: 1 files
- js: 1 files
- json: 4 files
- mjs: 3 files
- md: 3 files



## Key Dependencies

### court-jester-main/components/ui/sonner.tsx

- **Used by:** 21 files
- **Imports:** react, next-themes, sonner

### court-jester-main/components/ui/input-otp.tsx

- **Used by:** 1 files
- **Imports:** react, input-otp, lucide-react...

### court-jester-main/app/admin/dashboard/cases/[id]/page.tsx

- **Used by:** 0 files
- **Imports:** next/navigation, react, @/components/ui/button...

### court-jester-main/app/admin/dashboard/cases/page.tsx

- **Used by:** 0 files
- **Imports:** react, @/components/ui/button, next/link...

### court-jester-main/app/admin/dashboard/motions/[id]/page.tsx

- **Used by:** 0 files
- **Imports:** next/navigation, react, @/components/ui/button...

## Files by Directory

### court-jester-main

- court-jester-main/app/admin/dashboard/cases/[id]/page.tsx (tsx)
- court-jester-main/app/admin/dashboard/cases/page.tsx (tsx)
- court-jester-main/app/admin/dashboard/motions/[id]/page.tsx (tsx)
- court-jester-main/app/admin/dashboard/motions/page.tsx (tsx)
- court-jester-main/app/admin/dashboard/notifications/page.tsx (tsx)
- court-jester-main/app/admin/dashboard/offenders/[id]/page.tsx (tsx)
- court-jester-main/app/admin/dashboard/offenders/page.tsx (tsx)
- court-jester-main/app/admin/dashboard/settings/page.tsx (tsx)
- court-jester-main/app/admin/dashboard/tools/case-upload/page.tsx (tsx)
- court-jester-main/app/admin/dashboard/tools/database-reset/page.tsx (tsx)
- court-jester-main/app/admin/dashboard/tools/help/page.tsx (tsx)
- court-jester-main/app/admin/dashboard/tools/motions-editor/page.tsx (tsx)
- court-jester-main/app/admin/dashboard/tools/mugshot-upload/page.tsx (tsx)
- court-jester-main/app/admin/dashboard/tools/offender-profile/page.tsx (tsx)
- court-jester-main/app/admin/dashboard/tools/loading.tsx (tsx)
- court-jester-main/app/admin/dashboard/tools/page.tsx (tsx)
- court-jester-main/app/admin/dashboard/layout.tsx (tsx)
- court-jester-main/app/admin/dashboard/loading.tsx (tsx)
- court-jester-main/app/admin/dashboard/page.tsx (tsx)
- court-jester-main/app/api/admin/cases/search/route.ts (typescript)
- court-jester-main/app/api/admin/cases/upload/route.ts (typescript)
- court-jester-main/app/api/admin/cases/[id]/route.ts (typescript)
- court-jester-main/app/api/admin/cases/route.ts (typescript)
- court-jester-main/app/api/admin/config/route.ts (typescript)
- court-jester-main/app/api/admin/database/connection/route.ts (typescript)
- court-jester-main/app/api/admin/database/migrate/route.ts (typescript)
- court-jester-main/app/api/admin/database/reset/route.ts (typescript)
- court-jester-main/app/api/admin/database/tables/route.ts (typescript)
- court-jester-main/app/api/admin/motions/[id]/generate-pdf/route.ts (typescript)
- court-jester-main/app/api/admin/motions/[id]/route.ts (typescript)
- court-jester-main/app/api/admin/motions/route.ts (typescript)
- court-jester-main/app/api/admin/notifications/mark-all-read/route.ts (typescript)
- court-jester-main/app/api/admin/notifications/[id]/read/route.ts (typescript)
- court-jester-main/app/api/admin/notifications/route.ts (typescript)
- court-jester-main/app/api/admin/offenders/search/route.ts (typescript)
- court-jester-main/app/api/admin/offenders/[id]/mugshot/route.ts (typescript)
- court-jester-main/app/api/admin/offenders/[id]/route.ts (typescript)
- court-jester-main/app/api/admin/offenders/route.ts (typescript)
- court-jester-main/app/api/admin/settings/email/test/route.ts (typescript)
- court-jester-main/app/api/admin/settings/email/route.ts (typescript)
- court-jester-main/app/api/admin/settings/system/route.ts (typescript)
- court-jester-main/app/api/auth/confirm/route.ts (typescript)
- court-jester-main/app/api/auth/login/route.ts (typescript)
- court-jester-main/app/api/auth/logout/route.ts (typescript)
- court-jester-main/app/api/notifications/check-court-dates/route.ts (typescript)
- court-jester-main/app/api/offenders/me/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/cases/[caseId]/charges/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/cases/[caseId]/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/cases/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/court-dates/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/delete-account/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/hearings/notifications/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/hearings/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/motions/notifications/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/motions/templates/[templateId]/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/motions/templates/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/motions/[motionId]/download-pdf/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/motions/[motionId]/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/motions/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/mugshot/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/notifications/preferences/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/notifications/unread-count/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/notifications/[notificationId]/read/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/notifications/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/profile/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/request-update/route.ts (typescript)
- court-jester-main/app/api/offenders/[id]/settings/route.ts (typescript)
- court-jester-main/app/confirmation/page.tsx (tsx)
- court-jester-main/app/offender/dashboard/[id]/cases/[caseId]/loading.tsx (tsx)
- court-jester-main/app/offender/dashboard/[id]/cases/[caseId]/page.tsx (tsx)
- court-jester-main/app/offender/dashboard/[id]/cases/loading.tsx (tsx)
- court-jester-main/app/offender/dashboard/[id]/cases/page.tsx (tsx)
- court-jester-main/app/offender/dashboard/[id]/court-dates/page.tsx (tsx)
- court-jester-main/app/offender/dashboard/[id]/motions/[motionId]/page.tsx (tsx)
- court-jester-main/app/offender/dashboard/[id]/motions/page.tsx (tsx)
- court-jester-main/app/offender/dashboard/[id]/notifications/page.tsx (tsx)
- court-jester-main/app/offender/dashboard/[id]/profile/error.tsx (tsx)
- court-jester-main/app/offender/dashboard/[id]/profile/loading.tsx (tsx)
- court-jester-main/app/offender/dashboard/[id]/profile/page.tsx (tsx)
- court-jester-main/app/offender/dashboard/[id]/settings/page.tsx (tsx)
- court-jester-main/app/offender/dashboard/[id]/layout.tsx (tsx)
- court-jester-main/app/offender/dashboard/[id]/loading.tsx (tsx)
- court-jester-main/app/offender/dashboard/[id]/page.tsx (tsx)
- court-jester-main/app/fonts.ts (typescript)
- court-jester-main/app/favicon.ico (plaintext)
- court-jester-main/app/globals.css (css)
- court-jester-main/app/layout.tsx (tsx)
- court-jester-main/app/page.tsx (tsx)
- court-jester-main/components/shared/dashboard-tabs.tsx (tsx)
- court-jester-main/components/shared/dashboard-header.tsx (tsx)
- court-jester-main/components/shared/delete-account.tsx (tsx)
- court-jester-main/components/shared/notification-permission.tsx (tsx)
- court-jester-main/components/shared/notification-manager.tsx (tsx)
- court-jester-main/components/ui/accordion.tsx (tsx)
- court-jester-main/components/ui/alert-dialog.tsx (tsx)
- court-jester-main/components/ui/alert.tsx (tsx)
- court-jester-main/components/ui/aspect-ratio.tsx (tsx)
- court-jester-main/components/ui/avatar.tsx (tsx)
- court-jester-main/components/ui/button.tsx (tsx)
- court-jester-main/components/ui/badge.tsx (tsx)
- court-jester-main/components/ui/breadcrumb.tsx (tsx)
- court-jester-main/components/ui/calendar.tsx (tsx)
- court-jester-main/components/ui/card.tsx (tsx)
- court-jester-main/components/ui/chart.tsx (tsx)
- court-jester-main/components/ui/carousel.tsx (tsx)
- court-jester-main/components/ui/checkbox.tsx (tsx)
- court-jester-main/components/ui/collapsible.tsx (tsx)
- court-jester-main/components/ui/context-menu.tsx (tsx)
- court-jester-main/components/ui/command.tsx (tsx)
- court-jester-main/components/ui/dialog.tsx (tsx)
- court-jester-main/components/ui/drawer.tsx (tsx)
- court-jester-main/components/ui/dropdown-menu.tsx (tsx)
- court-jester-main/components/ui/form.tsx (tsx)
- court-jester-main/components/ui/hover-card.tsx (tsx)
- court-jester-main/components/ui/input-otp.tsx (tsx)
- court-jester-main/components/ui/input.tsx (tsx)
- court-jester-main/components/ui/label.tsx (tsx)
- court-jester-main/components/ui/menubar.tsx (tsx)
- court-jester-main/components/ui/navigation-menu.tsx (tsx)
- court-jester-main/components/ui/pagination.tsx (tsx)
- court-jester-main/components/ui/popover.tsx (tsx)
- court-jester-main/components/ui/progress.tsx (tsx)
- court-jester-main/components/ui/radio-group.tsx (tsx)
- court-jester-main/components/ui/resizable.tsx (tsx)
- court-jester-main/components/ui/scroll-area.tsx (tsx)
- court-jester-main/components/ui/select.tsx (tsx)
- court-jester-main/components/ui/separator.tsx (tsx)
- court-jester-main/components/ui/sidebar.tsx (tsx)
- court-jester-main/components/ui/sheet.tsx (tsx)
- court-jester-main/components/ui/skeleton.tsx (tsx)
- court-jester-main/components/ui/slider.tsx (tsx)
- court-jester-main/components/ui/sonner.tsx (tsx)
- court-jester-main/components/ui/switch.tsx (tsx)
- court-jester-main/components/ui/table.tsx (tsx)
- court-jester-main/components/ui/tabs.tsx (tsx)
- court-jester-main/components/ui/textarea.tsx (tsx)
- court-jester-main/components/ui/toaster.tsx (tsx)
- court-jester-main/components/ui/toast.tsx (tsx)
- court-jester-main/components/ui/toggle-group.tsx (tsx)
- court-jester-main/components/ui/toggle.tsx (tsx)
- court-jester-main/components/ui/use-mobile.tsx (tsx)
- court-jester-main/components/ui/use-toast.ts (typescript)
- court-jester-main/components/ui/tooltip.tsx (tsx)
- court-jester-main/components/search-form.tsx (tsx)
- court-jester-main/components/theme-provider.tsx (tsx)
- court-jester-main/components/date-range-picker.tsx (tsx)
- court-jester-main/components/toast-provider.tsx (tsx)
- court-jester-main/lib/db/blob.ts (typescript)
- court-jester-main/lib/db/db-schema.ts (typescript)
- court-jester-main/lib/db/db.ts (typescript)
- court-jester-main/lib/hooks/use-mobile.tsx (tsx)
- court-jester-main/lib/hooks/use-mobile.ts (typescript)
- court-jester-main/lib/hooks/useOffenderData.ts (typescript)
- court-jester-main/lib/hooks/use-toast.ts (typescript)
- court-jester-main/lib/utils/date-utils.ts (typescript)
- court-jester-main/lib/utils/email-utils.ts (typescript)
- court-jester-main/lib/utils/case-utils.ts (typescript)
- court-jester-main/lib/utils/notification-utils.ts (typescript)
- court-jester-main/lib/utils/motion-utils.ts (typescript)
- court-jester-main/lib/utils/pdf-utils.ts (typescript)
- court-jester-main/lib/utils/utils.ts (typescript)
- court-jester-main/lib/utils/push-notification-utils.ts (typescript)
- court-jester-main/lib/utils/validation-utils.ts (typescript)
- court-jester-main/lib/auth.ts (typescript)
- court-jester-main/lib/case-parser.ts (typescript)
- court-jester-main/lib/pdf-generator.ts (typescript)
- court-jester-main/lib/profile-parser.ts (typescript)
- court-jester-main/public/fonts/jacquard-24-charted.woff2 (plaintext)
- court-jester-main/public/fonts/kings.woff2 (plaintext)
- court-jester-main/public/icons/homepage.png (plaintext)
- court-jester-main/public/notification-worker.ts (typescript)
- court-jester-main/.gitignore (plaintext)
- court-jester-main/.hintrc (plaintext)
- court-jester-main/.prettierignore (plaintext)
- court-jester-main/.prettierrc.js (javascript)
- court-jester-main/components.json (json)
- court-jester-main/next.config.mjs (plaintext)
- court-jester-main/middleware.ts (typescript)
- court-jester-main/eslint.config.mjs (plaintext)
- court-jester-main/DESIGN.md (markdown)
- court-jester-main/README.md (markdown)
- court-jester-main/tsconfig.json (json)
- court-jester-main/HELP.md (markdown)
- court-jester-main/tailwind.config.ts (typescript)
- court-jester-main/package.json (json)
- court-jester-main/package-lock.json (json)
- court-jester-main/postcss.config.mjs (plaintext)

## Selected File Contents

### court-jester-main/app/api/admin/config/route.ts

```typescript
import { type NextRequest, NextResponse } from "next/server";
import { query } from "@/lib/db/db";
import { verifyToken } from "@/lib/auth";

export async function GET(request: NextRequest) {
  try {
    // Verify admin authorization
    const token = request.cookies.get("token")?.value;
    const session = await verifyToken(token);

    if (!session || session.role !== "admin") {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    // Get search query from URL parameters
    const searchParams = request.nextUrl.searchParams;
    const searchQuery = searchParams.get("q");

    if (!searchQuery) {
      return NextResponse.json({ error: "Search query is required" }, { status: 400 });
    }

    // Search cases with matching fields from the cases and offenders tables
    const result = await query(
      `
        SELECT 
          c.id, 
          c.case_number, 
          c.offender_id, 
          CONCAT(o.last_name, ', ', o.first_name) AS offender_name,
          c.court, 
          c.judge, 
          c.status, 
          c.next_date, 
          c.created_at
        FROM cases c
        JOIN offenders o ON c.offender_id = o.id
        WHERE 
          c.case_number ILIKE $1 OR
          o.last_name ILIKE $1 OR
          o.first_name ILIKE $1 OR
          c.court ILIKE $1 OR
          c.judge ILIKE $1 OR
          c.status ILIKE $1
        ORDER BY c.created_at DESC
      `,
      [`%${searchQuery}%`]
    );

    return NextResponse.json({
      cases: result.rows,
    });
  } catch (error) {
    console.error("Error searching cases:", error);
    return NextResponse.json({ error: "Failed to search cases" }, { status: 500 });
  }
}

```

### court-jester-main/tailwind.config.ts

```typescript
import type { Config } from "tailwindcss";
import tailwindcssAnimate from "tailwindcss-animate";
import typography from "@tailwindcss/typography";

const config: Config = {
  darkMode: "class",
  content: [
    "./pages/**/*.{ts,tsx}",
    "./components/**/*.{ts,tsx}",
    "./app/**/*.{ts,tsx}",
    "./src/**/*.{ts,tsx}",
    "*.{js,ts,jsx,tsx,mdx}",
  ],
  prefix: "",
  theme: {
    container: {
      center: true,
      padding: "2rem",
      screens: {
        xs: "480px",
        sm: "640px",
        md: "768px",
        lg: "1024px",
        xl: "1280px",
        "2xl": "1536px",
      },
    },
    extend: {
      colors: {
        border: "hsl(var(--primary))",
        input: "hsl(var(--input))",
        ring: "hsl(var(--ring))",
        background: "hsl(var(--background))",
        foreground: "hsl(var(--foreground))",
        primary: {
          DEFAULT: "hsl(var(--primary))",
          foreground: "hsl(var(--primary-foreground))",
        },
        secondary: {
          DEFAULT: "hsl(var(--secondary))",
          foreground: "hsl(var(--secondary-foreground))",
        },
        destructive: {
          DEFAULT: "hsl(var(--destructive))",
          foreground: "hsl(var(--destructive-foreground))",
        },
        muted: {
          DEFAULT: "hsl(var(--muted))",
          foreground: "hsl(var(--muted-foreground))",
        },
        accent: {
          DEFAULT: "hsl(var(--accent))",
          foreground: "hsl(var(--accent-foreground))",
        },
        popover: {
          DEFAULT: "hsl(var(--popover))",
          foreground: "hsl(var(--popover-foreground))",
        },
        card: {
          DEFAULT: "hsl(var(--card))",
          foreground: "hsl(var(--card-foreground))",
        },
      },
      borderRadius: {
        lg: "var(--radius)",
        md: "calc(var(--radius) - 2px)",
        sm: "calc(var(--radius) - 4px)",
      },
      fontFamily: {
        kings: ["Kings", "serif"],
        jacquard: ['"Jacquard 24 Charted"', "serif"],
      },
      keyframes: {
        "accordion-down": {
          from: { height: "0" },
          to: { height: "100%" },
        },
        "accordion-up": {
          from: { height: "100%" },
          to: { height: "0" },
        },
      },
      animation: {
        "accordion-down": "accordion-down 0.2s ease-out",
        "accordion-up": "accordion-up 0.2s ease-out",
      },
    },
  },
  plugins: [tailwindcssAnimate, typography],
} satisfies Config;

export default config;

```

### court-jester-main/components/shared/dashboard-tabs.tsx

```tsx
// components/shared/dashboard-tabs.tsx
"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/utils/utils";

interface TabItem {
  label: string;
  href: string;
  count?: number | string;
}

interface DashboardTabsProps {
  role: "admin" | "offender";
  offenderId?: number;
}

export function DashboardTabs({ role, offenderId }: DashboardTabsProps) {
  const pathname = usePathname();

  const tabs: TabItem[] =
    role === "admin"
      ? [
          { label: "Notifications", href: "/admin/dashboard/notifications" },
          { label: "Offenders", href: "/admin/dashboard/offenders" },
          { label: "Cases", href: "/admin/dashboard/cases" },
          { label: "Motions", href: "/admin/dashboard/motions" },
          { label: "Settings", href: "/admin/dashboard/settings" },
          { label: "Tools", href: "/admin/dashboard/tools" },
        ]
      : offenderId
        ? [
            { label: "Profile", href: `/offender/dashboard/${offenderId}/profile` },
            { label: "Cases", href: `/offender/dashboard/${offenderId}/cases` },
            { label: "Court Dates", href: `/offender/dashboard/${offenderId}/court-dates` },
            { label: "Settings", href: `/offender/dashboard/${offenderId}/settings` },
          ]
        : [];

  return (
    <div className="mb-4">
      <div className="flex w-full rounded-md border-2 border-border overflow-hidden">
        {tabs.map((tab) => (
          <Link
            key={tab.href}
            href={tab.href}
            className={cn(
              "relative flex-1 px-4 py-2 text-center transition-colors font-kings",
              pathname === tab.href || pathname.startsWith(tab.href.replace(/\/$/, ""))
                ? "font-medium bg-background text-foreground"
                : "bg-foreground text-background hover:bg-background hover:opacity-90"
            )}
          >
            <span>{tab.label}</span>
            {tab.count && (
              <span className="ml-1 inline-flex h-5 w-5 items-center justify-center rounded-full bg-foreground text-xs text-background">
                {tab.count}
              </span>
            )}
          </Link>
        ))}
      </div>
    </div>
  );
}

```

### court-jester-main/components/shared/dashboard-header.tsx

```tsx
// components/shared/dashboard-header.tsx
"use client";

import { usePathname } from "next/navigation";
import { Button } from "../ui/button";
import Link from "next/link";

/**
 * Logs out the user and redirects to home.
 */
async function logout() {
  try {
    const res = await fetch("/api/auth/logout", { method: "GET" });
    if (res.ok) {
      window.location.href = "/";
    } else {
      console.error("Logout failed");
    }
  } catch (err) {
    console.error("Logout error:", err);
  }
}

export function AdminDashboardHeader() {
  return (
    <header className="flex justify-between items-center py-4 mb-2.5">
      <Link className="font-jacquard text-5xl sm:text-5xl" href="/admin/dashboard">
        Court Jester
      </Link>
      <Button
        className="bg-foreground text-background hover:bg-foreground/90 font-kings px-4 py-2 rounded-md"
        onClick={logout}
      >
        Logout
      </Button>
    </header>
  );
}

export function OffenderDashboardHeader() {
  return (
    <header className="flex justify-between items-center py-4 mb-2.5">
      <Link className="font-jacquard text-5xl sm:text-5xl" href="/offender/dashboard">
        Court Jester
      </Link>
      <Button
        className="bg-foreground text-background hover:bg-foreground/90 font-kings px-4 py-2 rounded-md"
        onClick={logout}
      >
        Logout
      </Button>
    </header>
  );
}

export function DashboardHeader() {
  const pathname = usePathname();
  const isAdmin = pathname.includes("/admin/");

  return isAdmin ? <AdminDashboardHeader /> : <OffenderDashboardHeader />;
}

```

### court-jester-main/components/shared/delete-account.tsx

```tsx
"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { Trash2 } from "lucide-react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog"
import { Input } from "@/components/ui/input"
import { toast } from "sonner"

interface DeleteAccountProps {
  offenderId: string
}

export function DeleteAccount({ offenderId }: DeleteAccountProps) {
  const [isOpen, setIsOpen] = useState(false)
  const [confirmation, setConfirmation] = useState("")
  const [isDeleting, setIsDeleting] = useState(false)
  const router = useRouter()

  const handleDelete = async () => {
    if (confirmation !== "DELETE") {
      toast.error("Please type DELETE to confirm")
      return
    }

    setIsDeleting(true)
    try {
      const response = await fetch(`/api/offenders/${offenderId}/delete-account`, {
        method: "POST",
      })

      if (!response.ok) {
        throw new Error("Failed to delete account")
      }

      toast.success("Account deleted successfully")

      // Clear cookies and redirect to home
      document.cookie = "token=; path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT"
      router.push("/")
    } catch (error) {
      console.error("Error deleting account:", error)
      toast.error("Failed to delete account")
      setIsDeleting(false)
    }
  }

  return (
    <Card className="border-red-200">
      <CardHeader>
        <CardTitle className="flex items-center gap-2 text-red-500">
          <Trash2 className="h-5 w-5" />
          Delete Account
        </CardTitle>
        <CardDescription>Permanently delete your account and all associated data</CardDescription>
      </CardHeader>
      <CardContent>
        <p className="text-sm text-muted-foreground">
          This action cannot be undone. All your personal data, cases, motions, and settings will be permanently
          removed.
        </p>
      </CardContent>
      <CardFooter>
        <Dialog open={isOpen} onOpenChange={setIsOpen}>
          <DialogTrigger asChild>
            <Button className="bg-foreground text-background  w-full font-kings" variant="destructive">
              DELETE ACCOUNT
            </Button>
          </DialogTrigger>
          <DialogContent>
            <DialogHeader>
              <DialogTitle>Are you absolutely sure?</DialogTitle>
              <DialogDescription>
                This action cannot be undone. This will permanently delete your account and remove all your data from
                our servers.
              </DialogDescription>
            </DialogHeader>
            <div className="space-y-4 py-4">
              <p className="text-sm text-muted-foreground">
                Type <span className="font-bold">DELETE</span> to confirm:
              </p>
              <Input
                value={confirmation}
                onChange={(e) => setConfirmation(e.target.value)}
                placeholder="Type DELETE to confirm"
                className="font-mono"
              />
            </div>
            <DialogFooter>
              <Button variant="outline" onClick={() => setIsOpen(false)} disabled={isDeleting}>
                Cancel
              </Button>
              <Button
                variant="destructive"
                onClick={handleDelete}
                disabled={confirmation !== "DELETE" || isDeleting}
                className="font-kings"
              >
                {isDeleting ? "DELETING..." : "CONFIRM DELETE"}
              </Button>
            </DialogFooter>
          </DialogContent>
        </Dialog>
      </CardFooter>
    </Card>
  )
}


```

