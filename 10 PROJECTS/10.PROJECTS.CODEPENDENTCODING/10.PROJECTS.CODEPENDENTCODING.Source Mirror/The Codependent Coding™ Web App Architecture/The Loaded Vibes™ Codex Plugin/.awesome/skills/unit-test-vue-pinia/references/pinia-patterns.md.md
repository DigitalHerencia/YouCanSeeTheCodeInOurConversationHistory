---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\unit-test-vue-pinia\references\pinia-patterns.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\unit-test-vue-pinia\references\pinia-patterns.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.unit-test-vue-pinia.references.pinia-patterns.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\unit-test-vue-pinia\references\pinia-patterns.md'
source_file: 'pinia-patterns.md'
source_sha256: 'a4cef6798975429d5affcf2a03abaab00dae858fff1d99dad4b6dc11791dcfa1'
generated: true
---

# `pinia-patterns.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\unit-test-vue-pinia\references\pinia-patterns.md`
> SHA-256: `a4cef6798975429d5affcf2a03abaab00dae858fff1d99dad4b6dc11791dcfa1`

````markdown
# Pinia Testing Snippets (Cookbook-Aligned)

Use these patterns directly when writing tests with `@pinia/testing`.

## Component mount with `createTestingPinia`

```ts
import { mount } from "@vue/test-utils";
import { createTestingPinia } from "@pinia/testing";
import { vi } from "vitest";

const wrapper = mount(ComponentUnderTest, {
  global: {
    plugins: [
      createTestingPinia({
        createSpy: vi.fn,
      }),
    ],
  },
});
```

## Execute real actions

Use this only when behavior inside the action must run.
If the test only checks call/no-call expectations, keep default stubbing (`stubActions: true`).

```ts
const wrapper = mount(ComponentUnderTest, {
  global: {
    plugins: [
      createTestingPinia({
        createSpy: vi.fn,
        stubActions: false,
      }),
    ],
  },
});
```

## Seed starting state

```ts
const wrapper = mount(ComponentUnderTest, {
  global: {
    plugins: [
      createTestingPinia({
        createSpy: vi.fn,
        initialState: {
          counter: { n: 10 },
          profile: { name: "Sherlock Holmes" },
        },
      }),
    ],
  },
});
```

## Use store in test and assert action call

```ts
const pinia = createTestingPinia({ createSpy: vi.fn });
const store = useCounterStore(pinia);

store.increment();
expect(store.increment).toHaveBeenCalledTimes(1);
```

## Add plugin under test

```ts
const wrapper = mount(ComponentUnderTest, {
  global: {
    plugins: [
      createTestingPinia({
        createSpy: vi.fn,
        plugins: [myPiniaPlugin],
      }),
    ],
  },
});
```

## Override and reset getters for edge tests

```ts
const pinia = createTestingPinia({ createSpy: vi.fn });
const store = useCounterStore(pinia);

store.double = 42;
expect(store.double).toBe(42);

// @ts-expect-error test-only reset
store.double = undefined;
```

````