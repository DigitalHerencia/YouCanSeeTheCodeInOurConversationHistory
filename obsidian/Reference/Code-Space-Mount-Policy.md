---
title: "Code-Space-Mount-Policy"
role: devnotes
system: devnotes
workspace:
type: reference
status: active
authority: reference
created: 2026-08-24
updated: 2026-08-24
tags: []
---
# Code Space Mount Policy

Target:

```text
_mounts/
└── CodependentCoding/  → D:\TheCodependentCodingWebAppArchitecture
```

Rules:
- mount only the complete trusted Codependent Coding source directory;
- never mount the whole development drive;
- `_mounts/` is local-only and Git-ignored;
- durable notes preserve meaning/decision/spec/evidence, not source photocopies;
- stale code mirrors are not retained after their durable links are migrated to Code Space.
