---
title: "<% tp.file.title %>"
namespace: "<% tp.user.makeNamespace(tp.user.inferSystem(tp.file.folder(true)), tp.user.inferRole(tp.file.folder(true)), tp.file.title, 'auth-security') %>"
role: "<% tp.user.inferRole(tp.file.folder(true)) %>"
system: "<% tp.user.inferSystem(tp.file.folder(true)) %>"
workspace: "<% tp.user.inferWorkspace(tp.file.folder(true)) %>"
type: "auth-security"
status: "draft"
authority: "project-specific"
created: "<% tp.date.now('YYYY-MM-DD') %>"
updated: "<% tp.date.now('YYYY-MM-DD') %>"
tags: []
---

# Authentication & Security

## Purpose
## Trust Model
## Identity Provider
## Sign-In / Sign-Up
## Session Model
## Local Application Identity
## Authentication
## Authorization
### Roles
### Capabilities
### RBAC
### ABAC
### Resource Policies
## Tenant / Ownership Model
## Protected Read Path
## Protected Mutation Path
## Database Security
## Row-Level Security
## API Security
## Webhook Security
## Provider Security
## Secrets
## Environment Boundaries
## Failure Semantics
## Administrative Access
## Threats / Abuse Cases
## Security Invariants
## Security Validation
