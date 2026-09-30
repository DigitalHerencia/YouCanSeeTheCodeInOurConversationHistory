# Playwright/Vitest

Category: Testing
Type: Utility
Edited: December 18, 2025 8:06 PM
Docs Link: • Vitest
• Vitest + TypeScript
• Playwright
• @testing-library/react
• faker-js
Cover: https://images.unsplash.com/photo-1551033406-611cf9a28f67?ixlib=rb-4.1.0&q=85&fm=jpg&crop=entropy&cs=srgb&w=6000
Tags: Faker, Playwright, Testing, Vitest

---

## Mental Models

- **Server-first and deterministic**: tests must run against predictable server actions, database state, and API responses.
- **Three layers of testing**:
    1. **Unit tests** → isolated logic (functions, server actions, utilities).
    2. **Integration tests** → server actions + DB + cache interactions.
    3. **E2E tests** → full browser flow (Playwright), simulating real user behavior.
- **Mocking for determinism**: use `@faker-js/faker` or Vitest mocks to prevent nondeterministic test results.
- **CI/CD integration**: run Vitest + Playwright automatically on PRs for deterministic verification.

---

## Canonical Workflow

### 1. Unit Test with Vitest

```tsx
// tests/unit/project.test.ts
import { describe, it, expect } from "vitest"
import { projectSchema } from "@/lib/validation/project"

describe("Project Schema", () => {
  it("should validate correct project data", () => {
    const data = { name: "Test Project", description: "Demo" }
    const parsed = projectSchema.parse(data)
    expect(parsed.name).toBe("Test Project")
  })

  it("should throw for invalid name", () => {
    const data = { name: "x", description: "Demo" }
    expect(() => projectSchema.parse(data)).toThrow()
  })
})

```

- **Isolated, deterministic tests** for schema and business logic.
- Fast feedback for CI/CD.

---

### 2. Integration Test with Vitest + Prisma

```tsx
// tests/integration/project-actions.test.ts
import { describe, it, expect, beforeAll } from "vitest"
import { db } from "@/lib/db"
import { createProject } from "@/app/(dashboard)/projects/actions"

describe("Project Actions", () => {
  let userId: string

  beforeAll(() => {
    userId = "test-user-id"
  })

  it("creates a project in DB", async () => {
    const project = await createProject({ name: "Integration Test" }, userId)
    const dbProject = await db.project.findUnique({ where: { id: project.id } })
    expect(dbProject?.name).toBe("Integration Test")
    expect(dbProject?.ownerId).toBe(userId)
  })
})

```

- **Deterministic DB state**: use a test DB or transactions for repeatable runs.
- Server Actions tested as expected.

---

### 3. E2E Test with Playwright

```tsx
// tests/e2e/dashboard.spec.ts
import { test, expect } from "@playwright/test"

test("user can login and view dashboard", async ({ page }) => {
  await page.goto("/sign-in")
  await page.fill("input[name='email']", "test@example.com")
  await page.fill("input[name='password']", "password123")
  await page.click("button[type='submit']")
  await expect(page).toHaveURL("/dashboard")
  await expect(page.locator("h1")).toHaveText("Welcome")
})

```

- **Browser simulation** ensures UI + server interactions work end-to-end.
- Deterministic with test credentials or mocked backend.

---

### 4. Test Data Management

- **Faker for dummy data**: `@faker-js/faker` for predictable seedable data.
- **Reset DB state** between tests for deterministic runs.
- **Mock external APIs** for stable E2E and integration tests.

---

## Best Practices

- **Layered testing** → unit → integration → E2E.
- **Always isolate test DB** or transactions.
- **Seed data deterministically**.
- **Use Vitest coverage** to ensure all critical logic paths are tested.
- **CI/CD** → run all tests on PRs to prevent regressions.

---

## Docs & References

- [Vitest](https://vitest.dev/)
- [Vitest + TypeScript](https://vitest.dev/guide/#typescript)
- [Playwright](https://playwright.dev/docs/intro)
- [@testing-library/react](https://testing-library.com/docs/react-testing-library/intro)
- [faker-js](https://fakerjs.dev/)

---