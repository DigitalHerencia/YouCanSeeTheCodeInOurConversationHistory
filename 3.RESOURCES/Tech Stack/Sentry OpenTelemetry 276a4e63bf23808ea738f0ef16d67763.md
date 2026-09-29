# Sentry/OpenTelemetry

Category: Monitoring / Logging
Type: Tooling
Edited: December 18, 2025 8:11 PM
Docs Link: • Sentry for Next.js
• OpenTelemetry JS
• Vercel Monitoring
Cover: https://images.unsplash.com/photo-1608742213509-815b97c30b36?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&w=6000
Tags: Logging

## Mental Models

- **You can’t fix what you don’t measure.**
- **Logs, metrics, traces** are the triad.
- **Errors must surface** — no silent failures.
- **Observability is dev-first** → dashboards and alerts accessible to developers.

---

## Canonical Workflow

### 1. Error Tracking

- Use **Sentry** or **Vercel Monitoring** for runtime errors.

```tsx
// sentry.client.config.ts
import * as Sentry from "@sentry/nextjs"

Sentry.init({
  dsn: process.env.SENTRY_DSN,
  tracesSampleRate: 1.0,
})

```

---

### 2. Logging

- Server logs → `console.log` (captured in Vercel logs).
- For structured logs: `pino` or `winston`.

---

### 3. Metrics & Traces

- Use **OpenTelemetry** (OTEL) instrumentation.
- Export metrics to provider (Datadog, Honeycomb, Grafana).

---

## Best Practices

- Capture frontend + backend errors in Sentry.
- Ship logs to centralized store.
- Monitor slow requests with tracing.
- Alerts tied to error thresholds, not vanity metrics.

---

## Docs & References

- Sentry for Next.js
- OpenTelemetry JS
- Vercel Monitoring

---