---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\spring-boot-testing\references\sb4-migration.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\spring-boot-testing\references\sb4-migration.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.spring-boot-testing.references.sb4-migration.md'
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
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\spring-boot-testing\references\sb4-migration.md'
source_file: 'sb4-migration.md'
source_sha256: '959d81d7ede3e141f78e4782e60460aaf113940d89614c3eac928c39f167a04c'
generated: true
---

# `sb4-migration.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\spring-boot-testing\references\sb4-migration.md`
> SHA-256: `959d81d7ede3e141f78e4782e60460aaf113940d89614c3eac928c39f167a04c`

````markdown
# Spring Boot 4.0 Migration

Key testing changes when migrating from Spring Boot 3.x to 4.0.

## Dependency Changes

### Modular Test Starters

Spring Boot 4.0 introduces modular test starters:

**Before (3.x):**

```xml
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-test</artifactId>
  <scope>test</scope>
</dependency>
```

**After (4.0) - WebMvc Testing:**

```xml
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-webmvc-test</artifactId>
  <scope>test</scope>
</dependency>
```

**After (4.0) - REST Client Testing:**

```xml
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-restclient-test</artifactId>
  <scope>test</scope>
</dependency>
```

## Annotation Migration

### @MockBean → @MockitoBean

**Deprecated (3.x):**

```java
@MockBean
private OrderService orderService;
```

**New (4.0):**

```java
@MockitoBean
private OrderService orderService;
```

### @SpyBean → @MockitoSpyBean

**Deprecated (3.x):**

```java
@SpyBean
private PaymentGatewayClient paymentClient;
```

**New (4.0):**

```java
@MockitoSpyBean
private PaymentGatewayClient paymentClient;
```

## New Testing Features

### RestTestClient

Replaces TestRestTemplate (deprecated):

```java
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@AutoConfigureRestTestClient
class OrderIntegrationTest {
  
  @Autowired
  private RestTestClient restClient;
  
  @Test
  void shouldCreateOrder() {
    restClient
      .post()
      .uri("/orders")
      .body(new OrderRequest("Product", 2))
      .exchange()
      .expectStatus()
      .isCreated()
      .expectHeader()
      .location("/orders/1");
  }
}
```

## JUnit 6 Support

Spring Boot 4.0 uses JUnit 6 by default:

- JUnit 4 is deprecated (use JUnit Vintage temporarily)
- All JUnit 5 features still work
- Remove JUnit 4 dependencies for clean migration

## Testcontainers 2.0

Module naming changed:

**Before (1.x):**

```xml
<artifactId>postgresql</artifactId>
```

**After (2.0):**

```xml
<artifactId>testcontainers-postgresql</artifactId>
```

## Non-Singleton Bean Mocking

Spring Framework 7 allows mocking prototype-scoped beans:

```java
@Component
@Scope("prototype")
public class OrderProcessor { }

@SpringBootTest
class OrderServiceTest {
  @MockitoBean
  private OrderProcessor orderProcessor; // Now works!
}
```

## SpringExtension Context Changes

Extension context is now test-method scoped by default.

If tests fail with @Nested classes:

```java
@SpringExtensionConfig(useTestClassScopedExtensionContext = true)
@SpringBootTest
class OrderTest {
  // Use old behavior
}
```

## Migration Checklist

- [ ] Replace @MockBean with @MockitoBean
- [ ] Replace @SpyBean with @MockitoSpyBean
- [ ] Update Testcontainers dependencies to 2.0 naming
- [ ] Add modular test starters as needed
- [ ] Migrate TestRestTemplate to RestTestClient
- [ ] Remove JUnit 4 dependencies
- [ ] Update custom TestExecutionListener implementations
- [ ] Test @Nested class behavior

## Backward Compatibility

Use "classic" starters for gradual migration:

```xml
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-test-classic</artifactId>
  <scope>test</scope>
</dependency>
```

This provides old behavior while you migrate incrementally.

````