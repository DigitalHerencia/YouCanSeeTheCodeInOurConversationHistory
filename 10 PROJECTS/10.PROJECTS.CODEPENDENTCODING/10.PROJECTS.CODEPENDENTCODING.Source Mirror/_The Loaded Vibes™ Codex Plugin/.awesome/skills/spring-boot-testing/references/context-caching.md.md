---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\spring-boot-testing\references\context-caching.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\spring-boot-testing\references\context-caching.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.spring-boot-testing.references.context-caching.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\spring-boot-testing\references\context-caching.md'
source_file: 'context-caching.md'
source_sha256: 'dbc938e69c086be119a02e7572b144c2849f164bed0968a2b78828ae391dd1c3'
generated: true
---

# `context-caching.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\spring-boot-testing\references\context-caching.md`
> SHA-256: `dbc938e69c086be119a02e7572b144c2849f164bed0968a2b78828ae391dd1c3`

````markdown
# Context Caching

Optimize Spring Boot test suite performance through context caching.

## How Context Caching Works

Spring's TestContext Framework caches application contexts based on their configuration "key". Tests with identical configurations reuse the same context.

### What Affects the Cache Key

- @ContextConfiguration
- @TestPropertySource
- @ActiveProfiles
- @WebAppConfiguration
- @MockitoBean definitions
- @TestConfiguration imports

## Cache Key Examples

### Same Key (Context Reused)

```java
@WebMvcTest(OrderController.class)
class OrderControllerTest1 {
  @MockitoBean private OrderService orderService;
}

@WebMvcTest(OrderController.class)
class OrderControllerTest2 {
  @MockitoBean private OrderService orderService;
}
// Same context reused
```

### Different Key (New Context)

```java
@WebMvcTest(OrderController.class)
@ActiveProfiles("test")
class OrderControllerTest1 { }

@WebMvcTest(OrderController.class)
@ActiveProfiles("integration")
class OrderControllerTest2 { }
// Different contexts loaded
```

## Viewing Cache Statistics

### Spring Boot Actuator

```yaml
management:
  endpoints:
    web:
      exposure:
        include: metrics
```

Access: `GET /actuator/metrics/spring.test.context.cache`

### Debug Logging

```properties
logging.level.org.springframework.test.context.cache=DEBUG
```

## Optimizing Cache Hit Rate

### Group Tests by Configuration

```
 tests/
   unit/           # No context
   web/            # @WebMvcTest
   repository/     # @DataJpaTest  
   integration/    # @SpringBootTest
```

### Minimize @TestPropertySource Variations

**Bad (multiple contexts):**

```java
@TestPropertySource(properties = "app.feature-x=true")
class FeatureXTest { }

@TestPropertySource(properties = "app.feature-y=true")
class FeatureYTest { }
```

**Better (grouped):**

```java
@TestPropertySource(properties = {"app.feature-x=true", "app.feature-y=true"})
class FeaturesTest { }
```

### Use @DirtiesContext Sparingly

Only when context state truly changes:

```java
@Test
@DirtiesContext // Forces context rebuild after test
void testThatModifiesBeanDefinitions() { }
```

## Best Practices

1. **Group by configuration** - Keep tests with same config together
2. **Limit property variations** - Use profiles over individual properties
3. **Avoid @DirtiesContext** - Prefer test data cleanup
4. **Use narrow slices** - @WebMvcTest vs @SpringBootTest
5. **Monitor cache hits** - Enable debug logging occasionally

````