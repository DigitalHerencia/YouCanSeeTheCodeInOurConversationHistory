## Related

- [[CtrlPlus Server-First Architecture Blueprint]]

## Type

type:: system

- system

```txt
CtrlPlus/
├─ app/
│  ├─ layout.tsx
│  ├─ global-error.tsx
│  ├─ not-found.tsx
│  ├─ globals.css
│  ├─ favicon.ico
│  ├─ page.tsx
│  │
│  ├─ (public)/
│  │  ├─ layout.tsx
│  │  ├─ loading.tsx
│  │  ├─ error.tsx
│  │  ├─ sign-in/[[...sign-in]]/page.tsx
│  │  └─ sign-up/[[...sign-up]]/page.tsx
│  │
│  ├─ (app)/
│  │  ├─ layout.tsx
│  │  ├─ loading.tsx
│  │  ├─ error.tsx
│  │  │
│  │  ├─ catalog/
│  │  │  ├─ page.tsx
│  │  │  ├─ new/page.tsx
│  │  │  ├─ [wrapId]/page.tsx
│  │  │  └─ [wrapId]/edit/page.tsx
│  │  │
│  │  ├─ visualizer/
│  │  │  ├─ page.tsx
│  │  │  └─ [previewId]/page.tsx
│  │  │
│  │  ├─ scheduling/
│  │  │  ├─ page.tsx
│  │  │  ├─ new/page.tsx
│  │  │  ├─ [bookingId]/page.tsx
│  │  │  └─ [bookingId]/edit/page.tsx
│  │  │
│  │  ├─ billing/
│  │  │  ├─ page.tsx
│  │  │  ├─ new/page.tsx
│  │  │  ├─ [invoiceId]/page.tsx
│  │  │  └─ [invoiceId]/edit/page.tsx
│  │  │
│  │  ├─ settings/
│  │  │  ├─ page.tsx
│  │  │  └─ profile/page.tsx
│  │  │
│  │  ├─ admin/
│  │  │  ├─ layout.tsx
│  │  │  ├─ page.tsx
│  │  │  ├─ catalog/page.tsx
│  │  │  ├─ scheduling/page.tsx
│  │  │  └─ billing/page.tsx
│  │  │
│  │  └─ platform/
│  │     ├─ layout.tsx
│  │     ├─ page.tsx
│  │     ├─ webhooks/page.tsx
│  │     ├─ database/page.tsx
│  │     └─ recovery/page.tsx
│  │
│  └─ api/
│     ├─ clerk/
│     │  └─ webhook-handler/route.ts
│     └─ stripe/
│        └─ webhook/route.ts
│
├─ components/
│  ├─ ui/
│  │  ├─ accordion.tsx
│  │  ├─ alert-dialog.tsx
│  │  ├─ badge.tsx
│  │  ├─ breadcrumb.tsx
│  │  ├─ button.tsx
│  │  ├─ card.tsx
│  │  ├─ checkbox.tsx
│  │  ├─ dialog.tsx
│  │  ├─ dropdown-menu.tsx
│  │  ├─ form.tsx
│  │  ├─ input.tsx
│  │  ├─ label.tsx
│  │  ├─ pagination.tsx
│  │  ├─ select.tsx
│  │  ├─ separator.tsx
│  │  ├─ sheet.tsx
│  │  ├─ sidebar.tsx
│  │  ├─ skeleton.tsx
│  │  ├─ table.tsx
│  │  ├─ tabs.tsx
│  │  ├─ textarea.tsx
│  │  ├─ toast.tsx
│  │  └─ tooltip.tsx
│  │
│  ├─ shared/
│  │  ├─ branding/
│  │  │  ├─ logo-icon.tsx
│  │  │  └─ logo-mark.tsx
│  │  ├─ layout/
│  │  │  ├─ site-header.tsx
│  │  │  ├─ site-footer.tsx
│  │  │  ├─ tenant-sidebar.tsx
│  │  │  ├─ tenant-nav-config.ts
│  │  │  ├─ workspace-page-intro.tsx
│  │  │  └─ workspace-metric-card.tsx
│  │  ├─ states/
│  │  │  ├─ empty-state.tsx
│  │  │  ├─ error-state.tsx
│  │  │  ├─ loading-state.tsx
│  │  │  └─ permission-state.tsx
│  │  └─ data-display/
│  │     ├─ entity-status-badge.tsx
│  │     ├─ data-table-toolbar.tsx
│  │     └─ data-table-empty.tsx
│  │
│  ├─ auth/
│  │  ├─ user-menu.tsx
│  │  ├─ login-cta.tsx
│  │  └─ auth-guard-message.tsx
│  │
│  ├─ catalog/
│  │  ├─ cards/
│  │  │  ├─ wrap-card.tsx
│  │  │  ├─ wrap-detail-card.tsx
│  │  │  └─ wrap-metric-card.tsx
│  │  ├─ tables/
│  │  │  ├─ wrap-table.tsx
│  │  │  └─ wrap-table-columns.tsx
│  │  ├─ forms/
│  │  │  ├─ wrap-form-fields.tsx
│  │  │  ├─ wrap-image-fields.tsx
│  │  │  └─ wrap-publish-fields.tsx
│  │  ├─ filters/
│  │  │  ├─ wrap-filter-bar.tsx
│  │  │  └─ wrap-sort-select.tsx
│  │  └─ media/
│  │     ├─ wrap-gallery.tsx
│  │     └─ wrap-image-uploader.tsx
│  │
│  ├─ visualizer/
│  │  ├─ cards/
│  │  │  ├─ preview-result-card.tsx
│  │  │  └─ preview-status-card.tsx
│  │  ├─ forms/
│  │  │  ├─ vehicle-upload-fields.tsx
│  │  │  └─ wrap-selector-fields.tsx
│  │  ├─ canvases/
│  │  │  └─ preview-canvas.tsx
│  │  └─ selectors/
│  │     └─ wrap-selector-grid.tsx
│  │
│  ├─ scheduling/
│  │  ├─ cards/
│  │  │  ├─ booking-card.tsx
│  │  │  ├─ booking-detail-card.tsx
│  │  │  └─ availability-summary-card.tsx
│  │  ├─ tables/
│  │  │  ├─ booking-table.tsx
│  │  │  └─ booking-table-columns.tsx
│  │  ├─ forms/
│  │  │  ├─ booking-form-fields.tsx
│  │  │  └─ customer-details-fields.tsx
│  │  ├─ filters/
│  │  │  └─ booking-filter-bar.tsx
│  │  └─ calendar/
│  │     ├─ availability-calendar.tsx
│  │     └─ time-slot-list.tsx
│  │
│  ├─ billing/
│  │  ├─ cards/
│  │  │  ├─ invoice-card.tsx
│  │  │  ├─ invoice-detail-card.tsx
│  │  │  └─ payment-summary-card.tsx
│  │  ├─ tables/
│  │  │  ├─ invoice-table.tsx
│  │  │  ├─ invoice-table-columns.tsx
│  │  │  └─ invoice-line-items-table.tsx
│  │  ├─ forms/
│  │  │  ├─ invoice-form-fields.tsx
│  │  │  └─ invoice-line-item-fields.tsx
│  │  ├─ filters/
│  │  │  └─ invoice-filter-bar.tsx
│  │  └─ payments/
│  │     ├─ checkout-button.tsx
│  │     └─ payment-history-list.tsx
│  │
│  ├─ settings/
│  │  ├─ forms/
│  │  │  ├─ store-settings-fields.tsx
│  │  │  ├─ business-profile-fields.tsx
│  │  │  └─ timezone-fields.tsx
│  │  └─ cards/
│  │     └─ settings-summary-card.tsx
│  │
│  ├─ admin/
│  │  ├─ cards/
│  │  │  ├─ owner-kpi-card.tsx
│  │  │  └─ operational-summary-card.tsx
│  │  └─ charts/
│  │     └─ owner-metrics-chart.tsx
│  │
│  └─ platform/
│     ├─ cards/
│     │  ├─ platform-health-card.tsx
│     │  └─ webhook-summary-card.tsx
│     ├─ tables/
│     │  ├─ webhook-events-table.tsx
│     │  └─ recovery-actions-table.tsx
│     └─ actions/
│        ├─ retry-webhook-button.tsx
│        └─ clear-failure-button.tsx
│
├─ features/
│  ├─ catalog/
│  │  ├─ list/
│  │  │  ├─ catalog-list-block.tsx
│  │  │  ├─ catalog-list-client.tsx
│  │  │  ├─ catalog-list-filters.tsx
│  │  │  └─ catalog-list-pagination.tsx
│  │  ├─ detail/
│  │  │  ├─ wrap-detail-block.tsx
│  │  │  └─ wrap-detail-actions.tsx
│  │  ├─ create/
│  │  │  ├─ wrap-create-block.tsx
│  │  │  └─ wrap-create-form.tsx
│  │  ├─ edit/
│  │  │  ├─ wrap-edit-block.tsx
│  │  │  └─ wrap-edit-form.tsx
│  │  └─shared/
│  │     ├─ wrap-form-shell.tsx
│  │     ├─ wrap-query-state.ts
│  │     └─ wrap-view-model.ts
│  │
│  ├─ visualizer/
│  │  ├─ workspace/
│  │  │  ├─ visualizer-workspace-block.tsx
│  │  │  ├─ visualizer-workspace-client.tsx
│  │  │  └─ visualizer-submit-form.tsx
│  │  ├─ detail/
│  │  │  └─ preview-detail-block.tsx
│  │  └─ shared/
│  │     ├─ preview-polling-client.tsx
│  │     └─ visualizer-view-model.ts
│  │
│  ├─ scheduling/
│  │  ├─ list/
│  │  │  ├─ booking-list-block.tsx
│  │  │  ├─ booking-list-client.tsx
│  │  │  ├─ booking-list-filters.tsx
│  │  │  └─ booking-list-pagination.tsx
│  │  ├─ detail/
│  │  │  ├─ booking-detail-block.tsx
│  │  │  └─ booking-detail-actions.tsx
│  │  ├─ create/
│  │  │  ├─ booking-create-block.tsx
│  │  │  ├─ booking-create-form.tsx
│  │  │  └─ availability-selector-client.tsx
│  │  ├─ edit/
│  │  │  ├─ booking-edit-block.tsx
│  │  │  └─ booking-edit-form.tsx
│  │  └─ shared/
│  │     ├─ booking-form-shell.tsx
│  │     ├─ booking-query-state.ts
│  │     └─ booking-view-model.ts
│  │
│  ├─ billing/
│  │  ├─ list/
│  │  │  ├─ invoice-list-block.tsx
│  │  │  ├─ invoice-list-client.tsx
│  │  │  ├─ invoice-list-filters.tsx
│  │  │  └─ invoice-list-pagination.tsx
│  │  ├─ detail/
│  │  │  ├─ invoice-detail-block.tsx
│  │  │  ├─ invoice-detail-actions.tsx
│  │  │  └─ invoice-payment-client.tsx
│  │  ├─ create/
│  │  │  ├─ invoice-create-block.tsx
│  │  │  └─ invoice-create-form.tsx
│  │  ├─ edit/
│  │  │  ├─ invoice-edit-block.tsx
│  │  │  └─ invoice-edit-form.tsx
│  │  └─ shared/
│  │     ├─ invoice-form-shell.tsx
│  │     ├─ invoice-query-state.ts
│  │     └─ invoice-view-model.ts
│  │
│  ├─ settings/
│  │  ├─ overview/
│  │  │  ├─ settings-overview-block.tsx
│  │  │  └─ settings-overview-client.tsx
│  │  ├─ profile/
│  │  │  ├─ settings-profile-block.tsx
│  │  │  └─ settings-profile-form.tsx
│  │  └─ shared/
│  │     └─ settings-view-model.ts
│  │
│  ├─ admin/
│  │  ├─ dashboard/
│  │  │  ├─ owner-dashboard-block.tsx
│  │  │  └─ owner-dashboard-client.tsx
│  │  └─ shared/
│  │     └─ owner-dashboard-view-model.ts
│  │
│  └─ platform/
│     ├─ overview/
│     │  ├─ platform-overview-block.tsx
│     │  └─ platform-overview-client.tsx
│     ├─ webhooks/
│     │  ├─ webhook-ops-block.tsx
│     │  ├─ webhook-ops-client.tsx
│     │  └─ webhook-recovery-actions.tsx
│     ├─ database/
│     │  └─ database-ops-block.tsx
│     └─ shared/
│        └─ platform-view-model.ts
│
├─ lib/
│  ├─ actions/
│  │  ├─ auth.actions.ts
│  │  ├─ scheduling.actions.ts
│  │  ├─ billing.actions.ts
│  │  ├─ settings.actions.ts
│  │  ├─ admin.actions.ts
│  │  ├─ catalog.actions.ts
│  │  ├─ visualizer.actions.ts
│  │  └─ platform.actions.ts
│  │
│  ├─ fetchers/
│  │  ├─ auth.fetchers.ts
│  │  ├─ scheduling.fetchers.ts
│  │  ├─ billing.fetchers.ts
│  │  ├─ settings.fetchers.ts
│  │  ├─ admin.fetchers.ts
│  │  ├─ catalog.fetchers.ts
│  │  ├─ visualizer.fetchers.ts
│  │  └─ platform.fetchers.ts
│  │
│  ├─ auth/
│  │  ├─ session.ts
│  │  ├─ identity.ts
│  │  ├─ redirect.ts
│  │  └─ clerk.ts
│  │
│  ├─ authz/
│  │  ├─ guards.ts
│  │  ├─ policy.ts
│  │  └─ capabilities.ts
│  │
│  ├─ db/
│  │  ├─ prisma.ts
│  │  ├─ selects/
│  │  │  ├─ catalog.selects.ts
│  │  │  ├─ scheduling.selects.ts
│  │  │  ├─ billing.selects.ts
│  │  │  └─ platform.selects.ts
│  │  └─ transactions/
│  │     ├─ scheduling.transactions.ts
│  │     ├─ billing.transactions.ts
│  │     └─ platform.transactions.ts
│  │
│  ├─ cache/
│  │  ├─ cache-keys.ts
│  │  ├─ revalidate-tags.ts
│  │  └─ unstable-cache.ts
│  │
│  ├─ integrations/
│  │  ├─ clerk.ts
│  │  ├─ stripe.ts
│  │  ├─ blob.ts
│  │  └─ huggingface.ts
│  │
│  ├─ uploads/
│  │  ├─ file-validation.ts
│  │  ├─ image-processing.ts
│  │  └─ storage.ts
│  │
│  ├─ utils/
│  │  ├─ cn.ts
│  │  ├─ dates.ts
│  │  ├─ currency.ts
│  │  ├─ pagination.ts
│  │  ├─ search-params.ts
│  │  └─ assertions.ts
│  │
│  └─ constants/
│     ├─ routes.ts
│     ├─ permissions.ts
│     ├─ statuses.ts
│     └─ app.ts
│
├─ types/
│  ├─ auth.types.ts
│  ├─ catalog.types.ts
│  ├─ visualizer.types.ts
│  ├─ scheduling.types.ts
│  ├─ billing.types.ts
│  ├─ settings.types.ts
│  ├─ admin.types.ts
│  ├─ platform.types.ts
│  ├─ common.types.ts
│  └─ api.types.ts
│
├─ schemas/
│  ├─ auth.schemas.ts
│  ├─ catalog.schemas.ts
│  ├─ visualizer.schemas.ts
│  ├─ scheduling.schemas.ts
│  ├─ billing.schemas.ts
│  ├─ settings.schemas.ts
│  ├─ admin.schemas.ts
│  ├─ platform.schemas.ts
│  ├─ common.schemas.ts
│  └─ api.schemas.ts
│
├─ tests/
│  ├─ vitest/
│  │  ├─ setup/
│  │  │  ├─ vitest.setup.ts
│  │  │  ├─ test-utils.tsx
│  │  │  ├─ mocks/
│  │  │  │  ├─ clerk.ts
│  │  │  │  ├─ next-navigation.ts
│  │  │  │  ├─ server-actions.ts
│  │  │  │  └─ prisma.ts
│  │  │  └─ factories/
│  │  │     ├─ booking.factory.ts
│  │  │     ├─ invoice.factory.ts
│  │  │     ├─ wrap.factory.ts
│  │  │     └─ user.factory.ts
│  │  │
│  │  ├─ unit/
│  │  │  ├─ components/
│  │  │  │  ├─ catalog/
│  │  │  │  ├─ visualizer/
│  │  │  │  ├─ scheduling/
│  │  │  │  └─ billing/
│  │  │  ├─ lib/
│  │  │  │  ├─ utils/
│  │  │  │  ├─ cache/
│  │  │  │  └─ authz/
│  │  │  ├─ schemas/
│  │  │  │  ├─ billing.schemas.test.ts
│  │  │  │  ├─ scheduling.schemas.test.ts
│  │  │  │  └─ visualizer.schemas.test.ts
│  │  │  └─ types/
│  │  │
│  │  ├─ integration/
│  │  │  ├─ actions/
│  │  │  │  ├─ catalog.actions.test.ts
│  │  │  │  ├─ scheduling.actions.test.ts
│  │  │  │  ├─ billing.actions.test.ts
│  │  │  │  └─ platform.actions.test.ts
│  │  │  ├─ fetchers/
│  │  │  │  ├─ catalog.fetchers.test.ts
│  │  │  │  ├─ scheduling.fetchers.test.ts
│  │  │  │  ├─ billing.fetchers.test.ts
│  │  │  │  └─ platform.fetchers.test.ts
│  │  │  └─ api/
│  │  │     ├─ clerk-webhook-route.test.ts
│  │  │     └─ stripe-webhook-route.test.ts
│  │  │
│  │  └─ smoke/
│  │     ├─ auth-boundaries.test.ts
│  │     ├─ route-shells.test.tsx
│  │     └─ nav-config.test.ts
│  │
│  └─ playwright/
│     ├─ fixtures/
│     │  ├─ auth.fixture.ts
│     │  ├─ customer.fixture.ts
│     │  ├─ owner.fixture.ts
│     │  └─ admin.fixture.ts
│     ├─ helpers/
│     │  ├─ db.ts
│     │  ├─ auth.ts
│     │  └─ assertions.ts
│     ├─ seed/
│     │  ├─ global.setup.ts
│     │  └─ global.teardown.ts
│     ├─ e2e/
│     │  ├─ public/
│     │  │  ├─ landing.spec.ts
│     │  │  └─ auth.spec.ts
│     │  ├─ catalog/
│     │  │  ├─ catalog-browse.spec.ts
│     │  │  ├─ catalog-manage.spec.ts
│     │  │  └─ wrap-edit.spec.ts
│     │  ├─ visualizer/
│     │  │  ├─ visualizer-submit.spec.ts
│     │  │  └─ preview-status.spec.ts
│     │  ├─ scheduling/
│     │  │  ├─ booking-create.spec.ts
│     │  │  ├─ booking-edit.spec.ts
│     │  │  └─ booking-cancel.spec.ts
│     │  ├─ billing/
│     │  │  ├─ invoice-list.spec.ts
│     │  │  ├─ invoice-pay.spec.ts
│     │  │  └─ owner-invoice-manage.spec.ts
│     │  ├─ settings/
│     │  │  └─ settings-save.spec.ts
│     │  ├─ admin/
│     │  │  └─ owner-dashboard.spec.ts
│     │  └─ platform/
│     │     ├─ webhook-ops.spec.ts
│     │     └─ recovery-actions.spec.ts
│     └─ smoke/
│        └─ critical-user-journeys.spec.ts
│
├─ docs/
│  ├─ catalog/
│  ├─ visualizer/
│  ├─ scheduling/
│  ├─ billing/
│  ├─ settings/
│  └─ admin/
│
├─ .codex/
│  ├─ instructions/
│  │  ├─ catalog.instructions.md
│  │  ├─ visualizer.instructions.md
│  │  ├─ scheduling.instructions.md
│  │  ├─ billing.instructions.md
│  │  ├─ settings.instructions.md
│  │  ├─ admin.instructions.md
│  │  └─ platform.instructions.md
│  ├─ specs/
│  │  ├─ catalog/
│  │  ├─ visualizer/
│  │  ├─ scheduling/
│  │  ├─ billing/
│  │  ├─ settings/
│  │  ├─ admin/
│  │  └─ platform/
│  └─ setup/
│
├─ prisma/
│  ├─ schema.prisma
│  └─ migrations/
│
├─ public/
├─ middleware.ts
├─ vitest.config.ts
├─ playwright.config.ts
├─ tsconfig.json
├─ next.config.ts
└─ package.json
```
